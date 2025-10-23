// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_hive_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileHiveModel {
  @HiveField(0)
  int get id;
  @HiveField(1)
  String get firstName;
  @HiveField(2)
  String get lastName;
  @HiveField(3)
  String get email;
  @HiveField(4)
  String? get phone;
  @HiveField(5)
  String? get role;
  @HiveField(6)
  String? get city;
  @HiveField(7)
  DateTime? get dob;
  @HiveField(8)
  String? get profileImageUrl;
  @HiveField(9)
  ProfilePreferencesHiveModel get preferences;
  @HiveField(10)
  DateTime get cachedAt;

  /// Create a copy of ProfileHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileHiveModelCopyWith<ProfileHiveModel> get copyWith =>
      _$ProfileHiveModelCopyWithImpl<ProfileHiveModel>(
          this as ProfileHiveModel, _$identity);

  /// Serializes this ProfileHiveModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileHiveModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName, email,
      phone, role, city, dob, profileImageUrl, preferences, cachedAt);

  @override
  String toString() {
    return 'ProfileHiveModel(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, role: $role, city: $city, dob: $dob, profileImageUrl: $profileImageUrl, preferences: $preferences, cachedAt: $cachedAt)';
  }
}

/// @nodoc
abstract mixin class $ProfileHiveModelCopyWith<$Res> {
  factory $ProfileHiveModelCopyWith(
          ProfileHiveModel value, $Res Function(ProfileHiveModel) _then) =
      _$ProfileHiveModelCopyWithImpl;
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
class _$ProfileHiveModelCopyWithImpl<$Res>
    implements $ProfileHiveModelCopyWith<$Res> {
  _$ProfileHiveModelCopyWithImpl(this._self, this._then);

  final ProfileHiveModel _self;
  final $Res Function(ProfileHiveModel) _then;

  /// Create a copy of ProfileHiveModel
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _self.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      profileImageUrl: freezed == profileImageUrl
          ? _self.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      preferences: null == preferences
          ? _self.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as ProfilePreferencesHiveModel,
      cachedAt: null == cachedAt
          ? _self.cachedAt
          : cachedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of ProfileHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfilePreferencesHiveModelCopyWith<$Res> get preferences {
    return $ProfilePreferencesHiveModelCopyWith<$Res>(_self.preferences,
        (value) {
      return _then(_self.copyWith(preferences: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ProfileHiveModel].
extension ProfileHiveModelPatterns on ProfileHiveModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ProfileHiveModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfileHiveModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ProfileHiveModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileHiveModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ProfileHiveModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileHiveModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @HiveField(0) int id,
            @HiveField(1) String firstName,
            @HiveField(2) String lastName,
            @HiveField(3) String email,
            @HiveField(4) String? phone,
            @HiveField(5) String? role,
            @HiveField(6) String? city,
            @HiveField(7) DateTime? dob,
            @HiveField(8) String? profileImageUrl,
            @HiveField(9) ProfilePreferencesHiveModel preferences,
            @HiveField(10) DateTime cachedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfileHiveModel() when $default != null:
        return $default(
            _that.id,
            _that.firstName,
            _that.lastName,
            _that.email,
            _that.phone,
            _that.role,
            _that.city,
            _that.dob,
            _that.profileImageUrl,
            _that.preferences,
            _that.cachedAt);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @HiveField(0) int id,
            @HiveField(1) String firstName,
            @HiveField(2) String lastName,
            @HiveField(3) String email,
            @HiveField(4) String? phone,
            @HiveField(5) String? role,
            @HiveField(6) String? city,
            @HiveField(7) DateTime? dob,
            @HiveField(8) String? profileImageUrl,
            @HiveField(9) ProfilePreferencesHiveModel preferences,
            @HiveField(10) DateTime cachedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileHiveModel():
        return $default(
            _that.id,
            _that.firstName,
            _that.lastName,
            _that.email,
            _that.phone,
            _that.role,
            _that.city,
            _that.dob,
            _that.profileImageUrl,
            _that.preferences,
            _that.cachedAt);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @HiveField(0) int id,
            @HiveField(1) String firstName,
            @HiveField(2) String lastName,
            @HiveField(3) String email,
            @HiveField(4) String? phone,
            @HiveField(5) String? role,
            @HiveField(6) String? city,
            @HiveField(7) DateTime? dob,
            @HiveField(8) String? profileImageUrl,
            @HiveField(9) ProfilePreferencesHiveModel preferences,
            @HiveField(10) DateTime cachedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileHiveModel() when $default != null:
        return $default(
            _that.id,
            _that.firstName,
            _that.lastName,
            _that.email,
            _that.phone,
            _that.role,
            _that.city,
            _that.dob,
            _that.profileImageUrl,
            _that.preferences,
            _that.cachedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProfileHiveModel implements ProfileHiveModel {
  const _ProfileHiveModel(
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
  factory _ProfileHiveModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileHiveModelFromJson(json);

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

  /// Create a copy of ProfileHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfileHiveModelCopyWith<_ProfileHiveModel> get copyWith =>
      __$ProfileHiveModelCopyWithImpl<_ProfileHiveModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProfileHiveModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileHiveModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName, email,
      phone, role, city, dob, profileImageUrl, preferences, cachedAt);

  @override
  String toString() {
    return 'ProfileHiveModel(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, role: $role, city: $city, dob: $dob, profileImageUrl: $profileImageUrl, preferences: $preferences, cachedAt: $cachedAt)';
  }
}

/// @nodoc
abstract mixin class _$ProfileHiveModelCopyWith<$Res>
    implements $ProfileHiveModelCopyWith<$Res> {
  factory _$ProfileHiveModelCopyWith(
          _ProfileHiveModel value, $Res Function(_ProfileHiveModel) _then) =
      __$ProfileHiveModelCopyWithImpl;
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
class __$ProfileHiveModelCopyWithImpl<$Res>
    implements _$ProfileHiveModelCopyWith<$Res> {
  __$ProfileHiveModelCopyWithImpl(this._self, this._then);

  final _ProfileHiveModel _self;
  final $Res Function(_ProfileHiveModel) _then;

  /// Create a copy of ProfileHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_ProfileHiveModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _self.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      profileImageUrl: freezed == profileImageUrl
          ? _self.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      preferences: null == preferences
          ? _self.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as ProfilePreferencesHiveModel,
      cachedAt: null == cachedAt
          ? _self.cachedAt
          : cachedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of ProfileHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfilePreferencesHiveModelCopyWith<$Res> get preferences {
    return $ProfilePreferencesHiveModelCopyWith<$Res>(_self.preferences,
        (value) {
      return _then(_self.copyWith(preferences: value));
    });
  }
}

/// @nodoc
mixin _$ProfilePreferencesHiveModel {
  @HiveField(0)
  bool get notificationsEnabled;
  @HiveField(1)
  bool get pushNotificationsEnabled;
  @HiveField(2)
  bool get emailNotificationsEnabled;
  @HiveField(3)
  bool get locationTrackingEnabled;
  @HiveField(4)
  String get language;
  @HiveField(5)
  bool get darkModeEnabled;
  @HiveField(6)
  bool get offlineSyncEnabled;
  @HiveField(7)
  int get syncIntervalMinutes;
  @HiveField(8)
  bool get autoLogoutEnabled;
  @HiveField(9)
  int get autoLogoutMinutes;

  /// Create a copy of ProfilePreferencesHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfilePreferencesHiveModelCopyWith<ProfilePreferencesHiveModel>
      get copyWith => _$ProfilePreferencesHiveModelCopyWithImpl<
              ProfilePreferencesHiveModel>(
          this as ProfilePreferencesHiveModel, _$identity);

  /// Serializes this ProfilePreferencesHiveModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfilePreferencesHiveModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  @override
  String toString() {
    return 'ProfilePreferencesHiveModel(notificationsEnabled: $notificationsEnabled, pushNotificationsEnabled: $pushNotificationsEnabled, emailNotificationsEnabled: $emailNotificationsEnabled, locationTrackingEnabled: $locationTrackingEnabled, language: $language, darkModeEnabled: $darkModeEnabled, offlineSyncEnabled: $offlineSyncEnabled, syncIntervalMinutes: $syncIntervalMinutes, autoLogoutEnabled: $autoLogoutEnabled, autoLogoutMinutes: $autoLogoutMinutes)';
  }
}

/// @nodoc
abstract mixin class $ProfilePreferencesHiveModelCopyWith<$Res> {
  factory $ProfilePreferencesHiveModelCopyWith(
          ProfilePreferencesHiveModel value,
          $Res Function(ProfilePreferencesHiveModel) _then) =
      _$ProfilePreferencesHiveModelCopyWithImpl;
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
class _$ProfilePreferencesHiveModelCopyWithImpl<$Res>
    implements $ProfilePreferencesHiveModelCopyWith<$Res> {
  _$ProfilePreferencesHiveModelCopyWithImpl(this._self, this._then);

  final ProfilePreferencesHiveModel _self;
  final $Res Function(ProfilePreferencesHiveModel) _then;

  /// Create a copy of ProfilePreferencesHiveModel
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      notificationsEnabled: null == notificationsEnabled
          ? _self.notificationsEnabled
          : notificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      pushNotificationsEnabled: null == pushNotificationsEnabled
          ? _self.pushNotificationsEnabled
          : pushNotificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      emailNotificationsEnabled: null == emailNotificationsEnabled
          ? _self.emailNotificationsEnabled
          : emailNotificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      locationTrackingEnabled: null == locationTrackingEnabled
          ? _self.locationTrackingEnabled
          : locationTrackingEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      darkModeEnabled: null == darkModeEnabled
          ? _self.darkModeEnabled
          : darkModeEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      offlineSyncEnabled: null == offlineSyncEnabled
          ? _self.offlineSyncEnabled
          : offlineSyncEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      syncIntervalMinutes: null == syncIntervalMinutes
          ? _self.syncIntervalMinutes
          : syncIntervalMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      autoLogoutEnabled: null == autoLogoutEnabled
          ? _self.autoLogoutEnabled
          : autoLogoutEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      autoLogoutMinutes: null == autoLogoutMinutes
          ? _self.autoLogoutMinutes
          : autoLogoutMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProfilePreferencesHiveModel].
extension ProfilePreferencesHiveModelPatterns on ProfilePreferencesHiveModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ProfilePreferencesHiveModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfilePreferencesHiveModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ProfilePreferencesHiveModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfilePreferencesHiveModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ProfilePreferencesHiveModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfilePreferencesHiveModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @HiveField(0) bool notificationsEnabled,
            @HiveField(1) bool pushNotificationsEnabled,
            @HiveField(2) bool emailNotificationsEnabled,
            @HiveField(3) bool locationTrackingEnabled,
            @HiveField(4) String language,
            @HiveField(5) bool darkModeEnabled,
            @HiveField(6) bool offlineSyncEnabled,
            @HiveField(7) int syncIntervalMinutes,
            @HiveField(8) bool autoLogoutEnabled,
            @HiveField(9) int autoLogoutMinutes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfilePreferencesHiveModel() when $default != null:
        return $default(
            _that.notificationsEnabled,
            _that.pushNotificationsEnabled,
            _that.emailNotificationsEnabled,
            _that.locationTrackingEnabled,
            _that.language,
            _that.darkModeEnabled,
            _that.offlineSyncEnabled,
            _that.syncIntervalMinutes,
            _that.autoLogoutEnabled,
            _that.autoLogoutMinutes);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @HiveField(0) bool notificationsEnabled,
            @HiveField(1) bool pushNotificationsEnabled,
            @HiveField(2) bool emailNotificationsEnabled,
            @HiveField(3) bool locationTrackingEnabled,
            @HiveField(4) String language,
            @HiveField(5) bool darkModeEnabled,
            @HiveField(6) bool offlineSyncEnabled,
            @HiveField(7) int syncIntervalMinutes,
            @HiveField(8) bool autoLogoutEnabled,
            @HiveField(9) int autoLogoutMinutes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfilePreferencesHiveModel():
        return $default(
            _that.notificationsEnabled,
            _that.pushNotificationsEnabled,
            _that.emailNotificationsEnabled,
            _that.locationTrackingEnabled,
            _that.language,
            _that.darkModeEnabled,
            _that.offlineSyncEnabled,
            _that.syncIntervalMinutes,
            _that.autoLogoutEnabled,
            _that.autoLogoutMinutes);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @HiveField(0) bool notificationsEnabled,
            @HiveField(1) bool pushNotificationsEnabled,
            @HiveField(2) bool emailNotificationsEnabled,
            @HiveField(3) bool locationTrackingEnabled,
            @HiveField(4) String language,
            @HiveField(5) bool darkModeEnabled,
            @HiveField(6) bool offlineSyncEnabled,
            @HiveField(7) int syncIntervalMinutes,
            @HiveField(8) bool autoLogoutEnabled,
            @HiveField(9) int autoLogoutMinutes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfilePreferencesHiveModel() when $default != null:
        return $default(
            _that.notificationsEnabled,
            _that.pushNotificationsEnabled,
            _that.emailNotificationsEnabled,
            _that.locationTrackingEnabled,
            _that.language,
            _that.darkModeEnabled,
            _that.offlineSyncEnabled,
            _that.syncIntervalMinutes,
            _that.autoLogoutEnabled,
            _that.autoLogoutMinutes);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProfilePreferencesHiveModel implements ProfilePreferencesHiveModel {
  const _ProfilePreferencesHiveModel(
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
  factory _ProfilePreferencesHiveModel.fromJson(Map<String, dynamic> json) =>
      _$ProfilePreferencesHiveModelFromJson(json);

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

  /// Create a copy of ProfilePreferencesHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfilePreferencesHiveModelCopyWith<_ProfilePreferencesHiveModel>
      get copyWith => __$ProfilePreferencesHiveModelCopyWithImpl<
          _ProfilePreferencesHiveModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProfilePreferencesHiveModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfilePreferencesHiveModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  @override
  String toString() {
    return 'ProfilePreferencesHiveModel(notificationsEnabled: $notificationsEnabled, pushNotificationsEnabled: $pushNotificationsEnabled, emailNotificationsEnabled: $emailNotificationsEnabled, locationTrackingEnabled: $locationTrackingEnabled, language: $language, darkModeEnabled: $darkModeEnabled, offlineSyncEnabled: $offlineSyncEnabled, syncIntervalMinutes: $syncIntervalMinutes, autoLogoutEnabled: $autoLogoutEnabled, autoLogoutMinutes: $autoLogoutMinutes)';
  }
}

/// @nodoc
abstract mixin class _$ProfilePreferencesHiveModelCopyWith<$Res>
    implements $ProfilePreferencesHiveModelCopyWith<$Res> {
  factory _$ProfilePreferencesHiveModelCopyWith(
          _ProfilePreferencesHiveModel value,
          $Res Function(_ProfilePreferencesHiveModel) _then) =
      __$ProfilePreferencesHiveModelCopyWithImpl;
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
class __$ProfilePreferencesHiveModelCopyWithImpl<$Res>
    implements _$ProfilePreferencesHiveModelCopyWith<$Res> {
  __$ProfilePreferencesHiveModelCopyWithImpl(this._self, this._then);

  final _ProfilePreferencesHiveModel _self;
  final $Res Function(_ProfilePreferencesHiveModel) _then;

  /// Create a copy of ProfilePreferencesHiveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_ProfilePreferencesHiveModel(
      notificationsEnabled: null == notificationsEnabled
          ? _self.notificationsEnabled
          : notificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      pushNotificationsEnabled: null == pushNotificationsEnabled
          ? _self.pushNotificationsEnabled
          : pushNotificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      emailNotificationsEnabled: null == emailNotificationsEnabled
          ? _self.emailNotificationsEnabled
          : emailNotificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      locationTrackingEnabled: null == locationTrackingEnabled
          ? _self.locationTrackingEnabled
          : locationTrackingEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      darkModeEnabled: null == darkModeEnabled
          ? _self.darkModeEnabled
          : darkModeEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      offlineSyncEnabled: null == offlineSyncEnabled
          ? _self.offlineSyncEnabled
          : offlineSyncEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      syncIntervalMinutes: null == syncIntervalMinutes
          ? _self.syncIntervalMinutes
          : syncIntervalMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      autoLogoutEnabled: null == autoLogoutEnabled
          ? _self.autoLogoutEnabled
          : autoLogoutEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      autoLogoutMinutes: null == autoLogoutMinutes
          ? _self.autoLogoutMinutes
          : autoLogoutMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
