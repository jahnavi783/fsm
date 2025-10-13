// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_work_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompleteWorkOrderRequestImpl _$$CompleteWorkOrderRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CompleteWorkOrderRequestImpl(
      workLog: json['work_log'] as String,
      partsUsed: (json['parts_used'] as List<dynamic>)
          .map((e) => PartUsedRequestDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      gpsCoordinates: json['gps_coordinates'] as String,
      completionNotes: json['completion_notes'] as String?,
    );

Map<String, dynamic> _$$CompleteWorkOrderRequestImplToJson(
        _$CompleteWorkOrderRequestImpl instance) =>
    <String, dynamic>{
      'work_log': instance.workLog,
      'parts_used': instance.partsUsed,
      'images': instance.images,
      'gps_coordinates': instance.gpsCoordinates,
      'completion_notes': instance.completionNotes,
    };

_$PartUsedRequestDtoImpl _$$PartUsedRequestDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PartUsedRequestDtoImpl(
      partNumber: json['part_number'] as String,
      quantityUsed: (json['quantity_used'] as num).toInt(),
    );

Map<String, dynamic> _$$PartUsedRequestDtoImplToJson(
        _$PartUsedRequestDtoImpl instance) =>
    <String, dynamic>{
      'part_number': instance.partNumber,
      'quantity_used': instance.quantityUsed,
    };
