// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_order_image_capture_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GpsCoordinatesDto _$GpsCoordinatesDtoFromJson(Map<String, dynamic> json) =>
    _GpsCoordinatesDto(
      type: json['type'] as String,
      coordinates: _coordinatesFromJson(json['coordinates']),
    );

Map<String, dynamic> _$GpsCoordinatesDtoToJson(_GpsCoordinatesDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };

_WorkOrderImageCaptureDto _$WorkOrderImageCaptureDtoFromJson(
        Map<String, dynamic> json) =>
    _WorkOrderImageCaptureDto(
      imageUrls: (json['image_urls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      gpsCoordinates: json['gps_coordinates'] == null
          ? null
          : GpsCoordinatesDto.fromJson(
              json['gps_coordinates'] as Map<String, dynamic>),
      capturedBy:
          CapturedByDto.fromJson(json['captured_by'] as Map<String, dynamic>),
      capturedAt: json['captured_at'] as String,
    );

Map<String, dynamic> _$WorkOrderImageCaptureDtoToJson(
        _WorkOrderImageCaptureDto instance) =>
    <String, dynamic>{
      'image_urls': instance.imageUrls,
      'gps_coordinates': instance.gpsCoordinates,
      'captured_by': instance.capturedBy,
      'captured_at': instance.capturedAt,
    };
