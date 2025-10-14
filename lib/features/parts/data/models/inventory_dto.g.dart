// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InventoryDtoImpl _$$InventoryDtoImplFromJson(Map<String, dynamic> json) =>
    _$InventoryDtoImpl(
      partId: (json['part_id'] as num).toInt(),
      partNumber: json['part_number'] as String,
      quantity: (json['quantity'] as num).toInt(),
      minQuantity: (json['min_quantity'] as num).toInt(),
      maxQuantity: (json['max_quantity'] as num).toInt(),
      lastUpdated: json['last_updated'] as String,
      location: json['location'] as String,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$InventoryDtoImplToJson(_$InventoryDtoImpl instance) =>
    <String, dynamic>{
      'part_id': instance.partId,
      'part_number': instance.partNumber,
      'quantity': instance.quantity,
      'min_quantity': instance.minQuantity,
      'max_quantity': instance.maxQuantity,
      'last_updated': instance.lastUpdated,
      'location': instance.location,
      'notes': instance.notes,
    };

_$InventoryUpdateDtoImpl _$$InventoryUpdateDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$InventoryUpdateDtoImpl(
      partId: (json['part_id'] as num).toInt(),
      quantityChange: (json['quantity_change'] as num).toInt(),
      type: json['type'] as String,
      reason: json['reason'] as String,
      timestamp: json['timestamp'] as String,
      workOrderId: json['work_order_id'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$InventoryUpdateDtoImplToJson(
        _$InventoryUpdateDtoImpl instance) =>
    <String, dynamic>{
      'part_id': instance.partId,
      'quantity_change': instance.quantityChange,
      'type': instance.type,
      'reason': instance.reason,
      'timestamp': instance.timestamp,
      'work_order_id': instance.workOrderId,
      'notes': instance.notes,
    };

_$InventoryUpdateRequestImpl _$$InventoryUpdateRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$InventoryUpdateRequestImpl(
      quantityChange: (json['quantity_change'] as num).toInt(),
      type: json['type'] as String,
      reason: json['reason'] as String,
      workOrderId: json['work_order_id'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$InventoryUpdateRequestImplToJson(
        _$InventoryUpdateRequestImpl instance) =>
    <String, dynamic>{
      'quantity_change': instance.quantityChange,
      'type': instance.type,
      'reason': instance.reason,
      'work_order_id': instance.workOrderId,
      'notes': instance.notes,
    };

_$PartsResponseImpl _$$PartsResponseImplFromJson(Map<String, dynamic> json) =>
    _$PartsResponseImpl(
      parts: (json['parts'] as List<dynamic>)
          .map((e) => PartDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: (json['total_count'] as num).toInt(),
      currentPage: (json['current_page'] as num).toInt(),
      totalPages: (json['total_pages'] as num).toInt(),
    );

Map<String, dynamic> _$$PartsResponseImplToJson(_$PartsResponseImpl instance) =>
    <String, dynamic>{
      'parts': instance.parts,
      'total_count': instance.totalCount,
      'current_page': instance.currentPage,
      'total_pages': instance.totalPages,
    };

_$InventoryResponseImpl _$$InventoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$InventoryResponseImpl(
      inventory: (json['inventory'] as List<dynamic>)
          .map((e) => InventoryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: (json['total_count'] as num).toInt(),
      currentPage: (json['current_page'] as num).toInt(),
      totalPages: (json['total_pages'] as num).toInt(),
    );

Map<String, dynamic> _$$InventoryResponseImplToJson(
        _$InventoryResponseImpl instance) =>
    <String, dynamic>{
      'inventory': instance.inventory,
      'total_count': instance.totalCount,
      'current_page': instance.currentPage,
      'total_pages': instance.totalPages,
    };
