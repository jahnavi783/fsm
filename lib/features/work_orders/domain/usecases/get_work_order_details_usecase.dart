import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/domain/repositories/i_work_order_repository.dart';

@injectable
class GetWorkOrderDetailsUseCase {
  final IWorkOrderRepository _repository;
  
  GetWorkOrderDetailsUseCase(this._repository);
  
  Future<Either<Failure, WorkOrderEntity>> call(int workOrderId) {
    return _repository.getWorkOrderById(workOrderId);
  }
}