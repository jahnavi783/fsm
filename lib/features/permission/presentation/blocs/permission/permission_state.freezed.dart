// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PermissionState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PermissionState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PermissionState()';
  }
}

/// @nodoc
class $PermissionStateCopyWith<$Res> {
  $PermissionStateCopyWith(
      PermissionState _, $Res Function(PermissionState) __);
}

/// Adds pattern-matching-related methods to [PermissionState].
extension PermissionStatePatterns on PermissionState {
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
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PermissionChecked value)? permissionChecked,
    TResult Function(_MultiplePermissionsChecked value)?
        multiplePermissionsChecked,
    TResult Function(_PermissionRequested value)? permissionRequested,
    TResult Function(_MultiplePermissionsRequested value)?
        multiplePermissionsRequested,
    TResult Function(_ServiceStatusChecked value)? serviceStatusChecked,
    TResult Function(_SettingsOpened value)? settingsOpened,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _PermissionChecked() when permissionChecked != null:
        return permissionChecked(_that);
      case _MultiplePermissionsChecked()
          when multiplePermissionsChecked != null:
        return multiplePermissionsChecked(_that);
      case _PermissionRequested() when permissionRequested != null:
        return permissionRequested(_that);
      case _MultiplePermissionsRequested()
          when multiplePermissionsRequested != null:
        return multiplePermissionsRequested(_that);
      case _ServiceStatusChecked() when serviceStatusChecked != null:
        return serviceStatusChecked(_that);
      case _SettingsOpened() when settingsOpened != null:
        return settingsOpened(_that);
      case _Error() when error != null:
        return error(_that);
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PermissionChecked value) permissionChecked,
    required TResult Function(_MultiplePermissionsChecked value)
        multiplePermissionsChecked,
    required TResult Function(_PermissionRequested value) permissionRequested,
    required TResult Function(_MultiplePermissionsRequested value)
        multiplePermissionsRequested,
    required TResult Function(_ServiceStatusChecked value) serviceStatusChecked,
    required TResult Function(_SettingsOpened value) settingsOpened,
    required TResult Function(_Error value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Loading():
        return loading(_that);
      case _PermissionChecked():
        return permissionChecked(_that);
      case _MultiplePermissionsChecked():
        return multiplePermissionsChecked(_that);
      case _PermissionRequested():
        return permissionRequested(_that);
      case _MultiplePermissionsRequested():
        return multiplePermissionsRequested(_that);
      case _ServiceStatusChecked():
        return serviceStatusChecked(_that);
      case _SettingsOpened():
        return settingsOpened(_that);
      case _Error():
        return error(_that);
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
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PermissionChecked value)? permissionChecked,
    TResult? Function(_MultiplePermissionsChecked value)?
        multiplePermissionsChecked,
    TResult? Function(_PermissionRequested value)? permissionRequested,
    TResult? Function(_MultiplePermissionsRequested value)?
        multiplePermissionsRequested,
    TResult? Function(_ServiceStatusChecked value)? serviceStatusChecked,
    TResult? Function(_SettingsOpened value)? settingsOpened,
    TResult? Function(_Error value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _PermissionChecked() when permissionChecked != null:
        return permissionChecked(_that);
      case _MultiplePermissionsChecked()
          when multiplePermissionsChecked != null:
        return multiplePermissionsChecked(_that);
      case _PermissionRequested() when permissionRequested != null:
        return permissionRequested(_that);
      case _MultiplePermissionsRequested()
          when multiplePermissionsRequested != null:
        return multiplePermissionsRequested(_that);
      case _ServiceStatusChecked() when serviceStatusChecked != null:
        return serviceStatusChecked(_that);
      case _SettingsOpened() when settingsOpened != null:
        return settingsOpened(_that);
      case _Error() when error != null:
        return error(_that);
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
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AppPermission permission, AppPermissionStatus status)?
        permissionChecked,
    TResult Function(Map<AppPermission, AppPermissionStatus> statusMap)?
        multiplePermissionsChecked,
    TResult Function(PermissionResult result)? permissionRequested,
    TResult Function(MultiplePermissionResult result)?
        multiplePermissionsRequested,
    TResult Function(AppPermission permission, bool isEnabled)?
        serviceStatusChecked,
    TResult Function(bool success)? settingsOpened,
    TResult Function(String message, AppPermission? permission)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _PermissionChecked() when permissionChecked != null:
        return permissionChecked(_that.permission, _that.status);
      case _MultiplePermissionsChecked()
          when multiplePermissionsChecked != null:
        return multiplePermissionsChecked(_that.statusMap);
      case _PermissionRequested() when permissionRequested != null:
        return permissionRequested(_that.result);
      case _MultiplePermissionsRequested()
          when multiplePermissionsRequested != null:
        return multiplePermissionsRequested(_that.result);
      case _ServiceStatusChecked() when serviceStatusChecked != null:
        return serviceStatusChecked(_that.permission, _that.isEnabled);
      case _SettingsOpened() when settingsOpened != null:
        return settingsOpened(_that.success);
      case _Error() when error != null:
        return error(_that.message, _that.permission);
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
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            AppPermission permission, AppPermissionStatus status)
        permissionChecked,
    required TResult Function(Map<AppPermission, AppPermissionStatus> statusMap)
        multiplePermissionsChecked,
    required TResult Function(PermissionResult result) permissionRequested,
    required TResult Function(MultiplePermissionResult result)
        multiplePermissionsRequested,
    required TResult Function(AppPermission permission, bool isEnabled)
        serviceStatusChecked,
    required TResult Function(bool success) settingsOpened,
    required TResult Function(String message, AppPermission? permission) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _PermissionChecked():
        return permissionChecked(_that.permission, _that.status);
      case _MultiplePermissionsChecked():
        return multiplePermissionsChecked(_that.statusMap);
      case _PermissionRequested():
        return permissionRequested(_that.result);
      case _MultiplePermissionsRequested():
        return multiplePermissionsRequested(_that.result);
      case _ServiceStatusChecked():
        return serviceStatusChecked(_that.permission, _that.isEnabled);
      case _SettingsOpened():
        return settingsOpened(_that.success);
      case _Error():
        return error(_that.message, _that.permission);
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
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AppPermission permission, AppPermissionStatus status)?
        permissionChecked,
    TResult? Function(Map<AppPermission, AppPermissionStatus> statusMap)?
        multiplePermissionsChecked,
    TResult? Function(PermissionResult result)? permissionRequested,
    TResult? Function(MultiplePermissionResult result)?
        multiplePermissionsRequested,
    TResult? Function(AppPermission permission, bool isEnabled)?
        serviceStatusChecked,
    TResult? Function(bool success)? settingsOpened,
    TResult? Function(String message, AppPermission? permission)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _PermissionChecked() when permissionChecked != null:
        return permissionChecked(_that.permission, _that.status);
      case _MultiplePermissionsChecked()
          when multiplePermissionsChecked != null:
        return multiplePermissionsChecked(_that.statusMap);
      case _PermissionRequested() when permissionRequested != null:
        return permissionRequested(_that.result);
      case _MultiplePermissionsRequested()
          when multiplePermissionsRequested != null:
        return multiplePermissionsRequested(_that.result);
      case _ServiceStatusChecked() when serviceStatusChecked != null:
        return serviceStatusChecked(_that.permission, _that.isEnabled);
      case _SettingsOpened() when settingsOpened != null:
        return settingsOpened(_that.success);
      case _Error() when error != null:
        return error(_that.message, _that.permission);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements PermissionState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PermissionState.initial()';
  }
}

/// @nodoc

class _Loading implements PermissionState {
  const _Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PermissionState.loading()';
  }
}

/// @nodoc

class _PermissionChecked implements PermissionState {
  const _PermissionChecked({required this.permission, required this.status});

  final AppPermission permission;
  final AppPermissionStatus status;

  /// Create a copy of PermissionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PermissionCheckedCopyWith<_PermissionChecked> get copyWith =>
      __$PermissionCheckedCopyWithImpl<_PermissionChecked>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PermissionChecked &&
            (identical(other.permission, permission) ||
                other.permission == permission) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, permission, status);

  @override
  String toString() {
    return 'PermissionState.permissionChecked(permission: $permission, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$PermissionCheckedCopyWith<$Res>
    implements $PermissionStateCopyWith<$Res> {
  factory _$PermissionCheckedCopyWith(
          _PermissionChecked value, $Res Function(_PermissionChecked) _then) =
      __$PermissionCheckedCopyWithImpl;
  @useResult
  $Res call({AppPermission permission, AppPermissionStatus status});
}

/// @nodoc
class __$PermissionCheckedCopyWithImpl<$Res>
    implements _$PermissionCheckedCopyWith<$Res> {
  __$PermissionCheckedCopyWithImpl(this._self, this._then);

  final _PermissionChecked _self;
  final $Res Function(_PermissionChecked) _then;

  /// Create a copy of PermissionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? permission = null,
    Object? status = null,
  }) {
    return _then(_PermissionChecked(
      permission: null == permission
          ? _self.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as AppPermission,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppPermissionStatus,
    ));
  }
}

/// @nodoc

class _MultiplePermissionsChecked implements PermissionState {
  const _MultiplePermissionsChecked(
      {required final Map<AppPermission, AppPermissionStatus> statusMap})
      : _statusMap = statusMap;

  final Map<AppPermission, AppPermissionStatus> _statusMap;
  Map<AppPermission, AppPermissionStatus> get statusMap {
    if (_statusMap is EqualUnmodifiableMapView) return _statusMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_statusMap);
  }

  /// Create a copy of PermissionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MultiplePermissionsCheckedCopyWith<_MultiplePermissionsChecked>
      get copyWith => __$MultiplePermissionsCheckedCopyWithImpl<
          _MultiplePermissionsChecked>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MultiplePermissionsChecked &&
            const DeepCollectionEquality()
                .equals(other._statusMap, _statusMap));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_statusMap));

  @override
  String toString() {
    return 'PermissionState.multiplePermissionsChecked(statusMap: $statusMap)';
  }
}

/// @nodoc
abstract mixin class _$MultiplePermissionsCheckedCopyWith<$Res>
    implements $PermissionStateCopyWith<$Res> {
  factory _$MultiplePermissionsCheckedCopyWith(
          _MultiplePermissionsChecked value,
          $Res Function(_MultiplePermissionsChecked) _then) =
      __$MultiplePermissionsCheckedCopyWithImpl;
  @useResult
  $Res call({Map<AppPermission, AppPermissionStatus> statusMap});
}

/// @nodoc
class __$MultiplePermissionsCheckedCopyWithImpl<$Res>
    implements _$MultiplePermissionsCheckedCopyWith<$Res> {
  __$MultiplePermissionsCheckedCopyWithImpl(this._self, this._then);

  final _MultiplePermissionsChecked _self;
  final $Res Function(_MultiplePermissionsChecked) _then;

  /// Create a copy of PermissionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? statusMap = null,
  }) {
    return _then(_MultiplePermissionsChecked(
      statusMap: null == statusMap
          ? _self._statusMap
          : statusMap // ignore: cast_nullable_to_non_nullable
              as Map<AppPermission, AppPermissionStatus>,
    ));
  }
}

/// @nodoc

class _PermissionRequested implements PermissionState {
  const _PermissionRequested({required this.result});

  final PermissionResult result;

  /// Create a copy of PermissionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PermissionRequestedCopyWith<_PermissionRequested> get copyWith =>
      __$PermissionRequestedCopyWithImpl<_PermissionRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PermissionRequested &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @override
  String toString() {
    return 'PermissionState.permissionRequested(result: $result)';
  }
}

/// @nodoc
abstract mixin class _$PermissionRequestedCopyWith<$Res>
    implements $PermissionStateCopyWith<$Res> {
  factory _$PermissionRequestedCopyWith(_PermissionRequested value,
          $Res Function(_PermissionRequested) _then) =
      __$PermissionRequestedCopyWithImpl;
  @useResult
  $Res call({PermissionResult result});

  $PermissionResultCopyWith<$Res> get result;
}

/// @nodoc
class __$PermissionRequestedCopyWithImpl<$Res>
    implements _$PermissionRequestedCopyWith<$Res> {
  __$PermissionRequestedCopyWithImpl(this._self, this._then);

  final _PermissionRequested _self;
  final $Res Function(_PermissionRequested) _then;

  /// Create a copy of PermissionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? result = null,
  }) {
    return _then(_PermissionRequested(
      result: null == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as PermissionResult,
    ));
  }

  /// Create a copy of PermissionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PermissionResultCopyWith<$Res> get result {
    return $PermissionResultCopyWith<$Res>(_self.result, (value) {
      return _then(_self.copyWith(result: value));
    });
  }
}

/// @nodoc

class _MultiplePermissionsRequested implements PermissionState {
  const _MultiplePermissionsRequested({required this.result});

  final MultiplePermissionResult result;

  /// Create a copy of PermissionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MultiplePermissionsRequestedCopyWith<_MultiplePermissionsRequested>
      get copyWith => __$MultiplePermissionsRequestedCopyWithImpl<
          _MultiplePermissionsRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MultiplePermissionsRequested &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @override
  String toString() {
    return 'PermissionState.multiplePermissionsRequested(result: $result)';
  }
}

/// @nodoc
abstract mixin class _$MultiplePermissionsRequestedCopyWith<$Res>
    implements $PermissionStateCopyWith<$Res> {
  factory _$MultiplePermissionsRequestedCopyWith(
          _MultiplePermissionsRequested value,
          $Res Function(_MultiplePermissionsRequested) _then) =
      __$MultiplePermissionsRequestedCopyWithImpl;
  @useResult
  $Res call({MultiplePermissionResult result});

  $MultiplePermissionResultCopyWith<$Res> get result;
}

/// @nodoc
class __$MultiplePermissionsRequestedCopyWithImpl<$Res>
    implements _$MultiplePermissionsRequestedCopyWith<$Res> {
  __$MultiplePermissionsRequestedCopyWithImpl(this._self, this._then);

  final _MultiplePermissionsRequested _self;
  final $Res Function(_MultiplePermissionsRequested) _then;

  /// Create a copy of PermissionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? result = null,
  }) {
    return _then(_MultiplePermissionsRequested(
      result: null == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as MultiplePermissionResult,
    ));
  }

  /// Create a copy of PermissionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MultiplePermissionResultCopyWith<$Res> get result {
    return $MultiplePermissionResultCopyWith<$Res>(_self.result, (value) {
      return _then(_self.copyWith(result: value));
    });
  }
}

/// @nodoc

class _ServiceStatusChecked implements PermissionState {
  const _ServiceStatusChecked(
      {required this.permission, required this.isEnabled});

  final AppPermission permission;
  final bool isEnabled;

  /// Create a copy of PermissionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServiceStatusCheckedCopyWith<_ServiceStatusChecked> get copyWith =>
      __$ServiceStatusCheckedCopyWithImpl<_ServiceStatusChecked>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServiceStatusChecked &&
            (identical(other.permission, permission) ||
                other.permission == permission) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, permission, isEnabled);

  @override
  String toString() {
    return 'PermissionState.serviceStatusChecked(permission: $permission, isEnabled: $isEnabled)';
  }
}

/// @nodoc
abstract mixin class _$ServiceStatusCheckedCopyWith<$Res>
    implements $PermissionStateCopyWith<$Res> {
  factory _$ServiceStatusCheckedCopyWith(_ServiceStatusChecked value,
          $Res Function(_ServiceStatusChecked) _then) =
      __$ServiceStatusCheckedCopyWithImpl;
  @useResult
  $Res call({AppPermission permission, bool isEnabled});
}

/// @nodoc
class __$ServiceStatusCheckedCopyWithImpl<$Res>
    implements _$ServiceStatusCheckedCopyWith<$Res> {
  __$ServiceStatusCheckedCopyWithImpl(this._self, this._then);

  final _ServiceStatusChecked _self;
  final $Res Function(_ServiceStatusChecked) _then;

  /// Create a copy of PermissionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? permission = null,
    Object? isEnabled = null,
  }) {
    return _then(_ServiceStatusChecked(
      permission: null == permission
          ? _self.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as AppPermission,
      isEnabled: null == isEnabled
          ? _self.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _SettingsOpened implements PermissionState {
  const _SettingsOpened({required this.success});

  final bool success;

  /// Create a copy of PermissionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SettingsOpenedCopyWith<_SettingsOpened> get copyWith =>
      __$SettingsOpenedCopyWithImpl<_SettingsOpened>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SettingsOpened &&
            (identical(other.success, success) || other.success == success));
  }

  @override
  int get hashCode => Object.hash(runtimeType, success);

  @override
  String toString() {
    return 'PermissionState.settingsOpened(success: $success)';
  }
}

/// @nodoc
abstract mixin class _$SettingsOpenedCopyWith<$Res>
    implements $PermissionStateCopyWith<$Res> {
  factory _$SettingsOpenedCopyWith(
          _SettingsOpened value, $Res Function(_SettingsOpened) _then) =
      __$SettingsOpenedCopyWithImpl;
  @useResult
  $Res call({bool success});
}

/// @nodoc
class __$SettingsOpenedCopyWithImpl<$Res>
    implements _$SettingsOpenedCopyWith<$Res> {
  __$SettingsOpenedCopyWithImpl(this._self, this._then);

  final _SettingsOpened _self;
  final $Res Function(_SettingsOpened) _then;

  /// Create a copy of PermissionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
  }) {
    return _then(_SettingsOpened(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _Error implements PermissionState {
  const _Error({required this.message, this.permission});

  final String message;
  final AppPermission? permission;

  /// Create a copy of PermissionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.permission, permission) ||
                other.permission == permission));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, permission);

  @override
  String toString() {
    return 'PermissionState.error(message: $message, permission: $permission)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $PermissionStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @useResult
  $Res call({String message, AppPermission? permission});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of PermissionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? permission = freezed,
  }) {
    return _then(_Error(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      permission: freezed == permission
          ? _self.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as AppPermission?,
    ));
  }
}

// dart format on
