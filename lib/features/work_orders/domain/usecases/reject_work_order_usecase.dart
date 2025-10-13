import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/domain/repositories/i_work_order_repository.dart';

@injectable
class RejectWorkOrderUseCase {
  final IWorkOrderRepository _repository;
  
  RejectWorkOrderUseCase(this._repository);
  
  Future<Either<Failure, WorkOrderEntity>> call(RejectWorkOrderParams params) {
    return _repository.rejectWorkOrder(
      workOrderId: params.workOrderId,
      reason: params.reason,
      latitude: params.latitude,
      longitude: params.longitude,
    );
  }
}

class RejectWorkOrderParams {
  final int workOrderId;
  final String reason;
  final double latitude;
  final double longitude;
  
  RejectWorkOrderParams({
    required this.workOrderId,
    required this.reason,
    required this.latitude,
    required this.longitude,
  });
}