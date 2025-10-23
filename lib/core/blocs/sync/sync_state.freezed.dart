// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SyncState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SyncState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SyncState()';
  }
}

/// @nodoc
class $SyncStateCopyWith<$Res> {
  $SyncStateCopyWith(SyncState _, $Res Function(SyncState) __);
}

/// Adds pattern-matching-related methods to [SyncState].
extension SyncStatePatterns on SyncState {
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
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Synced value)? synced,
    TResult Function(_SyncFailed value)? syncFailed,
    TResult Function(_PendingSync value)? pendingSync,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Syncing() when syncing != null:
        return syncing(_that);
      case _Synced() when synced != null:
        return synced(_that);
      case _SyncFailed() when syncFailed != null:
        return syncFailed(_that);
      case _PendingSync() when pendingSync != null:
        return pendingSync(_that);
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
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Synced value) synced,
    required TResult Function(_SyncFailed value) syncFailed,
    required TResult Function(_PendingSync value) pendingSync,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Syncing():
        return syncing(_that);
      case _Synced():
        return synced(_that);
      case _SyncFailed():
        return syncFailed(_that);
      case _PendingSync():
        return pendingSync(_that);
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
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Synced value)? synced,
    TResult? Function(_SyncFailed value)? syncFailed,
    TResult? Function(_PendingSync value)? pendingSync,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Syncing() when syncing != null:
        return syncing(_that);
      case _Synced() when synced != null:
        return synced(_that);
      case _SyncFailed() when syncFailed != null:
        return syncFailed(_that);
      case _PendingSync() when pendingSync != null:
        return pendingSync(_that);
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
    TResult Function(int totalItems, int syncedItems, String? currentItem)?
        syncing,
    TResult Function(DateTime lastSyncTime, int syncedItems)? synced,
    TResult Function(String error, DateTime failedAt, int pendingItems)?
        syncFailed,
    TResult Function(int pendingItems, DateTime? lastSyncTime)? pendingSync,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Syncing() when syncing != null:
        return syncing(_that.totalItems, _that.syncedItems, _that.currentItem);
      case _Synced() when synced != null:
        return synced(_that.lastSyncTime, _that.syncedItems);
      case _SyncFailed() when syncFailed != null:
        return syncFailed(_that.error, _that.failedAt, _that.pendingItems);
      case _PendingSync() when pendingSync != null:
        return pendingSync(_that.pendingItems, _that.lastSyncTime);
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
    required TResult Function(
            int totalItems, int syncedItems, String? currentItem)
        syncing,
    required TResult Function(DateTime lastSyncTime, int syncedItems) synced,
    required TResult Function(String error, DateTime failedAt, int pendingItems)
        syncFailed,
    required TResult Function(int pendingItems, DateTime? lastSyncTime)
        pendingSync,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Syncing():
        return syncing(_that.totalItems, _that.syncedItems, _that.currentItem);
      case _Synced():
        return synced(_that.lastSyncTime, _that.syncedItems);
      case _SyncFailed():
        return syncFailed(_that.error, _that.failedAt, _that.pendingItems);
      case _PendingSync():
        return pendingSync(_that.pendingItems, _that.lastSyncTime);
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
    TResult? Function(int totalItems, int syncedItems, String? currentItem)?
        syncing,
    TResult? Function(DateTime lastSyncTime, int syncedItems)? synced,
    TResult? Function(String error, DateTime failedAt, int pendingItems)?
        syncFailed,
    TResult? Function(int pendingItems, DateTime? lastSyncTime)? pendingSync,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Syncing() when syncing != null:
        return syncing(_that.totalItems, _that.syncedItems, _that.currentItem);
      case _Synced() when synced != null:
        return synced(_that.lastSyncTime, _that.syncedItems);
      case _SyncFailed() when syncFailed != null:
        return syncFailed(_that.error, _that.failedAt, _that.pendingItems);
      case _PendingSync() when pendingSync != null:
        return pendingSync(_that.pendingItems, _that.lastSyncTime);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements SyncState {
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
    return 'SyncState.initial()';
  }
}

/// @nodoc

class _Syncing implements SyncState {
  const _Syncing(
      {required this.totalItems, required this.syncedItems, this.currentItem});

  final int totalItems;
  final int syncedItems;
  final String? currentItem;

  /// Create a copy of SyncState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SyncingCopyWith<_Syncing> get copyWith =>
      __$SyncingCopyWithImpl<_Syncing>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Syncing &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            (identical(other.syncedItems, syncedItems) ||
                other.syncedItems == syncedItems) &&
            (identical(other.currentItem, currentItem) ||
                other.currentItem == currentItem));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, totalItems, syncedItems, currentItem);

  @override
  String toString() {
    return 'SyncState.syncing(totalItems: $totalItems, syncedItems: $syncedItems, currentItem: $currentItem)';
  }
}

/// @nodoc
abstract mixin class _$SyncingCopyWith<$Res>
    implements $SyncStateCopyWith<$Res> {
  factory _$SyncingCopyWith(_Syncing value, $Res Function(_Syncing) _then) =
      __$SyncingCopyWithImpl;
  @useResult
  $Res call({int totalItems, int syncedItems, String? currentItem});
}

/// @nodoc
class __$SyncingCopyWithImpl<$Res> implements _$SyncingCopyWith<$Res> {
  __$SyncingCopyWithImpl(this._self, this._then);

  final _Syncing _self;
  final $Res Function(_Syncing) _then;

  /// Create a copy of SyncState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalItems = null,
    Object? syncedItems = null,
    Object? currentItem = freezed,
  }) {
    return _then(_Syncing(
      totalItems: null == totalItems
          ? _self.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      syncedItems: null == syncedItems
          ? _self.syncedItems
          : syncedItems // ignore: cast_nullable_to_non_nullable
              as int,
      currentItem: freezed == currentItem
          ? _self.currentItem
          : currentItem // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _Synced implements SyncState {
  const _Synced({required this.lastSyncTime, required this.syncedItems});

  final DateTime lastSyncTime;
  final int syncedItems;

  /// Create a copy of SyncState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SyncedCopyWith<_Synced> get copyWith =>
      __$SyncedCopyWithImpl<_Synced>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Synced &&
            (identical(other.lastSyncTime, lastSyncTime) ||
                other.lastSyncTime == lastSyncTime) &&
            (identical(other.syncedItems, syncedItems) ||
                other.syncedItems == syncedItems));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lastSyncTime, syncedItems);

  @override
  String toString() {
    return 'SyncState.synced(lastSyncTime: $lastSyncTime, syncedItems: $syncedItems)';
  }
}

/// @nodoc
abstract mixin class _$SyncedCopyWith<$Res>
    implements $SyncStateCopyWith<$Res> {
  factory _$SyncedCopyWith(_Synced value, $Res Function(_Synced) _then) =
      __$SyncedCopyWithImpl;
  @useResult
  $Res call({DateTime lastSyncTime, int syncedItems});
}

/// @nodoc
class __$SyncedCopyWithImpl<$Res> implements _$SyncedCopyWith<$Res> {
  __$SyncedCopyWithImpl(this._self, this._then);

  final _Synced _self;
  final $Res Function(_Synced) _then;

  /// Create a copy of SyncState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lastSyncTime = null,
    Object? syncedItems = null,
  }) {
    return _then(_Synced(
      lastSyncTime: null == lastSyncTime
          ? _self.lastSyncTime
          : lastSyncTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      syncedItems: null == syncedItems
          ? _self.syncedItems
          : syncedItems // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _SyncFailed implements SyncState {
  const _SyncFailed(
      {required this.error,
      required this.failedAt,
      required this.pendingItems});

  final String error;
  final DateTime failedAt;
  final int pendingItems;

  /// Create a copy of SyncState
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
            (identical(other.error, error) || other.error == error) &&
            (identical(other.failedAt, failedAt) ||
                other.failedAt == failedAt) &&
            (identical(other.pendingItems, pendingItems) ||
                other.pendingItems == pendingItems));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, failedAt, pendingItems);

  @override
  String toString() {
    return 'SyncState.syncFailed(error: $error, failedAt: $failedAt, pendingItems: $pendingItems)';
  }
}

/// @nodoc
abstract mixin class _$SyncFailedCopyWith<$Res>
    implements $SyncStateCopyWith<$Res> {
  factory _$SyncFailedCopyWith(
          _SyncFailed value, $Res Function(_SyncFailed) _then) =
      __$SyncFailedCopyWithImpl;
  @useResult
  $Res call({String error, DateTime failedAt, int pendingItems});
}

/// @nodoc
class __$SyncFailedCopyWithImpl<$Res> implements _$SyncFailedCopyWith<$Res> {
  __$SyncFailedCopyWithImpl(this._self, this._then);

  final _SyncFailed _self;
  final $Res Function(_SyncFailed) _then;

  /// Create a copy of SyncState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
    Object? failedAt = null,
    Object? pendingItems = null,
  }) {
    return _then(_SyncFailed(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      failedAt: null == failedAt
          ? _self.failedAt
          : failedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      pendingItems: null == pendingItems
          ? _self.pendingItems
          : pendingItems // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _PendingSync implements SyncState {
  const _PendingSync({required this.pendingItems, this.lastSyncTime});

  final int pendingItems;
  final DateTime? lastSyncTime;

  /// Create a copy of SyncState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PendingSyncCopyWith<_PendingSync> get copyWith =>
      __$PendingSyncCopyWithImpl<_PendingSync>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PendingSync &&
            (identical(other.pendingItems, pendingItems) ||
                other.pendingItems == pendingItems) &&
            (identical(other.lastSyncTime, lastSyncTime) ||
                other.lastSyncTime == lastSyncTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pendingItems, lastSyncTime);

  @override
  String toString() {
    return 'SyncState.pendingSync(pendingItems: $pendingItems, lastSyncTime: $lastSyncTime)';
  }
}

/// @nodoc
abstract mixin class _$PendingSyncCopyWith<$Res>
    implements $SyncStateCopyWith<$Res> {
  factory _$PendingSyncCopyWith(
          _PendingSync value, $Res Function(_PendingSync) _then) =
      __$PendingSyncCopyWithImpl;
  @useResult
  $Res call({int pendingItems, DateTime? lastSyncTime});
}

/// @nodoc
class __$PendingSyncCopyWithImpl<$Res> implements _$PendingSyncCopyWith<$Res> {
  __$PendingSyncCopyWithImpl(this._self, this._then);

  final _PendingSync _self;
  final $Res Function(_PendingSync) _then;

  /// Create a copy of SyncState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? pendingItems = null,
    Object? lastSyncTime = freezed,
  }) {
    return _then(_PendingSync(
      pendingItems: null == pendingItems
          ? _self.pendingItems
          : pendingItems // ignore: cast_nullable_to_non_nullable
              as int,
      lastSyncTime: freezed == lastSyncTime
          ? _self.lastSyncTime
          : lastSyncTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
