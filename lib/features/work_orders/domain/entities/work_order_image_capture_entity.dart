import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm/features/work_orders/domain/entities/captured_by_entity.dart';

part 'work_order_image_capture_entity.freezed.dart';

@freezed
abstract class WorkOrderImageCaptureEntity with _$WorkOrderImageCaptureEntity {
  const factory WorkOrderImageCaptureEntity({
    int? id,
    String? timestamp,
    @Default([]) List<String> imageUrls,
    double? latitude,
    double? longitude,
    CapturedByEntity? capturedBy,
    DateTime? capturedAt,
    String? reason,
    String? comments,
    String? remarks,
  }) = _WorkOrderImageCaptureEntity;
}
