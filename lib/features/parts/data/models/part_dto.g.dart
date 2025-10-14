// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PartDtoImpl _$$PartDtoImplFromJson(Map<String, dynamic> json) =>
    _$PartDtoImpl(
      id: (json['id'] as num).toInt(),
      partNumber: json['part_number'] as String,
      partName: json['part_name'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      unitPrice: (json['unit_price'] as num).toDouble(),
      quantityAvailable: (json['quantity_available'] as num).toInt(),
      minQuantity: (json['min_quantity'] as num).toInt(),
      maxQuantity: (json['max_quantity'] as num).toInt(),
      unit: json['unit'] as String,
      status: json['status'] as String,
      compatibleModels: (json['compatible_models'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      imageUrl: json['image_url'] as String?,
      specifications: json['specifications'] as String?,
      lastUpdated: json['last_updated'] as String?,
    );

Map<String, dynamic> _$$PartDtoImplToJson(_$PartDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'part_number': instance.partNumber,
      'part_name': instance.partName,
      'description': instance.description,
      'category': instance.category,
      'unit_price': instance.unitPrice,
      'quantity_available': instance.quantityAvailable,
      'min_quantity': instance.minQuantity,
      'max_quantity': instance.maxQuantity,
      'unit': instance.unit,
      'status': instance.status,
      'compatible_models': instance.compatibleModels,
      'image_url': instance.imageUrl,
      'specifications': instance.specifications,
      'last_updated': instance.lastUpdated,
    };
