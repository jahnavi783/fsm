// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_order_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkOrderEntity _$WorkOrderEntityFromJson(Map<String, dynamic> json) =>
    _WorkOrderEntity(
      id: (json['id'] as num).toInt(),
      woNumber: json['wo_number'] as String,
      srId: (json['sr_id'] as num).toInt(),
      summary: json['summary'] as String? ?? '',
      problemDescription: json['problem_description'] as String? ?? '',
      priority: $enumDecode(_$WorkOrderPriorityEnumMap, json['priority']),
      visitDate: _$JsonConverterFromJson<String, DateTime>(
          json['visit_date'], const DateTimeConverter().fromJson),
      location: json['location'] as String? ?? '',
      status: $enumDecode(_$WorkOrderStatusEnumMap, json['status']),
      duration: (json['duration'] as num?)?.toInt() ?? 30,
      startedAt: _$JsonConverterFromJson<String, DateTime>(
          json['started_at'], const DateTimeConverter().fromJson),
      resumedAt: _$JsonConverterFromJson<String, DateTime>(
          json['resumed_at'], const DateTimeConverter().fromJson),
      completedAt: _$JsonConverterFromJson<String, DateTime>(
          json['completed_at'], const DateTimeConverter().fromJson),
      pauseLogs: json['pause_logs'],
      workLog: json['work_log'] as String?,
      partsUsed: json['parts_used'] == null
          ? const []
          : const JsonDecoder().fromJson(json['parts_used'] as String),
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt:
          const DateTimeConverter().fromJson(json['createdAt'] as String),
      updatedAt:
          const DateTimeConverter().fromJson(json['updatedAt'] as String),
      createdBy: json['createdBy'] == null
          ? null
          : UserEntity.fromJson(json['createdBy'] as Map<String, dynamic>),
      assignedTo: json['assignedTo'] == null
          ? null
          : UserEntity.fromJson(json['assignedTo'] as Map<String, dynamic>),
      serviceRequest: json['serviceRequest'] == null
          ? null
          : ServiceRequestEntity.fromJson(
              json['serviceRequest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WorkOrderEntityToJson(_WorkOrderEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'wo_number': instance.woNumber,
      'sr_id': instance.srId,
      'summary': instance.summary,
      'problem_description': instance.problemDescription,
      'priority': _$WorkOrderPriorityEnumMap[instance.priority]!,
      'visit_date': _$JsonConverterToJson<String, DateTime>(
          instance.visitDate, const DateTimeConverter().toJson),
      'location': instance.location,
      'status': _$WorkOrderStatusEnumMap[instance.status]!,
      'duration': instance.duration,
      'started_at': _$JsonConverterToJson<String, DateTime>(
          instance.startedAt, const DateTimeConverter().toJson),
      'resumed_at': _$JsonConverterToJson<String, DateTime>(
          instance.resumedAt, const DateTimeConverter().toJson),
      'completed_at': _$JsonConverterToJson<String, DateTime>(
          instance.completedAt, const DateTimeConverter().toJson),
      'pause_logs': instance.pauseLogs,
      'work_log': instance.workLog,
      'parts_used': const JsonDecoder().toJson(instance.partsUsed),
      'images': instance.images,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'updatedAt': const DateTimeConverter().toJson(instance.updatedAt),
      'createdBy': instance.createdBy,
      'assignedTo': instance.assignedTo,
      'serviceRequest': instance.serviceRequest,
    };

const _$WorkOrderPriorityEnumMap = {
  WorkOrderPriority.high: 'high',
  WorkOrderPriority.medium: 'medium',
  WorkOrderPriority.low: 'low',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$WorkOrderStatusEnumMap = {
  WorkOrderStatus.completed: 'Completed',
  WorkOrderStatus.paused: 'Paused',
  WorkOrderStatus.created: 'New',
  WorkOrderStatus.assigned: 'Assigned',
  WorkOrderStatus.inProgress: 'In Progress',
  WorkOrderStatus.rejected: 'Rejected',
  WorkOrderStatus.reAssigned: 'Reassigned',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
