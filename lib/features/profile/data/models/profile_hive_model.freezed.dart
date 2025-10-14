// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_hive_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfileHiveModel _$ProfileHiveModelFromJson(Map<String, dynamic> json) {
  return _ProfileHiveModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileHiveModel {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get firstName => throw _privateConstructorUsedError;
  @HiveField(2)
  String get lastName => throw _privateConstructorUsedError;
  @HiveField(3)
  String get email => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get phone => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get role => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get city => throw _privateConstructorUsedError;
  @HiveField(7)
  DateTime? get dob => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get profileImageUrl => throw _privateConstructorUsedError;
  @HiveField(9)
  ProfilePreferencesHiveModel get preferences =>
      throw _privateConstructorUsedError;
  @HiveField(10)
  DateTime get cachedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileHiveModelCopyWith<ProfileHiveModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileHiveModelCopyWith<$Res> {
  factory $ProfileHiveModelCopyWith(
          ProfileHiveModel value, $Res Function(ProfileHiveModel) then) =
      _$ProfileHiveModelCopyWithImpl<$Res, ProfileHiveModel>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String firstName,
      @HiveField(2) String lastName,
      @HiveField(3) String email,
      @HiveField(4) String? phone,
      @HiveField(5) String? role,
      @HiveField(6) String? city,
      @HiveField(7) DateTime? dob,
      @HiveField(8) String? profileImageUrl,
      @HiveField(9) ProfilePreferencesHiveModel preferences,
      @HiveField(10) DateTime cachedAt});

  $ProfilePreferencesHiveModelCopyWith<$Res> get preferences;
}

/// @nodoc
class _$ProfileHiveModelCopyWithImpl<$Res, $Val extends ProfileHiveModel>
    implements $ProfileHiveModelCopyWith<$Res> {
  _$ProfileHiveModelCopyWithImpl(this._value, this._then);

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
    Object? cachedAt = null,
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
              as ProfilePreferencesHiveModel,
      cachedAt: null == cachedAt
          ? _value.cachedAt
          : cachedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfilePreferencesHiveModelCopyWith<$Res> get preferences {
    return $ProfilePreferencesHiveModelCopyWith<$Res>(_value.preferences,
        (value) {
      return _then(_value.copyWith(preferences: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileHiveModelImplCopyWith<$Res>
    implements $ProfileHiveModelCopyWith<$Res> {
  factory _$$ProfileHiveModelImplCopyWith(_$ProfileHiveModelImpl value,
          $Res Function(_$ProfileHiveModelImpl) then) =
      __$$ProfileHiveModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String firstName,
      @HiveField(2) String lastName,
      @HiveField(3) String email,
      @HiveField(4) String? phone,
      @HiveField(5) String? role,
      @HiveField(6) String? city,
      @HiveField(7) DateTime? dob,
      @HiveField(8) String? profileImageUrl,
      @HiveField(9) ProfilePreferencesHiveModel preferences,
      @HiveField(10) DateTime cachedAt});

  @override
  $ProfilePreferencesHiveModelCopyWith<$Res> get preferences;
}

/// @nodoc
class __$$ProfileHiveModelImplCopyWithImpl<$Res>
    extends _$ProfileHiveModelCopyWithImpl<$Res, _$ProfileHiveModelImpl>
    implements _$$ProfileHiveModelImplCopyWith<$Res> {
  __$$ProfileHiveModelImplCopyWithImpl(_$ProfileHiveModelImpl _value,
      $Res Function(_$ProfileHiveModelImpl) _then)
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
    Object? cachedAt = null,
  }) {
    return _then(_$ProfileHiveModelImpl(
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
              as ProfilePreferencesHiveModel,
      cachedAt: null == cachedAt
          ? _value.cachedAt
          : cachedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileHiveModelImpl implements _ProfileHiveModel {
  const _$ProfileHiveModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.firstName,
      @HiveField(2) required this.lastName,
      @HiveField(3) required this.email,
      @HiveField(4) this.phone,
      @HiveField(5) this.role,
      @HiveField(6) this.city,
      @HiveField(7) this.dob,
      @HiveField(8) this.profileImageUrl,
      @HiveField(9) required this.preferences,
      @HiveField(10) required this.cachedAt});

  factory _$ProfileHiveModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileHiveModelImplFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String firstName;
  @override
  @HiveField(2)
  final String lastName;
  @override
  @HiveField(3)
  final String email;
  @override
  @HiveField(4)
  final String? phone;
  @override
  @HiveField(5)
  final String? role;
  @override
  @HiveField(6)
  final String? city;
  @override
  @HiveField(7)
  final DateTime? dob;
  @override
  @HiveField(8)
  final String? profileImageUrl;
  @override
  @HiveField(9)
  final ProfilePreferencesHiveModel preferences;
  @override
  @HiveField(10)
  final DateTime cachedAt;

  @override
  String toString() {
    return 'ProfileHiveModel(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, role: $role, city: $city, dob: $dob, profileImageUrl: $profileImageUrl, preferences: $preferences, cachedAt: $cachedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileHiveModelImpl &&
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
                other.preferences == preferences) &&
            (identical(other.cachedAt, cachedAt) ||
                other.cachedAt == cachedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName, email,
      phone, role, city, dob, profileImageUrl, preferences, cachedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileHiveModelImplCopyWith<_$ProfileHiveModelImpl> get copyWith =>
      __$$ProfileHiveModelImplCopyWithImpl<_$ProfileHiveModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileHiveModelImplToJson(
      this,
    );
  }
}

abstract class _ProfileHiveModel implements ProfileHiveModel {
  const factory _ProfileHiveModel(
          {@HiveField(0) required final int id,
          @HiveField(1) required final String firstName,
          @HiveField(2) required final String lastName,
          @HiveField(3) required final String email,
          @HiveField(4) final String? phone,
          @HiveField(5) final String? role,
          @HiveField(6) final String? city,
          @HiveField(7) final DateTime? dob,
          @HiveField(8) final String? profileImageUrl,
          @HiveField(9) required final ProfilePreferencesHiveModel preferences,
          @HiveField(10) required final DateTime cachedAt}) =
      _$ProfileHiveModelImpl;

  factory _ProfileHiveModel.fromJson(Map<String, dynamic> json) =
      _$ProfileHiveModelImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get firstName;
  @override
  @HiveField(2)
  String get lastName;
  @override
  @HiveField(3)
  String get email;
  @override
  @HiveField(4)
  String? get phone;
  @override
  @HiveField(5)
  String? get role;
  @override
  @HiveField(6)
  String? get city;
  @override
  @HiveField(7)
  DateTime? get dob;
  @override
  @HiveField(8)
  String? get profileImageUrl;
  @override
  @HiveField(9)
  ProfilePreferencesHiveModel get preferences;
  @override
  @HiveField(10)
  DateTime get cachedAt;
  @override
  @JsonKey(ignore: true)
  _$$ProfileHiveModelImplCopyWith<_$ProfileHiveModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfilePreferencesHiveModel _$ProfilePreferencesHiveModelFromJson(
    Map<String, dynamic> json) {
  return _ProfilePreferencesHiveModel.fromJson(json);
}

/// @nodoc
mixin _$ProfilePreferencesHiveModel {
  @HiveField(0)
  bool get notificationsEnabled => throw _privateConstructorUsedError;
  @HiveField(1)
  bool get pushNotificationsEnabled => throw _privateConstructorUsedError;
  @HiveField(2)
  bool get emailNotificationsEnabled => throw _privateConstructorUsedError;
  @HiveField(3)
  bool get locationTrackingEnabled => throw _privateConstructorUsedError;
  @HiveField(4)
  String get language => throw _privateConstructorUsedError;
  @HiveField(5)
  bool get darkModeEnabled => throw _privateConstructorUsedError;
  @HiveField(6)
  bool get offlineSyncEnabled => throw _privateConstructorUsedError;
  @HiveField(7)
  int get syncIntervalMinutes => throw _privateConstructorUsedError;
  @HiveField(8)
  bool get autoLogoutEnabled => throw _privateConstructorUsedError;
  @HiveField(9)
  int get autoLogoutMinutes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfilePreferencesHiveModelCopyWith<ProfilePreferencesHiveModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfilePreferencesHiveModelCopyWith<$Res> {
  factory $ProfilePreferencesHiveModelCopyWith(
          ProfilePreferencesHiveModel value,
          $Res Function(ProfilePreferencesHiveModel) then) =
      _$ProfilePreferencesHiveModelCopyWithImpl<$Res,
          ProfilePreferencesHiveModel>;
  @useResult
  $Res call(
      {@HiveField(0) bool notificationsEnabled,
      @HiveField(1) bool pushNotificationsEnabled,
      @HiveField(2) bool emailNotificationsEnabled,
      @HiveField(3) bool locationTrackingEnabled,
      @HiveField(4) String language,
      @HiveField(5) bool darkModeEnabled,
      @HiveField(6) bool offlineSyncEnabled,
      @HiveField(7) int syncIntervalMinutes,
      @HiveField(8) bool autoLogoutEnabled,
      @HiveField(9) int autoLogoutMinutes});
}

/// @nodoc
class _$ProfilePreferencesHiveModelCopyWithImpl<$Res,
        $Val extends ProfilePreferencesHiveModel>
    implements $ProfilePreferencesHiveModelCopyWith<$Res> {
  _$ProfilePreferencesHiveModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ProfilePreferencesHiveModelImplCopyWith<$Res>
    implements $ProfilePreferencesHiveModelCopyWith<$Res> {
  factory _$$ProfilePreferencesHiveModelImplCopyWith(
          _$ProfilePreferencesHiveModelImpl value,
          $Res Function(_$ProfilePreferencesHiveModelImpl) then) =
      __$$ProfilePreferencesHiveModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) bool notificationsEnabled,
      @HiveField(1) bool pushNotificationsEnabled,
      @HiveField(2) bool emailNotificationsEnabled,
      @HiveField(3) bool locationTrackingEnabled,
      @HiveField(4) String language,
      @HiveField(5) bool darkModeEnabled,
      @HiveField(6) bool offlineSyncEnabled,
      @HiveField(7) int syncIntervalMinutes,
      @HiveField(8) bool autoLogoutEnabled,
      @HiveField(9) int autoLogoutMinutes});
}

/// @nodoc
class __$$ProfilePreferencesHiveModelImplCopyWithImpl<$Res>
    extends _$ProfilePreferencesHiveModelCopyWithImpl<$Res,
        _$ProfilePreferencesHiveModelImpl>
    implements _$$ProfilePreferencesHiveModelImplCopyWith<$Res> {
  __$$ProfilePreferencesHiveModelImplCopyWithImpl(
      _$ProfilePreferencesHiveModelImpl _value,
      $Res Function(_$ProfilePreferencesHiveModelImpl) _then)
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
    return _then(_$ProfilePreferencesHiveModelImpl(
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
class _$ProfilePreferencesHiveModelImpl
    implements _ProfilePreferencesHiveModel {
  const _$ProfilePreferencesHiveModelImpl(
      {@HiveField(0) this.notificationsEnabled = true,
      @HiveField(1) this.pushNotificationsEnabled = true,
      @HiveField(2) this.emailNotificationsEnabled = true,
      @HiveField(3) this.locationTrackingEnabled = true,
      @HiveField(4) this.language = 'en',
      @HiveField(5) this.darkModeEnabled = false,
      @HiveField(6) this.offlineSyncEnabled = true,
      @HiveField(7) this.syncIntervalMinutes = 30,
      @HiveField(8) this.autoLogoutEnabled = true,
      @HiveField(9) this.autoLogoutMinutes = 60});

  factory _$ProfilePreferencesHiveModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ProfilePreferencesHiveModelImplFromJson(json);

  @override
  @JsonKey()
  @HiveField(0)
  final bool notificationsEnabled;
  @override
  @JsonKey()
  @HiveField(1)
  final bool pushNotificationsEnabled;
  @override
  @JsonKey()
  @HiveField(2)
  final bool emailNotificationsEnabled;
  @override
  @JsonKey()
  @HiveField(3)
  final bool locationTrackingEnabled;
  @override
  @JsonKey()
  @HiveField(4)
  final String language;
  @override
  @JsonKey()
  @HiveField(5)
  final bool darkModeEnabled;
  @override
  @JsonKey()
  @HiveField(6)
  final bool offlineSyncEnabled;
  @override
  @JsonKey()
  @HiveField(7)
  final int syncIntervalMinutes;
  @override
  @JsonKey()
  @HiveField(8)
  final bool autoLogoutEnabled;
  @override
  @JsonKey()
  @HiveField(9)
  final int autoLogoutMinutes;

  @override
  String toString() {
    return 'ProfilePreferencesHiveModel(notificationsEnabled: $notificationsEnabled, pushNotificationsEnabled: $pushNotificationsEnabled, emailNotificationsEnabled: $emailNotificationsEnabled, locationTrackingEnabled: $locationTrackingEnabled, language: $language, darkModeEnabled: $darkModeEnabled, offlineSyncEnabled: $offlineSyncEnabled, syncIntervalMinutes: $syncIntervalMinutes, autoLogoutEnabled: $autoLogoutEnabled, autoLogoutMinutes: $autoLogoutMinutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfilePreferencesHiveModelImpl &&
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
  _$$ProfilePreferencesHiveModelImplCopyWith<_$ProfilePreferencesHiveModelImpl>
      get copyWith => __$$ProfilePreferencesHiveModelImplCopyWithImpl<
          _$ProfilePreferencesHiveModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfilePreferencesHiveModelImplToJson(
      this,
    );
  }
}

abstract class _ProfilePreferencesHiveModel
    implements ProfilePreferencesHiveModel {
  const factory _ProfilePreferencesHiveModel(
          {@HiveField(0) final bool notificationsEnabled,
          @HiveField(1) final bool pushNotificationsEnabled,
          @HiveField(2) final bool emailNotificationsEnabled,
          @HiveField(3) final bool locationTrackingEnabled,
          @HiveField(4) final String language,
          @HiveField(5) final bool darkModeEnabled,
          @HiveField(6) final bool offlineSyncEnabled,
          @HiveField(7) final int syncIntervalMinutes,
          @HiveField(8) final bool autoLogoutEnabled,
          @HiveField(9) final int autoLogoutMinutes}) =
      _$ProfilePreferencesHiveModelImpl;

  factory _ProfilePreferencesHiveModel.fromJson(Map<String, dynamic> json) =
      _$ProfilePreferencesHiveModelImpl.fromJson;

  @override
  @HiveField(0)
  bool get notificationsEnabled;
  @override
  @HiveField(1)
  bool get pushNotificationsEnabled;
  @override
  @HiveField(2)
  bool get emailNotificationsEnabled;
  @override
  @HiveField(3)
  bool get locationTrackingEnabled;
  @override
  @HiveField(4)
  String get language;
  @override
  @HiveField(5)
  bool get darkModeEnabled;
  @override
  @HiveField(6)
  bool get offlineSyncEnabled;
  @override
  @HiveField(7)
  int get syncIntervalMinutes;
  @override
  @HiveField(8)
  bool get autoLogoutEnabled;
  @override
  @HiveField(9)
  int get autoLogoutMinutes;
  @override
  @JsonKey(ignore: true)
  _$$ProfilePreferencesHiveModelImplCopyWith<_$ProfilePreferencesHiveModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
