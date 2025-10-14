// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileDtoImpl _$$ProfileDtoImplFromJson(Map<String, dynamic> json) =>
    _$ProfileDtoImpl(
      id: (json['id'] as num).toInt(),
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      role: json['role'] as String?,
      city: json['city'] as String?,
      dob: json['date_of_birth'] as String?,
      profileImageUrl: json['profile_image_url'] as String?,
    );

Map<String, dynamic> _$$ProfileDtoImplToJson(_$ProfileDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'role': instance.role,
      'city': instance.city,
      'date_of_birth': instance.dob,
      'profile_image_url': instance.profileImageUrl,
    };

_$ProfilePreferencesDtoImpl _$$ProfilePreferencesDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfilePreferencesDtoImpl(
      notificationsEnabled: json['notifications_enabled'] as bool? ?? true,
      pushNotificationsEnabled:
          json['push_notifications_enabled'] as bool? ?? true,
      emailNotificationsEnabled:
          json['email_notifications_enabled'] as bool? ?? true,
      locationTrackingEnabled:
          json['location_tracking_enabled'] as bool? ?? true,
      language: json['language'] as String? ?? 'en',
      darkModeEnabled: json['dark_mode_enabled'] as bool? ?? false,
      offlineSyncEnabled: json['offline_sync_enabled'] as bool? ?? true,
      syncIntervalMinutes:
          (json['sync_interval_minutes'] as num?)?.toInt() ?? 30,
      autoLogoutEnabled: json['auto_logout_enabled'] as bool? ?? true,
      autoLogoutMinutes: (json['auto_logout_minutes'] as num?)?.toInt() ?? 60,
    );

Map<String, dynamic> _$$ProfilePreferencesDtoImplToJson(
        _$ProfilePreferencesDtoImpl instance) =>
    <String, dynamic>{
      'notifications_enabled': instance.notificationsEnabled,
      'push_notifications_enabled': instance.pushNotificationsEnabled,
      'email_notifications_enabled': instance.emailNotificationsEnabled,
      'location_tracking_enabled': instance.locationTrackingEnabled,
      'language': instance.language,
      'dark_mode_enabled': instance.darkModeEnabled,
      'offline_sync_enabled': instance.offlineSyncEnabled,
      'sync_interval_minutes': instance.syncIntervalMinutes,
      'auto_logout_enabled': instance.autoLogoutEnabled,
      'auto_logout_minutes': instance.autoLogoutMinutes,
    };
