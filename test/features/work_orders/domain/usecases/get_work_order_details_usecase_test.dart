import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_grouped_images_entity.dart';
import 'package:fsm/features/work_orders/domain/repositories/i_work_order_repository.dart';
import 'package:fsm/features/work_orders/domain/usecases/get_work_order_details_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_work_order_details_usecase_test.mocks.dart';

@GenerateMocks([IWorkOrderRepository])
void main() {
  late GetWorkOrderDetailsUseCase useCase;
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
    provideDummy<Either<Failure, WorkOrderGroupedImagesEntity>>(
      Right(WorkOrderGroupedImagesEntity(workOrderId: 0, groupedImages: {})),
    );
  });

  setUp(() {
    mockRepository = MockIWorkOrderRepository();
    useCase = GetWorkOrderDetailsUseCase(mockRepository);
  });

  const tWorkOrderId = 1;
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
    status: WorkOrderStatus.assigned,
    durationDays: 1,
    createdAt: DateTime(2025, 1, 1),
    updatedAt: DateTime(2025, 1, 1),
  );

  final tGroupedImages = WorkOrderGroupedImagesEntity(
    workOrderId: tWorkOrderId,
    groupedImages: {'start': []},
  );

  test(
      'should return WorkOrderDetailsResult with images when both calls succeed',
      () async {
    // Arrange
    when(mockRepository.getWorkOrderById(tWorkOrderId))
        .thenAnswer((_) async => Right(tWorkOrder));
    when(mockRepository.getGroupedImages(tWorkOrderId))
        .thenAnswer((_) async => Right(tGroupedImages));

    // Act
    final result = await useCase(tWorkOrderId);

    // Assert
    expect(result.isRight, true);
    result.fold(
      (failure) => fail('Should return Right'),
      (details) {
        expect(details.workOrder, tWorkOrder);
        expect(details.groupedImages, tGroupedImages);
      },
    );
    verify(mockRepository.getWorkOrderById(tWorkOrderId)).called(1);
    verify(mockRepository.getGroupedImages(tWorkOrderId)).called(1);
  });

  test(
      'should return WorkOrderDetailsResult without images when images call fails',
      () async {
    // Arrange
    when(mockRepository.getWorkOrderById(tWorkOrderId))
        .thenAnswer((_) async => Right(tWorkOrder));
    when(mockRepository.getGroupedImages(tWorkOrderId)).thenAnswer(
        (_) async => const Left(ServerFailure(message: 'Image Error')));

    // Act
    final result = await useCase(tWorkOrderId);

    // Assert
    expect(result.isRight, true);
    result.fold(
      (failure) => fail('Should return Right'),
      (details) {
        expect(details.workOrder, tWorkOrder);
        expect(details.groupedImages, null);
      },
    );
    verify(mockRepository.getWorkOrderById(tWorkOrderId)).called(1);
    verify(mockRepository.getGroupedImages(tWorkOrderId)).called(1);
  });

  test('should return Failure when getWorkOrderById fails', () async {
    // Arrange
    const tFailure = ServerFailure(message: 'Server Error');
    when(mockRepository.getWorkOrderById(tWorkOrderId))
        .thenAnswer((_) async => const Left(tFailure));

    // Act
    final result = await useCase(tWorkOrderId);

    // Assert
    expect(result.isLeft, true);
    result.fold(
      (failure) => expect(failure, tFailure),
      (details) => fail('Should return Left'),
    );
    verify(mockRepository.getWorkOrderById(tWorkOrderId)).called(1);
    verifyNever(mockRepository.getGroupedImages(any));
  });
}
