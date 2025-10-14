// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connectivity_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConnectivityEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool isConnected) connectivityChanged,
    required TResult Function() checkConnectivity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool isConnected)? connectivityChanged,
    TResult? Function()? checkConnectivity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool isConnected)? connectivityChanged,
    TResult Function()? checkConnectivity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ConnectivityChanged value) connectivityChanged,
    required TResult Function(_CheckConnectivity value) checkConnectivity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ConnectivityChanged value)? connectivityChanged,
    TResult? Function(_CheckConnectivity value)? checkConnectivity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ConnectivityChanged value)? connectivityChanged,
    TResult Function(_CheckConnectivity value)? checkConnectivity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectivityEventCopyWith<$Res> {
  factory $ConnectivityEventCopyWith(
          ConnectivityEvent value, $Res Function(ConnectivityEvent) then) =
      _$ConnectivityEventCopyWithImpl<$Res, ConnectivityEvent>;
}

/// @nodoc
class _$ConnectivityEventCopyWithImpl<$Res, $Val extends ConnectivityEvent>
    implements $ConnectivityEventCopyWith<$Res> {
  _$ConnectivityEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$ConnectivityEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'ConnectivityEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool isConnected) connectivityChanged,
    required TResult Function() checkConnectivity,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool isConnected)? connectivityChanged,
    TResult? Function()? checkConnectivity,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool isConnected)? connectivityChanged,
    TResult Function()? checkConnectivity,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ConnectivityChanged value) connectivityChanged,
    required TResult Function(_CheckConnectivity value) checkConnectivity,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ConnectivityChanged value)? connectivityChanged,
    TResult? Function(_CheckConnectivity value)? checkConnectivity,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ConnectivityChanged value)? connectivityChanged,
    TResult Function(_CheckConnectivity value)? checkConnectivity,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ConnectivityEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$ConnectivityChangedImplCopyWith<$Res> {
  factory _$$ConnectivityChangedImplCopyWith(_$ConnectivityChangedImpl value,
          $Res Function(_$ConnectivityChangedImpl) then) =
      __$$ConnectivityChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isConnected});
}

/// @nodoc
class __$$ConnectivityChangedImplCopyWithImpl<$Res>
    extends _$ConnectivityEventCopyWithImpl<$Res, _$ConnectivityChangedImpl>
    implements _$$ConnectivityChangedImplCopyWith<$Res> {
  __$$ConnectivityChangedImplCopyWithImpl(_$ConnectivityChangedImpl _value,
      $Res Function(_$ConnectivityChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isConnected = null,
  }) {
    return _then(_$ConnectivityChangedImpl(
      null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ConnectivityChangedImpl implements _ConnectivityChanged {
  const _$ConnectivityChangedImpl(this.isConnected);

  @override
  final bool isConnected;

  @override
  String toString() {
    return 'ConnectivityEvent.connectivityChanged(isConnected: $isConnected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectivityChangedImpl &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isConnected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectivityChangedImplCopyWith<_$ConnectivityChangedImpl> get copyWith =>
      __$$ConnectivityChangedImplCopyWithImpl<_$ConnectivityChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool isConnected) connectivityChanged,
    required TResult Function() checkConnectivity,
  }) {
    return connectivityChanged(isConnected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool isConnected)? connectivityChanged,
    TResult? Function()? checkConnectivity,
  }) {
    return connectivityChanged?.call(isConnected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool isConnected)? connectivityChanged,
    TResult Function()? checkConnectivity,
    required TResult orElse(),
  }) {
    if (connectivityChanged != null) {
      return connectivityChanged(isConnected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ConnectivityChanged value) connectivityChanged,
    required TResult Function(_CheckConnectivity value) checkConnectivity,
  }) {
    return connectivityChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ConnectivityChanged value)? connectivityChanged,
    TResult? Function(_CheckConnectivity value)? checkConnectivity,
  }) {
    return connectivityChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ConnectivityChanged value)? connectivityChanged,
    TResult Function(_CheckConnectivity value)? checkConnectivity,
    required TResult orElse(),
  }) {
    if (connectivityChanged != null) {
      return connectivityChanged(this);
    }
    return orElse();
  }
}

abstract class _ConnectivityChanged implements ConnectivityEvent {
  const factory _ConnectivityChanged(final bool isConnected) =
      _$ConnectivityChangedImpl;

  bool get isConnected;
  @JsonKey(ignore: true)
  _$$ConnectivityChangedImplCopyWith<_$ConnectivityChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckConnectivityImplCopyWith<$Res> {
  factory _$$CheckConnectivityImplCopyWith(_$CheckConnectivityImpl value,
          $Res Function(_$CheckConnectivityImpl) then) =
      __$$CheckConnectivityImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckConnectivityImplCopyWithImpl<$Res>
    extends _$ConnectivityEventCopyWithImpl<$Res, _$CheckConnectivityImpl>
    implements _$$CheckConnectivityImplCopyWith<$Res> {
  __$$CheckConnectivityImplCopyWithImpl(_$CheckConnectivityImpl _value,
      $Res Function(_$CheckConnectivityImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckConnectivityImpl implements _CheckConnectivity {
  const _$CheckConnectivityImpl();

  @override
  String toString() {
    return 'ConnectivityEvent.checkConnectivity()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckConnectivityImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool isConnected) connectivityChanged,
    required TResult Function() checkConnectivity,
  }) {
    return checkConnectivity();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool isConnected)? connectivityChanged,
    TResult? Function()? checkConnectivity,
  }) {
    return checkConnectivity?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool isConnected)? connectivityChanged,
    TResult Function()? checkConnectivity,
    required TResult orElse(),
  }) {
    if (checkConnectivity != null) {
      return checkConnectivity();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ConnectivityChanged value) connectivityChanged,
    required TResult Function(_CheckConnectivity value) checkConnectivity,
  }) {
    return checkConnectivity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ConnectivityChanged value)? connectivityChanged,
    TResult? Function(_CheckConnectivity value)? checkConnectivity,
  }) {
    return checkConnectivity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ConnectivityChanged value)? connectivityChanged,
    TResult Function(_CheckConnectivity value)? checkConnectivity,
    required TResult orElse(),
  }) {
    if (checkConnectivity != null) {
      return checkConnectivity(this);
    }
    return orElse();
  }
}

abstract class _CheckConnectivity implements ConnectivityEvent {
  const factory _CheckConnectivity() = _$CheckConnectivityImpl;
}
