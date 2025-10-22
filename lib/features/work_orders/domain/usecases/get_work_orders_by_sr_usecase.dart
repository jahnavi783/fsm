import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/domain/repositories/i_work_order_repository.dart';

@injectable
class GetWorkOrdersBySRUseCase {
  final IWorkOrderRepository _repository;

  GetWorkOrdersBySRUseCase(this._repository);

  Future<Either<Failure, List<WorkOrderEntity>>> call(int srId) {
    return _repository.getWorkOrdersBySR(srId);
  }
}
