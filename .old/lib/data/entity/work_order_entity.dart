import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm_flutter/core/utils.dart';
import 'package:fsm_flutter/data/entity/service_request_entity.dart';
import 'package:fsm_flutter/data/entity/user_entity.dart';
import 'package:fsm_flutter/data/response/wo_complete_request.dart';

part 'work_order_entity.freezed.dart';
part 'work_order_entity.g.dart';

@freezed
abstract class WorkOrderEntity with _$WorkOrderEntity {
  const WorkOrderEntity._();
  const factory WorkOrderEntity({
    required int id,
    @JsonKey(name: 'wo_number') required String woNumber,
    @JsonKey(name: 'sr_id') required int srId,
    @Default('') String summary,
    @Default('')
    @JsonKey(name: 'problem_description')
    String problemDescription,
    required WorkOrderPriority priority,
    @DateTimeConverter() @JsonKey(name: 'visit_date') DateTime? visitDate,
    @Default('') String location,
    required WorkOrderStatus status,
    @Default(30) @JsonKey(name: 'duration') int duration,
    @DateTimeConverter() @JsonKey(name: 'started_at') DateTime? startedAt,
    @DateTimeConverter() @JsonKey(name: 'resumed_at') DateTime? resumedAt,
    @DateTimeConverter() @JsonKey(name: 'completed_at') DateTime? completedAt,
    @JsonKey(name: 'pause_logs') dynamic pauseLogs,
    @JsonKey(name: 'work_log') String? workLog,
    @Default([])
    @JsonDecoder()
    @JsonKey(name: 'parts_used')
    List<WoCompletePartsUsedRequest> partsUsed,
    @Default([]) @JsonKey(name: 'images') List<String> images,
    @DateTimeConverter() required DateTime createdAt,
    @DateTimeConverter() required DateTime updatedAt,
    UserEntity? createdBy,
    UserEntity? assignedTo,
    ServiceRequestEntity? serviceRequest,
  }) = _WorkOrderEntity;

  factory WorkOrderEntity.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderEntityFromJson(json);
}

enum WorkOrderStatus {
  @JsonValue('Completed')
  completed,
  @JsonValue('Paused')
  paused,
  @JsonValue('New')
  created,
  @JsonValue('Assigned')
  assigned,
  @JsonValue('In Progress')
  inProgress,
  @JsonValue('Rejected')
  rejected,
  @JsonValue('Reassigned')
  reAssigned;

  @override
  String toString() {
    return switch (this) {
      WorkOrderStatus.completed => 'Completed',
      WorkOrderStatus.paused => 'Paused',
      WorkOrderStatus.created => 'New',
      WorkOrderStatus.assigned => 'Assigned',
      WorkOrderStatus.inProgress => 'In Progress',
      WorkOrderStatus.rejected => 'Rejected',
      WorkOrderStatus.reAssigned => 'Reassigned',
    };
  }
}

enum WorkOrderPriority {
  @JsonValue('high')
  high,
  @JsonValue('medium')
  medium,
  @JsonValue('low')
  low;

  @override
  String toString() {
    return switch (this) {
      WorkOrderPriority.high => 'High',
      WorkOrderPriority.medium => 'Medium',
      WorkOrderPriority.low => 'Low',
    };
  }
}
