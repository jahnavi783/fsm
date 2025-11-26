import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/domain/repositories/i_work_order_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/network_info.dart';

@injectable
class CompleteWorkOrderUseCase {
  final IWorkOrderRepository _repository;
  final NetworkInfo _networkInfo;

  CompleteWorkOrderUseCase(
    this._repository,
    this._networkInfo,
  );

  Future<Either<Failure, WorkOrderEntity>> call(
      CompleteWorkOrderParams params) async {
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      return _repository.completeWorkOrder(
        workOrderId: params.workOrderId,
        workLog: params.workLog,
        customerName: params.customerName,
        signature: params.signature,
        partsUsed: params.partsUsed,
        files: params.files,
        latitude: params.latitude,
        longitude: params.longitude,
        completionNotes: params.completionNotes,
      ); // Return locally-updated entity (status = completed)
    }
    return _repository.completeWorkOrder(
      workOrderId: params.workOrderId,
      workLog: params.workLog,
      customerName: params.customerName,
      signature: params.signature,
      partsUsed: params.partsUsed,
      files: params.files,
      latitude: params.latitude,
      longitude: params.longitude,
      completionNotes: params.completionNotes,
    );
  }
}

class CompleteWorkOrderParams {
  final int workOrderId;
  final String workLog;
  final String customerName;
  final File signature;
  final List<PartUsedEntity> partsUsed;
  final List<File> files;
  final double latitude;
  final double longitude;
  final String? completionNotes;

  CompleteWorkOrderParams({
    required this.workOrderId,
    required this.workLog,
    required this.customerName,
    required this.signature,
    required this.partsUsed,
    required this.files,
    required this.latitude,
    required this.longitude,
    this.completionNotes,
  });
}
