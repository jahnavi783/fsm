// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventoryResponse _$InventoryResponseFromJson(Map<String, dynamic> json) =>
    InventoryResponse(
      parts: (json['parts'] as List<dynamic>)
          .map((e) => SparePartEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InventoryResponseToJson(InventoryResponse instance) =>
    <String, dynamic>{
      'parts': instance.parts,
    };
