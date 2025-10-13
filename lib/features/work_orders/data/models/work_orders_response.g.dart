// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_orders_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkOrdersResponseImpl _$$WorkOrdersResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkOrdersResponseImpl(
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      pages: (json['pages'] as num).toInt(),
      workOrders: (json['work_orders'] as List<dynamic>)
          .map((e) => WorkOrderDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WorkOrdersResponseImplToJson(
        _$WorkOrdersResponseImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'pages': instance.pages,
      'work_orders': instance.workOrders,
    };
