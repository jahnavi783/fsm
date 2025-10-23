// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProfileEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileEvent()';
  }
}

/// @nodoc
class $ProfileEventCopyWith<$Res> {
  $ProfileEventCopyWith(ProfileEvent _, $Res Function(ProfileEvent) __);
}

/// Adds pattern-matching-related methods to [ProfileEvent].
extension ProfileEventPatterns on ProfileEvent {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadProfile value)? loadProfile,
    TResult Function(_UpdateProfile value)? updateProfile,
    TResult Function(_LoadPreferences value)? loadPreferences,
    TResult Function(_UpdatePreferences value)? updatePreferences,
    TResult Function(_Logout value)? logout,
    TResult Function(_DeleteAccount value)? deleteAccount,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadProfile() when loadProfile != null:
        return loadProfile(_that);
      case _UpdateProfile() when updateProfile != null:
        return updateProfile(_that);
      case _LoadPreferences() when loadPreferences != null:
        return loadPreferences(_that);
      case _UpdatePreferences() when updatePreferences != null:
        return updatePreferences(_that);
      case _Logout() when logout != null:
        return logout(_that);
      case _DeleteAccount() when deleteAccount != null:
        return deleteAccount(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadProfile value) loadProfile,
    required TResult Function(_UpdateProfile value) updateProfile,
    required TResult Function(_LoadPreferences value) loadPreferences,
    required TResult Function(_UpdatePreferences value) updatePreferences,
    required TResult Function(_Logout value) logout,
    required TResult Function(_DeleteAccount value) deleteAccount,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadProfile():
        return loadProfile(_that);
      case _UpdateProfile():
        return updateProfile(_that);
      case _LoadPreferences():
        return loadPreferences(_that);
      case _UpdatePreferences():
        return updatePreferences(_that);
      case _Logout():
        return logout(_that);
      case _DeleteAccount():
        return deleteAccount(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadProfile value)? loadProfile,
    TResult? Function(_UpdateProfile value)? updateProfile,
    TResult? Function(_LoadPreferences value)? loadPreferences,
    TResult? Function(_UpdatePreferences value)? updatePreferences,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_DeleteAccount value)? deleteAccount,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadProfile() when loadProfile != null:
        return loadProfile(_that);
      case _UpdateProfile() when updateProfile != null:
        return updateProfile(_that);
      case _LoadPreferences() when loadPreferences != null:
        return loadPreferences(_that);
      case _UpdatePreferences() when updatePreferences != null:
        return updatePreferences(_that);
      case _Logout() when logout != null:
        return logout(_that);
      case _DeleteAccount() when deleteAccount != null:
        return deleteAccount(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProfile,
    TResult Function(ProfileEntity profile)? updateProfile,
    TResult Function()? loadPreferences,
    TResult Function(ProfilePreferences preferences)? updatePreferences,
    TResult Function()? logout,
    TResult Function()? deleteAccount,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadProfile() when loadProfile != null:
        return loadProfile();
      case _UpdateProfile() when updateProfile != null:
        return updateProfile(_that.profile);
      case _LoadPreferences() when loadPreferences != null:
        return loadPreferences();
      case _UpdatePreferences() when updatePreferences != null:
        return updatePreferences(_that.preferences);
      case _Logout() when logout != null:
        return logout();
      case _DeleteAccount() when deleteAccount != null:
        return deleteAccount();
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
  TResult when<TResult extends Object?>({
    required TResult Function() loadProfile,
    required TResult Function(ProfileEntity profile) updateProfile,
    required TResult Function() loadPreferences,
    required TResult Function(ProfilePreferences preferences) updatePreferences,
    required TResult Function() logout,
    required TResult Function() deleteAccount,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadProfile():
        return loadProfile();
      case _UpdateProfile():
        return updateProfile(_that.profile);
      case _LoadPreferences():
        return loadPreferences();
      case _UpdatePreferences():
        return updatePreferences(_that.preferences);
      case _Logout():
        return logout();
      case _DeleteAccount():
        return deleteAccount();
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProfile,
    TResult? Function(ProfileEntity profile)? updateProfile,
    TResult? Function()? loadPreferences,
    TResult? Function(ProfilePreferences preferences)? updatePreferences,
    TResult? Function()? logout,
    TResult? Function()? deleteAccount,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadProfile() when loadProfile != null:
        return loadProfile();
      case _UpdateProfile() when updateProfile != null:
        return updateProfile(_that.profile);
      case _LoadPreferences() when loadPreferences != null:
        return loadPreferences();
      case _UpdatePreferences() when updatePreferences != null:
        return updatePreferences(_that.preferences);
      case _Logout() when logout != null:
        return logout();
      case _DeleteAccount() when deleteAccount != null:
        return deleteAccount();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LoadProfile implements ProfileEvent {
  const _LoadProfile();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadProfile);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileEvent.loadProfile()';
  }
}

/// @nodoc

class _UpdateProfile implements ProfileEvent {
  const _UpdateProfile(this.profile);

  final ProfileEntity profile;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateProfileCopyWith<_UpdateProfile> get copyWith =>
      __$UpdateProfileCopyWithImpl<_UpdateProfile>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateProfile &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile);

  @override
  String toString() {
    return 'ProfileEvent.updateProfile(profile: $profile)';
  }
}

/// @nodoc
abstract mixin class _$UpdateProfileCopyWith<$Res>
    implements $ProfileEventCopyWith<$Res> {
  factory _$UpdateProfileCopyWith(
          _UpdateProfile value, $Res Function(_UpdateProfile) _then) =
      __$UpdateProfileCopyWithImpl;
  @useResult
  $Res call({ProfileEntity profile});

  $ProfileEntityCopyWith<$Res> get profile;
}

/// @nodoc
class __$UpdateProfileCopyWithImpl<$Res>
    implements _$UpdateProfileCopyWith<$Res> {
  __$UpdateProfileCopyWithImpl(this._self, this._then);

  final _UpdateProfile _self;
  final $Res Function(_UpdateProfile) _then;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profile = null,
  }) {
    return _then(_UpdateProfile(
      null == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileEntity,
    ));
  }

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileEntityCopyWith<$Res> get profile {
    return $ProfileEntityCopyWith<$Res>(_self.profile, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }
}

/// @nodoc

class _LoadPreferences implements ProfileEvent {
  const _LoadPreferences();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadPreferences);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileEvent.loadPreferences()';
  }
}

/// @nodoc

class _UpdatePreferences implements ProfileEvent {
  const _UpdatePreferences(this.preferences);

  final ProfilePreferences preferences;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdatePreferencesCopyWith<_UpdatePreferences> get copyWith =>
      __$UpdatePreferencesCopyWithImpl<_UpdatePreferences>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdatePreferences &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences));
  }

  @override
  int get hashCode => Object.hash(runtimeType, preferences);

  @override
  String toString() {
    return 'ProfileEvent.updatePreferences(preferences: $preferences)';
  }
}

/// @nodoc
abstract mixin class _$UpdatePreferencesCopyWith<$Res>
    implements $ProfileEventCopyWith<$Res> {
  factory _$UpdatePreferencesCopyWith(
          _UpdatePreferences value, $Res Function(_UpdatePreferences) _then) =
      __$UpdatePreferencesCopyWithImpl;
  @useResult
  $Res call({ProfilePreferences preferences});

  $ProfilePreferencesCopyWith<$Res> get preferences;
}

/// @nodoc
class __$UpdatePreferencesCopyWithImpl<$Res>
    implements _$UpdatePreferencesCopyWith<$Res> {
  __$UpdatePreferencesCopyWithImpl(this._self, this._then);

  final _UpdatePreferences _self;
  final $Res Function(_UpdatePreferences) _then;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? preferences = null,
  }) {
    return _then(_UpdatePreferences(
      null == preferences
          ? _self.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as ProfilePreferences,
    ));
  }

  /// Create a copy of ProfileEvent
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

class _Logout implements ProfileEvent {
  const _Logout();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Logout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileEvent.logout()';
  }
}

/// @nodoc

class _DeleteAccount implements ProfileEvent {
  const _DeleteAccount();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _DeleteAccount);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileEvent.deleteAccount()';
  }
}

// dart format on
