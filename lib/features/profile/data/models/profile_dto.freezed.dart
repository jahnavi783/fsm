// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfileDto _$ProfileDtoFromJson(Map<String, dynamic> json) {
  return _ProfileDto.fromJson(json);
}

/// @nodoc
mixin _$ProfileDto {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_birth')
  String? get dob => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_image_url')
  String? get profileImageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileDtoCopyWith<ProfileDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileDtoCopyWith<$Res> {
  factory $ProfileDtoCopyWith(
          ProfileDto value, $Res Function(ProfileDto) then) =
      _$ProfileDtoCopyWithImpl<$Res, ProfileDto>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String email,
      String? phone,
      String? role,
      String? city,
      @JsonKey(name: 'date_of_birth') String? dob,
      @JsonKey(name: 'profile_image_url') String? profileImageUrl});
}

/// @nodoc
class _$ProfileDtoCopyWithImpl<$Res, $Val extends ProfileDto>
    implements $ProfileDtoCopyWith<$Res> {
  _$ProfileDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? phone = freezed,
    Object? role = freezed,
    Object? city = freezed,
    Object? dob = freezed,
    Object? profileImageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileDtoImplCopyWith<$Res>
    implements $ProfileDtoCopyWith<$Res> {
  factory _$$ProfileDtoImplCopyWith(
          _$ProfileDtoImpl value, $Res Function(_$ProfileDtoImpl) then) =
      __$$ProfileDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String email,
      String? phone,
      String? role,
      String? city,
      @JsonKey(name: 'date_of_birth') String? dob,
      @JsonKey(name: 'profile_image_url') String? profileImageUrl});
}

/// @nodoc
class __$$ProfileDtoImplCopyWithImpl<$Res>
    extends _$ProfileDtoCopyWithImpl<$Res, _$ProfileDtoImpl>
    implements _$$ProfileDtoImplCopyWith<$Res> {
  __$$ProfileDtoImplCopyWithImpl(
      _$ProfileDtoImpl _value, $Res Function(_$ProfileDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? phone = freezed,
    Object? role = freezed,
    Object? city = freezed,
    Object? dob = freezed,
    Object? profileImageUrl = freezed,
  }) {
    return _then(_$ProfileDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileDtoImpl implements _ProfileDto {
  const _$ProfileDtoImpl(
      {required this.id,
      @JsonKey(name: 'first_name') required this.firstName,
      @JsonKey(name: 'last_name') required this.lastName,
      required this.email,
      this.phone,
      this.role,
      this.city,
      @JsonKey(name: 'date_of_birth') this.dob,
      @JsonKey(name: 'profile_image_url') this.profileImageUrl});

  factory _$ProfileDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileDtoImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  final String email;
  @override
  final String? phone;
  @override
  final String? role;
  @override
  final String? city;
  @override
  @JsonKey(name: 'date_of_birth')
  final String? dob;
  @override
  @JsonKey(name: 'profile_image_url')
  final String? profileImageUrl;

  @override
  String toString() {
    return 'ProfileDto(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, role: $role, city: $city, dob: $dob, profileImageUrl: $profileImageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName, email,
      phone, role, city, dob, profileImageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileDtoImplCopyWith<_$ProfileDtoImpl> get copyWith =>
      __$$ProfileDtoImplCopyWithImpl<_$ProfileDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileDtoImplToJson(
      this,
    );
  }
}

abstract class _ProfileDto implements ProfileDto {
  const factory _ProfileDto(
          {required final int id,
          @JsonKey(name: 'first_name') required final String firstName,
          @JsonKey(name: 'last_name') required final String lastName,
          required final String email,
          final String? phone,
          final String? role,
          final String? city,
          @JsonKey(name: 'date_of_birth') final String? dob,
          @JsonKey(name: 'profile_image_url') final String? profileImageUrl}) =
      _$ProfileDtoImpl;

  factory _ProfileDto.fromJson(Map<String, dynamic> json) =
      _$ProfileDtoImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  String get email;
  @override
  String? get phone;
  @override
  String? get role;
  @override
  String? get city;
  @override
  @JsonKey(name: 'date_of_birth')
  String? get dob;
  @override
  @JsonKey(name: 'profile_image_url')
  String? get profileImageUrl;
  @override
  @JsonKey(ignore: true)
  _$$ProfileDtoImplCopyWith<_$ProfileDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfilePreferencesDto _$ProfilePreferencesDtoFromJson(
    Map<String, dynamic> json) {
  return _ProfilePreferencesDto.fromJson(json);
}

/// @nodoc
mixin _$ProfilePreferencesDto {
  @JsonKey(name: 'notifications_enabled')
  bool get notificationsEnabled => throw _privateConstructorUsedError;
  @JsonKey(name: 'push_notifications_enabled')
  bool get pushNotificationsEnabled => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_notifications_enabled')
  bool get emailNotificationsEnabled => throw _privateConstructorUsedError;
  @JsonKey(name: 'location_tracking_enabled')
  bool get locationTrackingEnabled => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  @JsonKey(name: 'dark_mode_enabled')
  bool get darkModeEnabled => throw _privateConstructorUsedError;
  @JsonKey(name: 'offline_sync_enabled')
  bool get offlineSyncEnabled => throw _privateConstructorUsedError;
  @JsonKey(name: 'sync_interval_minutes')
  int get syncIntervalMinutes => throw _privateConstructorUsedError;
  @JsonKey(name: 'auto_logout_enabled')
  bool get autoLogoutEnabled => throw _privateConstructorUsedError;
  @JsonKey(name: 'auto_logout_minutes')
  int get autoLogoutMinutes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfilePreferencesDtoCopyWith<ProfilePreferencesDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfilePreferencesDtoCopyWith<$Res> {
  factory $ProfilePreferencesDtoCopyWith(ProfilePreferencesDto value,
          $Res Function(ProfilePreferencesDto) then) =
      _$ProfilePreferencesDtoCopyWithImpl<$Res, ProfilePreferencesDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'notifications_enabled') bool notificationsEnabled,
      @JsonKey(name: 'push_notifications_enabled')
      bool pushNotificationsEnabled,
      @JsonKey(name: 'email_notifications_enabled')
      bool emailNotificationsEnabled,
      @JsonKey(name: 'location_tracking_enabled') bool locationTrackingEnabled,
      String language,
      @JsonKey(name: 'dark_mode_enabled') bool darkModeEnabled,
      @JsonKey(name: 'offline_sync_enabled') bool offlineSyncEnabled,
      @JsonKey(name: 'sync_interval_minutes') int syncIntervalMinutes,
      @JsonKey(name: 'auto_logout_enabled') bool autoLogoutEnabled,
      @JsonKey(name: 'auto_logout_minutes') int autoLogoutMinutes});
}

/// @nodoc
class _$ProfilePreferencesDtoCopyWithImpl<$Res,
        $Val extends ProfilePreferencesDto>
    implements $ProfilePreferencesDtoCopyWith<$Res> {
  _$ProfilePreferencesDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationsEnabled = null,
    Object? pushNotificationsEnabled = null,
    Object? emailNotificationsEnabled = null,
    Object? locationTrackingEnabled = null,
    Object? language = null,
    Object? darkModeEnabled = null,
    Object? offlineSyncEnabled = null,
    Object? syncIntervalMinutes = null,
    Object? autoLogoutEnabled = null,
    Object? autoLogoutMinutes = null,
  }) {
    return _then(_value.copyWith(
      notificationsEnabled: null == notificationsEnabled
          ? _value.notificationsEnabled
          : notificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      pushNotificationsEnabled: null == pushNotificationsEnabled
          ? _value.pushNotificationsEnabled
          : pushNotificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      emailNotificationsEnabled: null == emailNotificationsEnabled
          ? _value.emailNotificationsEnabled
          : emailNotificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      locationTrackingEnabled: null == locationTrackingEnabled
          ? _value.locationTrackingEnabled
          : locationTrackingEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      darkModeEnabled: null == darkModeEnabled
          ? _value.darkModeEnabled
          : darkModeEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      offlineSyncEnabled: null == offlineSyncEnabled
          ? _value.offlineSyncEnabled
          : offlineSyncEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      syncIntervalMinutes: null == syncIntervalMinutes
          ? _value.syncIntervalMinutes
          : syncIntervalMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      autoLogoutEnabled: null == autoLogoutEnabled
          ? _value.autoLogoutEnabled
          : autoLogoutEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      autoLogoutMinutes: null == autoLogoutMinutes
          ? _value.autoLogoutMinutes
          : autoLogoutMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfilePreferencesDtoImplCopyWith<$Res>
    implements $ProfilePreferencesDtoCopyWith<$Res> {
  factory _$$ProfilePreferencesDtoImplCopyWith(
          _$ProfilePreferencesDtoImpl value,
          $Res Function(_$ProfilePreferencesDtoImpl) then) =
      __$$ProfilePreferencesDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'notifications_enabled') bool notificationsEnabled,
      @JsonKey(name: 'push_notifications_enabled')
      bool pushNotificationsEnabled,
      @JsonKey(name: 'email_notifications_enabled')
      bool emailNotificationsEnabled,
      @JsonKey(name: 'location_tracking_enabled') bool locationTrackingEnabled,
      String language,
      @JsonKey(name: 'dark_mode_enabled') bool darkModeEnabled,
      @JsonKey(name: 'offline_sync_enabled') bool offlineSyncEnabled,
      @JsonKey(name: 'sync_interval_minutes') int syncIntervalMinutes,
      @JsonKey(name: 'auto_logout_enabled') bool autoLogoutEnabled,
      @JsonKey(name: 'auto_logout_minutes') int autoLogoutMinutes});
}

/// @nodoc
class __$$ProfilePreferencesDtoImplCopyWithImpl<$Res>
    extends _$ProfilePreferencesDtoCopyWithImpl<$Res,
        _$ProfilePreferencesDtoImpl>
    implements _$$ProfilePreferencesDtoImplCopyWith<$Res> {
  __$$ProfilePreferencesDtoImplCopyWithImpl(_$ProfilePreferencesDtoImpl _value,
      $Res Function(_$ProfilePreferencesDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationsEnabled = null,
    Object? pushNotificationsEnabled = null,
    Object? emailNotificationsEnabled = null,
    Object? locationTrackingEnabled = null,
    Object? language = null,
    Object? darkModeEnabled = null,
    Object? offlineSyncEnabled = null,
    Object? syncIntervalMinutes = null,
    Object? autoLogoutEnabled = null,
    Object? autoLogoutMinutes = null,
  }) {
    return _then(_$ProfilePreferencesDtoImpl(
      notificationsEnabled: null == notificationsEnabled
          ? _value.notificationsEnabled
          : notificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      pushNotificationsEnabled: null == pushNotificationsEnabled
          ? _value.pushNotificationsEnabled
          : pushNotificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      emailNotificationsEnabled: null == emailNotificationsEnabled
          ? _value.emailNotificationsEnabled
          : emailNotificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      locationTrackingEnabled: null == locationTrackingEnabled
          ? _value.locationTrackingEnabled
          : locationTrackingEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      darkModeEnabled: null == darkModeEnabled
          ? _value.darkModeEnabled
          : darkModeEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      offlineSyncEnabled: null == offlineSyncEnabled
          ? _value.offlineSyncEnabled
          : offlineSyncEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      syncIntervalMinutes: null == syncIntervalMinutes
          ? _value.syncIntervalMinutes
          : syncIntervalMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      autoLogoutEnabled: null == autoLogoutEnabled
          ? _value.autoLogoutEnabled
          : autoLogoutEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      autoLogoutMinutes: null == autoLogoutMinutes
          ? _value.autoLogoutMinutes
          : autoLogoutMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfilePreferencesDtoImpl implements _ProfilePreferencesDto {
  const _$ProfilePreferencesDtoImpl(
      {@JsonKey(name: 'notifications_enabled') this.notificationsEnabled = true,
      @JsonKey(name: 'push_notifications_enabled')
      this.pushNotificationsEnabled = true,
      @JsonKey(name: 'email_notifications_enabled')
      this.emailNotificationsEnabled = true,
      @JsonKey(name: 'location_tracking_enabled')
      this.locationTrackingEnabled = true,
      this.language = 'en',
      @JsonKey(name: 'dark_mode_enabled') this.darkModeEnabled = false,
      @JsonKey(name: 'offline_sync_enabled') this.offlineSyncEnabled = true,
      @JsonKey(name: 'sync_interval_minutes') this.syncIntervalMinutes = 30,
      @JsonKey(name: 'auto_logout_enabled') this.autoLogoutEnabled = true,
      @JsonKey(name: 'auto_logout_minutes') this.autoLogoutMinutes = 60});

  factory _$ProfilePreferencesDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfilePreferencesDtoImplFromJson(json);

  @override
  @JsonKey(name: 'notifications_enabled')
  final bool notificationsEnabled;
  @override
  @JsonKey(name: 'push_notifications_enabled')
  final bool pushNotificationsEnabled;
  @override
  @JsonKey(name: 'email_notifications_enabled')
  final bool emailNotificationsEnabled;
  @override
  @JsonKey(name: 'location_tracking_enabled')
  final bool locationTrackingEnabled;
  @override
  @JsonKey()
  final String language;
  @override
  @JsonKey(name: 'dark_mode_enabled')
  final bool darkModeEnabled;
  @override
  @JsonKey(name: 'offline_sync_enabled')
  final bool offlineSyncEnabled;
  @override
  @JsonKey(name: 'sync_interval_minutes')
  final int syncIntervalMinutes;
  @override
  @JsonKey(name: 'auto_logout_enabled')
  final bool autoLogoutEnabled;
  @override
  @JsonKey(name: 'auto_logout_minutes')
  final int autoLogoutMinutes;

  @override
  String toString() {
    return 'ProfilePreferencesDto(notificationsEnabled: $notificationsEnabled, pushNotificationsEnabled: $pushNotificationsEnabled, emailNotificationsEnabled: $emailNotificationsEnabled, locationTrackingEnabled: $locationTrackingEnabled, language: $language, darkModeEnabled: $darkModeEnabled, offlineSyncEnabled: $offlineSyncEnabled, syncIntervalMinutes: $syncIntervalMinutes, autoLogoutEnabled: $autoLogoutEnabled, autoLogoutMinutes: $autoLogoutMinutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfilePreferencesDtoImpl &&
            (identical(other.notificationsEnabled, notificationsEnabled) ||
                other.notificationsEnabled == notificationsEnabled) &&
            (identical(
                    other.pushNotificationsEnabled, pushNotificationsEnabled) ||
                other.pushNotificationsEnabled == pushNotificationsEnabled) &&
            (identical(other.emailNotificationsEnabled,
                    emailNotificationsEnabled) ||
                other.emailNotificationsEnabled == emailNotificationsEnabled) &&
            (identical(
                    other.locationTrackingEnabled, locationTrackingEnabled) ||
                other.locationTrackingEnabled == locationTrackingEnabled) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.darkModeEnabled, darkModeEnabled) ||
                other.darkModeEnabled == darkModeEnabled) &&
            (identical(other.offlineSyncEnabled, offlineSyncEnabled) ||
                other.offlineSyncEnabled == offlineSyncEnabled) &&
            (identical(other.syncIntervalMinutes, syncIntervalMinutes) ||
                other.syncIntervalMinutes == syncIntervalMinutes) &&
            (identical(other.autoLogoutEnabled, autoLogoutEnabled) ||
                other.autoLogoutEnabled == autoLogoutEnabled) &&
            (identical(other.autoLogoutMinutes, autoLogoutMinutes) ||
                other.autoLogoutMinutes == autoLogoutMinutes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      notificationsEnabled,
      pushNotificationsEnabled,
      emailNotificationsEnabled,
      locationTrackingEnabled,
      language,
      darkModeEnabled,
      offlineSyncEnabled,
      syncIntervalMinutes,
      autoLogoutEnabled,
      autoLogoutMinutes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfilePreferencesDtoImplCopyWith<_$ProfilePreferencesDtoImpl>
      get copyWith => __$$ProfilePreferencesDtoImplCopyWithImpl<
          _$ProfilePreferencesDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfilePreferencesDtoImplToJson(
      this,
    );
  }
}

abstract class _ProfilePreferencesDto implements ProfilePreferencesDto {
  const factory _ProfilePreferencesDto(
      {@JsonKey(name: 'notifications_enabled') final bool notificationsEnabled,
      @JsonKey(name: 'push_notifications_enabled')
      final bool pushNotificationsEnabled,
      @JsonKey(name: 'email_notifications_enabled')
      final bool emailNotificationsEnabled,
      @JsonKey(name: 'location_tracking_enabled')
      final bool locationTrackingEnabled,
      final String language,
      @JsonKey(name: 'dark_mode_enabled') final bool darkModeEnabled,
      @JsonKey(name: 'offline_sync_enabled') final bool offlineSyncEnabled,
      @JsonKey(name: 'sync_interval_minutes') final int syncIntervalMinutes,
      @JsonKey(name: 'auto_logout_enabled') final bool autoLogoutEnabled,
      @JsonKey(name: 'auto_logout_minutes')
      final int autoLogoutMinutes}) = _$ProfilePreferencesDtoImpl;

  factory _ProfilePreferencesDto.fromJson(Map<String, dynamic> json) =
      _$ProfilePreferencesDtoImpl.fromJson;

  @override
  @JsonKey(name: 'notifications_enabled')
  bool get notificationsEnabled;
  @override
  @JsonKey(name: 'push_notifications_enabled')
  bool get pushNotificationsEnabled;
  @override
  @JsonKey(name: 'email_notifications_enabled')
  bool get emailNotificationsEnabled;
  @override
  @JsonKey(name: 'location_tracking_enabled')
  bool get locationTrackingEnabled;
  @override
  String get language;
  @override
  @JsonKey(name: 'dark_mode_enabled')
  bool get darkModeEnabled;
  @override
  @JsonKey(name: 'offline_sync_enabled')
  bool get offlineSyncEnabled;
  @override
  @JsonKey(name: 'sync_interval_minutes')
  int get syncIntervalMinutes;
  @override
  @JsonKey(name: 'auto_logout_enabled')
  bool get autoLogoutEnabled;
  @override
  @JsonKey(name: 'auto_logout_minutes')
  int get autoLogoutMinutes;
  @override
  @JsonKey(ignore: true)
  _$$ProfilePreferencesDtoImplCopyWith<_$ProfilePreferencesDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
