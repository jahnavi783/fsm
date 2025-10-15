import 'dart:io';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/domain/repositories/i_work_order_repository.dart';
import 'package:fsm/features/work_orders/domain/usecases/start_work_order_usecase.dart';

class MockWorkOrderRepository extends Mock implements IWorkOrderRepository {}

class MockFile extends Mock implements File {}

void main() {
  group('StartWorkOrderUseCase', () {
    late StartWorkOrderUseCase useCase;
    late MockWorkOrderRepository mockRepository;

    final testWorkOrder = WorkOrderEntity(
      id: 1,
      woNumber: 'WO-001',
      srId: 1,
      summary: 'Test Work Order',
      problemDescription: 'Test problem description',
      priority: WorkOrderPriority.high,
      visitDate: DateTime.parse('2024-01-15T10:00:00Z'),
      location: 'Test Location',
      status: WorkOrderStatus.inProgress,
      durationDays: 1,
      createdAt: DateTime.parse('2024-01-10T10:00:00Z'),
      updatedAt: DateTime.parse('2024-01-10T10:00:00Z'),
      startedAt: DateTime.parse('2024-01-15T09:00:00Z'),
    );

    setUp(() {
      mockRepository = MockWorkOrderRepository();
      useCase = StartWorkOrderUseCase(mockRepository);
    });

    test('should return updated work order when start is successful', () async {
      // Arrange
      final params = StartWorkOrderParams(
        workOrderId: 1,
        latitude: 37.7749,
        longitude: -122.4194,
        files: [],
        notes: 'Starting work order',
      );
      when(() => mockRepository.startWorkOrder(
            workOrderId: any(named: 'workOrderId'),
            latitude: any(named: 'latitude'),
            longitude: any(named: 'longitude'),
            files: any(named: 'files'),
            notes: any(named: 'notes'),
          )).thenAnswer((_) async => Right(testWorkOrder));

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(Right(testWorkOrder)));
      verify(() => mockRepository.startWorkOrder(
            workOrderId: 1,
            latitude: 37.7749,
            longitude: -122.4194,
            files: [],
            notes: 'Starting work order',
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
