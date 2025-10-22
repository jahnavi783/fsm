import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/work_orders/data/models/grouped_images_response.dart';
import 'package:fsm/features/work_orders/domain/repositories/i_work_order_repository.dart';

@injectable
class GetGroupedImagesUseCase {
  final IWorkOrderRepository _repository;

  GetGroupedImagesUseCase(this._repository);

  Future<Either<Failure, GroupedImagesResponse>> call(int workOrderId) {
    return _repository.getGroupedImages(workOrderId);
  }
}
