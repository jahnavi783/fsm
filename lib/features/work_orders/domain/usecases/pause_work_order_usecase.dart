import 'dart:io';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/domain/repositories/i_work_order_repository.dart';

@injectable
class PauseWorkOrderUseCase {
  final IWorkOrderRepository _repository;
  
  PauseWorkOrderUseCase(this._repository);
  
  Future<Either<Failure, WorkOrderEntity>> call(PauseWorkOrderParams params) {
    return _repository.pauseWorkOrder(
      workOrderId: params.workOrderId,
      reason: params.reason,
      latitude: params.latitude,
      longitude: params.longitude,
      files: params.files,
    );
  }
}

class PauseWorkOrderParams {
  final int workOrderId;
  final String reason;
  final double latitude;
  final double longitude;
  final List<File> files;
  
  PauseWorkOrderParams({
    required this.workOrderId,
    required this.reason,
    required this.latitude,
    required this.longitude,
    this.files = const [],
  });
}