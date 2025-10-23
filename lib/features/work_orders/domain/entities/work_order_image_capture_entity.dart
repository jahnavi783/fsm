import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm/features/work_orders/domain/entities/captured_by_entity.dart';

part 'work_order_image_capture_entity.freezed.dart';

@freezed
abstract class WorkOrderImageCaptureEntity with _$WorkOrderImageCaptureEntity {
  const factory WorkOrderImageCaptureEntity({
    required List<String> imageUrls,
    double? latitude,
    double? longitude,
    required CapturedByEntity capturedBy,
    required DateTime capturedAt,
  }) = _WorkOrderImageCaptureEntity;
}
