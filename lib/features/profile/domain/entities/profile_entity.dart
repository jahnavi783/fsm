import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_entity.freezed.dart';

@freezed
abstract class ProfileEntity with _$ProfileEntity {
  const ProfileEntity._();
  
  const factory ProfileEntity({
    required int id,
    required String firstName,
    required String lastName,
    required String email,
    String? phone,
    String? role,
    String? city,
    DateTime? dob,
    String? profileImageUrl,
    required ProfilePreferences preferences,
  }) = _ProfileEntity;

  String get fullName => '$firstName $lastName';
  String get initials => '${firstName.isNotEmpty ? firstName[0] : ''}${lastName.isNotEmpty ? lastName[0] : ''}';
}

@freezed
abstract class ProfilePreferences with _$ProfilePreferences {
  const factory ProfilePreferences({
    @Default(true) bool notificationsEnabled,
    @Default(true) bool pushNotificationsEnabled,
    @Default(true) bool emailNotificationsEnabled,
    @Default(true) bool locationTrackingEnabled,
    @Default('en') String language,
    @Default(false) bool darkModeEnabled,
    @Default(true) bool offlineSyncEnabled,
    @Default(30) int syncIntervalMinutes,
    @Default(true) bool autoLogoutEnabled,
    @Default(60) int autoLogoutMinutes,
  }) = _ProfilePreferences;
}