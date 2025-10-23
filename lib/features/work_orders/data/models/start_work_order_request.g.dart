// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_work_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StartWorkOrderRequest _$StartWorkOrderRequestFromJson(
        Map<String, dynamic> json) =>
    _StartWorkOrderRequest(
      gpsCoordinates: json['gps_coordinates'] as String,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$StartWorkOrderRequestToJson(
        _StartWorkOrderRequest instance) =>
    <String, dynamic>{
      'gps_coordinates': instance.gpsCoordinates,
      'notes': instance.notes,
    };
