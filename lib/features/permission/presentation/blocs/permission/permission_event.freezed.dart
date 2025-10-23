// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PermissionEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PermissionEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PermissionEvent()';
  }
}

/// @nodoc
class $PermissionEventCopyWith<$Res> {
  $PermissionEventCopyWith(
      PermissionEvent _, $Res Function(PermissionEvent) __);
}

/// Adds pattern-matching-related methods to [PermissionEvent].
extension PermissionEventPatterns on PermissionEvent {
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
    TResult Function(_CheckPermission value)? checkPermission,
    TResult Function(_CheckMultiplePermissions value)? checkMultiplePermissions,
    TResult Function(_RequestPermission value)? requestPermission,
    TResult Function(_RequestMultiplePermissions value)?
        requestMultiplePermissions,
    TResult Function(_RequestPermissionWithConfig value)?
        requestPermissionWithConfig,
    TResult Function(_RequestBatchPermissions value)? requestBatchPermissions,
    TResult Function(_OpenAppSettings value)? openAppSettings,
    TResult Function(_CheckServiceStatus value)? checkServiceStatus,
    TResult Function(_RequestServiceEnable value)? requestServiceEnable,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CheckPermission() when checkPermission != null:
        return checkPermission(_that);
      case _CheckMultiplePermissions() when checkMultiplePermissions != null:
        return checkMultiplePermissions(_that);
      case _RequestPermission() when requestPermission != null:
        return requestPermission(_that);
      case _RequestMultiplePermissions()
          when requestMultiplePermissions != null:
        return requestMultiplePermissions(_that);
      case _RequestPermissionWithConfig()
          when requestPermissionWithConfig != null:
        return requestPermissionWithConfig(_that);
      case _RequestBatchPermissions() when requestBatchPermissions != null:
        return requestBatchPermissions(_that);
      case _OpenAppSettings() when openAppSettings != null:
        return openAppSettings(_that);
      case _CheckServiceStatus() when checkServiceStatus != null:
        return checkServiceStatus(_that);
      case _RequestServiceEnable() when requestServiceEnable != null:
        return requestServiceEnable(_that);
      case _Reset() when reset != null:
        return reset(_that);
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
    required TResult Function(_CheckPermission value) checkPermission,
    required TResult Function(_CheckMultiplePermissions value)
        checkMultiplePermissions,
    required TResult Function(_RequestPermission value) requestPermission,
    required TResult Function(_RequestMultiplePermissions value)
        requestMultiplePermissions,
    required TResult Function(_RequestPermissionWithConfig value)
        requestPermissionWithConfig,
    required TResult Function(_RequestBatchPermissions value)
        requestBatchPermissions,
    required TResult Function(_OpenAppSettings value) openAppSettings,
    required TResult Function(_CheckServiceStatus value) checkServiceStatus,
    required TResult Function(_RequestServiceEnable value) requestServiceEnable,
    required TResult Function(_Reset value) reset,
  }) {
    final _that = this;
    switch (_that) {
      case _CheckPermission():
        return checkPermission(_that);
      case _CheckMultiplePermissions():
        return checkMultiplePermissions(_that);
      case _RequestPermission():
        return requestPermission(_that);
      case _RequestMultiplePermissions():
        return requestMultiplePermissions(_that);
      case _RequestPermissionWithConfig():
        return requestPermissionWithConfig(_that);
      case _RequestBatchPermissions():
        return requestBatchPermissions(_that);
      case _OpenAppSettings():
        return openAppSettings(_that);
      case _CheckServiceStatus():
        return checkServiceStatus(_that);
      case _RequestServiceEnable():
        return requestServiceEnable(_that);
      case _Reset():
        return reset(_that);
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
    TResult? Function(_CheckPermission value)? checkPermission,
    TResult? Function(_CheckMultiplePermissions value)?
        checkMultiplePermissions,
    TResult? Function(_RequestPermission value)? requestPermission,
    TResult? Function(_RequestMultiplePermissions value)?
        requestMultiplePermissions,
    TResult? Function(_RequestPermissionWithConfig value)?
        requestPermissionWithConfig,
    TResult? Function(_RequestBatchPermissions value)? requestBatchPermissions,
    TResult? Function(_OpenAppSettings value)? openAppSettings,
    TResult? Function(_CheckServiceStatus value)? checkServiceStatus,
    TResult? Function(_RequestServiceEnable value)? requestServiceEnable,
    TResult? Function(_Reset value)? reset,
  }) {
    final _that = this;
    switch (_that) {
      case _CheckPermission() when checkPermission != null:
        return checkPermission(_that);
      case _CheckMultiplePermissions() when checkMultiplePermissions != null:
        return checkMultiplePermissions(_that);
      case _RequestPermission() when requestPermission != null:
        return requestPermission(_that);
      case _RequestMultiplePermissions()
          when requestMultiplePermissions != null:
        return requestMultiplePermissions(_that);
      case _RequestPermissionWithConfig()
          when requestPermissionWithConfig != null:
        return requestPermissionWithConfig(_that);
      case _RequestBatchPermissions() when requestBatchPermissions != null:
        return requestBatchPermissions(_that);
      case _OpenAppSettings() when openAppSettings != null:
        return openAppSettings(_that);
      case _CheckServiceStatus() when checkServiceStatus != null:
        return checkServiceStatus(_that);
      case _RequestServiceEnable() when requestServiceEnable != null:
        return requestServiceEnable(_that);
      case _Reset() when reset != null:
        return reset(_that);
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
    TResult Function(AppPermission permission)? checkPermission,
    TResult Function(List<AppPermission> permissions)? checkMultiplePermissions,
    TResult Function(AppPermission permission)? requestPermission,
    TResult Function(List<AppPermission> permissions)?
        requestMultiplePermissions,
    TResult Function(AppPermission permission, PermissionRequestConfig config)?
        requestPermissionWithConfig,
    TResult Function(BatchPermissionRequestConfig config)?
        requestBatchPermissions,
    TResult Function()? openAppSettings,
    TResult Function(AppPermission permission)? checkServiceStatus,
    TResult Function(AppPermission permission)? requestServiceEnable,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CheckPermission() when checkPermission != null:
        return checkPermission(_that.permission);
      case _CheckMultiplePermissions() when checkMultiplePermissions != null:
        return checkMultiplePermissions(_that.permissions);
      case _RequestPermission() when requestPermission != null:
        return requestPermission(_that.permission);
      case _RequestMultiplePermissions()
          when requestMultiplePermissions != null:
        return requestMultiplePermissions(_that.permissions);
      case _RequestPermissionWithConfig()
          when requestPermissionWithConfig != null:
        return requestPermissionWithConfig(_that.permission, _that.config);
      case _RequestBatchPermissions() when requestBatchPermissions != null:
        return requestBatchPermissions(_that.config);
      case _OpenAppSettings() when openAppSettings != null:
        return openAppSettings();
      case _CheckServiceStatus() when checkServiceStatus != null:
        return checkServiceStatus(_that.permission);
      case _RequestServiceEnable() when requestServiceEnable != null:
        return requestServiceEnable(_that.permission);
      case _Reset() when reset != null:
        return reset();
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
    required TResult Function(AppPermission permission) checkPermission,
    required TResult Function(List<AppPermission> permissions)
        checkMultiplePermissions,
    required TResult Function(AppPermission permission) requestPermission,
    required TResult Function(List<AppPermission> permissions)
        requestMultiplePermissions,
    required TResult Function(
            AppPermission permission, PermissionRequestConfig config)
        requestPermissionWithConfig,
    required TResult Function(BatchPermissionRequestConfig config)
        requestBatchPermissions,
    required TResult Function() openAppSettings,
    required TResult Function(AppPermission permission) checkServiceStatus,
    required TResult Function(AppPermission permission) requestServiceEnable,
    required TResult Function() reset,
  }) {
    final _that = this;
    switch (_that) {
      case _CheckPermission():
        return checkPermission(_that.permission);
      case _CheckMultiplePermissions():
        return checkMultiplePermissions(_that.permissions);
      case _RequestPermission():
        return requestPermission(_that.permission);
      case _RequestMultiplePermissions():
        return requestMultiplePermissions(_that.permissions);
      case _RequestPermissionWithConfig():
        return requestPermissionWithConfig(_that.permission, _that.config);
      case _RequestBatchPermissions():
        return requestBatchPermissions(_that.config);
      case _OpenAppSettings():
        return openAppSettings();
      case _CheckServiceStatus():
        return checkServiceStatus(_that.permission);
      case _RequestServiceEnable():
        return requestServiceEnable(_that.permission);
      case _Reset():
        return reset();
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
    TResult? Function(AppPermission permission)? checkPermission,
    TResult? Function(List<AppPermission> permissions)?
        checkMultiplePermissions,
    TResult? Function(AppPermission permission)? requestPermission,
    TResult? Function(List<AppPermission> permissions)?
        requestMultiplePermissions,
    TResult? Function(AppPermission permission, PermissionRequestConfig config)?
        requestPermissionWithConfig,
    TResult? Function(BatchPermissionRequestConfig config)?
        requestBatchPermissions,
    TResult? Function()? openAppSettings,
    TResult? Function(AppPermission permission)? checkServiceStatus,
    TResult? Function(AppPermission permission)? requestServiceEnable,
    TResult? Function()? reset,
  }) {
    final _that = this;
    switch (_that) {
      case _CheckPermission() when checkPermission != null:
        return checkPermission(_that.permission);
      case _CheckMultiplePermissions() when checkMultiplePermissions != null:
        return checkMultiplePermissions(_that.permissions);
      case _RequestPermission() when requestPermission != null:
        return requestPermission(_that.permission);
      case _RequestMultiplePermissions()
          when requestMultiplePermissions != null:
        return requestMultiplePermissions(_that.permissions);
      case _RequestPermissionWithConfig()
          when requestPermissionWithConfig != null:
        return requestPermissionWithConfig(_that.permission, _that.config);
      case _RequestBatchPermissions() when requestBatchPermissions != null:
        return requestBatchPermissions(_that.config);
      case _OpenAppSettings() when openAppSettings != null:
        return openAppSettings();
      case _CheckServiceStatus() when checkServiceStatus != null:
        return checkServiceStatus(_that.permission);
      case _RequestServiceEnable() when requestServiceEnable != null:
        return requestServiceEnable(_that.permission);
      case _Reset() when reset != null:
        return reset();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CheckPermission implements PermissionEvent {
  const _CheckPermission(this.permission);

  final AppPermission permission;

  /// Create a copy of PermissionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CheckPermissionCopyWith<_CheckPermission> get copyWith =>
      __$CheckPermissionCopyWithImpl<_CheckPermission>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CheckPermission &&
            (identical(other.permission, permission) ||
                other.permission == permission));
  }

  @override
  int get hashCode => Object.hash(runtimeType, permission);

  @override
  String toString() {
    return 'PermissionEvent.checkPermission(permission: $permission)';
  }
}

/// @nodoc
abstract mixin class _$CheckPermissionCopyWith<$Res>
    implements $PermissionEventCopyWith<$Res> {
  factory _$CheckPermissionCopyWith(
          _CheckPermission value, $Res Function(_CheckPermission) _then) =
      __$CheckPermissionCopyWithImpl;
  @useResult
  $Res call({AppPermission permission});
}

/// @nodoc
class __$CheckPermissionCopyWithImpl<$Res>
    implements _$CheckPermissionCopyWith<$Res> {
  __$CheckPermissionCopyWithImpl(this._self, this._then);

  final _CheckPermission _self;
  final $Res Function(_CheckPermission) _then;

  /// Create a copy of PermissionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? permission = null,
  }) {
    return _then(_CheckPermission(
      null == permission
          ? _self.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as AppPermission,
    ));
  }
}

/// @nodoc

class _CheckMultiplePermissions implements PermissionEvent {
  const _CheckMultiplePermissions(final List<AppPermission> permissions)
      : _permissions = permissions;

  final List<AppPermission> _permissions;
  List<AppPermission> get permissions {
    if (_permissions is EqualUnmodifiableListView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permissions);
  }

  /// Create a copy of PermissionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CheckMultiplePermissionsCopyWith<_CheckMultiplePermissions> get copyWith =>
      __$CheckMultiplePermissionsCopyWithImpl<_CheckMultiplePermissions>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CheckMultiplePermissions &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_permissions));

  @override
  String toString() {
    return 'PermissionEvent.checkMultiplePermissions(permissions: $permissions)';
  }
}

/// @nodoc
abstract mixin class _$CheckMultiplePermissionsCopyWith<$Res>
    implements $PermissionEventCopyWith<$Res> {
  factory _$CheckMultiplePermissionsCopyWith(_CheckMultiplePermissions value,
          $Res Function(_CheckMultiplePermissions) _then) =
      __$CheckMultiplePermissionsCopyWithImpl;
  @useResult
  $Res call({List<AppPermission> permissions});
}

/// @nodoc
class __$CheckMultiplePermissionsCopyWithImpl<$Res>
    implements _$CheckMultiplePermissionsCopyWith<$Res> {
  __$CheckMultiplePermissionsCopyWithImpl(this._self, this._then);

  final _CheckMultiplePermissions _self;
  final $Res Function(_CheckMultiplePermissions) _then;

  /// Create a copy of PermissionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? permissions = null,
  }) {
    return _then(_CheckMultiplePermissions(
      null == permissions
          ? _self._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<AppPermission>,
    ));
  }
}

/// @nodoc

class _RequestPermission implements PermissionEvent {
  const _RequestPermission(this.permission);

  final AppPermission permission;

  /// Create a copy of PermissionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RequestPermissionCopyWith<_RequestPermission> get copyWith =>
      __$RequestPermissionCopyWithImpl<_RequestPermission>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RequestPermission &&
            (identical(other.permission, permission) ||
                other.permission == permission));
  }

  @override
  int get hashCode => Object.hash(runtimeType, permission);

  @override
  String toString() {
    return 'PermissionEvent.requestPermission(permission: $permission)';
  }
}

/// @nodoc
abstract mixin class _$RequestPermissionCopyWith<$Res>
    implements $PermissionEventCopyWith<$Res> {
  factory _$RequestPermissionCopyWith(
          _RequestPermission value, $Res Function(_RequestPermission) _then) =
      __$RequestPermissionCopyWithImpl;
  @useResult
  $Res call({AppPermission permission});
}

/// @nodoc
class __$RequestPermissionCopyWithImpl<$Res>
    implements _$RequestPermissionCopyWith<$Res> {
  __$RequestPermissionCopyWithImpl(this._self, this._then);

  final _RequestPermission _self;
  final $Res Function(_RequestPermission) _then;

  /// Create a copy of PermissionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? permission = null,
  }) {
    return _then(_RequestPermission(
      null == permission
          ? _self.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as AppPermission,
    ));
  }
}

/// @nodoc

class _RequestMultiplePermissions implements PermissionEvent {
  const _RequestMultiplePermissions(final List<AppPermission> permissions)
      : _permissions = permissions;

  final List<AppPermission> _permissions;
  List<AppPermission> get permissions {
    if (_permissions is EqualUnmodifiableListView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permissions);
  }

  /// Create a copy of PermissionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RequestMultiplePermissionsCopyWith<_RequestMultiplePermissions>
      get copyWith => __$RequestMultiplePermissionsCopyWithImpl<
          _RequestMultiplePermissions>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RequestMultiplePermissions &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_permissions));

  @override
  String toString() {
    return 'PermissionEvent.requestMultiplePermissions(permissions: $permissions)';
  }
}

/// @nodoc
abstract mixin class _$RequestMultiplePermissionsCopyWith<$Res>
    implements $PermissionEventCopyWith<$Res> {
  factory _$RequestMultiplePermissionsCopyWith(
          _RequestMultiplePermissions value,
          $Res Function(_RequestMultiplePermissions) _then) =
      __$RequestMultiplePermissionsCopyWithImpl;
  @useResult
  $Res call({List<AppPermission> permissions});
}

/// @nodoc
class __$RequestMultiplePermissionsCopyWithImpl<$Res>
    implements _$RequestMultiplePermissionsCopyWith<$Res> {
  __$RequestMultiplePermissionsCopyWithImpl(this._self, this._then);

  final _RequestMultiplePermissions _self;
  final $Res Function(_RequestMultiplePermissions) _then;

  /// Create a copy of PermissionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? permissions = null,
  }) {
    return _then(_RequestMultiplePermissions(
      null == permissions
          ? _self._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<AppPermission>,
    ));
  }
}

/// @nodoc

class _RequestPermissionWithConfig implements PermissionEvent {
  const _RequestPermissionWithConfig(
      {required this.permission, required this.config});

  final AppPermission permission;
  final PermissionRequestConfig config;

  /// Create a copy of PermissionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RequestPermissionWithConfigCopyWith<_RequestPermissionWithConfig>
      get copyWith => __$RequestPermissionWithConfigCopyWithImpl<
          _RequestPermissionWithConfig>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RequestPermissionWithConfig &&
            (identical(other.permission, permission) ||
                other.permission == permission) &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, permission, config);

  @override
  String toString() {
    return 'PermissionEvent.requestPermissionWithConfig(permission: $permission, config: $config)';
  }
}

/// @nodoc
abstract mixin class _$RequestPermissionWithConfigCopyWith<$Res>
    implements $PermissionEventCopyWith<$Res> {
  factory _$RequestPermissionWithConfigCopyWith(
          _RequestPermissionWithConfig value,
          $Res Function(_RequestPermissionWithConfig) _then) =
      __$RequestPermissionWithConfigCopyWithImpl;
  @useResult
  $Res call({AppPermission permission, PermissionRequestConfig config});

  $PermissionRequestConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$RequestPermissionWithConfigCopyWithImpl<$Res>
    implements _$RequestPermissionWithConfigCopyWith<$Res> {
  __$RequestPermissionWithConfigCopyWithImpl(this._self, this._then);

  final _RequestPermissionWithConfig _self;
  final $Res Function(_RequestPermissionWithConfig) _then;

  /// Create a copy of PermissionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? permission = null,
    Object? config = null,
  }) {
    return _then(_RequestPermissionWithConfig(
      permission: null == permission
          ? _self.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as AppPermission,
      config: null == config
          ? _self.config
          : config // ignore: cast_nullable_to_non_nullable
              as PermissionRequestConfig,
    ));
  }

  /// Create a copy of PermissionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PermissionRequestConfigCopyWith<$Res> get config {
    return $PermissionRequestConfigCopyWith<$Res>(_self.config, (value) {
      return _then(_self.copyWith(config: value));
    });
  }
}

/// @nodoc

class _RequestBatchPermissions implements PermissionEvent {
  const _RequestBatchPermissions({required this.config});

  final BatchPermissionRequestConfig config;

  /// Create a copy of PermissionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RequestBatchPermissionsCopyWith<_RequestBatchPermissions> get copyWith =>
      __$RequestBatchPermissionsCopyWithImpl<_RequestBatchPermissions>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RequestBatchPermissions &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @override
  String toString() {
    return 'PermissionEvent.requestBatchPermissions(config: $config)';
  }
}

/// @nodoc
abstract mixin class _$RequestBatchPermissionsCopyWith<$Res>
    implements $PermissionEventCopyWith<$Res> {
  factory _$RequestBatchPermissionsCopyWith(_RequestBatchPermissions value,
          $Res Function(_RequestBatchPermissions) _then) =
      __$RequestBatchPermissionsCopyWithImpl;
  @useResult
  $Res call({BatchPermissionRequestConfig config});

  $BatchPermissionRequestConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$RequestBatchPermissionsCopyWithImpl<$Res>
    implements _$RequestBatchPermissionsCopyWith<$Res> {
  __$RequestBatchPermissionsCopyWithImpl(this._self, this._then);

  final _RequestBatchPermissions _self;
  final $Res Function(_RequestBatchPermissions) _then;

  /// Create a copy of PermissionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? config = null,
  }) {
    return _then(_RequestBatchPermissions(
      config: null == config
          ? _self.config
          : config // ignore: cast_nullable_to_non_nullable
              as BatchPermissionRequestConfig,
    ));
  }

  /// Create a copy of PermissionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BatchPermissionRequestConfigCopyWith<$Res> get config {
    return $BatchPermissionRequestConfigCopyWith<$Res>(_self.config, (value) {
      return _then(_self.copyWith(config: value));
    });
  }
}

/// @nodoc

class _OpenAppSettings implements PermissionEvent {
  const _OpenAppSettings();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _OpenAppSettings);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PermissionEvent.openAppSettings()';
  }
}

/// @nodoc

class _CheckServiceStatus implements PermissionEvent {
  const _CheckServiceStatus(this.permission);

  final AppPermission permission;

  /// Create a copy of PermissionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CheckServiceStatusCopyWith<_CheckServiceStatus> get copyWith =>
      __$CheckServiceStatusCopyWithImpl<_CheckServiceStatus>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CheckServiceStatus &&
            (identical(other.permission, permission) ||
                other.permission == permission));
  }

  @override
  int get hashCode => Object.hash(runtimeType, permission);

  @override
  String toString() {
    return 'PermissionEvent.checkServiceStatus(permission: $permission)';
  }
}

/// @nodoc
abstract mixin class _$CheckServiceStatusCopyWith<$Res>
    implements $PermissionEventCopyWith<$Res> {
  factory _$CheckServiceStatusCopyWith(
          _CheckServiceStatus value, $Res Function(_CheckServiceStatus) _then) =
      __$CheckServiceStatusCopyWithImpl;
  @useResult
  $Res call({AppPermission permission});
}

/// @nodoc
class __$CheckServiceStatusCopyWithImpl<$Res>
    implements _$CheckServiceStatusCopyWith<$Res> {
  __$CheckServiceStatusCopyWithImpl(this._self, this._then);

  final _CheckServiceStatus _self;
  final $Res Function(_CheckServiceStatus) _then;

  /// Create a copy of PermissionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? permission = null,
  }) {
    return _then(_CheckServiceStatus(
      null == permission
          ? _self.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as AppPermission,
    ));
  }
}

/// @nodoc

class _RequestServiceEnable implements PermissionEvent {
  const _RequestServiceEnable(this.permission);

  final AppPermission permission;

  /// Create a copy of PermissionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RequestServiceEnableCopyWith<_RequestServiceEnable> get copyWith =>
      __$RequestServiceEnableCopyWithImpl<_RequestServiceEnable>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RequestServiceEnable &&
            (identical(other.permission, permission) ||
                other.permission == permission));
  }

  @override
  int get hashCode => Object.hash(runtimeType, permission);

  @override
  String toString() {
    return 'PermissionEvent.requestServiceEnable(permission: $permission)';
  }
}

/// @nodoc
abstract mixin class _$RequestServiceEnableCopyWith<$Res>
    implements $PermissionEventCopyWith<$Res> {
  factory _$RequestServiceEnableCopyWith(_RequestServiceEnable value,
          $Res Function(_RequestServiceEnable) _then) =
      __$RequestServiceEnableCopyWithImpl;
  @useResult
  $Res call({AppPermission permission});
}

/// @nodoc
class __$RequestServiceEnableCopyWithImpl<$Res>
    implements _$RequestServiceEnableCopyWith<$Res> {
  __$RequestServiceEnableCopyWithImpl(this._self, this._then);

  final _RequestServiceEnable _self;
  final $Res Function(_RequestServiceEnable) _then;

  /// Create a copy of PermissionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? permission = null,
  }) {
    return _then(_RequestServiceEnable(
      null == permission
          ? _self.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as AppPermission,
    ));
  }
}

/// @nodoc

class _Reset implements PermissionEvent {
  const _Reset();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Reset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PermissionEvent.reset()';
  }
}

// dart format on
