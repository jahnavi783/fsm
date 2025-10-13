// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resume_work_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResumeWorkOrderRequestImpl _$$ResumeWorkOrderRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ResumeWorkOrderRequestImpl(
      gpsCoordinates: json['gps_coordinates'] as String,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$ResumeWorkOrderRequestImplToJson(
        _$ResumeWorkOrderRequestImpl instance) =>
    <String, dynamic>{
      'gps_coordinates': instance.gpsCoordinates,
      'notes': instance.notes,
    };
