import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';
import 'package:fsm/core/constants/hive_boxes.dart';
import 'package:fsm/features/profile/domain/entities/profile_entity.dart';

part 'profile_hive_model.freezed.dart';
part 'profile_hive_model.g.dart';

@freezed
@HiveType(typeId: HiveBoxes.profileEntityTypeId)
class ProfileHiveModel with _$ProfileHiveModel {
  const factory ProfileHiveModel({
    @HiveField(0) required int id,
    @HiveField(1) required String firstName,
    @HiveField(2) required String lastName,
    @HiveField(3) required String email,
    @HiveField(4) String? phone,
    @HiveField(5) String? role,
    @HiveField(6) String? city,
    @HiveField(7) DateTime? dob,
    @HiveField(8) String? profileImageUrl,
    @HiveField(9) required ProfilePreferencesHiveModel preferences,
    @HiveField(10) required DateTime cachedAt,
  }) = _ProfileHiveModel;

  factory ProfileHiveModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileHiveModelFromJson(json);
}

@freezed
@HiveType(typeId: HiveBoxes.profilePreferencesEntityTypeId)
class ProfilePreferencesHiveModel with _$ProfilePreferencesHiveModel {
  const factory ProfilePreferencesHiveModel({
    @HiveField(0) @Default(true) bool notificationsEnabled,
    @HiveField(1) @Default(true) bool pushNotificationsEnabled,
    @HiveField(2) @Default(true) bool emailNotificationsEnabled,
    @HiveField(3) @Default(true) bool locationTrackingEnabled,
    @HiveField(4) @Default('en') String language,
    @HiveField(5) @Default(false) bool darkModeEnabled,
    @HiveField(6) @Default(true) bool offlineSyncEnabled,
    @HiveField(7) @Default(30) int syncIntervalMinutes,
    @HiveField(8) @Default(true) bool autoLogoutEnabled,
    @HiveField(9) @Default(60) int autoLogoutMinutes,
  }) = _ProfilePreferencesHiveModel;

  factory ProfilePreferencesHiveModel.fromJson(Map<String, dynamic> json) =>
      _$ProfilePreferencesHiveModelFromJson(json);
}

// Extension for mapping to domain entity
extension ProfileHiveModelX on ProfileHiveModel {
  ProfileEntity toEntity() {
    return ProfileEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      role: role,
      city: city,
      dob: dob,
      profileImageUrl: profileImageUrl,
      preferences: preferences.toEntity(),
    );
  }
}

extension ProfilePreferencesHiveModelX on ProfilePreferencesHiveModel {
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

// Factory method for creating from domain entity
extension ProfileEntityX on ProfileEntity {
  ProfileHiveModel toHiveModel() {
    return ProfileHiveModel(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      role: role,
      city: city,
      dob: dob,
      profileImageUrl: profileImageUrl,
      preferences: preferences.toHiveModel(),
      cachedAt: DateTime.now(),
    );
  }
}

extension ProfilePreferencesX on ProfilePreferences {
  ProfilePreferencesHiveModel toHiveModel() {
    return ProfilePreferencesHiveModel(
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
