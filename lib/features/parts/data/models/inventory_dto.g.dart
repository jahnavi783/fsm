// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InventoryDto _$InventoryDtoFromJson(Map<String, dynamic> json) =>
    _InventoryDto(
      partId: (json['part_id'] as num).toInt(),
      partNumber: json['part_number'] as String,
      quantity: (json['quantity'] as num).toInt(),
      minQuantity: (json['min_quantity'] as num).toInt(),
      maxQuantity: (json['max_quantity'] as num).toInt(),
      lastUpdated: json['last_updated'] as String,
      location: json['location'] as String,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$InventoryDtoToJson(_InventoryDto instance) =>
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

_InventoryUpdateDto _$InventoryUpdateDtoFromJson(Map<String, dynamic> json) =>
    _InventoryUpdateDto(
      partId: (json['part_id'] as num).toInt(),
      quantityChange: (json['quantity_change'] as num).toInt(),
      type: json['type'] as String,
      reason: json['reason'] as String,
      timestamp: json['timestamp'] as String,
      workOrderId: json['work_order_id'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$InventoryUpdateDtoToJson(_InventoryUpdateDto instance) =>
    <String, dynamic>{
      'part_id': instance.partId,
      'quantity_change': instance.quantityChange,
      'type': instance.type,
      'reason': instance.reason,
      'timestamp': instance.timestamp,
      'work_order_id': instance.workOrderId,
      'notes': instance.notes,
    };

_InventoryUpdateRequest _$InventoryUpdateRequestFromJson(
        Map<String, dynamic> json) =>
    _InventoryUpdateRequest(
      quantityChange: (json['quantity_change'] as num).toInt(),
      type: json['type'] as String,
      reason: json['reason'] as String,
      workOrderId: json['work_order_id'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$InventoryUpdateRequestToJson(
        _InventoryUpdateRequest instance) =>
    <String, dynamic>{
      'quantity_change': instance.quantityChange,
      'type': instance.type,
      'reason': instance.reason,
      'work_order_id': instance.workOrderId,
      'notes': instance.notes,
    };

_PartsResponse _$PartsResponseFromJson(Map<String, dynamic> json) =>
    _PartsResponse(
      parts: (json['parts'] as List<dynamic>)
          .map((e) => PartDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: (json['total_count'] as num?)?.toInt() ?? 0,
      currentPage: (json['current_page'] as num?)?.toInt() ?? 1,
      totalPages: (json['total_pages'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$PartsResponseToJson(_PartsResponse instance) =>
    <String, dynamic>{
      'parts': instance.parts,
      'total_count': instance.totalCount,
      'current_page': instance.currentPage,
      'total_pages': instance.totalPages,
    };

_InventoryResponse _$InventoryResponseFromJson(Map<String, dynamic> json) =>
    _InventoryResponse(
      inventory: (json['inventory'] as List<dynamic>)
          .map((e) => InventoryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: (json['total_count'] as num).toInt(),
      currentPage: (json['current_page'] as num).toInt(),
      totalPages: (json['total_pages'] as num).toInt(),
    );

Map<String, dynamic> _$InventoryResponseToJson(_InventoryResponse instance) =>
    <String, dynamic>{
      'inventory': instance.inventory,
      'total_count': instance.totalCount,
      'current_page': instance.currentPage,
      'total_pages': instance.totalPages,
    };
