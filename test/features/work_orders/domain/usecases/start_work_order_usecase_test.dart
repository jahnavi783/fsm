import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/domain/repositories/i_work_order_repository.dart';
import 'package:fsm/features/work_orders/domain/usecases/start_work_order_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'start_work_order_usecase_test.mocks.dart';

@GenerateMocks([IWorkOrderRepository])
void main() {
  late StartWorkOrderUseCase useCase;
  late MockIWorkOrderRepository mockRepository;

  setUpAll(() {
    provideDummy<Either<Failure, WorkOrderEntity>>(
      Right(WorkOrderEntity(
        id: 0,
        woNumber: '',
        srId: 0,
        summary: '',
        problemDescription: '',
        priority: WorkOrderPriority.low,
        visitDate: DateTime(2000),
        location: '',
        status: WorkOrderStatus.assigned,
        durationDays: 0,
        createdAt: DateTime(2000),
        updatedAt: DateTime(2000),
      )),
    );
  });

  setUp(() {
    mockRepository = MockIWorkOrderRepository();
    useCase = StartWorkOrderUseCase(mockRepository);
  });

  const tWorkOrderId = 1;
  const tLatitude = 12.34;
  const tLongitude = 56.78;
  final tFiles = [File('path/to/file')];
  const tNotes = 'Test Notes';

  final tWorkOrder = WorkOrderEntity(
    id: tWorkOrderId,
    woNumber: 'WO-123',
    srId: 101,
    serviceRequestNumber: 'SR-101',
    summary: 'Test Summary',
    problemDescription: 'Test Desc',
    priority: WorkOrderPriority.medium,
    visitDate: DateTime(2025, 1, 1),
    location: 'Test Location',
    status: WorkOrderStatus.inProgress,
    durationDays: 1,
    createdAt: DateTime(2025, 1, 1),
    updatedAt: DateTime(2025, 1, 1),
  );

  test('should call startWorkOrder on repository and return WorkOrderEntity',
      () async {
    // Arrange
    when(mockRepository.startWorkOrder(
      workOrderId: tWorkOrderId,
      latitude: tLatitude,
      longitude: tLongitude,
      files: tFiles,
      notes: tNotes,
    )).thenAnswer((_) async => Right(tWorkOrder));

    final params = StartWorkOrderParams(
      workOrderId: tWorkOrderId,
      latitude: tLatitude,
      longitude: tLongitude,
      files: tFiles,
      notes: tNotes,
    );

    // Act
    final result = await useCase(params);

    // Assert
    expect(result.isRight, true);
    result.fold(
      (failure) => fail('Should return Right'),
      (data) => expect(data, tWorkOrder),
    );

    verify(mockRepository.startWorkOrder(
      workOrderId: tWorkOrderId,
      latitude: tLatitude,
      longitude: tLongitude,
      files: tFiles,
      notes: tNotes,
    )).called(1);
  });

  test('should return Failure when repository call fails', () async {
    // Arrange
    const tFailure = ServerFailure(message: 'Server Error');
    when(mockRepository.startWorkOrder(
      workOrderId: tWorkOrderId,
      latitude: tLatitude,
      longitude: tLongitude,
      files: tFiles,
      notes: tNotes,
    )).thenAnswer((_) async => const Left(tFailure));

    final params = StartWorkOrderParams(
      workOrderId: tWorkOrderId,
      latitude: tLatitude,
      longitude: tLongitude,
      files: tFiles,
      notes: tNotes,
    );

    // Act
    final result = await useCase(params);

    // Assert
    expect(result.isLeft, true);
    result.fold(
      (failure) => expect(failure, tFailure),
      (data) => fail('Should return Left'),
    );
  });
}
