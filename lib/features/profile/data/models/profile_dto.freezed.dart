// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileDto {
  int get id;
  @JsonKey(name: 'first_name')
  String get firstName;
  @JsonKey(name: 'last_name')
  String get lastName;
  String get email;
  String? get phone;
  String? get role;
  String? get city;
  @JsonKey(name: 'date_of_birth')
  String? get dob;
  @JsonKey(name: 'profile_image_url')
  String? get profileImageUrl;

  /// Create a copy of ProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileDtoCopyWith<ProfileDto> get copyWith =>
      _$ProfileDtoCopyWithImpl<ProfileDto>(this as ProfileDto, _$identity);

  /// Serializes this ProfileDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileDto &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName, email,
      phone, role, city, dob, profileImageUrl);

  @override
  String toString() {
    return 'ProfileDto(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, role: $role, city: $city, dob: $dob, profileImageUrl: $profileImageUrl)';
  }
}

/// @nodoc
abstract mixin class $ProfileDtoCopyWith<$Res> {
  factory $ProfileDtoCopyWith(
          ProfileDto value, $Res Function(ProfileDto) _then) =
      _$ProfileDtoCopyWithImpl;
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
class _$ProfileDtoCopyWithImpl<$Res> implements $ProfileDtoCopyWith<$Res> {
  _$ProfileDtoCopyWithImpl(this._self, this._then);

  final ProfileDto _self;
  final $Res Function(ProfileDto) _then;

  /// Create a copy of ProfileDto
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
              as String?,
      profileImageUrl: freezed == profileImageUrl
          ? _self.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProfileDto].
extension ProfileDtoPatterns on ProfileDto {
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
    TResult Function(_ProfileDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfileDto() when $default != null:
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
    TResult Function(_ProfileDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileDto():
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
    TResult? Function(_ProfileDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileDto() when $default != null:
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
            @JsonKey(name: 'first_name') String firstName,
            @JsonKey(name: 'last_name') String lastName,
            String email,
            String? phone,
            String? role,
            String? city,
            @JsonKey(name: 'date_of_birth') String? dob,
            @JsonKey(name: 'profile_image_url') String? profileImageUrl)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfileDto() when $default != null:
        return $default(
            _that.id,
            _that.firstName,
            _that.lastName,
            _that.email,
            _that.phone,
            _that.role,
            _that.city,
            _that.dob,
            _that.profileImageUrl);
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
            @JsonKey(name: 'first_name') String firstName,
            @JsonKey(name: 'last_name') String lastName,
            String email,
            String? phone,
            String? role,
            String? city,
            @JsonKey(name: 'date_of_birth') String? dob,
            @JsonKey(name: 'profile_image_url') String? profileImageUrl)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileDto():
        return $default(
            _that.id,
            _that.firstName,
            _that.lastName,
            _that.email,
            _that.phone,
            _that.role,
            _that.city,
            _that.dob,
            _that.profileImageUrl);
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
            @JsonKey(name: 'first_name') String firstName,
            @JsonKey(name: 'last_name') String lastName,
            String email,
            String? phone,
            String? role,
            String? city,
            @JsonKey(name: 'date_of_birth') String? dob,
            @JsonKey(name: 'profile_image_url') String? profileImageUrl)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileDto() when $default != null:
        return $default(
            _that.id,
            _that.firstName,
            _that.lastName,
            _that.email,
            _that.phone,
            _that.role,
            _that.city,
            _that.dob,
            _that.profileImageUrl);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProfileDto implements ProfileDto {
  const _ProfileDto(
      {required this.id,
      @JsonKey(name: 'first_name') required this.firstName,
      @JsonKey(name: 'last_name') required this.lastName,
      required this.email,
      this.phone,
      this.role,
      this.city,
      @JsonKey(name: 'date_of_birth') this.dob,
      @JsonKey(name: 'profile_image_url') this.profileImageUrl});
  factory _ProfileDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileDtoFromJson(json);

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

  /// Create a copy of ProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfileDtoCopyWith<_ProfileDto> get copyWith =>
      __$ProfileDtoCopyWithImpl<_ProfileDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProfileDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileDto &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName, email,
      phone, role, city, dob, profileImageUrl);

  @override
  String toString() {
    return 'ProfileDto(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, role: $role, city: $city, dob: $dob, profileImageUrl: $profileImageUrl)';
  }
}

/// @nodoc
abstract mixin class _$ProfileDtoCopyWith<$Res>
    implements $ProfileDtoCopyWith<$Res> {
  factory _$ProfileDtoCopyWith(
          _ProfileDto value, $Res Function(_ProfileDto) _then) =
      __$ProfileDtoCopyWithImpl;
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
class __$ProfileDtoCopyWithImpl<$Res> implements _$ProfileDtoCopyWith<$Res> {
  __$ProfileDtoCopyWithImpl(this._self, this._then);

  final _ProfileDto _self;
  final $Res Function(_ProfileDto) _then;

  /// Create a copy of ProfileDto
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
  }) {
    return _then(_ProfileDto(
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
              as String?,
      profileImageUrl: freezed == profileImageUrl
          ? _self.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$ProfilePreferencesDto {
  @JsonKey(name: 'notifications_enabled')
  bool get notificationsEnabled;
  @JsonKey(name: 'push_notifications_enabled')
  bool get pushNotificationsEnabled;
  @JsonKey(name: 'email_notifications_enabled')
  bool get emailNotificationsEnabled;
  @JsonKey(name: 'location_tracking_enabled')
  bool get locationTrackingEnabled;
  String get language;
  @JsonKey(name: 'dark_mode_enabled')
  bool get darkModeEnabled;
  @JsonKey(name: 'offline_sync_enabled')
  bool get offlineSyncEnabled;
  @JsonKey(name: 'sync_interval_minutes')
  int get syncIntervalMinutes;
  @JsonKey(name: 'auto_logout_enabled')
  bool get autoLogoutEnabled;
  @JsonKey(name: 'auto_logout_minutes')
  int get autoLogoutMinutes;

  /// Create a copy of ProfilePreferencesDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfilePreferencesDtoCopyWith<ProfilePreferencesDto> get copyWith =>
      _$ProfilePreferencesDtoCopyWithImpl<ProfilePreferencesDto>(
          this as ProfilePreferencesDto, _$identity);

  /// Serializes this ProfilePreferencesDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfilePreferencesDto &&
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
    return 'ProfilePreferencesDto(notificationsEnabled: $notificationsEnabled, pushNotificationsEnabled: $pushNotificationsEnabled, emailNotificationsEnabled: $emailNotificationsEnabled, locationTrackingEnabled: $locationTrackingEnabled, language: $language, darkModeEnabled: $darkModeEnabled, offlineSyncEnabled: $offlineSyncEnabled, syncIntervalMinutes: $syncIntervalMinutes, autoLogoutEnabled: $autoLogoutEnabled, autoLogoutMinutes: $autoLogoutMinutes)';
  }
}

/// @nodoc
abstract mixin class $ProfilePreferencesDtoCopyWith<$Res> {
  factory $ProfilePreferencesDtoCopyWith(ProfilePreferencesDto value,
          $Res Function(ProfilePreferencesDto) _then) =
      _$ProfilePreferencesDtoCopyWithImpl;
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
class _$ProfilePreferencesDtoCopyWithImpl<$Res>
    implements $ProfilePreferencesDtoCopyWith<$Res> {
  _$ProfilePreferencesDtoCopyWithImpl(this._self, this._then);

  final ProfilePreferencesDto _self;
  final $Res Function(ProfilePreferencesDto) _then;

  /// Create a copy of ProfilePreferencesDto
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

/// Adds pattern-matching-related methods to [ProfilePreferencesDto].
extension ProfilePreferencesDtoPatterns on ProfilePreferencesDto {
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
    TResult Function(_ProfilePreferencesDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfilePreferencesDto() when $default != null:
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
    TResult Function(_ProfilePreferencesDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfilePreferencesDto():
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
    TResult? Function(_ProfilePreferencesDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfilePreferencesDto() when $default != null:
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
            @JsonKey(name: 'notifications_enabled') bool notificationsEnabled,
            @JsonKey(name: 'push_notifications_enabled')
            bool pushNotificationsEnabled,
            @JsonKey(name: 'email_notifications_enabled')
            bool emailNotificationsEnabled,
            @JsonKey(name: 'location_tracking_enabled')
            bool locationTrackingEnabled,
            String language,
            @JsonKey(name: 'dark_mode_enabled') bool darkModeEnabled,
            @JsonKey(name: 'offline_sync_enabled') bool offlineSyncEnabled,
            @JsonKey(name: 'sync_interval_minutes') int syncIntervalMinutes,
            @JsonKey(name: 'auto_logout_enabled') bool autoLogoutEnabled,
            @JsonKey(name: 'auto_logout_minutes') int autoLogoutMinutes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfilePreferencesDto() when $default != null:
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
            @JsonKey(name: 'notifications_enabled') bool notificationsEnabled,
            @JsonKey(name: 'push_notifications_enabled')
            bool pushNotificationsEnabled,
            @JsonKey(name: 'email_notifications_enabled')
            bool emailNotificationsEnabled,
            @JsonKey(name: 'location_tracking_enabled')
            bool locationTrackingEnabled,
            String language,
            @JsonKey(name: 'dark_mode_enabled') bool darkModeEnabled,
            @JsonKey(name: 'offline_sync_enabled') bool offlineSyncEnabled,
            @JsonKey(name: 'sync_interval_minutes') int syncIntervalMinutes,
            @JsonKey(name: 'auto_logout_enabled') bool autoLogoutEnabled,
            @JsonKey(name: 'auto_logout_minutes') int autoLogoutMinutes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfilePreferencesDto():
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
            @JsonKey(name: 'notifications_enabled') bool notificationsEnabled,
            @JsonKey(name: 'push_notifications_enabled')
            bool pushNotificationsEnabled,
            @JsonKey(name: 'email_notifications_enabled')
            bool emailNotificationsEnabled,
            @JsonKey(name: 'location_tracking_enabled')
            bool locationTrackingEnabled,
            String language,
            @JsonKey(name: 'dark_mode_enabled') bool darkModeEnabled,
            @JsonKey(name: 'offline_sync_enabled') bool offlineSyncEnabled,
            @JsonKey(name: 'sync_interval_minutes') int syncIntervalMinutes,
            @JsonKey(name: 'auto_logout_enabled') bool autoLogoutEnabled,
            @JsonKey(name: 'auto_logout_minutes') int autoLogoutMinutes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfilePreferencesDto() when $default != null:
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
class _ProfilePreferencesDto implements ProfilePreferencesDto {
  const _ProfilePreferencesDto(
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
  factory _ProfilePreferencesDto.fromJson(Map<String, dynamic> json) =>
      _$ProfilePreferencesDtoFromJson(json);

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

  /// Create a copy of ProfilePreferencesDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfilePreferencesDtoCopyWith<_ProfilePreferencesDto> get copyWith =>
      __$ProfilePreferencesDtoCopyWithImpl<_ProfilePreferencesDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProfilePreferencesDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfilePreferencesDto &&
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
    return 'ProfilePreferencesDto(notificationsEnabled: $notificationsEnabled, pushNotificationsEnabled: $pushNotificationsEnabled, emailNotificationsEnabled: $emailNotificationsEnabled, locationTrackingEnabled: $locationTrackingEnabled, language: $language, darkModeEnabled: $darkModeEnabled, offlineSyncEnabled: $offlineSyncEnabled, syncIntervalMinutes: $syncIntervalMinutes, autoLogoutEnabled: $autoLogoutEnabled, autoLogoutMinutes: $autoLogoutMinutes)';
  }
}

/// @nodoc
abstract mixin class _$ProfilePreferencesDtoCopyWith<$Res>
    implements $ProfilePreferencesDtoCopyWith<$Res> {
  factory _$ProfilePreferencesDtoCopyWith(_ProfilePreferencesDto value,
          $Res Function(_ProfilePreferencesDto) _then) =
      __$ProfilePreferencesDtoCopyWithImpl;
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
class __$ProfilePreferencesDtoCopyWithImpl<$Res>
    implements _$ProfilePreferencesDtoCopyWith<$Res> {
  __$ProfilePreferencesDtoCopyWithImpl(this._self, this._then);

  final _ProfilePreferencesDto _self;
  final $Res Function(_ProfilePreferencesDto) _then;

  /// Create a copy of ProfilePreferencesDto
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
    return _then(_ProfilePreferencesDto(
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
