// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wo_complete_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WoCompleteRequest _$WoCompleteRequestFromJson(Map<String, dynamic> json) =>
    WoCompleteRequest(
      json['work_log'] as String,
      (json['parts_used'] as List<dynamic>)
          .map((e) =>
              WoCompletePartsUsedRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$WoCompleteRequestToJson(WoCompleteRequest instance) =>
    <String, dynamic>{
      'work_log': instance.workLog,
      'parts_used': instance.partsUsed,
      'images': instance.images,
    };

WoCompletePartsUsedRequest _$WoCompletePartsUsedRequestFromJson(
        Map<String, dynamic> json) =>
    WoCompletePartsUsedRequest(
      json['part_number'] as String,
      (json['quantity_used'] as num).toInt(),
    );

Map<String, dynamic> _$WoCompletePartsUsedRequestToJson(
        WoCompletePartsUsedRequest instance) =>
    <String, dynamic>{
      'part_number': instance.partNumber,
      'quantity_used': instance.quantityUsed,
    };
