// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SyncEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() syncRequested,
    required TResult Function() syncCompleted,
    required TResult Function(String error) syncFailed,
    required TResult Function(int count) pendingChangesDetected,
    required TResult Function() autoSyncTriggered,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? syncRequested,
    TResult? Function()? syncCompleted,
    TResult? Function(String error)? syncFailed,
    TResult? Function(int count)? pendingChangesDetected,
    TResult? Function()? autoSyncTriggered,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? syncRequested,
    TResult Function()? syncCompleted,
    TResult Function(String error)? syncFailed,
    TResult Function(int count)? pendingChangesDetected,
    TResult Function()? autoSyncTriggered,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SyncRequested value) syncRequested,
    required TResult Function(_SyncCompleted value) syncCompleted,
    required TResult Function(_SyncFailed value) syncFailed,
    required TResult Function(_PendingChangesDetected value)
        pendingChangesDetected,
    required TResult Function(_AutoSyncTriggered value) autoSyncTriggered,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SyncRequested value)? syncRequested,
    TResult? Function(_SyncCompleted value)? syncCompleted,
    TResult? Function(_SyncFailed value)? syncFailed,
    TResult? Function(_PendingChangesDetected value)? pendingChangesDetected,
    TResult? Function(_AutoSyncTriggered value)? autoSyncTriggered,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SyncRequested value)? syncRequested,
    TResult Function(_SyncCompleted value)? syncCompleted,
    TResult Function(_SyncFailed value)? syncFailed,
    TResult Function(_PendingChangesDetected value)? pendingChangesDetected,
    TResult Function(_AutoSyncTriggered value)? autoSyncTriggered,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncEventCopyWith<$Res> {
  factory $SyncEventCopyWith(SyncEvent value, $Res Function(SyncEvent) then) =
      _$SyncEventCopyWithImpl<$Res, SyncEvent>;
}

/// @nodoc
class _$SyncEventCopyWithImpl<$Res, $Val extends SyncEvent>
    implements $SyncEventCopyWith<$Res> {
  _$SyncEventCopyWithImpl(this._value, this._then);

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
    extends _$SyncEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'SyncEvent.started()';
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
    required TResult Function() syncRequested,
    required TResult Function() syncCompleted,
    required TResult Function(String error) syncFailed,
    required TResult Function(int count) pendingChangesDetected,
    required TResult Function() autoSyncTriggered,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? syncRequested,
    TResult? Function()? syncCompleted,
    TResult? Function(String error)? syncFailed,
    TResult? Function(int count)? pendingChangesDetected,
    TResult? Function()? autoSyncTriggered,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? syncRequested,
    TResult Function()? syncCompleted,
    TResult Function(String error)? syncFailed,
    TResult Function(int count)? pendingChangesDetected,
    TResult Function()? autoSyncTriggered,
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
    required TResult Function(_SyncRequested value) syncRequested,
    required TResult Function(_SyncCompleted value) syncCompleted,
    required TResult Function(_SyncFailed value) syncFailed,
    required TResult Function(_PendingChangesDetected value)
        pendingChangesDetected,
    required TResult Function(_AutoSyncTriggered value) autoSyncTriggered,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SyncRequested value)? syncRequested,
    TResult? Function(_SyncCompleted value)? syncCompleted,
    TResult? Function(_SyncFailed value)? syncFailed,
    TResult? Function(_PendingChangesDetected value)? pendingChangesDetected,
    TResult? Function(_AutoSyncTriggered value)? autoSyncTriggered,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SyncRequested value)? syncRequested,
    TResult Function(_SyncCompleted value)? syncCompleted,
    TResult Function(_SyncFailed value)? syncFailed,
    TResult Function(_PendingChangesDetected value)? pendingChangesDetected,
    TResult Function(_AutoSyncTriggered value)? autoSyncTriggered,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements SyncEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$SyncRequestedImplCopyWith<$Res> {
  factory _$$SyncRequestedImplCopyWith(
          _$SyncRequestedImpl value, $Res Function(_$SyncRequestedImpl) then) =
      __$$SyncRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncRequestedImplCopyWithImpl<$Res>
    extends _$SyncEventCopyWithImpl<$Res, _$SyncRequestedImpl>
    implements _$$SyncRequestedImplCopyWith<$Res> {
  __$$SyncRequestedImplCopyWithImpl(
      _$SyncRequestedImpl _value, $Res Function(_$SyncRequestedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SyncRequestedImpl implements _SyncRequested {
  const _$SyncRequestedImpl();

  @override
  String toString() {
    return 'SyncEvent.syncRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SyncRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() syncRequested,
    required TResult Function() syncCompleted,
    required TResult Function(String error) syncFailed,
    required TResult Function(int count) pendingChangesDetected,
    required TResult Function() autoSyncTriggered,
  }) {
    return syncRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? syncRequested,
    TResult? Function()? syncCompleted,
    TResult? Function(String error)? syncFailed,
    TResult? Function(int count)? pendingChangesDetected,
    TResult? Function()? autoSyncTriggered,
  }) {
    return syncRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? syncRequested,
    TResult Function()? syncCompleted,
    TResult Function(String error)? syncFailed,
    TResult Function(int count)? pendingChangesDetected,
    TResult Function()? autoSyncTriggered,
    required TResult orElse(),
  }) {
    if (syncRequested != null) {
      return syncRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SyncRequested value) syncRequested,
    required TResult Function(_SyncCompleted value) syncCompleted,
    required TResult Function(_SyncFailed value) syncFailed,
    required TResult Function(_PendingChangesDetected value)
        pendingChangesDetected,
    required TResult Function(_AutoSyncTriggered value) autoSyncTriggered,
  }) {
    return syncRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SyncRequested value)? syncRequested,
    TResult? Function(_SyncCompleted value)? syncCompleted,
    TResult? Function(_SyncFailed value)? syncFailed,
    TResult? Function(_PendingChangesDetected value)? pendingChangesDetected,
    TResult? Function(_AutoSyncTriggered value)? autoSyncTriggered,
  }) {
    return syncRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SyncRequested value)? syncRequested,
    TResult Function(_SyncCompleted value)? syncCompleted,
    TResult Function(_SyncFailed value)? syncFailed,
    TResult Function(_PendingChangesDetected value)? pendingChangesDetected,
    TResult Function(_AutoSyncTriggered value)? autoSyncTriggered,
    required TResult orElse(),
  }) {
    if (syncRequested != null) {
      return syncRequested(this);
    }
    return orElse();
  }
}

abstract class _SyncRequested implements SyncEvent {
  const factory _SyncRequested() = _$SyncRequestedImpl;
}

/// @nodoc
abstract class _$$SyncCompletedImplCopyWith<$Res> {
  factory _$$SyncCompletedImplCopyWith(
          _$SyncCompletedImpl value, $Res Function(_$SyncCompletedImpl) then) =
      __$$SyncCompletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncCompletedImplCopyWithImpl<$Res>
    extends _$SyncEventCopyWithImpl<$Res, _$SyncCompletedImpl>
    implements _$$SyncCompletedImplCopyWith<$Res> {
  __$$SyncCompletedImplCopyWithImpl(
      _$SyncCompletedImpl _value, $Res Function(_$SyncCompletedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SyncCompletedImpl implements _SyncCompleted {
  const _$SyncCompletedImpl();

  @override
  String toString() {
    return 'SyncEvent.syncCompleted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SyncCompletedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() syncRequested,
    required TResult Function() syncCompleted,
    required TResult Function(String error) syncFailed,
    required TResult Function(int count) pendingChangesDetected,
    required TResult Function() autoSyncTriggered,
  }) {
    return syncCompleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? syncRequested,
    TResult? Function()? syncCompleted,
    TResult? Function(String error)? syncFailed,
    TResult? Function(int count)? pendingChangesDetected,
    TResult? Function()? autoSyncTriggered,
  }) {
    return syncCompleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? syncRequested,
    TResult Function()? syncCompleted,
    TResult Function(String error)? syncFailed,
    TResult Function(int count)? pendingChangesDetected,
    TResult Function()? autoSyncTriggered,
    required TResult orElse(),
  }) {
    if (syncCompleted != null) {
      return syncCompleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SyncRequested value) syncRequested,
    required TResult Function(_SyncCompleted value) syncCompleted,
    required TResult Function(_SyncFailed value) syncFailed,
    required TResult Function(_PendingChangesDetected value)
        pendingChangesDetected,
    required TResult Function(_AutoSyncTriggered value) autoSyncTriggered,
  }) {
    return syncCompleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SyncRequested value)? syncRequested,
    TResult? Function(_SyncCompleted value)? syncCompleted,
    TResult? Function(_SyncFailed value)? syncFailed,
    TResult? Function(_PendingChangesDetected value)? pendingChangesDetected,
    TResult? Function(_AutoSyncTriggered value)? autoSyncTriggered,
  }) {
    return syncCompleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SyncRequested value)? syncRequested,
    TResult Function(_SyncCompleted value)? syncCompleted,
    TResult Function(_SyncFailed value)? syncFailed,
    TResult Function(_PendingChangesDetected value)? pendingChangesDetected,
    TResult Function(_AutoSyncTriggered value)? autoSyncTriggered,
    required TResult orElse(),
  }) {
    if (syncCompleted != null) {
      return syncCompleted(this);
    }
    return orElse();
  }
}

abstract class _SyncCompleted implements SyncEvent {
  const factory _SyncCompleted() = _$SyncCompletedImpl;
}

/// @nodoc
abstract class _$$SyncFailedImplCopyWith<$Res> {
  factory _$$SyncFailedImplCopyWith(
          _$SyncFailedImpl value, $Res Function(_$SyncFailedImpl) then) =
      __$$SyncFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$SyncFailedImplCopyWithImpl<$Res>
    extends _$SyncEventCopyWithImpl<$Res, _$SyncFailedImpl>
    implements _$$SyncFailedImplCopyWith<$Res> {
  __$$SyncFailedImplCopyWithImpl(
      _$SyncFailedImpl _value, $Res Function(_$SyncFailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$SyncFailedImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SyncFailedImpl implements _SyncFailed {
  const _$SyncFailedImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'SyncEvent.syncFailed(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncFailedImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncFailedImplCopyWith<_$SyncFailedImpl> get copyWith =>
      __$$SyncFailedImplCopyWithImpl<_$SyncFailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() syncRequested,
    required TResult Function() syncCompleted,
    required TResult Function(String error) syncFailed,
    required TResult Function(int count) pendingChangesDetected,
    required TResult Function() autoSyncTriggered,
  }) {
    return syncFailed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? syncRequested,
    TResult? Function()? syncCompleted,
    TResult? Function(String error)? syncFailed,
    TResult? Function(int count)? pendingChangesDetected,
    TResult? Function()? autoSyncTriggered,
  }) {
    return syncFailed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? syncRequested,
    TResult Function()? syncCompleted,
    TResult Function(String error)? syncFailed,
    TResult Function(int count)? pendingChangesDetected,
    TResult Function()? autoSyncTriggered,
    required TResult orElse(),
  }) {
    if (syncFailed != null) {
      return syncFailed(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SyncRequested value) syncRequested,
    required TResult Function(_SyncCompleted value) syncCompleted,
    required TResult Function(_SyncFailed value) syncFailed,
    required TResult Function(_PendingChangesDetected value)
        pendingChangesDetected,
    required TResult Function(_AutoSyncTriggered value) autoSyncTriggered,
  }) {
    return syncFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SyncRequested value)? syncRequested,
    TResult? Function(_SyncCompleted value)? syncCompleted,
    TResult? Function(_SyncFailed value)? syncFailed,
    TResult? Function(_PendingChangesDetected value)? pendingChangesDetected,
    TResult? Function(_AutoSyncTriggered value)? autoSyncTriggered,
  }) {
    return syncFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SyncRequested value)? syncRequested,
    TResult Function(_SyncCompleted value)? syncCompleted,
    TResult Function(_SyncFailed value)? syncFailed,
    TResult Function(_PendingChangesDetected value)? pendingChangesDetected,
    TResult Function(_AutoSyncTriggered value)? autoSyncTriggered,
    required TResult orElse(),
  }) {
    if (syncFailed != null) {
      return syncFailed(this);
    }
    return orElse();
  }
}

abstract class _SyncFailed implements SyncEvent {
  const factory _SyncFailed(final String error) = _$SyncFailedImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$SyncFailedImplCopyWith<_$SyncFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PendingChangesDetectedImplCopyWith<$Res> {
  factory _$$PendingChangesDetectedImplCopyWith(
          _$PendingChangesDetectedImpl value,
          $Res Function(_$PendingChangesDetectedImpl) then) =
      __$$PendingChangesDetectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int count});
}

/// @nodoc
class __$$PendingChangesDetectedImplCopyWithImpl<$Res>
    extends _$SyncEventCopyWithImpl<$Res, _$PendingChangesDetectedImpl>
    implements _$$PendingChangesDetectedImplCopyWith<$Res> {
  __$$PendingChangesDetectedImplCopyWithImpl(
      _$PendingChangesDetectedImpl _value,
      $Res Function(_$PendingChangesDetectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
  }) {
    return _then(_$PendingChangesDetectedImpl(
      null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PendingChangesDetectedImpl implements _PendingChangesDetected {
  const _$PendingChangesDetectedImpl(this.count);

  @override
  final int count;

  @override
  String toString() {
    return 'SyncEvent.pendingChangesDetected(count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PendingChangesDetectedImpl &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PendingChangesDetectedImplCopyWith<_$PendingChangesDetectedImpl>
      get copyWith => __$$PendingChangesDetectedImplCopyWithImpl<
          _$PendingChangesDetectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() syncRequested,
    required TResult Function() syncCompleted,
    required TResult Function(String error) syncFailed,
    required TResult Function(int count) pendingChangesDetected,
    required TResult Function() autoSyncTriggered,
  }) {
    return pendingChangesDetected(count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? syncRequested,
    TResult? Function()? syncCompleted,
    TResult? Function(String error)? syncFailed,
    TResult? Function(int count)? pendingChangesDetected,
    TResult? Function()? autoSyncTriggered,
  }) {
    return pendingChangesDetected?.call(count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? syncRequested,
    TResult Function()? syncCompleted,
    TResult Function(String error)? syncFailed,
    TResult Function(int count)? pendingChangesDetected,
    TResult Function()? autoSyncTriggered,
    required TResult orElse(),
  }) {
    if (pendingChangesDetected != null) {
      return pendingChangesDetected(count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SyncRequested value) syncRequested,
    required TResult Function(_SyncCompleted value) syncCompleted,
    required TResult Function(_SyncFailed value) syncFailed,
    required TResult Function(_PendingChangesDetected value)
        pendingChangesDetected,
    required TResult Function(_AutoSyncTriggered value) autoSyncTriggered,
  }) {
    return pendingChangesDetected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SyncRequested value)? syncRequested,
    TResult? Function(_SyncCompleted value)? syncCompleted,
    TResult? Function(_SyncFailed value)? syncFailed,
    TResult? Function(_PendingChangesDetected value)? pendingChangesDetected,
    TResult? Function(_AutoSyncTriggered value)? autoSyncTriggered,
  }) {
    return pendingChangesDetected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SyncRequested value)? syncRequested,
    TResult Function(_SyncCompleted value)? syncCompleted,
    TResult Function(_SyncFailed value)? syncFailed,
    TResult Function(_PendingChangesDetected value)? pendingChangesDetected,
    TResult Function(_AutoSyncTriggered value)? autoSyncTriggered,
    required TResult orElse(),
  }) {
    if (pendingChangesDetected != null) {
      return pendingChangesDetected(this);
    }
    return orElse();
  }
}

abstract class _PendingChangesDetected implements SyncEvent {
  const factory _PendingChangesDetected(final int count) =
      _$PendingChangesDetectedImpl;

  int get count;
  @JsonKey(ignore: true)
  _$$PendingChangesDetectedImplCopyWith<_$PendingChangesDetectedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AutoSyncTriggeredImplCopyWith<$Res> {
  factory _$$AutoSyncTriggeredImplCopyWith(_$AutoSyncTriggeredImpl value,
          $Res Function(_$AutoSyncTriggeredImpl) then) =
      __$$AutoSyncTriggeredImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AutoSyncTriggeredImplCopyWithImpl<$Res>
    extends _$SyncEventCopyWithImpl<$Res, _$AutoSyncTriggeredImpl>
    implements _$$AutoSyncTriggeredImplCopyWith<$Res> {
  __$$AutoSyncTriggeredImplCopyWithImpl(_$AutoSyncTriggeredImpl _value,
      $Res Function(_$AutoSyncTriggeredImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AutoSyncTriggeredImpl implements _AutoSyncTriggered {
  const _$AutoSyncTriggeredImpl();

  @override
  String toString() {
    return 'SyncEvent.autoSyncTriggered()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AutoSyncTriggeredImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() syncRequested,
    required TResult Function() syncCompleted,
    required TResult Function(String error) syncFailed,
    required TResult Function(int count) pendingChangesDetected,
    required TResult Function() autoSyncTriggered,
  }) {
    return autoSyncTriggered();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? syncRequested,
    TResult? Function()? syncCompleted,
    TResult? Function(String error)? syncFailed,
    TResult? Function(int count)? pendingChangesDetected,
    TResult? Function()? autoSyncTriggered,
  }) {
    return autoSyncTriggered?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? syncRequested,
    TResult Function()? syncCompleted,
    TResult Function(String error)? syncFailed,
    TResult Function(int count)? pendingChangesDetected,
    TResult Function()? autoSyncTriggered,
    required TResult orElse(),
  }) {
    if (autoSyncTriggered != null) {
      return autoSyncTriggered();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SyncRequested value) syncRequested,
    required TResult Function(_SyncCompleted value) syncCompleted,
    required TResult Function(_SyncFailed value) syncFailed,
    required TResult Function(_PendingChangesDetected value)
        pendingChangesDetected,
    required TResult Function(_AutoSyncTriggered value) autoSyncTriggered,
  }) {
    return autoSyncTriggered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SyncRequested value)? syncRequested,
    TResult? Function(_SyncCompleted value)? syncCompleted,
    TResult? Function(_SyncFailed value)? syncFailed,
    TResult? Function(_PendingChangesDetected value)? pendingChangesDetected,
    TResult? Function(_AutoSyncTriggered value)? autoSyncTriggered,
  }) {
    return autoSyncTriggered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SyncRequested value)? syncRequested,
    TResult Function(_SyncCompleted value)? syncCompleted,
    TResult Function(_SyncFailed value)? syncFailed,
    TResult Function(_PendingChangesDetected value)? pendingChangesDetected,
    TResult Function(_AutoSyncTriggered value)? autoSyncTriggered,
    required TResult orElse(),
  }) {
    if (autoSyncTriggered != null) {
      return autoSyncTriggered(this);
    }
    return orElse();
  }
}

abstract class _AutoSyncTriggered implements SyncEvent {
  const factory _AutoSyncTriggered() = _$AutoSyncTriggeredImpl;
}
