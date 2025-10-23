// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SyncEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SyncEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SyncEvent()';
  }
}

/// @nodoc
class $SyncEventCopyWith<$Res> {
  $SyncEventCopyWith(SyncEvent _, $Res Function(SyncEvent) __);
}

/// Adds pattern-matching-related methods to [SyncEvent].
extension SyncEventPatterns on SyncEvent {
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
    TResult Function(_Started value)? started,
    TResult Function(_SyncRequested value)? syncRequested,
    TResult Function(_SyncCompleted value)? syncCompleted,
    TResult Function(_SyncFailed value)? syncFailed,
    TResult Function(_PendingChangesDetected value)? pendingChangesDetected,
    TResult Function(_AutoSyncTriggered value)? autoSyncTriggered,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _SyncRequested() when syncRequested != null:
        return syncRequested(_that);
      case _SyncCompleted() when syncCompleted != null:
        return syncCompleted(_that);
      case _SyncFailed() when syncFailed != null:
        return syncFailed(_that);
      case _PendingChangesDetected() when pendingChangesDetected != null:
        return pendingChangesDetected(_that);
      case _AutoSyncTriggered() when autoSyncTriggered != null:
        return autoSyncTriggered(_that);
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
    required TResult Function(_Started value) started,
    required TResult Function(_SyncRequested value) syncRequested,
    required TResult Function(_SyncCompleted value) syncCompleted,
    required TResult Function(_SyncFailed value) syncFailed,
    required TResult Function(_PendingChangesDetected value)
        pendingChangesDetected,
    required TResult Function(_AutoSyncTriggered value) autoSyncTriggered,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started(_that);
      case _SyncRequested():
        return syncRequested(_that);
      case _SyncCompleted():
        return syncCompleted(_that);
      case _SyncFailed():
        return syncFailed(_that);
      case _PendingChangesDetected():
        return pendingChangesDetected(_that);
      case _AutoSyncTriggered():
        return autoSyncTriggered(_that);
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
    TResult? Function(_Started value)? started,
    TResult? Function(_SyncRequested value)? syncRequested,
    TResult? Function(_SyncCompleted value)? syncCompleted,
    TResult? Function(_SyncFailed value)? syncFailed,
    TResult? Function(_PendingChangesDetected value)? pendingChangesDetected,
    TResult? Function(_AutoSyncTriggered value)? autoSyncTriggered,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _SyncRequested() when syncRequested != null:
        return syncRequested(_that);
      case _SyncCompleted() when syncCompleted != null:
        return syncCompleted(_that);
      case _SyncFailed() when syncFailed != null:
        return syncFailed(_that);
      case _PendingChangesDetected() when pendingChangesDetected != null:
        return pendingChangesDetected(_that);
      case _AutoSyncTriggered() when autoSyncTriggered != null:
        return autoSyncTriggered(_that);
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
    TResult Function()? started,
    TResult Function()? syncRequested,
    TResult Function()? syncCompleted,
    TResult Function(String error)? syncFailed,
    TResult Function(int count)? pendingChangesDetected,
    TResult Function()? autoSyncTriggered,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case _SyncRequested() when syncRequested != null:
        return syncRequested();
      case _SyncCompleted() when syncCompleted != null:
        return syncCompleted();
      case _SyncFailed() when syncFailed != null:
        return syncFailed(_that.error);
      case _PendingChangesDetected() when pendingChangesDetected != null:
        return pendingChangesDetected(_that.count);
      case _AutoSyncTriggered() when autoSyncTriggered != null:
        return autoSyncTriggered();
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
    required TResult Function() started,
    required TResult Function() syncRequested,
    required TResult Function() syncCompleted,
    required TResult Function(String error) syncFailed,
    required TResult Function(int count) pendingChangesDetected,
    required TResult Function() autoSyncTriggered,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started();
      case _SyncRequested():
        return syncRequested();
      case _SyncCompleted():
        return syncCompleted();
      case _SyncFailed():
        return syncFailed(_that.error);
      case _PendingChangesDetected():
        return pendingChangesDetected(_that.count);
      case _AutoSyncTriggered():
        return autoSyncTriggered();
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
    TResult? Function()? started,
    TResult? Function()? syncRequested,
    TResult? Function()? syncCompleted,
    TResult? Function(String error)? syncFailed,
    TResult? Function(int count)? pendingChangesDetected,
    TResult? Function()? autoSyncTriggered,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case _SyncRequested() when syncRequested != null:
        return syncRequested();
      case _SyncCompleted() when syncCompleted != null:
        return syncCompleted();
      case _SyncFailed() when syncFailed != null:
        return syncFailed(_that.error);
      case _PendingChangesDetected() when pendingChangesDetected != null:
        return pendingChangesDetected(_that.count);
      case _AutoSyncTriggered() when autoSyncTriggered != null:
        return autoSyncTriggered();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Started implements SyncEvent {
  const _Started();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SyncEvent.started()';
  }
}

/// @nodoc

class _SyncRequested implements SyncEvent {
  const _SyncRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SyncRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SyncEvent.syncRequested()';
  }
}

/// @nodoc

class _SyncCompleted implements SyncEvent {
  const _SyncCompleted();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SyncCompleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SyncEvent.syncCompleted()';
  }
}

/// @nodoc

class _SyncFailed implements SyncEvent {
  const _SyncFailed(this.error);

  final String error;

  /// Create a copy of SyncEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SyncFailedCopyWith<_SyncFailed> get copyWith =>
      __$SyncFailedCopyWithImpl<_SyncFailed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SyncFailed &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'SyncEvent.syncFailed(error: $error)';
  }
}

/// @nodoc
abstract mixin class _$SyncFailedCopyWith<$Res>
    implements $SyncEventCopyWith<$Res> {
  factory _$SyncFailedCopyWith(
          _SyncFailed value, $Res Function(_SyncFailed) _then) =
      __$SyncFailedCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$SyncFailedCopyWithImpl<$Res> implements _$SyncFailedCopyWith<$Res> {
  __$SyncFailedCopyWithImpl(this._self, this._then);

  final _SyncFailed _self;
  final $Res Function(_SyncFailed) _then;

  /// Create a copy of SyncEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(_SyncFailed(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _PendingChangesDetected implements SyncEvent {
  const _PendingChangesDetected(this.count);

  final int count;

  /// Create a copy of SyncEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PendingChangesDetectedCopyWith<_PendingChangesDetected> get copyWith =>
      __$PendingChangesDetectedCopyWithImpl<_PendingChangesDetected>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PendingChangesDetected &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, count);

  @override
  String toString() {
    return 'SyncEvent.pendingChangesDetected(count: $count)';
  }
}

/// @nodoc
abstract mixin class _$PendingChangesDetectedCopyWith<$Res>
    implements $SyncEventCopyWith<$Res> {
  factory _$PendingChangesDetectedCopyWith(_PendingChangesDetected value,
          $Res Function(_PendingChangesDetected) _then) =
      __$PendingChangesDetectedCopyWithImpl;
  @useResult
  $Res call({int count});
}

/// @nodoc
class __$PendingChangesDetectedCopyWithImpl<$Res>
    implements _$PendingChangesDetectedCopyWith<$Res> {
  __$PendingChangesDetectedCopyWithImpl(this._self, this._then);

  final _PendingChangesDetected _self;
  final $Res Function(_PendingChangesDetected) _then;

  /// Create a copy of SyncEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? count = null,
  }) {
    return _then(_PendingChangesDetected(
      null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _AutoSyncTriggered implements SyncEvent {
  const _AutoSyncTriggered();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _AutoSyncTriggered);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SyncEvent.autoSyncTriggered()';
  }
}

// dart format on
