// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reject_work_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RejectWorkOrderRequestImpl _$$RejectWorkOrderRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$RejectWorkOrderRequestImpl(
      reason: json['reason'] as String,
      gpsCoordinates: json['gps_coordinates'] as String,
    );

Map<String, dynamic> _$$RejectWorkOrderRequestImplToJson(
        _$RejectWorkOrderRequestImpl instance) =>
    <String, dynamic>{
      'reason': instance.reason,
      'gps_coordinates': instance.gpsCoordinates,
    };
