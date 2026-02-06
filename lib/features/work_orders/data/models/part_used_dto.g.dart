// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_used_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PartUsedDto _$PartUsedDtoFromJson(Map<String, dynamic> json) => _PartUsedDto(
      partNumber: json['partNumber'] as String?,
      quantityUsed: (json['quantity_used'] as num).toInt(),
      partName: json['partName'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$PartUsedDtoToJson(_PartUsedDto instance) =>
    <String, dynamic>{
      'partNumber': instance.partNumber,
      'quantity_used': instance.quantityUsed,
      'partName': instance.partName,
      'description': instance.description,
    };
