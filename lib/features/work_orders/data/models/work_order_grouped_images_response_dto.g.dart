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
    );

Map<String, dynamic> _$WorkOrderGroupedImagesResponseDtoToJson(
        _WorkOrderGroupedImagesResponseDto instance) =>
    <String, dynamic>{
      'work_order_id': instance.workOrderId,
      'grouped_images': instance.groupedImages,
    };
