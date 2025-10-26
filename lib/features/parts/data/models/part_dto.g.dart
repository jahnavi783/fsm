// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PartDto _$PartDtoFromJson(Map<String, dynamic> json) => _PartDto(
      partNumber: json['part_number'] as String,
      partName: json['part_name'] as String,
      category: json['category'] as String,
      quantityAvailable: (json['quantity_available'] as num).toInt(),
      unitPrice: _priceFromJson(json['unit_price']),
      status: json['status'] as String,
    );

Map<String, dynamic> _$PartDtoToJson(_PartDto instance) => <String, dynamic>{
      'part_number': instance.partNumber,
      'part_name': instance.partName,
      'category': instance.category,
      'quantity_available': instance.quantityAvailable,
      'unit_price': _priceToJson(instance.unitPrice),
      'status': instance.status,
    };

_PartsResponse _$PartsResponseFromJson(Map<String, dynamic> json) =>
    _PartsResponse(
      parts: (json['parts'] as List<dynamic>)
          .map((e) => PartDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PartsResponseToJson(_PartsResponse instance) =>
    <String, dynamic>{
      'parts': instance.parts,
    };
