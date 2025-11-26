import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm/features/work_orders/domain/entities/customer_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/location_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/part_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/service_request_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/work_log_entity.dart';

part 'work_order_entity.freezed.dart';

@freezed
abstract class WorkOrderEntity with _$WorkOrderEntity {
  const WorkOrderEntity._();

  const factory WorkOrderEntity({
    required int id,
    required String woNumber,
    required int srId,
    required String summary,
    required String problemDescription,
    required WorkOrderPriority priority,
    required DateTime visitDate,
    required String location,
    required WorkOrderStatus status,
    required int durationDays,
    double? durationHours,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? startedAt,
    DateTime? resumedAt,
    DateTime? completedAt,
    String? pauseLogs,
    String? workLog,
    @Default([]) List<PartUsedEntity> partsUsed,
    @Default([]) List<String> images,
    CustomerEntity? customer,
    LocationEntity? locationDetails,
    ServiceRequestEntity? serviceRequest,
    @Default([]) List<WorkLogEntity> workLogs,
    @Default([]) List<String> requiredSkills,
    @Default([]) List<PartEntity> requiredParts,
    @Default([]) List<String> attachments,
    String? completionNotes,
    String? userId,
  }) = _WorkOrderEntity;

  // Business logic methods
  bool get canBeStarted => status == WorkOrderStatus.assigned;
  bool get canBePaused => status == WorkOrderStatus.inProgress;
  bool get canBeResumed => status == WorkOrderStatus.paused;
  bool get canBeCompleted => status == WorkOrderStatus.inProgress;
  bool get canBeRejected =>
      status == WorkOrderStatus.assigned || status == WorkOrderStatus.paused;
  bool get isOverdue => visitDate.isBefore(DateTime.now()) && !isCompleted;
  bool get isCompleted => status == WorkOrderStatus.completed;
  bool get isInProgress => status == WorkOrderStatus.inProgress;
  bool get isPaused => status == WorkOrderStatus.paused;
  bool get isAssigned => status == WorkOrderStatus.assigned;
  bool get isRejected => status == WorkOrderStatus.rejected;

  Duration? get totalWorkDuration {
    if (startedAt == null) return null;
    if (completedAt != null) {
      return completedAt!.difference(startedAt!);
    }
    if (isInProgress) {
      return DateTime.now().difference(startedAt!);
    }
    return null;
  }

  String get statusDisplayName => status.displayName;
  String get priorityDisplayName => priority.displayName;
}

enum WorkOrderStatus {
  created,
  assigned,
  inProgress,
  paused,
  completed,
  rejected,
  reAssigned;

  String get displayName {
    switch (this) {
      case WorkOrderStatus.created:
        return 'New';
      case WorkOrderStatus.assigned:
        return 'Assigned';
      case WorkOrderStatus.inProgress:
        return 'In Progress';
      case WorkOrderStatus.paused:
        return 'Paused';
      case WorkOrderStatus.completed:
        return 'Completed';
      case WorkOrderStatus.rejected:
        return 'Rejected';
      case WorkOrderStatus.reAssigned:
        return 'Reassigned';
    }
  }

  @override
  String toString() {
    switch (this) {
      case WorkOrderStatus.created:
        return 'created';
      case WorkOrderStatus.assigned:
        return 'assigned';
      case WorkOrderStatus.inProgress:
        return 'in_progress';
      case WorkOrderStatus.paused:
        return 'paused';
      case WorkOrderStatus.completed:
        return 'completed';

      case WorkOrderStatus.rejected:
        return 'rejected';

      case WorkOrderStatus.reAssigned:
        return 're_assigned';
    }
  }
}

enum WorkOrderPriority {
  low,
  medium,
  high,
  urgent;

  String get displayName {
    switch (this) {
      case WorkOrderPriority.low:
        return 'Low';
      case WorkOrderPriority.medium:
        return 'Medium';
      case WorkOrderPriority.high:
        return 'High';
      case WorkOrderPriority.urgent:
        return 'Urgent';
    }
  }
}

@freezed
abstract class PartUsedEntity with _$PartUsedEntity {
  const factory PartUsedEntity({
    required String partNumber,
    required int quantityUsed,
    String? partName,
    String? description,
  }) = _PartUsedEntity;
}
