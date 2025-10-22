import 'package:freezed_annotation/freezed_annotation.dart';

part 'grouped_images_response.freezed.dart';
part 'grouped_images_response.g.dart';

@freezed
class GroupedImagesResponse with _$GroupedImagesResponse {
  const factory GroupedImagesResponse({
    @JsonKey(name: 'work_order_id') required int workOrderId,
    @JsonKey(name: 'grouped_images') required GroupedImages groupedImages,
  }) = _GroupedImagesResponse;

  factory GroupedImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$GroupedImagesResponseFromJson(json);
}

@freezed
class GroupedImages with _$GroupedImages {
  const factory GroupedImages({
    @Default([]) List<ImageLog> start,
    @Default([]) List<ImageLog> pause,
    @Default([]) List<ImageLog> resume,
    @Default([]) List<ImageLog> complete,
    @Default([]) List<ImageLog> signature,
  }) = _GroupedImages;

  factory GroupedImages.fromJson(Map<String, dynamic> json) =>
      _$GroupedImagesFromJson(json);
}

@freezed
class ImageLog with _$ImageLog {
  const factory ImageLog({
    @JsonKey(name: 'image_urls') required List<String> imageUrls,
    @JsonKey(name: 'gps_coordinates') GpsCoordinates? gpsCoordinates,
    @JsonKey(name: 'captured_by') required CapturedBy capturedBy,
    @JsonKey(name: 'captured_at') required String capturedAt,
  }) = _ImageLog;

  factory ImageLog.fromJson(Map<String, dynamic> json) =>
      _$ImageLogFromJson(json);
}

@freezed
class GpsCoordinates with _$GpsCoordinates {
  const factory GpsCoordinates({
    required String type,
    required List<double> coordinates,
  }) = _GpsCoordinates;

  factory GpsCoordinates.fromJson(Map<String, dynamic> json) =>
      _$GpsCoordinatesFromJson(json);
}

@freezed
class CapturedBy with _$CapturedBy {
  const factory CapturedBy({
    required int id,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String email,
    @JsonKey(name: 'role_id') required int roleId,
  }) = _CapturedBy;

  factory CapturedBy.fromJson(Map<String, dynamic> json) =>
      _$CapturedByFromJson(json);
}
