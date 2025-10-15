// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PermissionState {
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionStateCopyWith<$Res> {
  factory $PermissionStateCopyWith(
          PermissionState value, $Res Function(PermissionState) then) =
      _$PermissionStateCopyWithImpl<$Res, PermissionState>;
}

/// @nodoc
class _$PermissionStateCopyWithImpl<$Res, $Val extends PermissionState>
    implements $PermissionStateCopyWith<$Res> {
  _$PermissionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PermissionStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PermissionState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return initial();
  }

  @override
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
    return initial?.call();
  }

  @override
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
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
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
    return initial(this);
  }

  @override
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
    return initial?.call(this);
  }

  @override
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
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PermissionState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$PermissionStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'PermissionState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return loading();
  }

  @override
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
    return loading?.call();
  }

  @override
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
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
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
    return loading(this);
  }

  @override
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
    return loading?.call(this);
  }

  @override
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
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PermissionState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$PermissionCheckedImplCopyWith<$Res> {
  factory _$$PermissionCheckedImplCopyWith(_$PermissionCheckedImpl value,
          $Res Function(_$PermissionCheckedImpl) then) =
      __$$PermissionCheckedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppPermission permission, AppPermissionStatus status});
}

/// @nodoc
class __$$PermissionCheckedImplCopyWithImpl<$Res>
    extends _$PermissionStateCopyWithImpl<$Res, _$PermissionCheckedImpl>
    implements _$$PermissionCheckedImplCopyWith<$Res> {
  __$$PermissionCheckedImplCopyWithImpl(_$PermissionCheckedImpl _value,
      $Res Function(_$PermissionCheckedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permission = null,
    Object? status = null,
  }) {
    return _then(_$PermissionCheckedImpl(
      permission: null == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as AppPermission,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppPermissionStatus,
    ));
  }
}

/// @nodoc

class _$PermissionCheckedImpl implements _PermissionChecked {
  const _$PermissionCheckedImpl(
      {required this.permission, required this.status});

  @override
  final AppPermission permission;
  @override
  final AppPermissionStatus status;

  @override
  String toString() {
    return 'PermissionState.permissionChecked(permission: $permission, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionCheckedImpl &&
            (identical(other.permission, permission) ||
                other.permission == permission) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, permission, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionCheckedImplCopyWith<_$PermissionCheckedImpl> get copyWith =>
      __$$PermissionCheckedImplCopyWithImpl<_$PermissionCheckedImpl>(
          this, _$identity);

  @override
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
    return permissionChecked(permission, status);
  }

  @override
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
    return permissionChecked?.call(permission, status);
  }

  @override
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
    if (permissionChecked != null) {
      return permissionChecked(permission, status);
    }
    return orElse();
  }

  @override
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
    return permissionChecked(this);
  }

  @override
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
    return permissionChecked?.call(this);
  }

  @override
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
    if (permissionChecked != null) {
      return permissionChecked(this);
    }
    return orElse();
  }
}

abstract class _PermissionChecked implements PermissionState {
  const factory _PermissionChecked(
      {required final AppPermission permission,
      required final AppPermissionStatus status}) = _$PermissionCheckedImpl;

  AppPermission get permission;
  AppPermissionStatus get status;
  @JsonKey(ignore: true)
  _$$PermissionCheckedImplCopyWith<_$PermissionCheckedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MultiplePermissionsCheckedImplCopyWith<$Res> {
  factory _$$MultiplePermissionsCheckedImplCopyWith(
          _$MultiplePermissionsCheckedImpl value,
          $Res Function(_$MultiplePermissionsCheckedImpl) then) =
      __$$MultiplePermissionsCheckedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<AppPermission, AppPermissionStatus> statusMap});
}

/// @nodoc
class __$$MultiplePermissionsCheckedImplCopyWithImpl<$Res>
    extends _$PermissionStateCopyWithImpl<$Res,
        _$MultiplePermissionsCheckedImpl>
    implements _$$MultiplePermissionsCheckedImplCopyWith<$Res> {
  __$$MultiplePermissionsCheckedImplCopyWithImpl(
      _$MultiplePermissionsCheckedImpl _value,
      $Res Function(_$MultiplePermissionsCheckedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusMap = null,
  }) {
    return _then(_$MultiplePermissionsCheckedImpl(
      statusMap: null == statusMap
          ? _value._statusMap
          : statusMap // ignore: cast_nullable_to_non_nullable
              as Map<AppPermission, AppPermissionStatus>,
    ));
  }
}

/// @nodoc

class _$MultiplePermissionsCheckedImpl implements _MultiplePermissionsChecked {
  const _$MultiplePermissionsCheckedImpl(
      {required final Map<AppPermission, AppPermissionStatus> statusMap})
      : _statusMap = statusMap;

  final Map<AppPermission, AppPermissionStatus> _statusMap;
  @override
  Map<AppPermission, AppPermissionStatus> get statusMap {
    if (_statusMap is EqualUnmodifiableMapView) return _statusMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_statusMap);
  }

  @override
  String toString() {
    return 'PermissionState.multiplePermissionsChecked(statusMap: $statusMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MultiplePermissionsCheckedImpl &&
            const DeepCollectionEquality()
                .equals(other._statusMap, _statusMap));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_statusMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MultiplePermissionsCheckedImplCopyWith<_$MultiplePermissionsCheckedImpl>
      get copyWith => __$$MultiplePermissionsCheckedImplCopyWithImpl<
          _$MultiplePermissionsCheckedImpl>(this, _$identity);

  @override
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
    return multiplePermissionsChecked(statusMap);
  }

  @override
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
    return multiplePermissionsChecked?.call(statusMap);
  }

  @override
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
    if (multiplePermissionsChecked != null) {
      return multiplePermissionsChecked(statusMap);
    }
    return orElse();
  }

  @override
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
    return multiplePermissionsChecked(this);
  }

  @override
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
    return multiplePermissionsChecked?.call(this);
  }

  @override
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
    if (multiplePermissionsChecked != null) {
      return multiplePermissionsChecked(this);
    }
    return orElse();
  }
}

abstract class _MultiplePermissionsChecked implements PermissionState {
  const factory _MultiplePermissionsChecked(
          {required final Map<AppPermission, AppPermissionStatus> statusMap}) =
      _$MultiplePermissionsCheckedImpl;

  Map<AppPermission, AppPermissionStatus> get statusMap;
  @JsonKey(ignore: true)
  _$$MultiplePermissionsCheckedImplCopyWith<_$MultiplePermissionsCheckedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PermissionRequestedImplCopyWith<$Res> {
  factory _$$PermissionRequestedImplCopyWith(_$PermissionRequestedImpl value,
          $Res Function(_$PermissionRequestedImpl) then) =
      __$$PermissionRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PermissionResult result});

  $PermissionResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$PermissionRequestedImplCopyWithImpl<$Res>
    extends _$PermissionStateCopyWithImpl<$Res, _$PermissionRequestedImpl>
    implements _$$PermissionRequestedImplCopyWith<$Res> {
  __$$PermissionRequestedImplCopyWithImpl(_$PermissionRequestedImpl _value,
      $Res Function(_$PermissionRequestedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$PermissionRequestedImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as PermissionResult,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PermissionResultCopyWith<$Res> get result {
    return $PermissionResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value));
    });
  }
}

/// @nodoc

class _$PermissionRequestedImpl implements _PermissionRequested {
  const _$PermissionRequestedImpl({required this.result});

  @override
  final PermissionResult result;

  @override
  String toString() {
    return 'PermissionState.permissionRequested(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionRequestedImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionRequestedImplCopyWith<_$PermissionRequestedImpl> get copyWith =>
      __$$PermissionRequestedImplCopyWithImpl<_$PermissionRequestedImpl>(
          this, _$identity);

  @override
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
    return permissionRequested(result);
  }

  @override
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
    return permissionRequested?.call(result);
  }

  @override
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
    if (permissionRequested != null) {
      return permissionRequested(result);
    }
    return orElse();
  }

  @override
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
    return permissionRequested(this);
  }

  @override
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
    return permissionRequested?.call(this);
  }

  @override
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
    if (permissionRequested != null) {
      return permissionRequested(this);
    }
    return orElse();
  }
}

abstract class _PermissionRequested implements PermissionState {
  const factory _PermissionRequested({required final PermissionResult result}) =
      _$PermissionRequestedImpl;

  PermissionResult get result;
  @JsonKey(ignore: true)
  _$$PermissionRequestedImplCopyWith<_$PermissionRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MultiplePermissionsRequestedImplCopyWith<$Res> {
  factory _$$MultiplePermissionsRequestedImplCopyWith(
          _$MultiplePermissionsRequestedImpl value,
          $Res Function(_$MultiplePermissionsRequestedImpl) then) =
      __$$MultiplePermissionsRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MultiplePermissionResult result});

  $MultiplePermissionResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$MultiplePermissionsRequestedImplCopyWithImpl<$Res>
    extends _$PermissionStateCopyWithImpl<$Res,
        _$MultiplePermissionsRequestedImpl>
    implements _$$MultiplePermissionsRequestedImplCopyWith<$Res> {
  __$$MultiplePermissionsRequestedImplCopyWithImpl(
      _$MultiplePermissionsRequestedImpl _value,
      $Res Function(_$MultiplePermissionsRequestedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$MultiplePermissionsRequestedImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as MultiplePermissionResult,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MultiplePermissionResultCopyWith<$Res> get result {
    return $MultiplePermissionResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value));
    });
  }
}

/// @nodoc

class _$MultiplePermissionsRequestedImpl
    implements _MultiplePermissionsRequested {
  const _$MultiplePermissionsRequestedImpl({required this.result});

  @override
  final MultiplePermissionResult result;

  @override
  String toString() {
    return 'PermissionState.multiplePermissionsRequested(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MultiplePermissionsRequestedImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MultiplePermissionsRequestedImplCopyWith<
          _$MultiplePermissionsRequestedImpl>
      get copyWith => __$$MultiplePermissionsRequestedImplCopyWithImpl<
          _$MultiplePermissionsRequestedImpl>(this, _$identity);

  @override
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
    return multiplePermissionsRequested(result);
  }

  @override
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
    return multiplePermissionsRequested?.call(result);
  }

  @override
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
    if (multiplePermissionsRequested != null) {
      return multiplePermissionsRequested(result);
    }
    return orElse();
  }

  @override
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
    return multiplePermissionsRequested(this);
  }

  @override
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
    return multiplePermissionsRequested?.call(this);
  }

  @override
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
    if (multiplePermissionsRequested != null) {
      return multiplePermissionsRequested(this);
    }
    return orElse();
  }
}

abstract class _MultiplePermissionsRequested implements PermissionState {
  const factory _MultiplePermissionsRequested(
          {required final MultiplePermissionResult result}) =
      _$MultiplePermissionsRequestedImpl;

  MultiplePermissionResult get result;
  @JsonKey(ignore: true)
  _$$MultiplePermissionsRequestedImplCopyWith<
          _$MultiplePermissionsRequestedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServiceStatusCheckedImplCopyWith<$Res> {
  factory _$$ServiceStatusCheckedImplCopyWith(_$ServiceStatusCheckedImpl value,
          $Res Function(_$ServiceStatusCheckedImpl) then) =
      __$$ServiceStatusCheckedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppPermission permission, bool isEnabled});
}

/// @nodoc
class __$$ServiceStatusCheckedImplCopyWithImpl<$Res>
    extends _$PermissionStateCopyWithImpl<$Res, _$ServiceStatusCheckedImpl>
    implements _$$ServiceStatusCheckedImplCopyWith<$Res> {
  __$$ServiceStatusCheckedImplCopyWithImpl(_$ServiceStatusCheckedImpl _value,
      $Res Function(_$ServiceStatusCheckedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permission = null,
    Object? isEnabled = null,
  }) {
    return _then(_$ServiceStatusCheckedImpl(
      permission: null == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as AppPermission,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ServiceStatusCheckedImpl implements _ServiceStatusChecked {
  const _$ServiceStatusCheckedImpl(
      {required this.permission, required this.isEnabled});

  @override
  final AppPermission permission;
  @override
  final bool isEnabled;

  @override
  String toString() {
    return 'PermissionState.serviceStatusChecked(permission: $permission, isEnabled: $isEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceStatusCheckedImpl &&
            (identical(other.permission, permission) ||
                other.permission == permission) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, permission, isEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceStatusCheckedImplCopyWith<_$ServiceStatusCheckedImpl>
      get copyWith =>
          __$$ServiceStatusCheckedImplCopyWithImpl<_$ServiceStatusCheckedImpl>(
              this, _$identity);

  @override
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
    return serviceStatusChecked(permission, isEnabled);
  }

  @override
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
    return serviceStatusChecked?.call(permission, isEnabled);
  }

  @override
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
    if (serviceStatusChecked != null) {
      return serviceStatusChecked(permission, isEnabled);
    }
    return orElse();
  }

  @override
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
    return serviceStatusChecked(this);
  }

  @override
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
    return serviceStatusChecked?.call(this);
  }

  @override
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
    if (serviceStatusChecked != null) {
      return serviceStatusChecked(this);
    }
    return orElse();
  }
}

abstract class _ServiceStatusChecked implements PermissionState {
  const factory _ServiceStatusChecked(
      {required final AppPermission permission,
      required final bool isEnabled}) = _$ServiceStatusCheckedImpl;

  AppPermission get permission;
  bool get isEnabled;
  @JsonKey(ignore: true)
  _$$ServiceStatusCheckedImplCopyWith<_$ServiceStatusCheckedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SettingsOpenedImplCopyWith<$Res> {
  factory _$$SettingsOpenedImplCopyWith(_$SettingsOpenedImpl value,
          $Res Function(_$SettingsOpenedImpl) then) =
      __$$SettingsOpenedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool success});
}

/// @nodoc
class __$$SettingsOpenedImplCopyWithImpl<$Res>
    extends _$PermissionStateCopyWithImpl<$Res, _$SettingsOpenedImpl>
    implements _$$SettingsOpenedImplCopyWith<$Res> {
  __$$SettingsOpenedImplCopyWithImpl(
      _$SettingsOpenedImpl _value, $Res Function(_$SettingsOpenedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
  }) {
    return _then(_$SettingsOpenedImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SettingsOpenedImpl implements _SettingsOpened {
  const _$SettingsOpenedImpl({required this.success});

  @override
  final bool success;

  @override
  String toString() {
    return 'PermissionState.settingsOpened(success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsOpenedImpl &&
            (identical(other.success, success) || other.success == success));
  }

  @override
  int get hashCode => Object.hash(runtimeType, success);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsOpenedImplCopyWith<_$SettingsOpenedImpl> get copyWith =>
      __$$SettingsOpenedImplCopyWithImpl<_$SettingsOpenedImpl>(
          this, _$identity);

  @override
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
    return settingsOpened(success);
  }

  @override
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
    return settingsOpened?.call(success);
  }

  @override
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
    if (settingsOpened != null) {
      return settingsOpened(success);
    }
    return orElse();
  }

  @override
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
    return settingsOpened(this);
  }

  @override
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
    return settingsOpened?.call(this);
  }

  @override
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
    if (settingsOpened != null) {
      return settingsOpened(this);
    }
    return orElse();
  }
}

abstract class _SettingsOpened implements PermissionState {
  const factory _SettingsOpened({required final bool success}) =
      _$SettingsOpenedImpl;

  bool get success;
  @JsonKey(ignore: true)
  _$$SettingsOpenedImplCopyWith<_$SettingsOpenedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, AppPermission? permission});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$PermissionStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? permission = freezed,
  }) {
    return _then(_$ErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      permission: freezed == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as AppPermission?,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.message, this.permission});

  @override
  final String message;
  @override
  final AppPermission? permission;

  @override
  String toString() {
    return 'PermissionState.error(message: $message, permission: $permission)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.permission, permission) ||
                other.permission == permission));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, permission);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
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
    return error(message, permission);
  }

  @override
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
    return error?.call(message, permission);
  }

  @override
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
    if (error != null) {
      return error(message, permission);
    }
    return orElse();
  }

  @override
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
    return error(this);
  }

  @override
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
    return error?.call(this);
  }

  @override
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
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements PermissionState {
  const factory _Error(
      {required final String message,
      final AppPermission? permission}) = _$ErrorImpl;

  String get message;
  AppPermission? get permission;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
