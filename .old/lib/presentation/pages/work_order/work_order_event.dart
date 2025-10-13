part of 'work_order_bloc.dart';

sealed class WorkOrderEvent {
  final int workOrderId;
  WorkOrderEvent({required this.workOrderId});
}

final class FetchWorkOrderEvent extends WorkOrderEvent {
  FetchWorkOrderEvent({required super.workOrderId});
}

final class StartWorkOrderEvent extends WorkOrderEvent {
  final String gpsCoordinates;
  final List<File> files;
  StartWorkOrderEvent(
      {required super.workOrderId,
      required this.gpsCoordinates,
      this.files = const []});
}

final class PauseWorkOrderEvent extends WorkOrderEvent {
  final String gpsCoordinates;
  final List<File> files;
  final String reason;
  PauseWorkOrderEvent({
    required super.workOrderId,
    required this.gpsCoordinates,
    this.files = const [],
    required this.reason,
  });
}

final class ResumeWorkOrderEvent extends WorkOrderEvent {
  final String gpsCoordinates;
  final List<File> files;
  ResumeWorkOrderEvent({
    required super.workOrderId,
    required this.gpsCoordinates,
    this.files = const [],
  });
}

final class CompleteWorkOrderEvent extends WorkOrderEvent {
  final String gpsCoordinates;
  final List<File> files;
  final String? comment;
  final List<WoCompletePartsUsedRequest> partsUsed;
  CompleteWorkOrderEvent({
    required super.workOrderId,
    required this.gpsCoordinates,
    this.comment,
    this.files = const [],
    required this.partsUsed,
  });
}

final class RejectWorkOrderEvent extends WorkOrderEvent {
  final String reason;
  RejectWorkOrderEvent({
    required super.workOrderId,
    required this.reason,
  });
}

final class CancelWorkOrderEvent extends WorkOrderEvent {
  final String reason;
  CancelWorkOrderEvent({
    required super.workOrderId,
    required this.reason,
  });
}
