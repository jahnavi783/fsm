// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkOrderResponse _$WorkOrderResponseFromJson(Map<String, dynamic> json) =>
    WorkOrderResponse(
      WorkOrderEntity.fromJson(json['work_order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WorkOrderResponseToJson(WorkOrderResponse instance) =>
    <String, dynamic>{
      'work_order': instance.workOrder,
    };
