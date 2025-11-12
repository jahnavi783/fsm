import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';

part 'work_order_action_event.freezed.dart';

@freezed
class WorkOrderActionEvent with _$WorkOrderActionEvent {
  const factory WorkOrderActionEvent.loadWorkOrder(int workOrderId) =
      _LoadWorkOrder;

  const factory WorkOrderActionEvent.startWorkOrder({
    required int workOrderId,
    required double latitude,
    required double longitude,
    @Default([]) List<File> files,
    String? notes,
  }) = _StartWorkOrder;

  const factory WorkOrderActionEvent.pauseWorkOrder({
    required int workOrderId,
    required String reason,
    required double latitude,
    required double longitude,
    @Default([]) List<File> files,
  }) = _PauseWorkOrder;

  const factory WorkOrderActionEvent.resumeWorkOrder({
    required int workOrderId,
    required double latitude,
    required double longitude,
    @Default([]) List<File> files,
    String? notes,
  }) = _ResumeWorkOrder;

  const factory WorkOrderActionEvent.completeWorkOrder({
    required int workOrderId,
    required String workLog,
    required String customerName,
    required File signature,
    @Default([]) List<PartUsedEntity> partsUsed,
    @Default([]) List<File> files,
    required double latitude,
    required double longitude,
    String? completionNotes,
  }) = _CompleteWorkOrder;

  const factory WorkOrderActionEvent.rejectWorkOrder({
    required int workOrderId,
    required String reason,
    required double latitude,
    required double longitude,
  }) = _RejectWorkOrder;

  const factory WorkOrderActionEvent.captureLocation() = _CaptureLocation;

  const factory WorkOrderActionEvent.clearError() = _ClearError;
}
