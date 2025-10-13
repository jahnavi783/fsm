import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm/features/work_orders/domain/entities/location_entity.dart';

part 'location_dto.freezed.dart';
part 'location_dto.g.dart';

@freezed
class LocationDto with _$LocationDto {
  const factory LocationDto({
    required double latitude,
    required double longitude,
    String? address,
    String? city,
    String? state,
    @JsonKey(name: 'postal_code') String? postalCode,
    String? country,
    String? landmark,
    double? accuracy,
    @JsonKey(name: 'captured_at') String? capturedAt,
  }) = _LocationDto;

  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);
}

extension LocationDtoX on LocationDto {
  LocationEntity toEntity() {
    return LocationEntity(
      latitude: latitude,
      longitude: longitude,
      address: address,
      city: city,
      state: state,
      postalCode: postalCode,
      country: country,
      landmark: landmark,
      accuracy: accuracy,
      capturedAt: capturedAt != null ? DateTime.parse(capturedAt!) : null,
    );
  }
}