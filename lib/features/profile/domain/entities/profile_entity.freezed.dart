// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileEntity {
  int get id;
  String get firstName;
  String get lastName;
  String get email;
  String? get phone;
  String? get role;
  String? get city;
  DateTime? get dob;
  String? get profileImageUrl;
  ProfilePreferences get preferences;

  /// Create a copy of ProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileEntityCopyWith<ProfileEntity> get copyWith =>
      _$ProfileEntityCopyWithImpl<ProfileEntity>(
          this as ProfileEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileEntity &&
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

  @override
  String toString() {
    return 'ProfileEntity(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, role: $role, city: $city, dob: $dob, profileImageUrl: $profileImageUrl, preferences: $preferences)';
  }
}

/// @nodoc
abstract mixin class $ProfileEntityCopyWith<$Res> {
  factory $ProfileEntityCopyWith(
          ProfileEntity value, $Res Function(ProfileEntity) _then) =
      _$ProfileEntityCopyWithImpl;
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
class _$ProfileEntityCopyWithImpl<$Res>
    implements $ProfileEntityCopyWith<$Res> {
  _$ProfileEntityCopyWithImpl(this._self, this._then);

  final ProfileEntity _self;
  final $Res Function(ProfileEntity) _then;

  /// Create a copy of ProfileEntity
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
              as ProfilePreferences,
    ));
  }

  /// Create a copy of ProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfilePreferencesCopyWith<$Res> get preferences {
    return $ProfilePreferencesCopyWith<$Res>(_self.preferences, (value) {
      return _then(_self.copyWith(preferences: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ProfileEntity].
extension ProfileEntityPatterns on ProfileEntity {
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
    TResult Function(_ProfileEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfileEntity() when $default != null:
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
    TResult Function(_ProfileEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileEntity():
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
    TResult? Function(_ProfileEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileEntity() when $default != null:
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
            int id,
            String firstName,
            String lastName,
            String email,
            String? phone,
            String? role,
            String? city,
            DateTime? dob,
            String? profileImageUrl,
            ProfilePreferences preferences)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfileEntity() when $default != null:
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
            _that.preferences);
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
            int id,
            String firstName,
            String lastName,
            String email,
            String? phone,
            String? role,
            String? city,
            DateTime? dob,
            String? profileImageUrl,
            ProfilePreferences preferences)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileEntity():
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
            _that.preferences);
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
            int id,
            String firstName,
            String lastName,
            String email,
            String? phone,
            String? role,
            String? city,
            DateTime? dob,
            String? profileImageUrl,
            ProfilePreferences preferences)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileEntity() when $default != null:
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
            _that.preferences);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ProfileEntity extends ProfileEntity {
  const _ProfileEntity(
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

  /// Create a copy of ProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfileEntityCopyWith<_ProfileEntity> get copyWith =>
      __$ProfileEntityCopyWithImpl<_ProfileEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileEntity &&
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

  @override
  String toString() {
    return 'ProfileEntity(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, role: $role, city: $city, dob: $dob, profileImageUrl: $profileImageUrl, preferences: $preferences)';
  }
}

/// @nodoc
abstract mixin class _$ProfileEntityCopyWith<$Res>
    implements $ProfileEntityCopyWith<$Res> {
  factory _$ProfileEntityCopyWith(
          _ProfileEntity value, $Res Function(_ProfileEntity) _then) =
      __$ProfileEntityCopyWithImpl;
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
class __$ProfileEntityCopyWithImpl<$Res>
    implements _$ProfileEntityCopyWith<$Res> {
  __$ProfileEntityCopyWithImpl(this._self, this._then);

  final _ProfileEntity _self;
  final $Res Function(_ProfileEntity) _then;

  /// Create a copy of ProfileEntity
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
  }) {
    return _then(_ProfileEntity(
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
              as ProfilePreferences,
    ));
  }

  /// Create a copy of ProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfilePreferencesCopyWith<$Res> get preferences {
    return $ProfilePreferencesCopyWith<$Res>(_self.preferences, (value) {
      return _then(_self.copyWith(preferences: value));
    });
  }
}

/// @nodoc
mixin _$ProfilePreferences {
  bool get notificationsEnabled;
  bool get pushNotificationsEnabled;
  bool get emailNotificationsEnabled;
  bool get locationTrackingEnabled;
  String get language;
  bool get darkModeEnabled;
  bool get offlineSyncEnabled;
  int get syncIntervalMinutes;
  bool get autoLogoutEnabled;
  int get autoLogoutMinutes;

  /// Create a copy of ProfilePreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfilePreferencesCopyWith<ProfilePreferences> get copyWith =>
      _$ProfilePreferencesCopyWithImpl<ProfilePreferences>(
          this as ProfilePreferences, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfilePreferences &&
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

  @override
  String toString() {
    return 'ProfilePreferences(notificationsEnabled: $notificationsEnabled, pushNotificationsEnabled: $pushNotificationsEnabled, emailNotificationsEnabled: $emailNotificationsEnabled, locationTrackingEnabled: $locationTrackingEnabled, language: $language, darkModeEnabled: $darkModeEnabled, offlineSyncEnabled: $offlineSyncEnabled, syncIntervalMinutes: $syncIntervalMinutes, autoLogoutEnabled: $autoLogoutEnabled, autoLogoutMinutes: $autoLogoutMinutes)';
  }
}

/// @nodoc
abstract mixin class $ProfilePreferencesCopyWith<$Res> {
  factory $ProfilePreferencesCopyWith(
          ProfilePreferences value, $Res Function(ProfilePreferences) _then) =
      _$ProfilePreferencesCopyWithImpl;
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
class _$ProfilePreferencesCopyWithImpl<$Res>
    implements $ProfilePreferencesCopyWith<$Res> {
  _$ProfilePreferencesCopyWithImpl(this._self, this._then);

  final ProfilePreferences _self;
  final $Res Function(ProfilePreferences) _then;

  /// Create a copy of ProfilePreferences
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

/// Adds pattern-matching-related methods to [ProfilePreferences].
extension ProfilePreferencesPatterns on ProfilePreferences {
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
    TResult Function(_ProfilePreferences value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfilePreferences() when $default != null:
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
    TResult Function(_ProfilePreferences value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfilePreferences():
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
    TResult? Function(_ProfilePreferences value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfilePreferences() when $default != null:
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
            bool notificationsEnabled,
            bool pushNotificationsEnabled,
            bool emailNotificationsEnabled,
            bool locationTrackingEnabled,
            String language,
            bool darkModeEnabled,
            bool offlineSyncEnabled,
            int syncIntervalMinutes,
            bool autoLogoutEnabled,
            int autoLogoutMinutes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfilePreferences() when $default != null:
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
            bool notificationsEnabled,
            bool pushNotificationsEnabled,
            bool emailNotificationsEnabled,
            bool locationTrackingEnabled,
            String language,
            bool darkModeEnabled,
            bool offlineSyncEnabled,
            int syncIntervalMinutes,
            bool autoLogoutEnabled,
            int autoLogoutMinutes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfilePreferences():
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
            bool notificationsEnabled,
            bool pushNotificationsEnabled,
            bool emailNotificationsEnabled,
            bool locationTrackingEnabled,
            String language,
            bool darkModeEnabled,
            bool offlineSyncEnabled,
            int syncIntervalMinutes,
            bool autoLogoutEnabled,
            int autoLogoutMinutes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfilePreferences() when $default != null:
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

class _ProfilePreferences implements ProfilePreferences {
  const _ProfilePreferences(
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

  /// Create a copy of ProfilePreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfilePreferencesCopyWith<_ProfilePreferences> get copyWith =>
      __$ProfilePreferencesCopyWithImpl<_ProfilePreferences>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfilePreferences &&
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

  @override
  String toString() {
    return 'ProfilePreferences(notificationsEnabled: $notificationsEnabled, pushNotificationsEnabled: $pushNotificationsEnabled, emailNotificationsEnabled: $emailNotificationsEnabled, locationTrackingEnabled: $locationTrackingEnabled, language: $language, darkModeEnabled: $darkModeEnabled, offlineSyncEnabled: $offlineSyncEnabled, syncIntervalMinutes: $syncIntervalMinutes, autoLogoutEnabled: $autoLogoutEnabled, autoLogoutMinutes: $autoLogoutMinutes)';
  }
}

/// @nodoc
abstract mixin class _$ProfilePreferencesCopyWith<$Res>
    implements $ProfilePreferencesCopyWith<$Res> {
  factory _$ProfilePreferencesCopyWith(
          _ProfilePreferences value, $Res Function(_ProfilePreferences) _then) =
      __$ProfilePreferencesCopyWithImpl;
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
class __$ProfilePreferencesCopyWithImpl<$Res>
    implements _$ProfilePreferencesCopyWith<$Res> {
  __$ProfilePreferencesCopyWithImpl(this._self, this._then);

  final _ProfilePreferences _self;
  final $Res Function(_ProfilePreferences) _then;

  /// Create a copy of ProfilePreferences
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
    return _then(_ProfilePreferences(
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
