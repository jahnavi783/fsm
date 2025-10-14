// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileEntity {
  int get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  DateTime? get dob => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  ProfilePreferences get preferences => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileEntityCopyWith<ProfileEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEntityCopyWith<$Res> {
  factory $ProfileEntityCopyWith(
          ProfileEntity value, $Res Function(ProfileEntity) then) =
      _$ProfileEntityCopyWithImpl<$Res, ProfileEntity>;
  @useResult
  $Res call(
      {int id,
      String firstName,
      String lastName,
      String email,
      String? phone,
      String? role,
      String? city,
      DateTime? dob,
      String? profileImageUrl,
      ProfilePreferences preferences});

  $ProfilePreferencesCopyWith<$Res> get preferences;
}

/// @nodoc
class _$ProfileEntityCopyWithImpl<$Res, $Val extends ProfileEntity>
    implements $ProfileEntityCopyWith<$Res> {
  _$ProfileEntityCopyWithImpl(this._value, this._then);

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
    Object? preferences = null,
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
              as DateTime?,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      preferences: null == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as ProfilePreferences,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfilePreferencesCopyWith<$Res> get preferences {
    return $ProfilePreferencesCopyWith<$Res>(_value.preferences, (value) {
      return _then(_value.copyWith(preferences: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileEntityImplCopyWith<$Res>
    implements $ProfileEntityCopyWith<$Res> {
  factory _$$ProfileEntityImplCopyWith(
          _$ProfileEntityImpl value, $Res Function(_$ProfileEntityImpl) then) =
      __$$ProfileEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String firstName,
      String lastName,
      String email,
      String? phone,
      String? role,
      String? city,
      DateTime? dob,
      String? profileImageUrl,
      ProfilePreferences preferences});

  @override
  $ProfilePreferencesCopyWith<$Res> get preferences;
}

/// @nodoc
class __$$ProfileEntityImplCopyWithImpl<$Res>
    extends _$ProfileEntityCopyWithImpl<$Res, _$ProfileEntityImpl>
    implements _$$ProfileEntityImplCopyWith<$Res> {
  __$$ProfileEntityImplCopyWithImpl(
      _$ProfileEntityImpl _value, $Res Function(_$ProfileEntityImpl) _then)
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
    Object? preferences = null,
  }) {
    return _then(_$ProfileEntityImpl(
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
              as DateTime?,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      preferences: null == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as ProfilePreferences,
    ));
  }
}

/// @nodoc

class _$ProfileEntityImpl extends _ProfileEntity {
  const _$ProfileEntityImpl(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      this.phone,
      this.role,
      this.city,
      this.dob,
      this.profileImageUrl,
      required this.preferences})
      : super._();

  @override
  final int id;
  @override
  final String firstName;
  @override
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
  final DateTime? dob;
  @override
  final String? profileImageUrl;
  @override
  final ProfilePreferences preferences;

  @override
  String toString() {
    return 'ProfileEntity(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, role: $role, city: $city, dob: $dob, profileImageUrl: $profileImageUrl, preferences: $preferences)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileEntityImpl &&
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
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName, email,
      phone, role, city, dob, profileImageUrl, preferences);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileEntityImplCopyWith<_$ProfileEntityImpl> get copyWith =>
      __$$ProfileEntityImplCopyWithImpl<_$ProfileEntityImpl>(this, _$identity);
}

abstract class _ProfileEntity extends ProfileEntity {
  const factory _ProfileEntity(
      {required final int id,
      required final String firstName,
      required final String lastName,
      required final String email,
      final String? phone,
      final String? role,
      final String? city,
      final DateTime? dob,
      final String? profileImageUrl,
      required final ProfilePreferences preferences}) = _$ProfileEntityImpl;
  const _ProfileEntity._() : super._();

  @override
  int get id;
  @override
  String get firstName;
  @override
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
  DateTime? get dob;
  @override
  String? get profileImageUrl;
  @override
  ProfilePreferences get preferences;
  @override
  @JsonKey(ignore: true)
  _$$ProfileEntityImplCopyWith<_$ProfileEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProfilePreferences {
  bool get notificationsEnabled => throw _privateConstructorUsedError;
  bool get pushNotificationsEnabled => throw _privateConstructorUsedError;
  bool get emailNotificationsEnabled => throw _privateConstructorUsedError;
  bool get locationTrackingEnabled => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  bool get darkModeEnabled => throw _privateConstructorUsedError;
  bool get offlineSyncEnabled => throw _privateConstructorUsedError;
  int get syncIntervalMinutes => throw _privateConstructorUsedError;
  bool get autoLogoutEnabled => throw _privateConstructorUsedError;
  int get autoLogoutMinutes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfilePreferencesCopyWith<ProfilePreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfilePreferencesCopyWith<$Res> {
  factory $ProfilePreferencesCopyWith(
          ProfilePreferences value, $Res Function(ProfilePreferences) then) =
      _$ProfilePreferencesCopyWithImpl<$Res, ProfilePreferences>;
  @useResult
  $Res call(
      {bool notificationsEnabled,
      bool pushNotificationsEnabled,
      bool emailNotificationsEnabled,
      bool locationTrackingEnabled,
      String language,
      bool darkModeEnabled,
      bool offlineSyncEnabled,
      int syncIntervalMinutes,
      bool autoLogoutEnabled,
      int autoLogoutMinutes});
}

/// @nodoc
class _$ProfilePreferencesCopyWithImpl<$Res, $Val extends ProfilePreferences>
    implements $ProfilePreferencesCopyWith<$Res> {
  _$ProfilePreferencesCopyWithImpl(this._value, this._then);

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
abstract class _$$ProfilePreferencesImplCopyWith<$Res>
    implements $ProfilePreferencesCopyWith<$Res> {
  factory _$$ProfilePreferencesImplCopyWith(_$ProfilePreferencesImpl value,
          $Res Function(_$ProfilePreferencesImpl) then) =
      __$$ProfilePreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool notificationsEnabled,
      bool pushNotificationsEnabled,
      bool emailNotificationsEnabled,
      bool locationTrackingEnabled,
      String language,
      bool darkModeEnabled,
      bool offlineSyncEnabled,
      int syncIntervalMinutes,
      bool autoLogoutEnabled,
      int autoLogoutMinutes});
}

/// @nodoc
class __$$ProfilePreferencesImplCopyWithImpl<$Res>
    extends _$ProfilePreferencesCopyWithImpl<$Res, _$ProfilePreferencesImpl>
    implements _$$ProfilePreferencesImplCopyWith<$Res> {
  __$$ProfilePreferencesImplCopyWithImpl(_$ProfilePreferencesImpl _value,
      $Res Function(_$ProfilePreferencesImpl) _then)
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
    return _then(_$ProfilePreferencesImpl(
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

class _$ProfilePreferencesImpl implements _ProfilePreferences {
  const _$ProfilePreferencesImpl(
      {this.notificationsEnabled = true,
      this.pushNotificationsEnabled = true,
      this.emailNotificationsEnabled = true,
      this.locationTrackingEnabled = true,
      this.language = 'en',
      this.darkModeEnabled = false,
      this.offlineSyncEnabled = true,
      this.syncIntervalMinutes = 30,
      this.autoLogoutEnabled = true,
      this.autoLogoutMinutes = 60});

  @override
  @JsonKey()
  final bool notificationsEnabled;
  @override
  @JsonKey()
  final bool pushNotificationsEnabled;
  @override
  @JsonKey()
  final bool emailNotificationsEnabled;
  @override
  @JsonKey()
  final bool locationTrackingEnabled;
  @override
  @JsonKey()
  final String language;
  @override
  @JsonKey()
  final bool darkModeEnabled;
  @override
  @JsonKey()
  final bool offlineSyncEnabled;
  @override
  @JsonKey()
  final int syncIntervalMinutes;
  @override
  @JsonKey()
  final bool autoLogoutEnabled;
  @override
  @JsonKey()
  final int autoLogoutMinutes;

  @override
  String toString() {
    return 'ProfilePreferences(notificationsEnabled: $notificationsEnabled, pushNotificationsEnabled: $pushNotificationsEnabled, emailNotificationsEnabled: $emailNotificationsEnabled, locationTrackingEnabled: $locationTrackingEnabled, language: $language, darkModeEnabled: $darkModeEnabled, offlineSyncEnabled: $offlineSyncEnabled, syncIntervalMinutes: $syncIntervalMinutes, autoLogoutEnabled: $autoLogoutEnabled, autoLogoutMinutes: $autoLogoutMinutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfilePreferencesImpl &&
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
  _$$ProfilePreferencesImplCopyWith<_$ProfilePreferencesImpl> get copyWith =>
      __$$ProfilePreferencesImplCopyWithImpl<_$ProfilePreferencesImpl>(
          this, _$identity);
}

abstract class _ProfilePreferences implements ProfilePreferences {
  const factory _ProfilePreferences(
      {final bool notificationsEnabled,
      final bool pushNotificationsEnabled,
      final bool emailNotificationsEnabled,
      final bool locationTrackingEnabled,
      final String language,
      final bool darkModeEnabled,
      final bool offlineSyncEnabled,
      final int syncIntervalMinutes,
      final bool autoLogoutEnabled,
      final int autoLogoutMinutes}) = _$ProfilePreferencesImpl;

  @override
  bool get notificationsEnabled;
  @override
  bool get pushNotificationsEnabled;
  @override
  bool get emailNotificationsEnabled;
  @override
  bool get locationTrackingEnabled;
  @override
  String get language;
  @override
  bool get darkModeEnabled;
  @override
  bool get offlineSyncEnabled;
  @override
  int get syncIntervalMinutes;
  @override
  bool get autoLogoutEnabled;
  @override
  int get autoLogoutMinutes;
  @override
  @JsonKey(ignore: true)
  _$$ProfilePreferencesImplCopyWith<_$ProfilePreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
