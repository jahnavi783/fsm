// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pause_work_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PauseWorkOrderRequestImpl _$$PauseWorkOrderRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$PauseWorkOrderRequestImpl(
      reason: json['reason'] as String,
      gpsCoordinates: json['gps_coordinates'] as String,
    );

Map<String, dynamic> _$$PauseWorkOrderRequestImplToJson(
        _$PauseWorkOrderRequestImpl instance) =>
    <String, dynamic>{
      'reason': instance.reason,
      'gps_coordinates': instance.gpsCoordinates,
    };
