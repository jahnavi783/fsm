// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pause_work_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PauseWorkOrderRequest _$PauseWorkOrderRequestFromJson(
        Map<String, dynamic> json) =>
    _PauseWorkOrderRequest(
      reason: json['reason'] as String,
      gpsCoordinates: json['gps_coordinates'] as String,
    );

Map<String, dynamic> _$PauseWorkOrderRequestToJson(
        _PauseWorkOrderRequest instance) =>
    <String, dynamic>{
      'reason': instance.reason,
      'gps_coordinates': instance.gpsCoordinates,
    };
