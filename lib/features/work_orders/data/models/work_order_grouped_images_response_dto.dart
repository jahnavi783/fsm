import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm/features/work_orders/data/models/work_order_image_capture_dto.dart';
import 'package:fsm/features/work_orders/domain/entities/pause_count_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_grouped_images_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_image_capture_entity.dart';

part 'work_order_grouped_images_response_dto.freezed.dart';
part 'work_order_grouped_images_response_dto.g.dart';

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
    @JsonKey(name: 'pause_counts') List<PauseCountDto>? pauseCounts,
  }) = _WorkOrderGroupedImagesResponseDto;

  factory WorkOrderGroupedImagesResponseDto.fromJson(
          Map<String, dynamic> json) =>
      _$WorkOrderGroupedImagesResponseDtoFromJson(json);
}

@freezed
abstract class PauseCountDto with _$PauseCountDto {
  const factory PauseCountDto({
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String email,
    @JsonKey(name: 'pause_count') required int pauseCount,
  }) = _PauseCountDto;

  factory PauseCountDto.fromJson(Map<String, dynamic> json) =>
      _$PauseCountDtoFromJson(json);
}

extension WorkOrderGroupedImagesResponseDtoX
    on WorkOrderGroupedImagesResponseDto {
  WorkOrderGroupedImagesEntity toEntity() {
    final Map<String, List<WorkOrderImageCaptureEntity>> entityMap = {};

    groupedImages.forEach((key, value) {
      entityMap[key] = value.map((dto) => dto.toEntity()).toList();
    });

    final List<PauseCountEntity> pauseCountEntities = pauseCounts
            ?.map((dto) => PauseCountEntity(
                  userId: dto.userId,
                  firstName: dto.firstName,
                  lastName: dto.lastName,
                  email: dto.email,
                  pauseCount: dto.pauseCount,
                ))
            .toList() ??
        [];

    return WorkOrderGroupedImagesEntity(
      workOrderId: workOrderId,
      groupedImages: entityMap,
      pauseCounts: pauseCountEntities,
    );
  }
}
