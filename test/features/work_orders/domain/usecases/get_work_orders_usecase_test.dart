import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/domain/repositories/i_work_order_repository.dart';
import 'package:fsm/features/work_orders/domain/usecases/get_work_orders_usecase.dart';

class MockWorkOrderRepository extends Mock implements IWorkOrderRepository {}

void main() {
  group('GetWorkOrdersUseCase', () {
    late GetWorkOrdersUseCase useCase;
    late MockWorkOrderRepository mockRepository;

    final testWorkOrder1 = WorkOrderEntity(
      id: 1,
      woNumber: 'WO-001',
      srId: 1,
      summary: 'Test Work Order 1',
      problemDescription: 'Test problem description',
      priority: WorkOrderPriority.high,
      visitDate: DateTime.parse('2024-01-15T10:00:00Z'),
      location: 'Test Location 1',
      status: WorkOrderStatus.assigned,
      durationDays: 1,
      createdAt: DateTime.parse('2024-01-10T10:00:00Z'),
      updatedAt: DateTime.parse('2024-01-10T10:00:00Z'),
    );

    final testWorkOrder2 = WorkOrderEntity(
      id: 2,
      woNumber: 'WO-002',
      srId: 2,
      summary: 'Test Work Order 2',
      problemDescription: 'Test problem description 2',
      priority: WorkOrderPriority.medium,
      visitDate: DateTime.parse('2024-01-16T10:00:00Z'),
      location: 'Test Location 2',
      status: WorkOrderStatus.inProgress,
      durationDays: 2,
      createdAt: DateTime.parse('2024-01-11T10:00:00Z'),
      updatedAt: DateTime.parse('2024-01-11T10:00:00Z'),
    );

    setUp(() {
      mockRepository = MockWorkOrderRepository();
      useCase = GetWorkOrdersUseCase(mockRepository);
    });

    test('should return list of work orders when repository call is successful',
        () async {
      // Arrange
      final params = GetWorkOrdersParams(page: 1, limit: 20);
      final testWorkOrders = [testWorkOrder1, testWorkOrder2];
      when(() => mockRepository.getWorkOrders(
            page: any(named: 'page'),
            limit: any(named: 'limit'),
            status: any(named: 'status'),
            priority: any(named: 'priority'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => Right(testWorkOrders));

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(Right(testWorkOrders)));
      verify(() => mockRepository.getWorkOrders(
            page: 1,
            limit: 20,
            status: null,
            priority: null,
            searchQuery: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return work orders filtered by status', () async {
      // Arrange
      final params = GetWorkOrdersParams(
        page: 1,
        limit: 20,
        status: WorkOrderStatus.assigned,
      );
      final filteredWorkOrders = [testWorkOrder1];
      when(() => mockRepository.getWorkOrders(
            page: any(named: 'page'),
            limit: any(named: 'limit'),
            status: any(named: 'status'),
            priority: any(named: 'priority'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => Right(filteredWorkOrders));

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(Right(filteredWorkOrders)));
      verify(() => mockRepository.getWorkOrders(
            page: 1,
            limit: 20,
            status: WorkOrderStatus.assigned,
            priority: null,
            searchQuery: null,
          )).called(1);
    });

    test('should return NetworkFailure when there is no internet connection',
        () async {
      // Arrange
      final params = GetWorkOrdersParams(page: 1, limit: 20);
      const failure = NetworkFailure(message: 'No internet connection');
      when(() => mockRepository.getWorkOrders(
            page: any(named: 'page'),
            limit: any(named: 'limit'),
            status: any(named: 'status'),
            priority: any(named: 'priority'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.getWorkOrders(
            page: 1,
            limit: 20,
            status: null,
            priority: null,
            searchQuery: null,
          )).called(1);
    });
  });
}
