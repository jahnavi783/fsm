// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spare_part.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SparePartEntity _$SparePartEntityFromJson(Map<String, dynamic> json) =>
    _SparePartEntity(
      partNumber: json['part_number'] as String,
      partName: json['part_name'] as String,
      category: json['category'] as String? ?? '',
      quantityAvailable: (json['quantity_available'] as num?)?.toInt() ?? 0,
      unitPrice: json['unit_price'] as String? ?? '',
      status: json['status'] as String,
    );

Map<String, dynamic> _$SparePartEntityToJson(_SparePartEntity instance) =>
    <String, dynamic>{
      'part_number': instance.partNumber,
      'part_name': instance.partName,
      'category': instance.category,
      'quantity_available': instance.quantityAvailable,
      'unit_price': instance.unitPrice,
      'status': instance.status,
    };
