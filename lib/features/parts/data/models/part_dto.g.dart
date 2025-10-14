// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PartDtoImpl _$$PartDtoImplFromJson(Map<String, dynamic> json) =>
    _$PartDtoImpl(
      partNumber: json['part_number'] as String,
      partName: json['part_name'] as String,
      category: json['category'] as String,
      quantityAvailable: (json['quantity_available'] as num).toInt(),
      unitPrice: (json['unit_price'] as num).toDouble(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$PartDtoImplToJson(_$PartDtoImpl instance) =>
    <String, dynamic>{
      'part_number': instance.partNumber,
      'part_name': instance.partName,
      'category': instance.category,
      'quantity_available': instance.quantityAvailable,
      'unit_price': instance.unitPrice,
      'status': instance.status,
    };

_$PartsResponseImpl _$$PartsResponseImplFromJson(Map<String, dynamic> json) =>
    _$PartsResponseImpl(
      parts: (json['parts'] as List<dynamic>)
          .map((e) => PartDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PartsResponseImplToJson(_$PartsResponseImpl instance) =>
    <String, dynamic>{
      'parts': instance.parts,
    };
