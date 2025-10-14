import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/profile_entity.dart';

part 'profile_dto.freezed.dart';
part 'profile_dto.g.dart';

@freezed
class ProfileDto with _$ProfileDto {
  const factory ProfileDto({
    required int id,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String email,
    String? phone,
    String? role,
    String? city,
    @JsonKey(name: 'date_of_birth') String? dob,
    @JsonKey(name: 'profile_image_url') String? profileImageUrl,
  }) = _ProfileDto;

  factory ProfileDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileDtoFromJson(json);
}

@freezed
class ProfilePreferencesDto with _$ProfilePreferencesDto {
  const factory ProfilePreferencesDto({
    @JsonKey(name: 'notifications_enabled') @Default(true) bool notificationsEnabled,
    @JsonKey(name: 'push_notifications_enabled') @Default(true) bool pushNotificationsEnabled,
    @JsonKey(name: 'email_notifications_enabled') @Default(true) bool emailNotificationsEnabled,
    @JsonKey(name: 'location_tracking_enabled') @Default(true) bool locationTrackingEnabled,
    @Default('en') String language,
    @JsonKey(name: 'dark_mode_enabled') @Default(false) bool darkModeEnabled,
    @JsonKey(name: 'offline_sync_enabled') @Default(true) bool offlineSyncEnabled,
    @JsonKey(name: 'sync_interval_minutes') @Default(30) int syncIntervalMinutes,
    @JsonKey(name: 'auto_logout_enabled') @Default(true) bool autoLogoutEnabled,
    @JsonKey(name: 'auto_logout_minutes') @Default(60) int autoLogoutMinutes,
  }) = _ProfilePreferencesDto;

  factory ProfilePreferencesDto.fromJson(Map<String, dynamic> json) =>
      _$ProfilePreferencesDtoFromJson(json);
}

// Extensions for mapping to domain entities
extension ProfileDtoX on ProfileDto {
  ProfileEntity toEntity(ProfilePreferences preferences) {
    return ProfileEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      role: role,
      city: city,
      dob: dob != null ? DateTime.tryParse(dob!) : null,
      profileImageUrl: profileImageUrl,
      preferences: preferences,
    );
  }
}

extension ProfilePreferencesDtoX on ProfilePreferencesDto {
  ProfilePreferences toEntity() {
    return ProfilePreferences(
      notificationsEnabled: notificationsEnabled,
      pushNotificationsEnabled: pushNotificationsEnabled,
      emailNotificationsEnabled: emailNotificationsEnabled,
      locationTrackingEnabled: locationTrackingEnabled,
      language: language,
      darkModeEnabled: darkModeEnabled,
      offlineSyncEnabled: offlineSyncEnabled,
      syncIntervalMinutes: syncIntervalMinutes,
      autoLogoutEnabled: autoLogoutEnabled,
      autoLogoutMinutes: autoLogoutMinutes,
    );
  }
}

// Extensions for mapping from domain entities
extension ProfileEntityX on ProfileEntity {
  ProfileDto toDto() {
    return ProfileDto(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      role: role,
      city: city,
      dob: dob?.toIso8601String(),
      profileImageUrl: profileImageUrl,
    );
  }
}

extension ProfilePreferencesEntityX on ProfilePreferences {
  ProfilePreferencesDto toDto() {
    return ProfilePreferencesDto(
      notificationsEnabled: notificationsEnabled,
      pushNotificationsEnabled: pushNotificationsEnabled,
      emailNotificationsEnabled: emailNotificationsEnabled,
      locationTrackingEnabled: locationTrackingEnabled,
      language: language,
      darkModeEnabled: darkModeEnabled,
      offlineSyncEnabled: offlineSyncEnabled,
      syncIntervalMinutes: syncIntervalMinutes,
      autoLogoutEnabled: autoLogoutEnabled,
      autoLogoutMinutes: autoLogoutMinutes,
    );
  }
}