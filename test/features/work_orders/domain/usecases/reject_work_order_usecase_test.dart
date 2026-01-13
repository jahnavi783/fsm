import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/domain/repositories/i_work_order_repository.dart';
import 'package:fsm/features/work_orders/domain/usecases/reject_work_order_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'reject_work_order_usecase_test.mocks.dart';

@GenerateMocks([IWorkOrderRepository])
void main() {
  late RejectWorkOrderUseCase useCase;
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
    useCase = RejectWorkOrderUseCase(mockRepository);
  });

  const tWorkOrderId = 1;
  const tReason = 'Duplicate work order';
  const tLatitude = 12.34;
  const tLongitude = 56.78;

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
    status: WorkOrderStatus.rejected,
    durationDays: 1,
    createdAt: DateTime(2025, 1, 1),
    updatedAt: DateTime(2025, 1, 1),
    pauseLogs:
        tReason, // Assuming pauseLogs is reused for rejection reason or similar
  );

  test('should call rejectWorkOrder on repository and return WorkOrderEntity',
      () async {
    // Arrange
    when(mockRepository.rejectWorkOrder(
      workOrderId: tWorkOrderId,
      reason: tReason,
      latitude: tLatitude,
      longitude: tLongitude,
    )).thenAnswer((_) async => Right(tWorkOrder));

    final params = RejectWorkOrderParams(
      workOrderId: tWorkOrderId,
      reason: tReason,
      latitude: tLatitude,
      longitude: tLongitude,
    );

    // Act
    final result = await useCase(params);

    // Assert
    expect(result.isRight, true);
    result.fold(
      (failure) => fail('Should return Right'),
      (data) => expect(data, tWorkOrder),
    );

    verify(mockRepository.rejectWorkOrder(
      workOrderId: tWorkOrderId,
      reason: tReason,
      latitude: tLatitude,
      longitude: tLongitude,
    )).called(1);
  });

  test('should return Failure when repository call fails', () async {
    // Arrange
    const tFailure = ServerFailure(message: 'Server Error');
    when(mockRepository.rejectWorkOrder(
      workOrderId: tWorkOrderId,
      reason: tReason,
      latitude: tLatitude,
      longitude: tLongitude,
    )).thenAnswer((_) async => const Left(tFailure));

    final params = RejectWorkOrderParams(
      workOrderId: tWorkOrderId,
      reason: tReason,
      latitude: tLatitude,
      longitude: tLongitude,
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
