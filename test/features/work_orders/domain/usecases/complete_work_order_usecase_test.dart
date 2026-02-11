import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/core/network/network_info.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/domain/repositories/i_work_order_repository.dart';
import 'package:fsm/features/work_orders/domain/usecases/complete_work_order_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'complete_work_order_usecase_test.mocks.dart';

@GenerateMocks([IWorkOrderRepository, NetworkInfo])
void main() {
  late CompleteWorkOrderUseCase useCase;
  late MockIWorkOrderRepository mockRepository;
  late MockNetworkInfo mockNetworkInfo;

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
    mockNetworkInfo = MockNetworkInfo();
    useCase = CompleteWorkOrderUseCase(mockRepository, mockNetworkInfo);
  });

  const tWorkOrderId = 1;
  const tWorkLog = 'Completed work';
  const tCustomerName = 'John Doe';
  final tSignature = File('path/to/signature');
  final tFiles = [File('path/to/file')];
  const tLatitude = 12.34;
  const tLongitude = 56.78;
  const tCompletionNotes = 'Notes';

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
    status: WorkOrderStatus.completed,
    durationDays: 1,
    createdAt: DateTime(2025, 1, 1),
    updatedAt: DateTime(2025, 1, 1),
    workLog: tWorkLog,
    completedAt: DateTime.now(),
  );

  test('should call completeWorkOrder on repository when online', () async {
    // Arrange
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    when(mockRepository.completeWorkOrder(
      workOrderId: tWorkOrderId,
      workLog: tWorkLog,
      customerName: tCustomerName,
      signature: tSignature,
      partsUsed: [],
      files: tFiles,
      latitude: tLatitude,
      longitude: tLongitude,
      completionNotes: tCompletionNotes,
    )).thenAnswer((_) async => Right(tWorkOrder));

    final params = CompleteWorkOrderParams(
      workOrderId: tWorkOrderId,
      workLog: tWorkLog,
      customerName: tCustomerName,
      signature: tSignature,
      partsUsed: [],
      files: tFiles,
      latitude: tLatitude,
      longitude: tLongitude,
      completionNotes: tCompletionNotes,
    );

    // Act
    final result = await useCase(params);

    // Assert
    expect(result.isRight, true);
    result.fold(
      (failure) => fail('Should return Right'),
      (data) => expect(data, tWorkOrder),
    );

    verify(mockNetworkInfo.isConnected).called(1);
    verify(mockRepository.completeWorkOrder(
      workOrderId: tWorkOrderId,
      workLog: tWorkLog,
      customerName: tCustomerName,
      signature: tSignature,
      partsUsed: [],
      files: tFiles,
      latitude: tLatitude,
      longitude: tLongitude,
      completionNotes: tCompletionNotes,
    )).called(1);
  });

  test('should call completeWorkOrder on repository when offline', () async {
    // The implementation shows that it calls repository even when offline.
    // We need to verify that behavior.

    // Arrange
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    when(mockRepository.completeWorkOrder(
      workOrderId: tWorkOrderId,
      workLog: tWorkLog,
      customerName: tCustomerName,
      signature: tSignature,
      partsUsed: [],
      files: tFiles,
      latitude: tLatitude,
      longitude: tLongitude,
      completionNotes: tCompletionNotes,
    )).thenAnswer((_) async => Right(tWorkOrder));

    final params = CompleteWorkOrderParams(
      workOrderId: tWorkOrderId,
      workLog: tWorkLog,
      customerName: tCustomerName,
      signature: tSignature,
      partsUsed: [],
      files: tFiles,
      latitude: tLatitude,
      longitude: tLongitude,
      completionNotes: tCompletionNotes,
    );

    // Act
    final result = await useCase(params);

    // Assert
    expect(result.isRight, true);
    verify(mockNetworkInfo.isConnected).called(1);
    verify(mockRepository.completeWorkOrder(
      workOrderId: tWorkOrderId,
      workLog: tWorkLog,
      customerName: tCustomerName,
      signature: tSignature,
      partsUsed: [],
      files: tFiles,
      latitude: tLatitude,
      longitude: tLongitude,
      completionNotes: tCompletionNotes,
    )).called(1);
  });
}
