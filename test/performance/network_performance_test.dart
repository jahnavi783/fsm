import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fsm/features/work_orders/data/datasources/work_order_remote_datasource.dart';
import 'package:fsm/features/work_orders/data/models/work_order_dto.dart';
import 'package:fsm/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:fsm/features/auth/data/models/login_request.dart';
import 'package:fsm/features/auth/data/models/login_response.dart';

class MockWorkOrderRemoteDataSource extends Mock
    implements WorkOrderRemoteDataSource {}

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

void main() {
  group('Network Performance Tests', () {
    late MockWorkOrderRemoteDataSource workOrderDataSource;
    late MockAuthRemoteDataSource authDataSource;

    setUp(() {
      workOrderDataSource = MockWorkOrderRemoteDataSource();
      authDataSource = MockAuthRemoteDataSource();
    });

    test('Login API call performance', () async {
      final loginRequest = LoginRequest(
        email: 'test@example.com',
        password: 'password123',
      );

      final mockLoginResponse = LoginResponse(
        token: 'mock_jwt_token',
        refreshToken: 'mock_refresh_token',
        user: const UserDto(
          id: 1,
          email: 'test@example.com',
          firstName: 'John',
          lastName: 'Doe',
          role: 'technician',
          permissions: ['work_orders', 'documents'],
        ),
      );

      when(() => authDataSource.login(any())).thenAnswer((_) async {
        // Simulate network delay
        await Future.delayed(const Duration(milliseconds: 100));
        return mockLoginResponse;
      });

      final stopwatch = Stopwatch()..start();

      final result = await authDataSource.login(loginRequest);

      stopwatch.stop();
      final responseTime = stopwatch.elapsedMilliseconds;

      expect(result, isA<LoginResponse>());
      expect(responseTime, lessThan(500),
          reason:
              'Login API call took ${responseTime}ms, should be under 500ms');

      print('Login API response time: ${responseTime}ms');
    });

    test('Work orders fetch performance', () async {
      final mockWorkOrders = List.generate(
          50,
          (index) => WorkOrderDto(
                id: index + 1,
                woNumber: 'WO-2024-${(index + 1).toString().padLeft(3, '0')}',
                summary: 'Work Order ${index + 1}',
                description: 'Description for work order ${index + 1}',
                status: 'assigned',
                priority: 'medium',
                visitDate:
                    DateTime.now().add(Duration(days: index)).toIso8601String(),
                customer: CustomerDto(
                  id: index + 1,
                  name: 'Customer ${index + 1}',
                  contactPerson: 'Contact ${index + 1}',
                  phone: '+1-555-0123',
                  email: 'contact${index + 1}@example.com',
                ),
                location: LocationDto(
                  id: index + 1,
                  address: '${index + 1} Test Street',
                  city: 'Test City',
                  state: 'TS',
                  zipCode: '12345',
                  latitude: 40.7128,
                  longitude: -74.0060,
                ),
                requiredSkills: ['Skill1', 'Skill2'],
                requiredParts: [],
                attachments: [],
                workLogs: [],
              ));

      when(() => workOrderDataSource.getWorkOrders(
            page: any(named: 'page'),
            limit: any(named: 'limit'),
          )).thenAnswer((_) async {
        // Simulate network delay for larger dataset
        await Future.delayed(const Duration(milliseconds: 200));
        return mockWorkOrders;
      });

      final stopwatch = Stopwatch()..start();

      final result = await workOrderDataSource.getWorkOrders(
        page: 1,
        limit: 50,
      );

      stopwatch.stop();
      final responseTime = stopwatch.elapsedMilliseconds;

      expect(result, isA<List<WorkOrderDto>>());
      expect(result.length, equals(50));
      expect(responseTime, lessThan(1000),
          reason:
              'Work orders fetch took ${responseTime}ms, should be under 1000ms');

      print('Work orders fetch response time: ${responseTime}ms');
    });

    test('Concurrent API calls performance', () async {
      // Mock multiple API responses
      when(() => workOrderDataSource.getWorkOrders(
            page: any(named: 'page'),
            limit: any(named: 'limit'),
          )).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 150));
        return <WorkOrderDto>[];
      });

      final stopwatch = Stopwatch()..start();

      // Execute concurrent API calls
      final futures = [
        workOrderDataSource.getWorkOrders(page: 1, limit: 20),
        workOrderDataSource.getWorkOrders(page: 2, limit: 20),
        workOrderDataSource.getWorkOrders(page: 3, limit: 20),
      ];

      await Future.wait(futures);

      stopwatch.stop();
      final totalTime = stopwatch.elapsedMilliseconds;

      // Concurrent calls should be faster than sequential calls
      // Sequential would be ~450ms (150*3), concurrent should be ~150ms (max of all)
      expect(totalTime, lessThan(250),
          reason:
              'Concurrent API calls took ${totalTime}ms, should be under 250ms');

      print('Concurrent API calls total time: ${totalTime}ms');
    });

    test('Large payload handling performance', () async {
      // Create a large mock response (simulating many work orders)
      final largePayload = List.generate(
          500,
          (index) => WorkOrderDto(
                id: index + 1,
                woNumber: 'WO-2024-${(index + 1).toString().padLeft(4, '0')}',
                summary:
                    'Work Order ${index + 1} with a very long summary that contains detailed information about the work to be performed',
                description:
                    'This is a very detailed description for work order ${index + 1}. ' *
                        10, // Long description
                status: 'assigned',
                priority: 'medium',
                visitDate:
                    DateTime.now().add(Duration(days: index)).toIso8601String(),
                customer: CustomerDto(
                  id: index + 1,
                  name: 'Customer ${index + 1} with a very long company name',
                  contactPerson: 'Contact Person ${index + 1}',
                  phone: '+1-555-${(index + 1000).toString().padLeft(4, '0')}',
                  email:
                      'very.long.email.address.contact${index + 1}@example.com',
                ),
                location: LocationDto(
                  id: index + 1,
                  address:
                      '${index + 1} Very Long Street Name with Suite ${index + 1}',
                  city: 'Test City with Long Name',
                  state: 'TS',
                  zipCode: '${(10000 + index).toString()}',
                  latitude: 40.7128 + (index * 0.001),
                  longitude: -74.0060 + (index * 0.001),
                ),
                requiredSkills: List.generate(5, (i) => 'Skill${i + 1}'),
                requiredParts: [],
                attachments: List.generate(3, (i) => 'attachment${i + 1}.pdf'),
                workLogs: [],
              ));

      when(() => workOrderDataSource.getWorkOrders(
            page: any(named: 'page'),
            limit: any(named: 'limit'),
          )).thenAnswer((_) async {
        // Simulate processing time for large payload
        await Future.delayed(const Duration(milliseconds: 300));
        return largePayload;
      });

      final stopwatch = Stopwatch()..start();

      final result = await workOrderDataSource.getWorkOrders(
        page: 1,
        limit: 500,
      );

      stopwatch.stop();
      final processingTime = stopwatch.elapsedMilliseconds;

      expect(result, isA<List<WorkOrderDto>>());
      expect(result.length, equals(500));
      expect(processingTime, lessThan(2000),
          reason:
              'Large payload processing took ${processingTime}ms, should be under 2000ms');

      print('Large payload (500 items) processing time: ${processingTime}ms');
    });
  });
}
