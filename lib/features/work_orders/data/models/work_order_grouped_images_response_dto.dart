import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm/features/work_orders/data/models/work_order_image_capture_dto.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_grouped_images_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_image_capture_entity.dart';

part 'work_order_grouped_images_response_dto.freezed.dart';
part 'work_order_grouped_images_response_dto.g.dart';

/// Helper function to parse work_order_id which may come as String or int
int _workOrderIdFromJson(dynamic value) {
  if (value is int) return value;
  if (value is String) return int.parse(value);
  throw FormatException('Invalid work_order_id type: ${value.runtimeType}');
}

@freezed
abstract class WorkOrderGroupedImagesResponseDto
    with _$WorkOrderGroupedImagesResponseDto {
  const factory WorkOrderGroupedImagesResponseDto({
    @JsonKey(name: 'work_order_id', fromJson: _workOrderIdFromJson)
    required int workOrderId,
    @JsonKey(name: 'grouped_images')
    required Map<String, List<WorkOrderImageCaptureDto>> groupedImages,
  }) = _WorkOrderGroupedImagesResponseDto;

  factory WorkOrderGroupedImagesResponseDto.fromJson(
          Map<String, dynamic> json) =>
      _$WorkOrderGroupedImagesResponseDtoFromJson(json);
}

extension WorkOrderGroupedImagesResponseDtoX
    on WorkOrderGroupedImagesResponseDto {
  WorkOrderGroupedImagesEntity toEntity() {
    // Convert map of DTOs to map of entities
    final Map<String, List<WorkOrderImageCaptureEntity>> entityMap = {};

    groupedImages.forEach((key, value) {
      entityMap[key] = value.map((dto) => dto.toEntity()).toList();
    });

    return WorkOrderGroupedImagesEntity(
      workOrderId: workOrderId,
      groupedImages: entityMap,
    );
  }
}
