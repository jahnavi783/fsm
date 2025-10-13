// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_work_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StartWorkOrderRequestImpl _$$StartWorkOrderRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$StartWorkOrderRequestImpl(
      gpsCoordinates: json['gps_coordinates'] as String,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$StartWorkOrderRequestImplToJson(
        _$StartWorkOrderRequestImpl instance) =>
    <String, dynamic>{
      'gps_coordinates': instance.gpsCoordinates,
      'notes': instance.notes,
    };
