import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm/features/work_orders/data/models/captured_by_dto.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_image_capture_entity.dart';

part 'work_order_image_capture_dto.freezed.dart';
part 'work_order_image_capture_dto.g.dart';

/// Helper function to parse double coordinates which may come as various types
List<double> _coordinatesFromJson(dynamic value) {
  if (value is List) {
    return value.map((e) {
      if (e is double) return e;
      if (e is int) return e.toDouble();
      if (e is String) return double.parse(e);
      throw FormatException('Invalid coordinate type: ${e.runtimeType}');
    }).toList();
  }
  throw FormatException('Invalid coordinates type: ${value.runtimeType}');
}

@freezed
abstract class GpsCoordinatesDto with _$GpsCoordinatesDto {
  const factory GpsCoordinatesDto({
    required String type,
    @JsonKey(fromJson: _coordinatesFromJson) required List<double> coordinates,
  }) = _GpsCoordinatesDto;

  factory GpsCoordinatesDto.fromJson(Map<String, dynamic> json) =>
      _$GpsCoordinatesDtoFromJson(json);
}

@freezed
abstract class WorkOrderImageCaptureDto with _$WorkOrderImageCaptureDto {
  const factory WorkOrderImageCaptureDto({
    int? id,
    String? timestamp,
    @JsonKey(name: 'image_urls') List<String>? imageUrls,
    @JsonKey(name: 'gps_coordinates') GpsCoordinatesDto? gpsCoordinates,
    @JsonKey(name: 'captured_by') CapturedByDto? capturedBy,
    @JsonKey(name: 'captured_at') String? capturedAt,
    String? reason,
    String? remarks,
    String? comments,
  }) = _WorkOrderImageCaptureDto;

  factory WorkOrderImageCaptureDto.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderImageCaptureDtoFromJson(json);
}

extension WorkOrderImageCaptureDtoX on WorkOrderImageCaptureDto {
  WorkOrderImageCaptureEntity toEntity() {
    // Parse capturedAt if available, otherwise use timestamp as fallback
    DateTime? parsedCapturedAt;
    if (capturedAt != null) {
      try {
        parsedCapturedAt = DateTime.parse(capturedAt!);
      } catch (e) {
        // If capturedAt parsing fails, try timestamp
        if (timestamp != null) {
          try {
            parsedCapturedAt = DateTime.parse(timestamp!);
          } catch (_) {
            // If both fail, leave as null
          }
        }
      }
    } else if (timestamp != null) {
      // If capturedAt is null but timestamp exists, use timestamp
      try {
        parsedCapturedAt = DateTime.parse(timestamp!);
      } catch (_) {
        // If parsing fails, leave as null
      }
    }

    return WorkOrderImageCaptureEntity(
      id: id,
      timestamp: timestamp,
      imageUrls: imageUrls ?? [],
      latitude: gpsCoordinates?.coordinates.length == 2
          ? gpsCoordinates!.coordinates[1]
          : null,
      longitude: gpsCoordinates?.coordinates.length == 2
          ? gpsCoordinates!.coordinates[0]
          : null,
      capturedBy: capturedBy?.toEntity(),
      capturedAt: parsedCapturedAt,
      reason: reason,
      comments: comments,
      remarks: remarks,
    );
  }
}
