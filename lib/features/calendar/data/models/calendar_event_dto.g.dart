// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_event_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CalendarEventDto _$CalendarEventDtoFromJson(Map<String, dynamic> json) =>
    _CalendarEventDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      type: json['type'] as String,
      description: json['description'] as String,
      workOrderId: (json['work_order_id'] as num?)?.toInt(),
      location: json['location'] as String?,
      isAllDay: json['is_all_day'] as bool? ?? false,
      color: json['color'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$CalendarEventDtoToJson(_CalendarEventDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'type': instance.type,
      'description': instance.description,
      'work_order_id': instance.workOrderId,
      'location': instance.location,
      'is_all_day': instance.isAllDay,
      'color': instance.color,
      'metadata': instance.metadata,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
