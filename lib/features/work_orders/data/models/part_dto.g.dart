// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PartDtoImpl _$$PartDtoImplFromJson(Map<String, dynamic> json) =>
    _$PartDtoImpl(
      id: (json['id'] as num).toInt(),
      partNumber: json['part_number'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      stockQuantity: (json['stock_quantity'] as num).toInt(),
      unit: json['unit'] as String,
      compatibleModels: (json['compatible_models'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      imageUrl: json['image_url'] as String?,
      specifications: json['specifications'] as String?,
    );

Map<String, dynamic> _$$PartDtoImplToJson(_$PartDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'part_number': instance.partNumber,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'price': instance.price,
      'stock_quantity': instance.stockQuantity,
      'unit': instance.unit,
      'compatible_models': instance.compatibleModels,
      'image_url': instance.imageUrl,
      'specifications': instance.specifications,
    };
