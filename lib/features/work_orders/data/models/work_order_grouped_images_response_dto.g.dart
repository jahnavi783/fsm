// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_order_grouped_images_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkOrderGroupedImagesResponseDto _$WorkOrderGroupedImagesResponseDtoFromJson(
        Map<String, dynamic> json) =>
    _WorkOrderGroupedImagesResponseDto(
      workOrderId: _workOrderIdFromJson(json['work_order_id']),
      groupedImages: (json['grouped_images'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => WorkOrderImageCaptureDto.fromJson(
                    e as Map<String, dynamic>))
                .toList()),
      ),
      pauseCounts: (json['pause_counts'] as List<dynamic>?)
          ?.map((e) => PauseCountDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WorkOrderGroupedImagesResponseDtoToJson(
        _WorkOrderGroupedImagesResponseDto instance) =>
    <String, dynamic>{
      'work_order_id': instance.workOrderId,
      'grouped_images': instance.groupedImages,
      'pause_counts': instance.pauseCounts,
    };

_PauseCountDto _$PauseCountDtoFromJson(Map<String, dynamic> json) =>
    _PauseCountDto(
      userId: (json['user_id'] as num).toInt(),
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      pauseCount: (json['pause_count'] as num).toInt(),
    );

Map<String, dynamic> _$PauseCountDtoToJson(_PauseCountDto instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'pause_count': instance.pauseCount,
    };
