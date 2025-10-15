// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PermissionEvent {
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionEventCopyWith<$Res> {
  factory $PermissionEventCopyWith(
          PermissionEvent value, $Res Function(PermissionEvent) then) =
      _$PermissionEventCopyWithImpl<$Res, PermissionEvent>;
}

/// @nodoc
class _$PermissionEventCopyWithImpl<$Res, $Val extends PermissionEvent>
    implements $PermissionEventCopyWith<$Res> {
  _$PermissionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CheckPermissionImplCopyWith<$Res> {
  factory _$$CheckPermissionImplCopyWith(_$CheckPermissionImpl value,
          $Res Function(_$CheckPermissionImpl) then) =
      __$$CheckPermissionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppPermission permission});
}

/// @nodoc
class __$$CheckPermissionImplCopyWithImpl<$Res>
    extends _$PermissionEventCopyWithImpl<$Res, _$CheckPermissionImpl>
    implements _$$CheckPermissionImplCopyWith<$Res> {
  __$$CheckPermissionImplCopyWithImpl(
      _$CheckPermissionImpl _value, $Res Function(_$CheckPermissionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permission = null,
  }) {
    return _then(_$CheckPermissionImpl(
      null == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as AppPermission,
    ));
  }
}

/// @nodoc

class _$CheckPermissionImpl implements _CheckPermission {
  const _$CheckPermissionImpl(this.permission);

  @override
  final AppPermission permission;

  @override
  String toString() {
    return 'PermissionEvent.checkPermission(permission: $permission)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckPermissionImpl &&
            (identical(other.permission, permission) ||
                other.permission == permission));
  }

  @override
  int get hashCode => Object.hash(runtimeType, permission);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckPermissionImplCopyWith<_$CheckPermissionImpl> get copyWith =>
      __$$CheckPermissionImplCopyWithImpl<_$CheckPermissionImpl>(
          this, _$identity);

  @override
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
    return checkPermission(permission);
  }

  @override
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
    return checkPermission?.call(permission);
  }

  @override
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
    if (checkPermission != null) {
      return checkPermission(permission);
    }
    return orElse();
  }

  @override
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
    return checkPermission(this);
  }

  @override
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
    return checkPermission?.call(this);
  }

  @override
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
    if (checkPermission != null) {
      return checkPermission(this);
    }
    return orElse();
  }
}

abstract class _CheckPermission implements PermissionEvent {
  const factory _CheckPermission(final AppPermission permission) =
      _$CheckPermissionImpl;

  AppPermission get permission;
  @JsonKey(ignore: true)
  _$$CheckPermissionImplCopyWith<_$CheckPermissionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckMultiplePermissionsImplCopyWith<$Res> {
  factory _$$CheckMultiplePermissionsImplCopyWith(
          _$CheckMultiplePermissionsImpl value,
          $Res Function(_$CheckMultiplePermissionsImpl) then) =
      __$$CheckMultiplePermissionsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<AppPermission> permissions});
}

/// @nodoc
class __$$CheckMultiplePermissionsImplCopyWithImpl<$Res>
    extends _$PermissionEventCopyWithImpl<$Res, _$CheckMultiplePermissionsImpl>
    implements _$$CheckMultiplePermissionsImplCopyWith<$Res> {
  __$$CheckMultiplePermissionsImplCopyWithImpl(
      _$CheckMultiplePermissionsImpl _value,
      $Res Function(_$CheckMultiplePermissionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permissions = null,
  }) {
    return _then(_$CheckMultiplePermissionsImpl(
      null == permissions
          ? _value._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<AppPermission>,
    ));
  }
}

/// @nodoc

class _$CheckMultiplePermissionsImpl implements _CheckMultiplePermissions {
  const _$CheckMultiplePermissionsImpl(final List<AppPermission> permissions)
      : _permissions = permissions;

  final List<AppPermission> _permissions;
  @override
  List<AppPermission> get permissions {
    if (_permissions is EqualUnmodifiableListView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permissions);
  }

  @override
  String toString() {
    return 'PermissionEvent.checkMultiplePermissions(permissions: $permissions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckMultiplePermissionsImpl &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_permissions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckMultiplePermissionsImplCopyWith<_$CheckMultiplePermissionsImpl>
      get copyWith => __$$CheckMultiplePermissionsImplCopyWithImpl<
          _$CheckMultiplePermissionsImpl>(this, _$identity);

  @override
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
    return checkMultiplePermissions(permissions);
  }

  @override
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
    return checkMultiplePermissions?.call(permissions);
  }

  @override
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
    if (checkMultiplePermissions != null) {
      return checkMultiplePermissions(permissions);
    }
    return orElse();
  }

  @override
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
    return checkMultiplePermissions(this);
  }

  @override
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
    return checkMultiplePermissions?.call(this);
  }

  @override
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
    if (checkMultiplePermissions != null) {
      return checkMultiplePermissions(this);
    }
    return orElse();
  }
}

abstract class _CheckMultiplePermissions implements PermissionEvent {
  const factory _CheckMultiplePermissions(
      final List<AppPermission> permissions) = _$CheckMultiplePermissionsImpl;

  List<AppPermission> get permissions;
  @JsonKey(ignore: true)
  _$$CheckMultiplePermissionsImplCopyWith<_$CheckMultiplePermissionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestPermissionImplCopyWith<$Res> {
  factory _$$RequestPermissionImplCopyWith(_$RequestPermissionImpl value,
          $Res Function(_$RequestPermissionImpl) then) =
      __$$RequestPermissionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppPermission permission});
}

/// @nodoc
class __$$RequestPermissionImplCopyWithImpl<$Res>
    extends _$PermissionEventCopyWithImpl<$Res, _$RequestPermissionImpl>
    implements _$$RequestPermissionImplCopyWith<$Res> {
  __$$RequestPermissionImplCopyWithImpl(_$RequestPermissionImpl _value,
      $Res Function(_$RequestPermissionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permission = null,
  }) {
    return _then(_$RequestPermissionImpl(
      null == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as AppPermission,
    ));
  }
}

/// @nodoc

class _$RequestPermissionImpl implements _RequestPermission {
  const _$RequestPermissionImpl(this.permission);

  @override
  final AppPermission permission;

  @override
  String toString() {
    return 'PermissionEvent.requestPermission(permission: $permission)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestPermissionImpl &&
            (identical(other.permission, permission) ||
                other.permission == permission));
  }

  @override
  int get hashCode => Object.hash(runtimeType, permission);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestPermissionImplCopyWith<_$RequestPermissionImpl> get copyWith =>
      __$$RequestPermissionImplCopyWithImpl<_$RequestPermissionImpl>(
          this, _$identity);

  @override
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
    return requestPermission(permission);
  }

  @override
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
    return requestPermission?.call(permission);
  }

  @override
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
    if (requestPermission != null) {
      return requestPermission(permission);
    }
    return orElse();
  }

  @override
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
    return requestPermission(this);
  }

  @override
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
    return requestPermission?.call(this);
  }

  @override
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
    if (requestPermission != null) {
      return requestPermission(this);
    }
    return orElse();
  }
}

abstract class _RequestPermission implements PermissionEvent {
  const factory _RequestPermission(final AppPermission permission) =
      _$RequestPermissionImpl;

  AppPermission get permission;
  @JsonKey(ignore: true)
  _$$RequestPermissionImplCopyWith<_$RequestPermissionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestMultiplePermissionsImplCopyWith<$Res> {
  factory _$$RequestMultiplePermissionsImplCopyWith(
          _$RequestMultiplePermissionsImpl value,
          $Res Function(_$RequestMultiplePermissionsImpl) then) =
      __$$RequestMultiplePermissionsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<AppPermission> permissions});
}

/// @nodoc
class __$$RequestMultiplePermissionsImplCopyWithImpl<$Res>
    extends _$PermissionEventCopyWithImpl<$Res,
        _$RequestMultiplePermissionsImpl>
    implements _$$RequestMultiplePermissionsImplCopyWith<$Res> {
  __$$RequestMultiplePermissionsImplCopyWithImpl(
      _$RequestMultiplePermissionsImpl _value,
      $Res Function(_$RequestMultiplePermissionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permissions = null,
  }) {
    return _then(_$RequestMultiplePermissionsImpl(
      null == permissions
          ? _value._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<AppPermission>,
    ));
  }
}

/// @nodoc

class _$RequestMultiplePermissionsImpl implements _RequestMultiplePermissions {
  const _$RequestMultiplePermissionsImpl(final List<AppPermission> permissions)
      : _permissions = permissions;

  final List<AppPermission> _permissions;
  @override
  List<AppPermission> get permissions {
    if (_permissions is EqualUnmodifiableListView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permissions);
  }

  @override
  String toString() {
    return 'PermissionEvent.requestMultiplePermissions(permissions: $permissions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestMultiplePermissionsImpl &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_permissions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestMultiplePermissionsImplCopyWith<_$RequestMultiplePermissionsImpl>
      get copyWith => __$$RequestMultiplePermissionsImplCopyWithImpl<
          _$RequestMultiplePermissionsImpl>(this, _$identity);

  @override
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
    return requestMultiplePermissions(permissions);
  }

  @override
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
    return requestMultiplePermissions?.call(permissions);
  }

  @override
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
    if (requestMultiplePermissions != null) {
      return requestMultiplePermissions(permissions);
    }
    return orElse();
  }

  @override
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
    return requestMultiplePermissions(this);
  }

  @override
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
    return requestMultiplePermissions?.call(this);
  }

  @override
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
    if (requestMultiplePermissions != null) {
      return requestMultiplePermissions(this);
    }
    return orElse();
  }
}

abstract class _RequestMultiplePermissions implements PermissionEvent {
  const factory _RequestMultiplePermissions(
      final List<AppPermission> permissions) = _$RequestMultiplePermissionsImpl;

  List<AppPermission> get permissions;
  @JsonKey(ignore: true)
  _$$RequestMultiplePermissionsImplCopyWith<_$RequestMultiplePermissionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestPermissionWithConfigImplCopyWith<$Res> {
  factory _$$RequestPermissionWithConfigImplCopyWith(
          _$RequestPermissionWithConfigImpl value,
          $Res Function(_$RequestPermissionWithConfigImpl) then) =
      __$$RequestPermissionWithConfigImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppPermission permission, PermissionRequestConfig config});

  $PermissionRequestConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$RequestPermissionWithConfigImplCopyWithImpl<$Res>
    extends _$PermissionEventCopyWithImpl<$Res,
        _$RequestPermissionWithConfigImpl>
    implements _$$RequestPermissionWithConfigImplCopyWith<$Res> {
  __$$RequestPermissionWithConfigImplCopyWithImpl(
      _$RequestPermissionWithConfigImpl _value,
      $Res Function(_$RequestPermissionWithConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permission = null,
    Object? config = null,
  }) {
    return _then(_$RequestPermissionWithConfigImpl(
      permission: null == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as AppPermission,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as PermissionRequestConfig,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PermissionRequestConfigCopyWith<$Res> get config {
    return $PermissionRequestConfigCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value));
    });
  }
}

/// @nodoc

class _$RequestPermissionWithConfigImpl
    implements _RequestPermissionWithConfig {
  const _$RequestPermissionWithConfigImpl(
      {required this.permission, required this.config});

  @override
  final AppPermission permission;
  @override
  final PermissionRequestConfig config;

  @override
  String toString() {
    return 'PermissionEvent.requestPermissionWithConfig(permission: $permission, config: $config)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestPermissionWithConfigImpl &&
            (identical(other.permission, permission) ||
                other.permission == permission) &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, permission, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestPermissionWithConfigImplCopyWith<_$RequestPermissionWithConfigImpl>
      get copyWith => __$$RequestPermissionWithConfigImplCopyWithImpl<
          _$RequestPermissionWithConfigImpl>(this, _$identity);

  @override
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
    return requestPermissionWithConfig(permission, config);
  }

  @override
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
    return requestPermissionWithConfig?.call(permission, config);
  }

  @override
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
    if (requestPermissionWithConfig != null) {
      return requestPermissionWithConfig(permission, config);
    }
    return orElse();
  }

  @override
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
    return requestPermissionWithConfig(this);
  }

  @override
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
    return requestPermissionWithConfig?.call(this);
  }

  @override
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
    if (requestPermissionWithConfig != null) {
      return requestPermissionWithConfig(this);
    }
    return orElse();
  }
}

abstract class _RequestPermissionWithConfig implements PermissionEvent {
  const factory _RequestPermissionWithConfig(
          {required final AppPermission permission,
          required final PermissionRequestConfig config}) =
      _$RequestPermissionWithConfigImpl;

  AppPermission get permission;
  PermissionRequestConfig get config;
  @JsonKey(ignore: true)
  _$$RequestPermissionWithConfigImplCopyWith<_$RequestPermissionWithConfigImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestBatchPermissionsImplCopyWith<$Res> {
  factory _$$RequestBatchPermissionsImplCopyWith(
          _$RequestBatchPermissionsImpl value,
          $Res Function(_$RequestBatchPermissionsImpl) then) =
      __$$RequestBatchPermissionsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BatchPermissionRequestConfig config});

  $BatchPermissionRequestConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$RequestBatchPermissionsImplCopyWithImpl<$Res>
    extends _$PermissionEventCopyWithImpl<$Res, _$RequestBatchPermissionsImpl>
    implements _$$RequestBatchPermissionsImplCopyWith<$Res> {
  __$$RequestBatchPermissionsImplCopyWithImpl(
      _$RequestBatchPermissionsImpl _value,
      $Res Function(_$RequestBatchPermissionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_$RequestBatchPermissionsImpl(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as BatchPermissionRequestConfig,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BatchPermissionRequestConfigCopyWith<$Res> get config {
    return $BatchPermissionRequestConfigCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value));
    });
  }
}

/// @nodoc

class _$RequestBatchPermissionsImpl implements _RequestBatchPermissions {
  const _$RequestBatchPermissionsImpl({required this.config});

  @override
  final BatchPermissionRequestConfig config;

  @override
  String toString() {
    return 'PermissionEvent.requestBatchPermissions(config: $config)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestBatchPermissionsImpl &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestBatchPermissionsImplCopyWith<_$RequestBatchPermissionsImpl>
      get copyWith => __$$RequestBatchPermissionsImplCopyWithImpl<
          _$RequestBatchPermissionsImpl>(this, _$identity);

  @override
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
    return requestBatchPermissions(config);
  }

  @override
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
    return requestBatchPermissions?.call(config);
  }

  @override
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
    if (requestBatchPermissions != null) {
      return requestBatchPermissions(config);
    }
    return orElse();
  }

  @override
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
    return requestBatchPermissions(this);
  }

  @override
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
    return requestBatchPermissions?.call(this);
  }

  @override
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
    if (requestBatchPermissions != null) {
      return requestBatchPermissions(this);
    }
    return orElse();
  }
}

abstract class _RequestBatchPermissions implements PermissionEvent {
  const factory _RequestBatchPermissions(
          {required final BatchPermissionRequestConfig config}) =
      _$RequestBatchPermissionsImpl;

  BatchPermissionRequestConfig get config;
  @JsonKey(ignore: true)
  _$$RequestBatchPermissionsImplCopyWith<_$RequestBatchPermissionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OpenAppSettingsImplCopyWith<$Res> {
  factory _$$OpenAppSettingsImplCopyWith(_$OpenAppSettingsImpl value,
          $Res Function(_$OpenAppSettingsImpl) then) =
      __$$OpenAppSettingsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OpenAppSettingsImplCopyWithImpl<$Res>
    extends _$PermissionEventCopyWithImpl<$Res, _$OpenAppSettingsImpl>
    implements _$$OpenAppSettingsImplCopyWith<$Res> {
  __$$OpenAppSettingsImplCopyWithImpl(
      _$OpenAppSettingsImpl _value, $Res Function(_$OpenAppSettingsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OpenAppSettingsImpl implements _OpenAppSettings {
  const _$OpenAppSettingsImpl();

  @override
  String toString() {
    return 'PermissionEvent.openAppSettings()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OpenAppSettingsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return openAppSettings();
  }

  @override
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
    return openAppSettings?.call();
  }

  @override
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
    if (openAppSettings != null) {
      return openAppSettings();
    }
    return orElse();
  }

  @override
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
    return openAppSettings(this);
  }

  @override
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
    return openAppSettings?.call(this);
  }

  @override
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
    if (openAppSettings != null) {
      return openAppSettings(this);
    }
    return orElse();
  }
}

abstract class _OpenAppSettings implements PermissionEvent {
  const factory _OpenAppSettings() = _$OpenAppSettingsImpl;
}

/// @nodoc
abstract class _$$CheckServiceStatusImplCopyWith<$Res> {
  factory _$$CheckServiceStatusImplCopyWith(_$CheckServiceStatusImpl value,
          $Res Function(_$CheckServiceStatusImpl) then) =
      __$$CheckServiceStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppPermission permission});
}

/// @nodoc
class __$$CheckServiceStatusImplCopyWithImpl<$Res>
    extends _$PermissionEventCopyWithImpl<$Res, _$CheckServiceStatusImpl>
    implements _$$CheckServiceStatusImplCopyWith<$Res> {
  __$$CheckServiceStatusImplCopyWithImpl(_$CheckServiceStatusImpl _value,
      $Res Function(_$CheckServiceStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permission = null,
  }) {
    return _then(_$CheckServiceStatusImpl(
      null == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as AppPermission,
    ));
  }
}

/// @nodoc

class _$CheckServiceStatusImpl implements _CheckServiceStatus {
  const _$CheckServiceStatusImpl(this.permission);

  @override
  final AppPermission permission;

  @override
  String toString() {
    return 'PermissionEvent.checkServiceStatus(permission: $permission)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckServiceStatusImpl &&
            (identical(other.permission, permission) ||
                other.permission == permission));
  }

  @override
  int get hashCode => Object.hash(runtimeType, permission);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckServiceStatusImplCopyWith<_$CheckServiceStatusImpl> get copyWith =>
      __$$CheckServiceStatusImplCopyWithImpl<_$CheckServiceStatusImpl>(
          this, _$identity);

  @override
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
    return checkServiceStatus(permission);
  }

  @override
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
    return checkServiceStatus?.call(permission);
  }

  @override
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
    if (checkServiceStatus != null) {
      return checkServiceStatus(permission);
    }
    return orElse();
  }

  @override
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
    return checkServiceStatus(this);
  }

  @override
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
    return checkServiceStatus?.call(this);
  }

  @override
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
    if (checkServiceStatus != null) {
      return checkServiceStatus(this);
    }
    return orElse();
  }
}

abstract class _CheckServiceStatus implements PermissionEvent {
  const factory _CheckServiceStatus(final AppPermission permission) =
      _$CheckServiceStatusImpl;

  AppPermission get permission;
  @JsonKey(ignore: true)
  _$$CheckServiceStatusImplCopyWith<_$CheckServiceStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestServiceEnableImplCopyWith<$Res> {
  factory _$$RequestServiceEnableImplCopyWith(_$RequestServiceEnableImpl value,
          $Res Function(_$RequestServiceEnableImpl) then) =
      __$$RequestServiceEnableImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppPermission permission});
}

/// @nodoc
class __$$RequestServiceEnableImplCopyWithImpl<$Res>
    extends _$PermissionEventCopyWithImpl<$Res, _$RequestServiceEnableImpl>
    implements _$$RequestServiceEnableImplCopyWith<$Res> {
  __$$RequestServiceEnableImplCopyWithImpl(_$RequestServiceEnableImpl _value,
      $Res Function(_$RequestServiceEnableImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permission = null,
  }) {
    return _then(_$RequestServiceEnableImpl(
      null == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as AppPermission,
    ));
  }
}

/// @nodoc

class _$RequestServiceEnableImpl implements _RequestServiceEnable {
  const _$RequestServiceEnableImpl(this.permission);

  @override
  final AppPermission permission;

  @override
  String toString() {
    return 'PermissionEvent.requestServiceEnable(permission: $permission)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestServiceEnableImpl &&
            (identical(other.permission, permission) ||
                other.permission == permission));
  }

  @override
  int get hashCode => Object.hash(runtimeType, permission);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestServiceEnableImplCopyWith<_$RequestServiceEnableImpl>
      get copyWith =>
          __$$RequestServiceEnableImplCopyWithImpl<_$RequestServiceEnableImpl>(
              this, _$identity);

  @override
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
    return requestServiceEnable(permission);
  }

  @override
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
    return requestServiceEnable?.call(permission);
  }

  @override
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
    if (requestServiceEnable != null) {
      return requestServiceEnable(permission);
    }
    return orElse();
  }

  @override
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
    return requestServiceEnable(this);
  }

  @override
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
    return requestServiceEnable?.call(this);
  }

  @override
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
    if (requestServiceEnable != null) {
      return requestServiceEnable(this);
    }
    return orElse();
  }
}

abstract class _RequestServiceEnable implements PermissionEvent {
  const factory _RequestServiceEnable(final AppPermission permission) =
      _$RequestServiceEnableImpl;

  AppPermission get permission;
  @JsonKey(ignore: true)
  _$$RequestServiceEnableImplCopyWith<_$RequestServiceEnableImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl value, $Res Function(_$ResetImpl) then) =
      __$$ResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$PermissionEventCopyWithImpl<$Res, _$ResetImpl>
    implements _$$ResetImplCopyWith<$Res> {
  __$$ResetImplCopyWithImpl(
      _$ResetImpl _value, $Res Function(_$ResetImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetImpl implements _Reset {
  const _$ResetImpl();

  @override
  String toString() {
    return 'PermissionEvent.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return reset();
  }

  @override
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
    return reset?.call();
  }

  @override
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
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
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
    return reset(this);
  }

  @override
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
    return reset?.call(this);
  }

  @override
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
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset implements PermissionEvent {
  const factory _Reset() = _$ResetImpl;
}
