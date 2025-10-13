import 'package:freezed_annotation/freezed_annotation.dart';

enum DocumentCategory {
  @JsonValue('manual')
  manual,
  @JsonValue('sop')
  sop,
  @JsonValue('repair_guide')
  repairGuide,
  @JsonValue('specification')
  specification,
  @JsonValue('safety')
  safety,
  @JsonValue('training')
  training,
  @JsonValue('other')
  other;

  @override
  String toString() {
    return switch (this) {
      DocumentCategory.manual => 'Manual',
      DocumentCategory.sop => 'SOP',
      DocumentCategory.repairGuide => 'Repair Guide',
      DocumentCategory.specification => 'Specification',
      DocumentCategory.safety => 'Safety',
      DocumentCategory.training => 'Training',
      DocumentCategory.other => 'Other',
    };
  }

  String get apiValue {
    return switch (this) {
      DocumentCategory.manual => 'manual',
      DocumentCategory.sop => 'sop',
      DocumentCategory.repairGuide => 'repair_guide',
      DocumentCategory.specification => 'specification',
      DocumentCategory.safety => 'safety',
      DocumentCategory.training => 'training',
      DocumentCategory.other => 'other',
    };
  }
}

enum WorkOrderStatus {
  @JsonValue('assigned')
  assigned,
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('paused')
  paused,
  @JsonValue('completed')
  completed,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('rejected')
  rejected;

  @override
  String toString() {
    return switch (this) {
      WorkOrderStatus.assigned => 'Assigned',
      WorkOrderStatus.inProgress => 'In Progress',
      WorkOrderStatus.paused => 'Paused',
      WorkOrderStatus.completed => 'Completed',
      WorkOrderStatus.cancelled => 'Cancelled',
      WorkOrderStatus.rejected => 'Rejected',
    };
  }

  String get apiValue {
    return switch (this) {
      WorkOrderStatus.assigned => 'assigned',
      WorkOrderStatus.inProgress => 'in_progress',
      WorkOrderStatus.paused => 'paused',
      WorkOrderStatus.completed => 'completed',
      WorkOrderStatus.cancelled => 'cancelled',
      WorkOrderStatus.rejected => 'rejected',
    };
  }
}

enum WorkOrderPriority {
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high,
  @JsonValue('urgent')
  urgent;

  @override
  String toString() {
    return switch (this) {
      WorkOrderPriority.low => 'Low',
      WorkOrderPriority.medium => 'Medium',
      WorkOrderPriority.high => 'High',
      WorkOrderPriority.urgent => 'Urgent',
    };
  }

  String get apiValue {
    return switch (this) {
      WorkOrderPriority.low => 'low',
      WorkOrderPriority.medium => 'medium',
      WorkOrderPriority.high => 'high',
      WorkOrderPriority.urgent => 'urgent',
    };
  }
}

enum CalendarEventType {
  @JsonValue('work_order')
  workOrder,
  @JsonValue('meeting')
  meeting,
  @JsonValue('training')
  training,
  @JsonValue('maintenance')
  maintenance,
  @JsonValue('break')
  break_;

  @override
  String toString() {
    return switch (this) {
      CalendarEventType.workOrder => 'Work Order',
      CalendarEventType.meeting => 'Meeting',
      CalendarEventType.training => 'Training',
      CalendarEventType.maintenance => 'Maintenance',
      CalendarEventType.break_ => 'Break',
    };
  }

  String get apiValue {
    return switch (this) {
      CalendarEventType.workOrder => 'work_order',
      CalendarEventType.meeting => 'meeting',
      CalendarEventType.training => 'training',
      CalendarEventType.maintenance => 'maintenance',
      CalendarEventType.break_ => 'break',
    };
  }
}