// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileHiveModelAdapter extends TypeAdapter<ProfileHiveModel> {
  @override
  final int typeId = 10;

  @override
  ProfileHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileHiveModel(
      id: fields[0] as int,
      firstName: fields[1] as String,
      lastName: fields[2] as String,
      email: fields[3] as String,
      phone: fields[4] as String?,
      role: fields[5] as String?,
      city: fields[6] as String?,
      dob: fields[7] as DateTime?,
      profileImageUrl: fields[8] as String?,
      preferences: fields[9] as ProfilePreferencesHiveModel,
      cachedAt: fields[10] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileHiveModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.role)
      ..writeByte(6)
      ..write(obj.city)
      ..writeByte(7)
      ..write(obj.dob)
      ..writeByte(8)
      ..write(obj.profileImageUrl)
      ..writeByte(9)
      ..write(obj.preferences)
      ..writeByte(10)
      ..write(obj.cachedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProfilePreferencesHiveModelAdapter
    extends TypeAdapter<ProfilePreferencesHiveModel> {
  @override
  final int typeId = 11;

  @override
  ProfilePreferencesHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfilePreferencesHiveModel(
      notificationsEnabled: fields[0] as bool,
      pushNotificationsEnabled: fields[1] as bool,
      emailNotificationsEnabled: fields[2] as bool,
      locationTrackingEnabled: fields[3] as bool,
      language: fields[4] as String,
      darkModeEnabled: fields[5] as bool,
      offlineSyncEnabled: fields[6] as bool,
      syncIntervalMinutes: fields[7] as int,
      autoLogoutEnabled: fields[8] as bool,
      autoLogoutMinutes: fields[9] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ProfilePreferencesHiveModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.notificationsEnabled)
      ..writeByte(1)
      ..write(obj.pushNotificationsEnabled)
      ..writeByte(2)
      ..write(obj.emailNotificationsEnabled)
      ..writeByte(3)
      ..write(obj.locationTrackingEnabled)
      ..writeByte(4)
      ..write(obj.language)
      ..writeByte(5)
      ..write(obj.darkModeEnabled)
      ..writeByte(6)
      ..write(obj.offlineSyncEnabled)
      ..writeByte(7)
      ..write(obj.syncIntervalMinutes)
      ..writeByte(8)
      ..write(obj.autoLogoutEnabled)
      ..writeByte(9)
      ..write(obj.autoLogoutMinutes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfilePreferencesHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileHiveModelImpl _$$ProfileHiveModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileHiveModelImpl(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      role: json['role'] as String?,
      city: json['city'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      profileImageUrl: json['profileImageUrl'] as String?,
      preferences: ProfilePreferencesHiveModel.fromJson(
          json['preferences'] as Map<String, dynamic>),
      cachedAt: DateTime.parse(json['cachedAt'] as String),
    );

Map<String, dynamic> _$$ProfileHiveModelImplToJson(
        _$ProfileHiveModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'role': instance.role,
      'city': instance.city,
      'dob': instance.dob?.toIso8601String(),
      'profileImageUrl': instance.profileImageUrl,
      'preferences': instance.preferences,
      'cachedAt': instance.cachedAt.toIso8601String(),
    };

_$ProfilePreferencesHiveModelImpl _$$ProfilePreferencesHiveModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfilePreferencesHiveModelImpl(
      notificationsEnabled: json['notificationsEnabled'] as bool? ?? true,
      pushNotificationsEnabled:
          json['pushNotificationsEnabled'] as bool? ?? true,
      emailNotificationsEnabled:
          json['emailNotificationsEnabled'] as bool? ?? true,
      locationTrackingEnabled: json['locationTrackingEnabled'] as bool? ?? true,
      language: json['language'] as String? ?? 'en',
      darkModeEnabled: json['darkModeEnabled'] as bool? ?? false,
      offlineSyncEnabled: json['offlineSyncEnabled'] as bool? ?? true,
      syncIntervalMinutes: (json['syncIntervalMinutes'] as num?)?.toInt() ?? 30,
      autoLogoutEnabled: json['autoLogoutEnabled'] as bool? ?? true,
      autoLogoutMinutes: (json['autoLogoutMinutes'] as num?)?.toInt() ?? 60,
    );

Map<String, dynamic> _$$ProfilePreferencesHiveModelImplToJson(
        _$ProfilePreferencesHiveModelImpl instance) =>
    <String, dynamic>{
      'notificationsEnabled': instance.notificationsEnabled,
      'pushNotificationsEnabled': instance.pushNotificationsEnabled,
      'emailNotificationsEnabled': instance.emailNotificationsEnabled,
      'locationTrackingEnabled': instance.locationTrackingEnabled,
      'language': instance.language,
      'darkModeEnabled': instance.darkModeEnabled,
      'offlineSyncEnabled': instance.offlineSyncEnabled,
      'syncIntervalMinutes': instance.syncIntervalMinutes,
      'autoLogoutEnabled': instance.autoLogoutEnabled,
      'autoLogoutMinutes': instance.autoLogoutMinutes,
    };
