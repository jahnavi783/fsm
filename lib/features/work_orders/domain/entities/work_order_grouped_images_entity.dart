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

  // Get total count of all timeline entries (including those without images)
  int get totalEntryCount =>
      startImages.length +
      pauseImages.length +
      resumeImages.length +
      completeImages.length +
      signatureImages.length;

  /// Get all timeline entries flattened and sorted by timestamp
  /// Returns a list of maps with 'capture' and 'actionType' keys
  /// Sorted in ascending order (oldest first - chronological from start to end)
  List<Map<String, dynamic>> getAllTimelineEntries() {
    final List<Map<String, dynamic>> entries = [];

    // Add all entries with their action types
    for (final capture in startImages) {
      entries.add({'capture': capture, 'actionType': 'start'});
    }
    for (final capture in pauseImages) {
      entries.add({'capture': capture, 'actionType': 'pause'});
    }
    for (final capture in resumeImages) {
      entries.add({'capture': capture, 'actionType': 'resume'});
    }
    for (final capture in completeImages) {
      entries.add({'capture': capture, 'actionType': 'complete'});
    }
    for (final capture in signatureImages) {
      entries.add({'capture': capture, 'actionType': 'signature'});
    }

    // Sort by timestamp (oldest first - chronological order)
    entries.sort((a, b) {
      final captureA = a['capture'] as WorkOrderImageCaptureEntity;
      final captureB = b['capture'] as WorkOrderImageCaptureEntity;

      // Try to get DateTime from capturedAt first, then parse timestamp
      DateTime? dateA = captureA.capturedAt;
      if (dateA == null && captureA.timestamp != null) {
        try {
          dateA = DateTime.parse(captureA.timestamp!);
        } catch (_) {
          // If parsing fails, use a very old date so it goes to the beginning
          dateA = DateTime(1970);
        }
      }

      DateTime? dateB = captureB.capturedAt;
      if (dateB == null && captureB.timestamp != null) {
        try {
          dateB = DateTime.parse(captureB.timestamp!);
        } catch (_) {
          dateB = DateTime(1970);
        }
      }

      // If both are null, maintain order
      if (dateA == null && dateB == null) return 0;
      if (dateA == null) return 1; // A goes to end
      if (dateB == null) return -1; // B goes to end

      // Sort ascending (oldest first - chronological timeline)
      return dateA.compareTo(dateB);
    });

    return entries;
  }
}
