// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkOrderResponse _$WorkOrderResponseFromJson(Map<String, dynamic> json) =>
    _WorkOrderResponse(
      workOrder:
          WorkOrderDto.fromJson(json['work_order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WorkOrderResponseToJson(_WorkOrderResponse instance) =>
    <String, dynamic>{
      'work_order': instance.workOrder,
    };
