import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/work_orders_data.dart';
import 'package:fsm/features/work_orders/domain/repositories/i_work_order_repository.dart';

@injectable
class GetWorkOrdersUseCase {
  final IWorkOrderRepository _repository;

  GetWorkOrdersUseCase(this._repository);

  Future<Either<Failure, WorkOrdersData>> call(GetWorkOrdersParams params) {
    return _repository.getWorkOrders(
      page: params.page,
      limit: params.limit,
      status: params.status,
      priority: params.priority,
      searchQuery: params.searchQuery,
    );
  }
}

class GetWorkOrdersParams {
  final int page;
  final int limit;
  final WorkOrderStatus? status;
  final WorkOrderPriority? priority;
  final String? searchQuery;
  
  GetWorkOrdersParams({
    required this.page,
    required this.limit,
    this.status,
    this.priority,
    this.searchQuery,
  });
}