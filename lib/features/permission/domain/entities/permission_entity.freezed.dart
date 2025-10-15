// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PermissionResult {
  AppPermission get permission => throw _privateConstructorUsedError;
  AppPermissionStatus get status => throw _privateConstructorUsedError;
  bool get openedSettings => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PermissionResultCopyWith<PermissionResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionResultCopyWith<$Res> {
  factory $PermissionResultCopyWith(
          PermissionResult value, $Res Function(PermissionResult) then) =
      _$PermissionResultCopyWithImpl<$Res, PermissionResult>;
  @useResult
  $Res call(
      {AppPermission permission,
      AppPermissionStatus status,
      bool openedSettings});
}

/// @nodoc
class _$PermissionResultCopyWithImpl<$Res, $Val extends PermissionResult>
    implements $PermissionResultCopyWith<$Res> {
  _$PermissionResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permission = null,
    Object? status = null,
    Object? openedSettings = null,
  }) {
    return _then(_value.copyWith(
      permission: null == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as AppPermission,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppPermissionStatus,
      openedSettings: null == openedSettings
          ? _value.openedSettings
          : openedSettings // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PermissionResultImplCopyWith<$Res>
    implements $PermissionResultCopyWith<$Res> {
  factory _$$PermissionResultImplCopyWith(_$PermissionResultImpl value,
          $Res Function(_$PermissionResultImpl) then) =
      __$$PermissionResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AppPermission permission,
      AppPermissionStatus status,
      bool openedSettings});
}

/// @nodoc
class __$$PermissionResultImplCopyWithImpl<$Res>
    extends _$PermissionResultCopyWithImpl<$Res, _$PermissionResultImpl>
    implements _$$PermissionResultImplCopyWith<$Res> {
  __$$PermissionResultImplCopyWithImpl(_$PermissionResultImpl _value,
      $Res Function(_$PermissionResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permission = null,
    Object? status = null,
    Object? openedSettings = null,
  }) {
    return _then(_$PermissionResultImpl(
      permission: null == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as AppPermission,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppPermissionStatus,
      openedSettings: null == openedSettings
          ? _value.openedSettings
          : openedSettings // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PermissionResultImpl implements _PermissionResult {
  const _$PermissionResultImpl(
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

  @override
  String toString() {
    return 'PermissionResult(permission: $permission, status: $status, openedSettings: $openedSettings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionResultImpl &&
            (identical(other.permission, permission) ||
                other.permission == permission) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.openedSettings, openedSettings) ||
                other.openedSettings == openedSettings));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, permission, status, openedSettings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionResultImplCopyWith<_$PermissionResultImpl> get copyWith =>
      __$$PermissionResultImplCopyWithImpl<_$PermissionResultImpl>(
          this, _$identity);
}

abstract class _PermissionResult implements PermissionResult {
  const factory _PermissionResult(
      {required final AppPermission permission,
      required final AppPermissionStatus status,
      final bool openedSettings}) = _$PermissionResultImpl;

  @override
  AppPermission get permission;
  @override
  AppPermissionStatus get status;
  @override
  bool get openedSettings;
  @override
  @JsonKey(ignore: true)
  _$$PermissionResultImplCopyWith<_$PermissionResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MultiplePermissionResult {
  Map<AppPermission, AppPermissionStatus> get results =>
      throw _privateConstructorUsedError;
  List<AppPermission> get grantedPermissions =>
      throw _privateConstructorUsedError;
  List<AppPermission> get deniedPermissions =>
      throw _privateConstructorUsedError;
  List<AppPermission> get permanentlyDeniedPermissions =>
      throw _privateConstructorUsedError;
  List<AppPermission> get restrictedPermissions =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MultiplePermissionResultCopyWith<MultiplePermissionResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MultiplePermissionResultCopyWith<$Res> {
  factory $MultiplePermissionResultCopyWith(MultiplePermissionResult value,
          $Res Function(MultiplePermissionResult) then) =
      _$MultiplePermissionResultCopyWithImpl<$Res, MultiplePermissionResult>;
  @useResult
  $Res call(
      {Map<AppPermission, AppPermissionStatus> results,
      List<AppPermission> grantedPermissions,
      List<AppPermission> deniedPermissions,
      List<AppPermission> permanentlyDeniedPermissions,
      List<AppPermission> restrictedPermissions});
}

/// @nodoc
class _$MultiplePermissionResultCopyWithImpl<$Res,
        $Val extends MultiplePermissionResult>
    implements $MultiplePermissionResultCopyWith<$Res> {
  _$MultiplePermissionResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? grantedPermissions = null,
    Object? deniedPermissions = null,
    Object? permanentlyDeniedPermissions = null,
    Object? restrictedPermissions = null,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as Map<AppPermission, AppPermissionStatus>,
      grantedPermissions: null == grantedPermissions
          ? _value.grantedPermissions
          : grantedPermissions // ignore: cast_nullable_to_non_nullable
              as List<AppPermission>,
      deniedPermissions: null == deniedPermissions
          ? _value.deniedPermissions
          : deniedPermissions // ignore: cast_nullable_to_non_nullable
              as List<AppPermission>,
      permanentlyDeniedPermissions: null == permanentlyDeniedPermissions
          ? _value.permanentlyDeniedPermissions
          : permanentlyDeniedPermissions // ignore: cast_nullable_to_non_nullable
              as List<AppPermission>,
      restrictedPermissions: null == restrictedPermissions
          ? _value.restrictedPermissions
          : restrictedPermissions // ignore: cast_nullable_to_non_nullable
              as List<AppPermission>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MultiplePermissionResultImplCopyWith<$Res>
    implements $MultiplePermissionResultCopyWith<$Res> {
  factory _$$MultiplePermissionResultImplCopyWith(
          _$MultiplePermissionResultImpl value,
          $Res Function(_$MultiplePermissionResultImpl) then) =
      __$$MultiplePermissionResultImplCopyWithImpl<$Res>;
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
class __$$MultiplePermissionResultImplCopyWithImpl<$Res>
    extends _$MultiplePermissionResultCopyWithImpl<$Res,
        _$MultiplePermissionResultImpl>
    implements _$$MultiplePermissionResultImplCopyWith<$Res> {
  __$$MultiplePermissionResultImplCopyWithImpl(
      _$MultiplePermissionResultImpl _value,
      $Res Function(_$MultiplePermissionResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? grantedPermissions = null,
    Object? deniedPermissions = null,
    Object? permanentlyDeniedPermissions = null,
    Object? restrictedPermissions = null,
  }) {
    return _then(_$MultiplePermissionResultImpl(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as Map<AppPermission, AppPermissionStatus>,
      grantedPermissions: null == grantedPermissions
          ? _value._grantedPermissions
          : grantedPermissions // ignore: cast_nullable_to_non_nullable
              as List<AppPermission>,
      deniedPermissions: null == deniedPermissions
          ? _value._deniedPermissions
          : deniedPermissions // ignore: cast_nullable_to_non_nullable
              as List<AppPermission>,
      permanentlyDeniedPermissions: null == permanentlyDeniedPermissions
          ? _value._permanentlyDeniedPermissions
          : permanentlyDeniedPermissions // ignore: cast_nullable_to_non_nullable
              as List<AppPermission>,
      restrictedPermissions: null == restrictedPermissions
          ? _value._restrictedPermissions
          : restrictedPermissions // ignore: cast_nullable_to_non_nullable
              as List<AppPermission>,
    ));
  }
}

/// @nodoc

class _$MultiplePermissionResultImpl extends _MultiplePermissionResult {
  const _$MultiplePermissionResultImpl(
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

  @override
  String toString() {
    return 'MultiplePermissionResult(results: $results, grantedPermissions: $grantedPermissions, deniedPermissions: $deniedPermissions, permanentlyDeniedPermissions: $permanentlyDeniedPermissions, restrictedPermissions: $restrictedPermissions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MultiplePermissionResultImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MultiplePermissionResultImplCopyWith<_$MultiplePermissionResultImpl>
      get copyWith => __$$MultiplePermissionResultImplCopyWithImpl<
          _$MultiplePermissionResultImpl>(this, _$identity);
}

abstract class _MultiplePermissionResult extends MultiplePermissionResult {
  const factory _MultiplePermissionResult(
          {required final Map<AppPermission, AppPermissionStatus> results,
          final List<AppPermission> grantedPermissions,
          final List<AppPermission> deniedPermissions,
          final List<AppPermission> permanentlyDeniedPermissions,
          final List<AppPermission> restrictedPermissions}) =
      _$MultiplePermissionResultImpl;
  const _MultiplePermissionResult._() : super._();

  @override
  Map<AppPermission, AppPermissionStatus> get results;
  @override
  List<AppPermission> get grantedPermissions;
  @override
  List<AppPermission> get deniedPermissions;
  @override
  List<AppPermission> get permanentlyDeniedPermissions;
  @override
  List<AppPermission> get restrictedPermissions;
  @override
  @JsonKey(ignore: true)
  _$$MultiplePermissionResultImplCopyWith<_$MultiplePermissionResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PermissionRequestConfig {
  AppPermission get permission => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get rationale => throw _privateConstructorUsedError;
  String get positiveButtonText => throw _privateConstructorUsedError;
  String get negativeButtonText => throw _privateConstructorUsedError;
  bool get showRationale => throw _privateConstructorUsedError;
  bool get openSettingsOnDenied => throw _privateConstructorUsedError;
  bool get showInAppSettings => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PermissionRequestConfigCopyWith<PermissionRequestConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionRequestConfigCopyWith<$Res> {
  factory $PermissionRequestConfigCopyWith(PermissionRequestConfig value,
          $Res Function(PermissionRequestConfig) then) =
      _$PermissionRequestConfigCopyWithImpl<$Res, PermissionRequestConfig>;
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
class _$PermissionRequestConfigCopyWithImpl<$Res,
        $Val extends PermissionRequestConfig>
    implements $PermissionRequestConfigCopyWith<$Res> {
  _$PermissionRequestConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      permission: null == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as AppPermission,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      rationale: null == rationale
          ? _value.rationale
          : rationale // ignore: cast_nullable_to_non_nullable
              as String,
      positiveButtonText: null == positiveButtonText
          ? _value.positiveButtonText
          : positiveButtonText // ignore: cast_nullable_to_non_nullable
              as String,
      negativeButtonText: null == negativeButtonText
          ? _value.negativeButtonText
          : negativeButtonText // ignore: cast_nullable_to_non_nullable
              as String,
      showRationale: null == showRationale
          ? _value.showRationale
          : showRationale // ignore: cast_nullable_to_non_nullable
              as bool,
      openSettingsOnDenied: null == openSettingsOnDenied
          ? _value.openSettingsOnDenied
          : openSettingsOnDenied // ignore: cast_nullable_to_non_nullable
              as bool,
      showInAppSettings: null == showInAppSettings
          ? _value.showInAppSettings
          : showInAppSettings // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PermissionRequestConfigImplCopyWith<$Res>
    implements $PermissionRequestConfigCopyWith<$Res> {
  factory _$$PermissionRequestConfigImplCopyWith(
          _$PermissionRequestConfigImpl value,
          $Res Function(_$PermissionRequestConfigImpl) then) =
      __$$PermissionRequestConfigImplCopyWithImpl<$Res>;
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
class __$$PermissionRequestConfigImplCopyWithImpl<$Res>
    extends _$PermissionRequestConfigCopyWithImpl<$Res,
        _$PermissionRequestConfigImpl>
    implements _$$PermissionRequestConfigImplCopyWith<$Res> {
  __$$PermissionRequestConfigImplCopyWithImpl(
      _$PermissionRequestConfigImpl _value,
      $Res Function(_$PermissionRequestConfigImpl) _then)
      : super(_value, _then);

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
    return _then(_$PermissionRequestConfigImpl(
      permission: null == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as AppPermission,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      rationale: null == rationale
          ? _value.rationale
          : rationale // ignore: cast_nullable_to_non_nullable
              as String,
      positiveButtonText: null == positiveButtonText
          ? _value.positiveButtonText
          : positiveButtonText // ignore: cast_nullable_to_non_nullable
              as String,
      negativeButtonText: null == negativeButtonText
          ? _value.negativeButtonText
          : negativeButtonText // ignore: cast_nullable_to_non_nullable
              as String,
      showRationale: null == showRationale
          ? _value.showRationale
          : showRationale // ignore: cast_nullable_to_non_nullable
              as bool,
      openSettingsOnDenied: null == openSettingsOnDenied
          ? _value.openSettingsOnDenied
          : openSettingsOnDenied // ignore: cast_nullable_to_non_nullable
              as bool,
      showInAppSettings: null == showInAppSettings
          ? _value.showInAppSettings
          : showInAppSettings // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PermissionRequestConfigImpl implements _PermissionRequestConfig {
  const _$PermissionRequestConfigImpl(
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

  @override
  String toString() {
    return 'PermissionRequestConfig(permission: $permission, title: $title, description: $description, rationale: $rationale, positiveButtonText: $positiveButtonText, negativeButtonText: $negativeButtonText, showRationale: $showRationale, openSettingsOnDenied: $openSettingsOnDenied, showInAppSettings: $showInAppSettings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionRequestConfigImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionRequestConfigImplCopyWith<_$PermissionRequestConfigImpl>
      get copyWith => __$$PermissionRequestConfigImplCopyWithImpl<
          _$PermissionRequestConfigImpl>(this, _$identity);
}

abstract class _PermissionRequestConfig implements PermissionRequestConfig {
  const factory _PermissionRequestConfig(
      {required final AppPermission permission,
      final String title,
      final String description,
      final String rationale,
      final String positiveButtonText,
      final String negativeButtonText,
      final bool showRationale,
      final bool openSettingsOnDenied,
      final bool showInAppSettings}) = _$PermissionRequestConfigImpl;

  @override
  AppPermission get permission;
  @override
  String get title;
  @override
  String get description;
  @override
  String get rationale;
  @override
  String get positiveButtonText;
  @override
  String get negativeButtonText;
  @override
  bool get showRationale;
  @override
  bool get openSettingsOnDenied;
  @override
  bool get showInAppSettings;
  @override
  @JsonKey(ignore: true)
  _$$PermissionRequestConfigImplCopyWith<_$PermissionRequestConfigImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BatchPermissionRequestConfig {
  List<AppPermission> get permissions => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get positiveButtonText => throw _privateConstructorUsedError;
  String get negativeButtonText => throw _privateConstructorUsedError;
  bool get showRationale => throw _privateConstructorUsedError;
  bool get openSettingsOnDenied => throw _privateConstructorUsedError;
  bool get continueOnPartialGrant => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BatchPermissionRequestConfigCopyWith<BatchPermissionRequestConfig>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BatchPermissionRequestConfigCopyWith<$Res> {
  factory $BatchPermissionRequestConfigCopyWith(
          BatchPermissionRequestConfig value,
          $Res Function(BatchPermissionRequestConfig) then) =
      _$BatchPermissionRequestConfigCopyWithImpl<$Res,
          BatchPermissionRequestConfig>;
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
class _$BatchPermissionRequestConfigCopyWithImpl<$Res,
        $Val extends BatchPermissionRequestConfig>
    implements $BatchPermissionRequestConfigCopyWith<$Res> {
  _$BatchPermissionRequestConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<AppPermission>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      positiveButtonText: null == positiveButtonText
          ? _value.positiveButtonText
          : positiveButtonText // ignore: cast_nullable_to_non_nullable
              as String,
      negativeButtonText: null == negativeButtonText
          ? _value.negativeButtonText
          : negativeButtonText // ignore: cast_nullable_to_non_nullable
              as String,
      showRationale: null == showRationale
          ? _value.showRationale
          : showRationale // ignore: cast_nullable_to_non_nullable
              as bool,
      openSettingsOnDenied: null == openSettingsOnDenied
          ? _value.openSettingsOnDenied
          : openSettingsOnDenied // ignore: cast_nullable_to_non_nullable
              as bool,
      continueOnPartialGrant: null == continueOnPartialGrant
          ? _value.continueOnPartialGrant
          : continueOnPartialGrant // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BatchPermissionRequestConfigImplCopyWith<$Res>
    implements $BatchPermissionRequestConfigCopyWith<$Res> {
  factory _$$BatchPermissionRequestConfigImplCopyWith(
          _$BatchPermissionRequestConfigImpl value,
          $Res Function(_$BatchPermissionRequestConfigImpl) then) =
      __$$BatchPermissionRequestConfigImplCopyWithImpl<$Res>;
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
class __$$BatchPermissionRequestConfigImplCopyWithImpl<$Res>
    extends _$BatchPermissionRequestConfigCopyWithImpl<$Res,
        _$BatchPermissionRequestConfigImpl>
    implements _$$BatchPermissionRequestConfigImplCopyWith<$Res> {
  __$$BatchPermissionRequestConfigImplCopyWithImpl(
      _$BatchPermissionRequestConfigImpl _value,
      $Res Function(_$BatchPermissionRequestConfigImpl) _then)
      : super(_value, _then);

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
    return _then(_$BatchPermissionRequestConfigImpl(
      permissions: null == permissions
          ? _value._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<AppPermission>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      positiveButtonText: null == positiveButtonText
          ? _value.positiveButtonText
          : positiveButtonText // ignore: cast_nullable_to_non_nullable
              as String,
      negativeButtonText: null == negativeButtonText
          ? _value.negativeButtonText
          : negativeButtonText // ignore: cast_nullable_to_non_nullable
              as String,
      showRationale: null == showRationale
          ? _value.showRationale
          : showRationale // ignore: cast_nullable_to_non_nullable
              as bool,
      openSettingsOnDenied: null == openSettingsOnDenied
          ? _value.openSettingsOnDenied
          : openSettingsOnDenied // ignore: cast_nullable_to_non_nullable
              as bool,
      continueOnPartialGrant: null == continueOnPartialGrant
          ? _value.continueOnPartialGrant
          : continueOnPartialGrant // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BatchPermissionRequestConfigImpl
    implements _BatchPermissionRequestConfig {
  const _$BatchPermissionRequestConfigImpl(
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

  @override
  String toString() {
    return 'BatchPermissionRequestConfig(permissions: $permissions, title: $title, description: $description, positiveButtonText: $positiveButtonText, negativeButtonText: $negativeButtonText, showRationale: $showRationale, openSettingsOnDenied: $openSettingsOnDenied, continueOnPartialGrant: $continueOnPartialGrant)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BatchPermissionRequestConfigImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BatchPermissionRequestConfigImplCopyWith<
          _$BatchPermissionRequestConfigImpl>
      get copyWith => __$$BatchPermissionRequestConfigImplCopyWithImpl<
          _$BatchPermissionRequestConfigImpl>(this, _$identity);
}

abstract class _BatchPermissionRequestConfig
    implements BatchPermissionRequestConfig {
  const factory _BatchPermissionRequestConfig(
      {required final List<AppPermission> permissions,
      final String title,
      final String description,
      final String positiveButtonText,
      final String negativeButtonText,
      final bool showRationale,
      final bool openSettingsOnDenied,
      final bool continueOnPartialGrant}) = _$BatchPermissionRequestConfigImpl;

  @override
  List<AppPermission> get permissions;
  @override
  String get title;
  @override
  String get description;
  @override
  String get positiveButtonText;
  @override
  String get negativeButtonText;
  @override
  bool get showRationale;
  @override
  bool get openSettingsOnDenied;
  @override
  bool get continueOnPartialGrant;
  @override
  @JsonKey(ignore: true)
  _$$BatchPermissionRequestConfigImplCopyWith<
          _$BatchPermissionRequestConfigImpl>
      get copyWith => throw _privateConstructorUsedError;
}
