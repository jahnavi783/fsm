import 'dart:io';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/domain/repositories/i_work_order_repository.dart';

@injectable
class ResumeWorkOrderUseCase {
  final IWorkOrderRepository _repository;
  
  ResumeWorkOrderUseCase(this._repository);
  
  Future<Either<Failure, WorkOrderEntity>> call(ResumeWorkOrderParams params) {
    return _repository.resumeWorkOrder(
      workOrderId: params.workOrderId,
      latitude: params.latitude,
      longitude: params.longitude,
      files: params.files,
      notes: params.notes,
    );
  }
}

class ResumeWorkOrderParams {
  final int workOrderId;
  final double latitude;
  final double longitude;
  final List<File> files;
  final String? notes;
  
  ResumeWorkOrderParams({
    required this.workOrderId,
    required this.latitude,
    required this.longitude,
    this.files = const [],
    this.notes,
  });
}