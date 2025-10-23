// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reject_work_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RejectWorkOrderRequest _$RejectWorkOrderRequestFromJson(
        Map<String, dynamic> json) =>
    _RejectWorkOrderRequest(
      reason: json['reason'] as String,
      gpsCoordinates: json['gps_coordinates'] as String,
    );

Map<String, dynamic> _$RejectWorkOrderRequestToJson(
        _RejectWorkOrderRequest instance) =>
    <String, dynamic>{
      'reason': instance.reason,
      'gps_coordinates': instance.gpsCoordinates,
    };
