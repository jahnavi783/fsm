// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_orders_by_sr_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkOrdersBySRResponse _$WorkOrdersBySRResponseFromJson(
        Map<String, dynamic> json) =>
    _WorkOrdersBySRResponse(
      serviceRequest: ServiceRequestDto.fromJson(
          json['service_request'] as Map<String, dynamic>),
      workOrders: (json['work_orders'] as List<dynamic>)
          .map((e) => WorkOrderDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WorkOrdersBySRResponseToJson(
        _WorkOrdersBySRResponse instance) =>
    <String, dynamic>{
      'service_request': instance.serviceRequest,
      'work_orders': instance.workOrders,
    };
