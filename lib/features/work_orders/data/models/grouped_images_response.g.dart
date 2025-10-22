// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grouped_images_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GroupedImagesResponse _$GroupedImagesResponseFromJson(
        Map<String, dynamic> json) =>
    _GroupedImagesResponse(
      workOrderId: (json['work_order_id'] as num).toInt(),
      groupedImages: GroupedImages.fromJson(
          json['grouped_images'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GroupedImagesResponseToJson(
        _GroupedImagesResponse instance) =>
    <String, dynamic>{
      'work_order_id': instance.workOrderId,
      'grouped_images': instance.groupedImages,
    };

_GroupedImages _$GroupedImagesFromJson(Map<String, dynamic> json) =>
    _GroupedImages(
      start: (json['start'] as List<dynamic>?)
              ?.map((e) => ImageLog.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      pause: (json['pause'] as List<dynamic>?)
              ?.map((e) => ImageLog.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      resume: (json['resume'] as List<dynamic>?)
              ?.map((e) => ImageLog.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      complete: (json['complete'] as List<dynamic>?)
              ?.map((e) => ImageLog.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      signature: (json['signature'] as List<dynamic>?)
              ?.map((e) => ImageLog.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GroupedImagesToJson(_GroupedImages instance) =>
    <String, dynamic>{
      'start': instance.start,
      'pause': instance.pause,
      'resume': instance.resume,
      'complete': instance.complete,
      'signature': instance.signature,
    };

_ImageLog _$ImageLogFromJson(Map<String, dynamic> json) => _ImageLog(
      imageUrls: (json['image_urls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      gpsCoordinates: json['gps_coordinates'] == null
          ? null
          : GpsCoordinates.fromJson(
              json['gps_coordinates'] as Map<String, dynamic>),
      capturedBy:
          CapturedBy.fromJson(json['captured_by'] as Map<String, dynamic>),
      capturedAt: json['captured_at'] as String,
    );

Map<String, dynamic> _$ImageLogToJson(_ImageLog instance) => <String, dynamic>{
      'image_urls': instance.imageUrls,
      'gps_coordinates': instance.gpsCoordinates,
      'captured_by': instance.capturedBy,
      'captured_at': instance.capturedAt,
    };

_GpsCoordinates _$GpsCoordinatesFromJson(Map<String, dynamic> json) =>
    _GpsCoordinates(
      type: json['type'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$GpsCoordinatesToJson(_GpsCoordinates instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };

_CapturedBy _$CapturedByFromJson(Map<String, dynamic> json) => _CapturedBy(
      id: (json['id'] as num).toInt(),
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      roleId: (json['role_id'] as num).toInt(),
    );

Map<String, dynamic> _$CapturedByToJson(_CapturedBy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'role_id': instance.roleId,
    };
