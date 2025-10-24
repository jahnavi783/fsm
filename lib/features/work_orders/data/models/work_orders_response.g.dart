// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_orders_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkOrdersResponse _$WorkOrdersResponseFromJson(Map<String, dynamic> json) =>
    _WorkOrdersResponse(
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      pages: (json['pages'] as num).toInt(),
      workOrders: (json['work_orders'] as List<dynamic>)
          .map((e) => WorkOrderDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      unassignedWorkOrders: (json['unassigned_work_orders'] as List<dynamic>?)
              ?.map((e) => WorkOrderDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      unassignedCount: (json['unassigned_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$WorkOrdersResponseToJson(_WorkOrdersResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'pages': instance.pages,
      'work_orders': instance.workOrders,
      'unassigned_work_orders': instance.unassignedWorkOrders,
      'unassigned_count': instance.unassignedCount,
    };
