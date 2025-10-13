// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_log_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkLogDtoImpl _$$WorkLogDtoImplFromJson(Map<String, dynamic> json) =>
    _$WorkLogDtoImpl(
      id: (json['id'] as num).toInt(),
      workOrderId: (json['work_order_id'] as num).toInt(),
      type: json['type'] as String,
      description: json['description'] as String,
      timestamp: json['timestamp'] as String,
      notes: json['notes'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      userId: json['user_id'] as String?,
      userName: json['user_name'] as String?,
    );

Map<String, dynamic> _$$WorkLogDtoImplToJson(_$WorkLogDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'work_order_id': instance.workOrderId,
      'type': instance.type,
      'description': instance.description,
      'timestamp': instance.timestamp,
      'notes': instance.notes,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'user_id': instance.userId,
      'user_name': instance.userName,
    };
