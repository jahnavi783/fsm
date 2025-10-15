import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fsm/features/work_orders/data/repositories/work_order_repository_impl.dart';
import 'package:fsm/features/work_orders/data/datasources/work_order_remote_datasource.dart';
import 'package:fsm/features/work_orders/data/datasources/work_order_local_datasource.dart';
import 'package:fsm/features/work_orders/data/models/work_order_dto.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/core/network/network_info.dart';
import 'package:either_dart/either.dart';

class MockWorkOrderRemoteDataSource extends Mock
    implements WorkOrderRemoteDataSource {}

class MockWorkOrderLocalDataSource extends Mock
    implements WorkOrderLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  group('Load Tests for Large Data Sets', () {
    late WorkOrderRepositoryImpl repository;
    late MockWorkOrderRemoteDataSource mockRemoteDataSource;
    late MockWorkOrderLocalDataSource mockLocalDataSource;
    late MockNetworkInfo mockNetworkInfo;

    setUp(() {
      mockRemoteDataSource = MockWorkOrderRemoteDataSource();
      mockLocalDataSource = MockWorkOrderLocalDataSource();
      mockNetworkInfo = MockNetworkInfo();

      repository = WorkOrderRepositoryImpl(
        remoteDataSource: mockRemoteDataSource,
        localDataSource: mockLocalDataSource,
        networkInfo: mockNetworkInfo,
      );
    });

    test('Load test: Processing 1000 work orders', () async {
      // Create a large dataset
      final largeDataset = List.generate(1000, (index) {
        return WorkOrderDto(
          id: index + 1,
          woNumber: 'WO-2024-${(index + 1).toString().padLeft(4, '0')}',
          summary: 'Work Order ${index + 1} - Load Test',
          description:
              'This is a load test work order with detailed description. ' * 5,
          status: 'assigned',
          priority: 'medium',
          visitDate:
              DateTime.now().add(Duration(days: index)).toIso8601String(),
          customer: CustomerDto(
            id: index + 1,
            name: 'Customer ${index + 1}',
            contactPerson: 'Contact ${index + 1}',
            phone: '+1-555-${(index + 1000).toString().padLeft(4, '0')}',
            email: 'contact${index + 1}@example.com',
          ),
          location: LocationDto(
            id: index + 1,
            address: '${index + 1} Test Street',
            city: 'Test City',
            state: 'TS',
            zipCode: '${(10000 + index).toString()}',
            latitude: 40.7128 + (index * 0.001),
            longitude: -74.0060 + (index * 0.001),
          ),
          requiredSkills: [
            'Skill${index % 10 + 1}',
            'Skill${(index + 1) % 10 + 1}'
          ],
          requiredParts: [],
          attachments: List.generate(index % 5, (i) => 'attachment${i}.pdf'),
          workLogs: [],
        );
      });

      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockRemoteDataSource.getWorkOrders(
            page: any(named: 'page'),
            limit: any(named: 'limit'),
            status: any(named: 'status'),
          )).thenAnswer((_) async => largeDataset);

      when(() => mockLocalDataSource.cacheWorkOrders(any()))
          .thenAnswer((_) async {});

      final stopwatch = Stopwatch()..start();

      final result = await repository.getWorkOrders(
        page: 1,
        limit: 1000,
      );

      stopwatch.stop();
      final processingTime = stopwatch.elapsedMilliseconds;

      expect(result.isRight, true);
      final workOrders = result.right;
      expect(workOrders.length, equals(1000));

      // Processing 1000 items should be reasonably fast
      expect(processingTime, lessThan(5000),
          reason:
              'Processing 1000 work orders took ${processingTime}ms, should be under 5000ms');

      print('Load test: 1000 work orders processed in ${processingTime}ms');
    });

    test('Load test: Concurrent processing of multiple large datasets',
        () async {
      final dataset1 =
          List.generate(500, (index) => _createMockWorkOrderDto(index));
      final dataset2 =
          List.generate(500, (index) => _createMockWorkOrderDto(index + 500));
      final dataset3 =
          List.generate(500, (index) => _createMockWorkOrderDto(index + 1000));

      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      // Mock different responses for different calls
      when(() => mockRemoteDataSource.getWorkOrders(
            page: 1,
            limit: 500,
            status: WorkOrderStatus.assigned,
          )).thenAnswer((_) async => dataset1);

      when(() => mockRemoteDataSource.getWorkOrders(
            page: 1,
            limit: 500,
            status: WorkOrderStatus.inProgress,
          )).thenAnswer((_) async => dataset2);

      when(() => mockRemoteDataSource.getWorkOrders(
            page: 1,
            limit: 500,
            status: WorkOrderStatus.completed,
          )).thenAnswer((_) async => dataset3);

      when(() => mockLocalDataSource.cacheWorkOrders(any()))
          .thenAnswer((_) async {});

      final stopwatch = Stopwatch()..start();

      // Execute concurrent requests
      final futures = [
        repository.getWorkOrders(
            page: 1, limit: 500, status: WorkOrderStatus.assigned),
        repository.getWorkOrders(
            page: 1, limit: 500, status: WorkOrderStatus.inProgress),
        repository.getWorkOrders(
            page: 1, limit: 500, status: WorkOrderStatus.completed),
      ];

      final results = await Future.wait(futures);

      stopwatch.stop();
      final totalTime = stopwatch.elapsedMilliseconds;

      // Verify all requests succeeded
      for (final result in results) {
        expect(result.isRight, true);
        expect(result.right.length, equals(500));
      }

      // Concurrent processing should be efficient
      expect(totalTime, lessThan(3000),
          reason:
              'Concurrent processing of 1500 items took ${totalTime}ms, should be under 3000ms');

      print(
          'Concurrent load test: 1500 work orders (3x500) processed in ${totalTime}ms');
    });

    test('Load test: Memory efficiency with repeated large operations',
        () async {
      final largeDataset =
          List.generate(200, (index) => _createMockWorkOrderDto(index));

      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockRemoteDataSource.getWorkOrders(
            page: any(named: 'page'),
            limit: any(named: 'limit'),
          )).thenAnswer((_) async => largeDataset);

      when(() => mockLocalDataSource.cacheWorkOrders(any()))
          .thenAnswer((_) async {});

      final stopwatch = Stopwatch()..start();

      // Perform multiple operations to test memory efficiency
      for (int i = 0; i < 10; i++) {
        final result = await repository.getWorkOrders(
          page: i + 1,
          limit: 200,
        );

        expect(result.isRight, true);
        expect(result.right.length, equals(200));

        // Small delay to simulate real-world usage
        await Future.delayed(const Duration(milliseconds: 10));
      }

      stopwatch.stop();
      final totalTime = stopwatch.elapsedMilliseconds;

      // 10 operations of 200 items each should complete efficiently
      expect(totalTime, lessThan(10000),
          reason:
              'Repeated operations (10x200 items) took ${totalTime}ms, should be under 10000ms');

      print(
          'Memory efficiency test: 10 operations of 200 items completed in ${totalTime}ms');
    });

    test('Load test: Search performance with large dataset', () async {
      // Create dataset with searchable content
      final searchableDataset = List.generate(1000, (index) {
        final keywords = [
          'HVAC',
          'Plumbing',
          'Electrical',
          'Maintenance',
          'Repair'
        ];
        final keyword = keywords[index % keywords.length];

        return WorkOrderDto(
          id: index + 1,
          woNumber: 'WO-2024-${(index + 1).toString().padLeft(4, '0')}',
          summary: '$keyword System Work Order ${index + 1}',
          description:
              'Detailed $keyword work description with multiple keywords for search testing.',
          status: 'assigned',
          priority: 'medium',
          visitDate:
              DateTime.now().add(Duration(days: index)).toIso8601String(),
          customer: CustomerDto(
            id: index + 1,
            name: '$keyword Customer ${index + 1}',
            contactPerson: 'Contact ${index + 1}',
            phone: '+1-555-0123',
            email: 'contact${index + 1}@example.com',
          ),
          location: LocationDto(
            id: index + 1,
            address: '${index + 1} $keyword Street',
            city: 'Test City',
            state: 'TS',
            zipCode: '12345',
            latitude: 40.7128,
            longitude: -74.0060,
          ),
          requiredSkills: [keyword],
          requiredParts: [],
        );
      });

      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockRemoteDataSource.searchWorkOrders(
            query: any(named: 'query'),
            page: any(named: 'page'),
            limit: any(named: 'limit'),
          )).thenAnswer((invocation) async {
        final query = invocation.namedArguments[#query] as String;
        return searchableDataset
            .where(
                (wo) => wo.summary.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });

      final searchQueries = [
        'HVAC',
        'Plumbing',
        'Electrical',
        'Maintenance',
        'Repair'
      ];
      final stopwatch = Stopwatch()..start();

      for (final query in searchQueries) {
        final result = await repository.searchWorkOrders(
          query: query,
          page: 1,
          limit: 1000,
        );

        expect(result.isRight, true);
        final searchResults = result.right;
        expect(searchResults.isNotEmpty, true);

        // Verify search results contain the query term
        for (final workOrder in searchResults) {
          expect(
              workOrder.summary.toLowerCase(), contains(query.toLowerCase()));
        }
      }

      stopwatch.stop();
      final searchTime = stopwatch.elapsedMilliseconds;

      // Search operations should be fast even with large dataset
      expect(searchTime, lessThan(2000),
          reason:
              'Search operations took ${searchTime}ms, should be under 2000ms');

      print(
          'Search performance test: 5 searches in dataset of 1000 items completed in ${searchTime}ms');
    });

    test('Load test: Offline data synchronization performance', () async {
      final onlineDataset =
          List.generate(500, (index) => _createMockWorkOrderDto(index));
      final cachedDataset =
          List.generate(300, (index) => _createMockWorkOrderDto(index + 1000));

      // Test offline scenario
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      when(() => mockLocalDataSource.getCachedWorkOrders(
                status: any(named: 'status'),
              ))
          .thenAnswer((_) async =>
              cachedDataset.map((dto) => dto.toHiveModel()).toList());

      final stopwatch = Stopwatch()..start();

      final offlineResult = await repository.getWorkOrders(
        page: 1,
        limit: 500,
      );

      stopwatch.stop();
      final offlineTime = stopwatch.elapsedMilliseconds;

      expect(offlineResult.isRight, true);
      expect(offlineResult.right.length, equals(300)); // Cached items

      // Now test online sync
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockRemoteDataSource.getWorkOrders(
            page: any(named: 'page'),
            limit: any(named: 'limit'),
          )).thenAnswer((_) async => onlineDataset);

      when(() => mockLocalDataSource.cacheWorkOrders(any()))
          .thenAnswer((_) async {});

      final syncStopwatch = Stopwatch()..start();

      final onlineResult = await repository.getWorkOrders(
        page: 1,
        limit: 500,
      );

      syncStopwatch.stop();
      final syncTime = syncStopwatch.elapsedMilliseconds;

      expect(onlineResult.isRight, true);
      expect(onlineResult.right.length, equals(500)); // Online items

      // Both offline and sync operations should be fast
      expect(offlineTime, lessThan(1000),
          reason:
              'Offline data access took ${offlineTime}ms, should be under 1000ms');
      expect(syncTime, lessThan(2000),
          reason: 'Online sync took ${syncTime}ms, should be under 2000ms');

      print(
          'Offline/sync performance: Offline ${offlineTime}ms, Sync ${syncTime}ms');
    });
  });
}

WorkOrderDto _createMockWorkOrderDto(int index) {
  return WorkOrderDto(
    id: index + 1,
    woNumber: 'WO-2024-${(index + 1).toString().padLeft(4, '0')}',
    summary: 'Load Test Work Order ${index + 1}',
    description: 'Description for load test work order ${index + 1}',
    status: 'assigned',
    priority: 'medium',
    visitDate: DateTime.now().add(Duration(days: index)).toIso8601String(),
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
  );
}
