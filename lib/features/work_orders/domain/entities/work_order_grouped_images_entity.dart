import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_image_capture_entity.dart';

part 'work_order_grouped_images_entity.freezed.dart';

@freezed
abstract class WorkOrderGroupedImagesEntity
    with _$WorkOrderGroupedImagesEntity {
  const factory WorkOrderGroupedImagesEntity({
    required int workOrderId,
    required Map<String, List<WorkOrderImageCaptureEntity>> groupedImages,
  }) = _WorkOrderGroupedImagesEntity;

  const WorkOrderGroupedImagesEntity._();

  // Helper methods to get images by action type
  List<WorkOrderImageCaptureEntity> get startImages =>
      groupedImages['start'] ?? [];
  List<WorkOrderImageCaptureEntity> get pauseImages =>
      groupedImages['pause'] ?? [];
  List<WorkOrderImageCaptureEntity> get resumeImages =>
      groupedImages['resume'] ?? [];
  List<WorkOrderImageCaptureEntity> get completeImages =>
      groupedImages['complete'] ?? [];
  List<WorkOrderImageCaptureEntity> get signatureImages =>
      groupedImages['signature'] ?? [];

  // Check if any images exist
  bool get hasAnyImages =>
      startImages.isNotEmpty ||
      pauseImages.isNotEmpty ||
      resumeImages.isNotEmpty ||
      completeImages.isNotEmpty ||
      signatureImages.isNotEmpty;

  // Get total count of images
  int get totalImageCount =>
      startImages.length +
      pauseImages.length +
      resumeImages.length +
      completeImages.length +
      signatureImages.length;
}
