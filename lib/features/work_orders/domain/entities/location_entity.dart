import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_entity.freezed.dart';

@freezed
class LocationEntity with _$LocationEntity {
  const factory LocationEntity({
    required double latitude,
    required double longitude,
    String? address,
    String? city,
    String? state,
    String? postalCode,
    String? country,
    String? landmark,
    double? accuracy,
    DateTime? capturedAt,
  }) = _LocationEntity;
}