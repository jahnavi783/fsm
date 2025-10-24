// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assign_work_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AssignWorkOrderRequest _$AssignWorkOrderRequestFromJson(
        Map<String, dynamic> json) =>
    _AssignWorkOrderRequest(
      assignedTo: (json['assigned_to'] as num).toInt(),
    );

Map<String, dynamic> _$AssignWorkOrderRequestToJson(
        _AssignWorkOrderRequest instance) =>
    <String, dynamic>{
      'assigned_to': instance.assignedTo,
    };
