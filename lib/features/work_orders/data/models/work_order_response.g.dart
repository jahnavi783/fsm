// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkOrderResponseImpl _$$WorkOrderResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkOrderResponseImpl(
      workOrder:
          WorkOrderDto.fromJson(json['work_order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WorkOrderResponseImplToJson(
        _$WorkOrderResponseImpl instance) =>
    <String, dynamic>{
      'work_order': instance.workOrder,
    };
