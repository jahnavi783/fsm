import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_grouped_images_entity.dart';
import 'package:fsm/features/work_orders/domain/repositories/i_work_order_repository.dart';

class WorkOrderDetailsResult {
  final WorkOrderEntity workOrder;
  final WorkOrderGroupedImagesEntity? groupedImages;

  WorkOrderDetailsResult({
    required this.workOrder,
    this.groupedImages,
  });
}

@injectable
class GetWorkOrderDetailsUseCase {
  final IWorkOrderRepository _repository;

  GetWorkOrderDetailsUseCase(this._repository);

  Future<Either<Failure, WorkOrderDetailsResult>> call(int workOrderId) async {
    // Fetch work order details
    final workOrderResult = await _repository.getWorkOrderById(workOrderId);

    return workOrderResult.fold(
      (failure) => Left(failure),
      (workOrder) async {
        // Fetch grouped images (non-blocking, optional)
        WorkOrderGroupedImagesEntity? groupedImages;
        final imagesResult = await _repository.getGroupedImages(workOrderId);
        imagesResult.fold(
          (failure) {
            // Images fetch failed, but don't fail the whole operation
            // Just continue without images
          },
          (images) {
            groupedImages = images;
          },
        );

        return Right(WorkOrderDetailsResult(
          workOrder: workOrder,
          groupedImages: groupedImages,
        ));
      },
    );
  }
}