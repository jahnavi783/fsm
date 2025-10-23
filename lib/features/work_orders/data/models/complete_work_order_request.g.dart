// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_work_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompleteWorkOrderRequest _$CompleteWorkOrderRequestFromJson(
        Map<String, dynamic> json) =>
    _CompleteWorkOrderRequest(
      workLog: json['workLog'] as String,
      partsUsed: (json['partsUsed'] as List<dynamic>)
          .map((e) => PartUsedRequestDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      gpsCoordinates: json['gpsCoordinates'] as String,
      completionNotes: json['completionNotes'] as String?,
    );

Map<String, dynamic> _$CompleteWorkOrderRequestToJson(
        _CompleteWorkOrderRequest instance) =>
    <String, dynamic>{
      'workLog': instance.workLog,
      'partsUsed': instance.partsUsed,
      'images': instance.images,
      'gpsCoordinates': instance.gpsCoordinates,
      'completionNotes': instance.completionNotes,
    };

_PartUsedRequestDto _$PartUsedRequestDtoFromJson(Map<String, dynamic> json) =>
    _PartUsedRequestDto(
      partNumber: json['partNumber'] as String,
      quantityUsed: (json['quantityUsed'] as num).toInt(),
    );

Map<String, dynamic> _$PartUsedRequestDtoToJson(_PartUsedRequestDto instance) =>
    <String, dynamic>{
      'partNumber': instance.partNumber,
      'quantityUsed': instance.quantityUsed,
    };
