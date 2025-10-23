// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PartDto _$PartDtoFromJson(Map<String, dynamic> json) => _PartDto(
      quantity: (json['quantity'] as num?)?.toInt(),
      partName: json['partName'] as String?,
      unitPrice: json['unitPrice'] as num?,
      partNumber: json['partNumber'] as String?,
    );

Map<String, dynamic> _$PartDtoToJson(_PartDto instance) => <String, dynamic>{
      'quantity': instance.quantity,
      'partName': instance.partName,
      'unitPrice': instance.unitPrice,
      'partNumber': instance.partNumber,
    };
