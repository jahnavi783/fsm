// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PermissionResult {
  AppPermission get permission;
  AppPermissionStatus get status;
  bool get openedSettings;

  /// Create a copy of PermissionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PermissionResultCopyWith<PermissionResult> get copyWith =>
      _$PermissionResultCopyWithImpl<PermissionResult>(
          this as PermissionResult, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PermissionResult &&
            (identical(other.permission, permission) ||
                other.permission == permission) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.openedSettings, openedSettings) ||
                other.openedSettings == openedSettings));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, permission, status, openedSettings);

  @override
  String toString() {
    return 'PermissionResult(permission: $permission, status: $status, openedSettings: $openedSettings)';
  }
}

/// @nodoc
abstract mixin class $PermissionResultCopyWith<$Res> {
  factory $PermissionResultCopyWith(
          PermissionResult value, $Res Function(PermissionResult) _then) =
      _$PermissionResultCopyWithImpl;
  @useResult
  $Res call(
      {AppPermission permission,
      AppPermissionStatus status,
      bool openedSettings});
}

/// @nodoc
class _$PermissionResultCopyWithImpl<$Res>
    implements $PermissionResultCopyWith<$Res> {
  _$PermissionResultCopyWithImpl(this._self, this._then);

  final PermissionResult _self;
  final $Res Function(PermissionResult) _then;

  /// Create a copy of PermissionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permission = null,
    Object? status = null,
    Object? openedSettings = null,
  }) {
    return _then(_self.copyWith(
      permission: null == permission
          ? _self.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as AppPermission,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppPermissionStatus,
      openedSettings: null == openedSettings
          ? _self.openedSettings
          : openedSettings // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [PermissionResult].
extension PermissionResultPatterns on PermissionResult {
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
    TResult Function(_PermissionResult value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PermissionResult() when $default != null:
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
    TResult Function(_PermissionResult value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PermissionResult():
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
    TResult? Function(_PermissionResult value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PermissionResult() when $default != null:
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
    TResult Function(AppPermission permission, AppPermissionStatus status,
            bool openedSettings)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PermissionResult() when $default != null:
        return $default(_that.permission, _that.status, _that.openedSettings);
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
    TResult Function(AppPermission permission, AppPermissionStatus status,
            bool openedSettings)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PermissionResult():
        return $default(_that.permission, _that.status, _that.openedSettings);
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
    TResult? Function(AppPermission permission, AppPermissionStatus status,
            bool openedSettings)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PermissionResult() when $default != null:
        return $default(_that.permission, _that.status, _that.openedSettings);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PermissionResult implements PermissionResult {
  const _PermissionResult(
      {required this.permission,
      required this.status,
      this.openedSettings = false});

  @override
  final AppPermission permission;
  @override
  final AppPermissionStatus status;
  @override
  @JsonKey()
  final bool openedSettings;

  /// Create a copy of PermissionResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PermissionResultCopyWith<_PermissionResult> get copyWith =>
      __$PermissionResultCopyWithImpl<_PermissionResult>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PermissionResult &&
            (identical(other.permission, permission) ||
                other.permission == permission) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.openedSettings, openedSettings) ||
                other.openedSettings == openedSettings));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, permission, status, openedSettings);

  @override
  String toString() {
    return 'PermissionResult(permission: $permission, status: $status, openedSettings: $openedSettings)';
  }
}

/// @nodoc
abstract mixin class _$PermissionResultCopyWith<$Res>
    implements $PermissionResultCopyWith<$Res> {
  factory _$PermissionResultCopyWith(
          _PermissionResult value, $Res Function(_PermissionResult) _then) =
      __$PermissionResultCopyWithImpl;
  @override
  @useResult
  $Res call(
      {AppPermission permission,
      AppPermissionStatus status,
      bool openedSettings});
}

/// @nodoc
class __$PermissionResultCopyWithImpl<$Res>
    implements _$PermissionResultCopyWith<$Res> {
  __$PermissionResultCopyWithImpl(this._self, this._then);

  final _PermissionResult _self;
  final $Res Function(_PermissionResult) _then;

  /// Create a copy of PermissionResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? permission = null,
    Object? status = null,
    Object? openedSettings = null,
  }) {
    return _then(_PermissionResult(
      permission: null == permission
          ? _self.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as AppPermission,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppPermissionStatus,
      openedSettings: null == openedSettings
          ? _self.openedSettings
          : openedSettings // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$MultiplePermissionResult {
  Map<AppPermission, AppPermissionStatus> get results;
  List<AppPermission> get grantedPermissions;
  List<AppPermission> get deniedPermissions;
  List<AppPermission> get permanentlyDeniedPermissions;
  List<AppPermission> get restrictedPermissions;

  /// Create a copy of MultiplePermissionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MultiplePermissionResultCopyWith<MultiplePermissionResult> get copyWith =>
      _$MultiplePermissionResultCopyWithImpl<MultiplePermissionResult>(
          this as MultiplePermissionResult, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MultiplePermissionResult &&
            const DeepCollectionEquality().equals(other.results, results) &&
            const DeepCollectionEquality()
                .equals(other.grantedPermissions, grantedPermissions) &&
            const DeepCollectionEquality()
                .equals(other.deniedPermissions, deniedPermissions) &&
            const DeepCollectionEquality().equals(
                other.permanentlyDeniedPermissions,
                permanentlyDeniedPermissions) &&
            const DeepCollectionEquality()
                .equals(other.restrictedPermissions, restrictedPermissions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(results),
      const DeepCollectionEquality().hash(grantedPermissions),
      const DeepCollectionEquality().hash(deniedPermissions),
      const DeepCollectionEquality().hash(permanentlyDeniedPermissions),
      const DeepCollectionEquality().hash(restrictedPermissions));

  @override
  String toString() {
    return 'MultiplePermissionResult(results: $results, grantedPermissions: $grantedPermissions, deniedPermissions: $deniedPermissions, permanentlyDeniedPermissions: $permanentlyDeniedPermissions, restrictedPermissions: $restrictedPermissions)';
  }
}

/// @nodoc
abstract mixin class $MultiplePermissionResultCopyWith<$Res> {
  factory $MultiplePermissionResultCopyWith(MultiplePermissionResult value,
          $Res Function(MultiplePermissionResult) _then) =
      _$MultiplePermissionResultCopyWithImpl;
  @useResult
  $Res call(
      {Map<AppPermission, AppPermissionStatus> results,
      List<AppPermission> grantedPermissions,
      List<AppPermission> deniedPermissions,
      List<AppPermission> permanentlyDeniedPermissions,
      List<AppPermission> restrictedPermissions});
}

/// @nodoc
class _$MultiplePermissionResultCopyWithImpl<$Res>
    implements $MultiplePermissionResultCopyWith<$Res> {
  _$MultiplePermissionResultCopyWithImpl(this._self, this._then);

  final MultiplePermissionResult _self;
  final $Res Function(MultiplePermissionResult) _then;

  /// Create a copy of MultiplePermissionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? grantedPermissions = null,
    Object? deniedPermissions = null,
    Object? permanentlyDeniedPermissions = null,
    Object? restrictedPermissions = null,
  }) {
    return _then(_self.copyWith(
      results: null == results
          ? _self.results
          : results // ignore: cast_nullable_to_non_nullable
              as Map<AppPermission, AppPermissionStatus>,
      grantedPermissions: null == grantedPermissions
          ? _self.grantedPermissions
          : grantedPermissions // ignore: cast_nullable_to_non_nullable
              as List<AppPermission>,
      deniedPermissions: null == deniedPermissions
          ? _self.deniedPermissions
          : deniedPermissions // ignore: cast_nullable_to_non_nullable
              as List<AppPermission>,
      permanentlyDeniedPermissions: null == permanentlyDeniedPermissions
          ? _self.permanentlyDeniedPermissions
          : permanentlyDeniedPermissions // ignore: cast_nullable_to_non_nullable
              as List<AppPermission>,
      restrictedPermissions: null == restrictedPermissions
          ? _self.restrictedPermissions
          : restrictedPermissions // ignore: cast_nullable_to_non_nullable
              as List<AppPermission>,
    ));
  }
}

/// Adds pattern-matching-related methods to [MultiplePermissionResult].
extension MultiplePermissionResultPatterns on MultiplePermissionResult {
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
    TResult Function(_MultiplePermissionResult value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MultiplePermissionResult() when $default != null:
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
    TResult Function(_MultiplePermissionResult value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MultiplePermissionResult():
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
    TResult? Function(_MultiplePermissionResult value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MultiplePermissionResult() when $default != null:
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
            Map<AppPermission, AppPermissionStatus> results,
            List<AppPermission> grantedPermissions,
            List<AppPermission> deniedPermissions,
            List<AppPermission> permanentlyDeniedPermissions,
            List<AppPermission> restrictedPermissions)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MultiplePermissionResult() when $default != null:
        return $default(
            _that.results,
            _that.grantedPermissions,
            _that.deniedPermissions,
            _that.permanentlyDeniedPermissions,
            _that.restrictedPermissions);
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
            Map<AppPermission, AppPermissionStatus> results,
            List<AppPermission> grantedPermissions,
            List<AppPermission> deniedPermissions,
            List<AppPermission> permanentlyDeniedPermissions,
            List<AppPermission> restrictedPermissions)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MultiplePermissionResult():
        return $default(
            _that.results,
            _that.grantedPermissions,
            _that.deniedPermissions,
            _that.permanentlyDeniedPermissions,
            _that.restrictedPermissions);
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
            Map<AppPermission, AppPermissionStatus> results,
            List<AppPermission> grantedPermissions,
            List<AppPermission> deniedPermissions,
            List<AppPermission> permanentlyDeniedPermissions,
            List<AppPermission> restrictedPermissions)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MultiplePermissionResult() when $default != null:
        return $default(
            _that.results,
            _that.grantedPermissions,
            _that.deniedPermissions,
            _that.permanentlyDeniedPermissions,
            _that.restrictedPermissions);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MultiplePermissionResult extends MultiplePermissionResult {
  const _MultiplePermissionResult(
      {required final Map<AppPermission, AppPermissionStatus> results,
      final List<AppPermission> grantedPermissions = const [],
      final List<AppPermission> deniedPermissions = const [],
      final List<AppPermission> permanentlyDeniedPermissions = const [],
      final List<AppPermission> restrictedPermissions = const []})
      : _results = results,
        _grantedPermissions = grantedPermissions,
        _deniedPermissions = deniedPermissions,
        _permanentlyDeniedPermissions = permanentlyDeniedPermissions,
        _restrictedPermissions = restrictedPermissions,
        super._();

  final Map<AppPermission, AppPermissionStatus> _results;
  @override
  Map<AppPermission, AppPermissionStatus> get results {
    if (_results is EqualUnmodifiableMapView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_results);
  }

  final List<AppPermission> _grantedPermissions;
  @override
  @JsonKey()
  List<AppPermission> get grantedPermissions {
    if (_grantedPermissions is EqualUnmodifiableListView)
      return _grantedPermissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_grantedPermissions);
  }

  final List<AppPermission> _deniedPermissions;
  @override
  @JsonKey()
  List<AppPermission> get deniedPermissions {
    if (_deniedPermissions is EqualUnmodifiableListView)
      return _deniedPermissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deniedPermissions);
  }

  final List<AppPermission> _permanentlyDeniedPermissions;
  @override
  @JsonKey()
  List<AppPermission> get permanentlyDeniedPermissions {
    if (_permanentlyDeniedPermissions is EqualUnmodifiableListView)
      return _permanentlyDeniedPermissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permanentlyDeniedPermissions);
  }

  final List<AppPermission> _restrictedPermissions;
  @override
  @JsonKey()
  List<AppPermission> get restrictedPermissions {
    if (_restrictedPermissions is EqualUnmodifiableListView)
      return _restrictedPermissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_restrictedPermissions);
  }

  /// Create a copy of MultiplePermissionResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MultiplePermissionResultCopyWith<_MultiplePermissionResult> get copyWith =>
      __$MultiplePermissionResultCopyWithImpl<_MultiplePermissionResult>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MultiplePermissionResult &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            const DeepCollectionEquality()
                .equals(other._grantedPermissions, _grantedPermissions) &&
            const DeepCollectionEquality()
                .equals(other._deniedPermissions, _deniedPermissions) &&
            const DeepCollectionEquality().equals(
                other._permanentlyDeniedPermissions,
                _permanentlyDeniedPermissions) &&
            const DeepCollectionEquality()
                .equals(other._restrictedPermissions, _restrictedPermissions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_results),
      const DeepCollectionEquality().hash(_grantedPermissions),
      const DeepCollectionEquality().hash(_deniedPermissions),
      const DeepCollectionEquality().hash(_permanentlyDeniedPermissions),
      const DeepCollectionEquality().hash(_restrictedPermissions));

  @override
  String toString() {
    return 'MultiplePermissionResult(results: $results, grantedPermissions: $grantedPermissions, deniedPermissions: $deniedPermissions, permanentlyDeniedPermissions: $permanentlyDeniedPermissions, restrictedPermissions: $restrictedPermissions)';
  }
}

/// @nodoc
abstract mixin class _$MultiplePermissionResultCopyWith<$Res>
    implements $MultiplePermissionResultCopyWith<$Res> {
  factory _$MultiplePermissionResultCopyWith(_MultiplePermissionResult value,
          $Res Function(_MultiplePermissionResult) _then) =
      __$MultiplePermissionResultCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Map<AppPermission, AppPermissionStatus> results,
      List<AppPermission> grantedPermissions,
      List<AppPermission> deniedPermissions,
      List<AppPermission> permanentlyDeniedPermissions,
      List<AppPermission> restrictedPermissions});
}

/// @nodoc
class __$MultiplePermissionResultCopyWithImpl<$Res>
    implements _$MultiplePermissionResultCopyWith<$Res> {
  __$MultiplePermissionResultCopyWithImpl(this._self, this._then);

  final _MultiplePermissionResult _self;
  final $Res Function(_MultiplePermissionResult) _then;

  /// Create a copy of MultiplePermissionResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? results = null,
    Object? grantedPermissions = null,
    Object? deniedPermissions = null,
    Object? permanentlyDeniedPermissions = null,
    Object? restrictedPermissions = null,
  }) {
    return _then(_MultiplePermissionResult(
      results: null == results
          ? _self._results
          : results // ignore: cast_nullable_to_non_nullable
              as Map<AppPermission, AppPermissionStatus>,
      grantedPermissions: null == grantedPermissions
          ? _self._grantedPermissions
          : grantedPermissions // ignore: cast_nullable_to_non_nullable
              as List<AppPermission>,
      deniedPermissions: null == deniedPermissions
          ? _self._deniedPermissions
          : deniedPermissions // ignore: cast_nullable_to_non_nullable
              as List<AppPermission>,
      permanentlyDeniedPermissions: null == permanentlyDeniedPermissions
          ? _self._permanentlyDeniedPermissions
          : permanentlyDeniedPermissions // ignore: cast_nullable_to_non_nullable
              as List<AppPermission>,
      restrictedPermissions: null == restrictedPermissions
          ? _self._restrictedPermissions
          : restrictedPermissions // ignore: cast_nullable_to_non_nullable
              as List<AppPermission>,
    ));
  }
}

/// @nodoc
mixin _$PermissionRequestConfig {
  AppPermission get permission;
  String get title;
  String get description;
  String get rationale;
  String get positiveButtonText;
  String get negativeButtonText;
  bool get showRationale;
  bool get openSettingsOnDenied;
  bool get showInAppSettings;

  /// Create a copy of PermissionRequestConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PermissionRequestConfigCopyWith<PermissionRequestConfig> get copyWith =>
      _$PermissionRequestConfigCopyWithImpl<PermissionRequestConfig>(
          this as PermissionRequestConfig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PermissionRequestConfig &&
            (identical(other.permission, permission) ||
                other.permission == permission) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.rationale, rationale) ||
                other.rationale == rationale) &&
            (identical(other.positiveButtonText, positiveButtonText) ||
                other.positiveButtonText == positiveButtonText) &&
            (identical(other.negativeButtonText, negativeButtonText) ||
                other.negativeButtonText == negativeButtonText) &&
            (identical(other.showRationale, showRationale) ||
                other.showRationale == showRationale) &&
            (identical(other.openSettingsOnDenied, openSettingsOnDenied) ||
                other.openSettingsOnDenied == openSettingsOnDenied) &&
            (identical(other.showInAppSettings, showInAppSettings) ||
                other.showInAppSettings == showInAppSettings));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      permission,
      title,
      description,
      rationale,
      positiveButtonText,
      negativeButtonText,
      showRationale,
      openSettingsOnDenied,
      showInAppSettings);

  @override
  String toString() {
    return 'PermissionRequestConfig(permission: $permission, title: $title, description: $description, rationale: $rationale, positiveButtonText: $positiveButtonText, negativeButtonText: $negativeButtonText, showRationale: $showRationale, openSettingsOnDenied: $openSettingsOnDenied, showInAppSettings: $showInAppSettings)';
  }
}

/// @nodoc
abstract mixin class $PermissionRequestConfigCopyWith<$Res> {
  factory $PermissionRequestConfigCopyWith(PermissionRequestConfig value,
          $Res Function(PermissionRequestConfig) _then) =
      _$PermissionRequestConfigCopyWithImpl;
  @useResult
  $Res call(
      {AppPermission permission,
      String title,
      String description,
      String rationale,
      String positiveButtonText,
      String negativeButtonText,
      bool showRationale,
      bool openSettingsOnDenied,
      bool showInAppSettings});
}

/// @nodoc
class _$PermissionRequestConfigCopyWithImpl<$Res>
    implements $PermissionRequestConfigCopyWith<$Res> {
  _$PermissionRequestConfigCopyWithImpl(this._self, this._then);

  final PermissionRequestConfig _self;
  final $Res Function(PermissionRequestConfig) _then;

  /// Create a copy of PermissionRequestConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permission = null,
    Object? title = null,
    Object? description = null,
    Object? rationale = null,
    Object? positiveButtonText = null,
    Object? negativeButtonText = null,
    Object? showRationale = null,
    Object? openSettingsOnDenied = null,
    Object? showInAppSettings = null,
  }) {
    return _then(_self.copyWith(
      permission: null == permission
          ? _self.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as AppPermission,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      rationale: null == rationale
          ? _self.rationale
          : rationale // ignore: cast_nullable_to_non_nullable
              as String,
      positiveButtonText: null == positiveButtonText
          ? _self.positiveButtonText
          : positiveButtonText // ignore: cast_nullable_to_non_nullable
              as String,
      negativeButtonText: null == negativeButtonText
          ? _self.negativeButtonText
          : negativeButtonText // ignore: cast_nullable_to_non_nullable
              as String,
      showRationale: null == showRationale
          ? _self.showRationale
          : showRationale // ignore: cast_nullable_to_non_nullable
              as bool,
      openSettingsOnDenied: null == openSettingsOnDenied
          ? _self.openSettingsOnDenied
          : openSettingsOnDenied // ignore: cast_nullable_to_non_nullable
              as bool,
      showInAppSettings: null == showInAppSettings
          ? _self.showInAppSettings
          : showInAppSettings // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [PermissionRequestConfig].
extension PermissionRequestConfigPatterns on PermissionRequestConfig {
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
    TResult Function(_PermissionRequestConfig value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PermissionRequestConfig() when $default != null:
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
    TResult Function(_PermissionRequestConfig value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PermissionRequestConfig():
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
    TResult? Function(_PermissionRequestConfig value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PermissionRequestConfig() when $default != null:
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
            AppPermission permission,
            String title,
            String description,
            String rationale,
            String positiveButtonText,
            String negativeButtonText,
            bool showRationale,
            bool openSettingsOnDenied,
            bool showInAppSettings)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PermissionRequestConfig() when $default != null:
        return $default(
            _that.permission,
            _that.title,
            _that.description,
            _that.rationale,
            _that.positiveButtonText,
            _that.negativeButtonText,
            _that.showRationale,
            _that.openSettingsOnDenied,
            _that.showInAppSettings);
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
            AppPermission permission,
            String title,
            String description,
            String rationale,
            String positiveButtonText,
            String negativeButtonText,
            bool showRationale,
            bool openSettingsOnDenied,
            bool showInAppSettings)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PermissionRequestConfig():
        return $default(
            _that.permission,
            _that.title,
            _that.description,
            _that.rationale,
            _that.positiveButtonText,
            _that.negativeButtonText,
            _that.showRationale,
            _that.openSettingsOnDenied,
            _that.showInAppSettings);
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
            AppPermission permission,
            String title,
            String description,
            String rationale,
            String positiveButtonText,
            String negativeButtonText,
            bool showRationale,
            bool openSettingsOnDenied,
            bool showInAppSettings)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PermissionRequestConfig() when $default != null:
        return $default(
            _that.permission,
            _that.title,
            _that.description,
            _that.rationale,
            _that.positiveButtonText,
            _that.negativeButtonText,
            _that.showRationale,
            _that.openSettingsOnDenied,
            _that.showInAppSettings);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PermissionRequestConfig implements PermissionRequestConfig {
  const _PermissionRequestConfig(
      {required this.permission,
      this.title = '',
      this.description = '',
      this.rationale = '',
      this.positiveButtonText = 'Grant Permission',
      this.negativeButtonText = 'Cancel',
      this.showRationale = true,
      this.openSettingsOnDenied = true,
      this.showInAppSettings = false});

  @override
  final AppPermission permission;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String rationale;
  @override
  @JsonKey()
  final String positiveButtonText;
  @override
  @JsonKey()
  final String negativeButtonText;
  @override
  @JsonKey()
  final bool showRationale;
  @override
  @JsonKey()
  final bool openSettingsOnDenied;
  @override
  @JsonKey()
  final bool showInAppSettings;

  /// Create a copy of PermissionRequestConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PermissionRequestConfigCopyWith<_PermissionRequestConfig> get copyWith =>
      __$PermissionRequestConfigCopyWithImpl<_PermissionRequestConfig>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PermissionRequestConfig &&
            (identical(other.permission, permission) ||
                other.permission == permission) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.rationale, rationale) ||
                other.rationale == rationale) &&
            (identical(other.positiveButtonText, positiveButtonText) ||
                other.positiveButtonText == positiveButtonText) &&
            (identical(other.negativeButtonText, negativeButtonText) ||
                other.negativeButtonText == negativeButtonText) &&
            (identical(other.showRationale, showRationale) ||
                other.showRationale == showRationale) &&
            (identical(other.openSettingsOnDenied, openSettingsOnDenied) ||
                other.openSettingsOnDenied == openSettingsOnDenied) &&
            (identical(other.showInAppSettings, showInAppSettings) ||
                other.showInAppSettings == showInAppSettings));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      permission,
      title,
      description,
      rationale,
      positiveButtonText,
      negativeButtonText,
      showRationale,
      openSettingsOnDenied,
      showInAppSettings);

  @override
  String toString() {
    return 'PermissionRequestConfig(permission: $permission, title: $title, description: $description, rationale: $rationale, positiveButtonText: $positiveButtonText, negativeButtonText: $negativeButtonText, showRationale: $showRationale, openSettingsOnDenied: $openSettingsOnDenied, showInAppSettings: $showInAppSettings)';
  }
}

/// @nodoc
abstract mixin class _$PermissionRequestConfigCopyWith<$Res>
    implements $PermissionRequestConfigCopyWith<$Res> {
  factory _$PermissionRequestConfigCopyWith(_PermissionRequestConfig value,
          $Res Function(_PermissionRequestConfig) _then) =
      __$PermissionRequestConfigCopyWithImpl;
  @override
  @useResult
  $Res call(
      {AppPermission permission,
      String title,
      String description,
      String rationale,
      String positiveButtonText,
      String negativeButtonText,
      bool showRationale,
      bool openSettingsOnDenied,
      bool showInAppSettings});
}

/// @nodoc
class __$PermissionRequestConfigCopyWithImpl<$Res>
    implements _$PermissionRequestConfigCopyWith<$Res> {
  __$PermissionRequestConfigCopyWithImpl(this._self, this._then);

  final _PermissionRequestConfig _self;
  final $Res Function(_PermissionRequestConfig) _then;

  /// Create a copy of PermissionRequestConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? permission = null,
    Object? title = null,
    Object? description = null,
    Object? rationale = null,
    Object? positiveButtonText = null,
    Object? negativeButtonText = null,
    Object? showRationale = null,
    Object? openSettingsOnDenied = null,
    Object? showInAppSettings = null,
  }) {
    return _then(_PermissionRequestConfig(
      permission: null == permission
          ? _self.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as AppPermission,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      rationale: null == rationale
          ? _self.rationale
          : rationale // ignore: cast_nullable_to_non_nullable
              as String,
      positiveButtonText: null == positiveButtonText
          ? _self.positiveButtonText
          : positiveButtonText // ignore: cast_nullable_to_non_nullable
              as String,
      negativeButtonText: null == negativeButtonText
          ? _self.negativeButtonText
          : negativeButtonText // ignore: cast_nullable_to_non_nullable
              as String,
      showRationale: null == showRationale
          ? _self.showRationale
          : showRationale // ignore: cast_nullable_to_non_nullable
              as bool,
      openSettingsOnDenied: null == openSettingsOnDenied
          ? _self.openSettingsOnDenied
          : openSettingsOnDenied // ignore: cast_nullable_to_non_nullable
              as bool,
      showInAppSettings: null == showInAppSettings
          ? _self.showInAppSettings
          : showInAppSettings // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$BatchPermissionRequestConfig {
  List<AppPermission> get permissions;
  String get title;
  String get description;
  String get positiveButtonText;
  String get negativeButtonText;
  bool get showRationale;
  bool get openSettingsOnDenied;
  bool get continueOnPartialGrant;

  /// Create a copy of BatchPermissionRequestConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BatchPermissionRequestConfigCopyWith<BatchPermissionRequestConfig>
      get copyWith => _$BatchPermissionRequestConfigCopyWithImpl<
              BatchPermissionRequestConfig>(
          this as BatchPermissionRequestConfig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BatchPermissionRequestConfig &&
            const DeepCollectionEquality()
                .equals(other.permissions, permissions) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.positiveButtonText, positiveButtonText) ||
                other.positiveButtonText == positiveButtonText) &&
            (identical(other.negativeButtonText, negativeButtonText) ||
                other.negativeButtonText == negativeButtonText) &&
            (identical(other.showRationale, showRationale) ||
                other.showRationale == showRationale) &&
            (identical(other.openSettingsOnDenied, openSettingsOnDenied) ||
                other.openSettingsOnDenied == openSettingsOnDenied) &&
            (identical(other.continueOnPartialGrant, continueOnPartialGrant) ||
                other.continueOnPartialGrant == continueOnPartialGrant));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(permissions),
      title,
      description,
      positiveButtonText,
      negativeButtonText,
      showRationale,
      openSettingsOnDenied,
      continueOnPartialGrant);

  @override
  String toString() {
    return 'BatchPermissionRequestConfig(permissions: $permissions, title: $title, description: $description, positiveButtonText: $positiveButtonText, negativeButtonText: $negativeButtonText, showRationale: $showRationale, openSettingsOnDenied: $openSettingsOnDenied, continueOnPartialGrant: $continueOnPartialGrant)';
  }
}

/// @nodoc
abstract mixin class $BatchPermissionRequestConfigCopyWith<$Res> {
  factory $BatchPermissionRequestConfigCopyWith(
          BatchPermissionRequestConfig value,
          $Res Function(BatchPermissionRequestConfig) _then) =
      _$BatchPermissionRequestConfigCopyWithImpl;
  @useResult
  $Res call(
      {List<AppPermission> permissions,
      String title,
      String description,
      String positiveButtonText,
      String negativeButtonText,
      bool showRationale,
      bool openSettingsOnDenied,
      bool continueOnPartialGrant});
}

/// @nodoc
class _$BatchPermissionRequestConfigCopyWithImpl<$Res>
    implements $BatchPermissionRequestConfigCopyWith<$Res> {
  _$BatchPermissionRequestConfigCopyWithImpl(this._self, this._then);

  final BatchPermissionRequestConfig _self;
  final $Res Function(BatchPermissionRequestConfig) _then;

  /// Create a copy of BatchPermissionRequestConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permissions = null,
    Object? title = null,
    Object? description = null,
    Object? positiveButtonText = null,
    Object? negativeButtonText = null,
    Object? showRationale = null,
    Object? openSettingsOnDenied = null,
    Object? continueOnPartialGrant = null,
  }) {
    return _then(_self.copyWith(
      permissions: null == permissions
          ? _self.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<AppPermission>,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      positiveButtonText: null == positiveButtonText
          ? _self.positiveButtonText
          : positiveButtonText // ignore: cast_nullable_to_non_nullable
              as String,
      negativeButtonText: null == negativeButtonText
          ? _self.negativeButtonText
          : negativeButtonText // ignore: cast_nullable_to_non_nullable
              as String,
      showRationale: null == showRationale
          ? _self.showRationale
          : showRationale // ignore: cast_nullable_to_non_nullable
              as bool,
      openSettingsOnDenied: null == openSettingsOnDenied
          ? _self.openSettingsOnDenied
          : openSettingsOnDenied // ignore: cast_nullable_to_non_nullable
              as bool,
      continueOnPartialGrant: null == continueOnPartialGrant
          ? _self.continueOnPartialGrant
          : continueOnPartialGrant // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [BatchPermissionRequestConfig].
extension BatchPermissionRequestConfigPatterns on BatchPermissionRequestConfig {
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
    TResult Function(_BatchPermissionRequestConfig value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BatchPermissionRequestConfig() when $default != null:
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
    TResult Function(_BatchPermissionRequestConfig value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BatchPermissionRequestConfig():
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
    TResult? Function(_BatchPermissionRequestConfig value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BatchPermissionRequestConfig() when $default != null:
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
            List<AppPermission> permissions,
            String title,
            String description,
            String positiveButtonText,
            String negativeButtonText,
            bool showRationale,
            bool openSettingsOnDenied,
            bool continueOnPartialGrant)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BatchPermissionRequestConfig() when $default != null:
        return $default(
            _that.permissions,
            _that.title,
            _that.description,
            _that.positiveButtonText,
            _that.negativeButtonText,
            _that.showRationale,
            _that.openSettingsOnDenied,
            _that.continueOnPartialGrant);
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
            List<AppPermission> permissions,
            String title,
            String description,
            String positiveButtonText,
            String negativeButtonText,
            bool showRationale,
            bool openSettingsOnDenied,
            bool continueOnPartialGrant)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BatchPermissionRequestConfig():
        return $default(
            _that.permissions,
            _that.title,
            _that.description,
            _that.positiveButtonText,
            _that.negativeButtonText,
            _that.showRationale,
            _that.openSettingsOnDenied,
            _that.continueOnPartialGrant);
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
            List<AppPermission> permissions,
            String title,
            String description,
            String positiveButtonText,
            String negativeButtonText,
            bool showRationale,
            bool openSettingsOnDenied,
            bool continueOnPartialGrant)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BatchPermissionRequestConfig() when $default != null:
        return $default(
            _that.permissions,
            _that.title,
            _that.description,
            _that.positiveButtonText,
            _that.negativeButtonText,
            _that.showRationale,
            _that.openSettingsOnDenied,
            _that.continueOnPartialGrant);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _BatchPermissionRequestConfig implements BatchPermissionRequestConfig {
  const _BatchPermissionRequestConfig(
      {required final List<AppPermission> permissions,
      this.title = 'Permissions Required',
      this.description =
          'This app needs the following permissions to function properly',
      this.positiveButtonText = 'Grant Permissions',
      this.negativeButtonText = 'Cancel',
      this.showRationale = true,
      this.openSettingsOnDenied = true,
      this.continueOnPartialGrant = false})
      : _permissions = permissions;

  final List<AppPermission> _permissions;
  @override
  List<AppPermission> get permissions {
    if (_permissions is EqualUnmodifiableListView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permissions);
  }

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String positiveButtonText;
  @override
  @JsonKey()
  final String negativeButtonText;
  @override
  @JsonKey()
  final bool showRationale;
  @override
  @JsonKey()
  final bool openSettingsOnDenied;
  @override
  @JsonKey()
  final bool continueOnPartialGrant;

  /// Create a copy of BatchPermissionRequestConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BatchPermissionRequestConfigCopyWith<_BatchPermissionRequestConfig>
      get copyWith => __$BatchPermissionRequestConfigCopyWithImpl<
          _BatchPermissionRequestConfig>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BatchPermissionRequestConfig &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.positiveButtonText, positiveButtonText) ||
                other.positiveButtonText == positiveButtonText) &&
            (identical(other.negativeButtonText, negativeButtonText) ||
                other.negativeButtonText == negativeButtonText) &&
            (identical(other.showRationale, showRationale) ||
                other.showRationale == showRationale) &&
            (identical(other.openSettingsOnDenied, openSettingsOnDenied) ||
                other.openSettingsOnDenied == openSettingsOnDenied) &&
            (identical(other.continueOnPartialGrant, continueOnPartialGrant) ||
                other.continueOnPartialGrant == continueOnPartialGrant));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_permissions),
      title,
      description,
      positiveButtonText,
      negativeButtonText,
      showRationale,
      openSettingsOnDenied,
      continueOnPartialGrant);

  @override
  String toString() {
    return 'BatchPermissionRequestConfig(permissions: $permissions, title: $title, description: $description, positiveButtonText: $positiveButtonText, negativeButtonText: $negativeButtonText, showRationale: $showRationale, openSettingsOnDenied: $openSettingsOnDenied, continueOnPartialGrant: $continueOnPartialGrant)';
  }
}

/// @nodoc
abstract mixin class _$BatchPermissionRequestConfigCopyWith<$Res>
    implements $BatchPermissionRequestConfigCopyWith<$Res> {
  factory _$BatchPermissionRequestConfigCopyWith(
          _BatchPermissionRequestConfig value,
          $Res Function(_BatchPermissionRequestConfig) _then) =
      __$BatchPermissionRequestConfigCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<AppPermission> permissions,
      String title,
      String description,
      String positiveButtonText,
      String negativeButtonText,
      bool showRationale,
      bool openSettingsOnDenied,
      bool continueOnPartialGrant});
}

/// @nodoc
class __$BatchPermissionRequestConfigCopyWithImpl<$Res>
    implements _$BatchPermissionRequestConfigCopyWith<$Res> {
  __$BatchPermissionRequestConfigCopyWithImpl(this._self, this._then);

  final _BatchPermissionRequestConfig _self;
  final $Res Function(_BatchPermissionRequestConfig) _then;

  /// Create a copy of BatchPermissionRequestConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? permissions = null,
    Object? title = null,
    Object? description = null,
    Object? positiveButtonText = null,
    Object? negativeButtonText = null,
    Object? showRationale = null,
    Object? openSettingsOnDenied = null,
    Object? continueOnPartialGrant = null,
  }) {
    return _then(_BatchPermissionRequestConfig(
      permissions: null == permissions
          ? _self._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<AppPermission>,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      positiveButtonText: null == positiveButtonText
          ? _self.positiveButtonText
          : positiveButtonText // ignore: cast_nullable_to_non_nullable
              as String,
      negativeButtonText: null == negativeButtonText
          ? _self.negativeButtonText
          : negativeButtonText // ignore: cast_nullable_to_non_nullable
              as String,
      showRationale: null == showRationale
          ? _self.showRationale
          : showRationale // ignore: cast_nullable_to_non_nullable
              as bool,
      openSettingsOnDenied: null == openSettingsOnDenied
          ? _self.openSettingsOnDenied
          : openSettingsOnDenied // ignore: cast_nullable_to_non_nullable
              as bool,
      continueOnPartialGrant: null == continueOnPartialGrant
          ? _self.continueOnPartialGrant
          : continueOnPartialGrant // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
