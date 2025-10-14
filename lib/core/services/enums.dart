import 'package:freezed_annotation/freezed_annotation.dart';

enum UserRole {
  @JsonValue(0)
  superAdmin,
  @JsonValue(1)
  manager,
  @JsonValue(2)
  helpDesk,
  @JsonValue(3)
  partsManager,
  @JsonValue(4)
  technician;

  @override
  String toString() {
    return switch (this) {
      UserRole.superAdmin => 'Super Admin',
      UserRole.manager => 'Manager',
      UserRole.helpDesk => 'Help Desk',
      UserRole.partsManager => 'Parts Manager',
      UserRole.technician => 'Technician',
    };
  }

  int get apiValue {
    return switch (this) {
      UserRole.superAdmin => 0,
      UserRole.manager => 1,
      UserRole.helpDesk => 2,
      UserRole.partsManager => 3,
      UserRole.technician => 4,
    };
  }
}

enum Gender {
  @JsonValue('male')
  male,
  @JsonValue('female')
  female;

  @override
  String toString() {
    return switch (this) {
      Gender.male => 'Male',
      Gender.female => 'Female',
    };
  }

  String get apiValue {
    return switch (this) {
      Gender.male => 'male',
      Gender.female => 'female',
    };
  }
}

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
  @JsonValue('created')
  created,
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
  rejected,
  @JsonValue('reassigned')
  reAssigned;

  @override
  String toString() {
    return switch (this) {
      WorkOrderStatus.created => 'New',
      WorkOrderStatus.assigned => 'Assigned',
      WorkOrderStatus.inProgress => 'In Progress',
      WorkOrderStatus.paused => 'Paused',
      WorkOrderStatus.completed => 'Completed',
      WorkOrderStatus.cancelled => 'Cancelled',
      WorkOrderStatus.rejected => 'Rejected',
      WorkOrderStatus.reAssigned => 'Reassigned',
    };
  }

  String get apiValue {
    return switch (this) {
      WorkOrderStatus.created => 'created',
      WorkOrderStatus.assigned => 'assigned',
      WorkOrderStatus.inProgress => 'in_progress',
      WorkOrderStatus.paused => 'paused',
      WorkOrderStatus.completed => 'completed',
      WorkOrderStatus.cancelled => 'cancelled',
      WorkOrderStatus.rejected => 'rejected',
      WorkOrderStatus.reAssigned => 'reassigned',
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
