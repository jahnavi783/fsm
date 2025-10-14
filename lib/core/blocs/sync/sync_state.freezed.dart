// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SyncState {
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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int totalItems, int syncedItems, String? currentItem)?
        syncing,
    TResult? Function(DateTime lastSyncTime, int syncedItems)? synced,
    TResult? Function(String error, DateTime failedAt, int pendingItems)?
        syncFailed,
    TResult? Function(int pendingItems, DateTime? lastSyncTime)? pendingSync,
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Synced value) synced,
    required TResult Function(_SyncFailed value) syncFailed,
    required TResult Function(_PendingSync value) pendingSync,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Synced value)? synced,
    TResult? Function(_SyncFailed value)? syncFailed,
    TResult? Function(_PendingSync value)? pendingSync,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Synced value)? synced,
    TResult Function(_SyncFailed value)? syncFailed,
    TResult Function(_PendingSync value)? pendingSync,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncStateCopyWith<$Res> {
  factory $SyncStateCopyWith(SyncState value, $Res Function(SyncState) then) =
      _$SyncStateCopyWithImpl<$Res, SyncState>;
}

/// @nodoc
class _$SyncStateCopyWithImpl<$Res, $Val extends SyncState>
    implements $SyncStateCopyWith<$Res> {
  _$SyncStateCopyWithImpl(this._value, this._then);

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
    extends _$SyncStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'SyncState.initial()';
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
    required TResult Function(
            int totalItems, int syncedItems, String? currentItem)
        syncing,
    required TResult Function(DateTime lastSyncTime, int syncedItems) synced,
    required TResult Function(String error, DateTime failedAt, int pendingItems)
        syncFailed,
    required TResult Function(int pendingItems, DateTime? lastSyncTime)
        pendingSync,
  }) {
    return initial();
  }

  @override
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
    return initial?.call();
  }

  @override
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
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Synced value) synced,
    required TResult Function(_SyncFailed value) syncFailed,
    required TResult Function(_PendingSync value) pendingSync,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Synced value)? synced,
    TResult? Function(_SyncFailed value)? syncFailed,
    TResult? Function(_PendingSync value)? pendingSync,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Synced value)? synced,
    TResult Function(_SyncFailed value)? syncFailed,
    TResult Function(_PendingSync value)? pendingSync,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SyncState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SyncingImplCopyWith<$Res> {
  factory _$$SyncingImplCopyWith(
          _$SyncingImpl value, $Res Function(_$SyncingImpl) then) =
      __$$SyncingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int totalItems, int syncedItems, String? currentItem});
}

/// @nodoc
class __$$SyncingImplCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$SyncingImpl>
    implements _$$SyncingImplCopyWith<$Res> {
  __$$SyncingImplCopyWithImpl(
      _$SyncingImpl _value, $Res Function(_$SyncingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalItems = null,
    Object? syncedItems = null,
    Object? currentItem = freezed,
  }) {
    return _then(_$SyncingImpl(
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      syncedItems: null == syncedItems
          ? _value.syncedItems
          : syncedItems // ignore: cast_nullable_to_non_nullable
              as int,
      currentItem: freezed == currentItem
          ? _value.currentItem
          : currentItem // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SyncingImpl implements _Syncing {
  const _$SyncingImpl(
      {required this.totalItems, required this.syncedItems, this.currentItem});

  @override
  final int totalItems;
  @override
  final int syncedItems;
  @override
  final String? currentItem;

  @override
  String toString() {
    return 'SyncState.syncing(totalItems: $totalItems, syncedItems: $syncedItems, currentItem: $currentItem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncingImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncingImplCopyWith<_$SyncingImpl> get copyWith =>
      __$$SyncingImplCopyWithImpl<_$SyncingImpl>(this, _$identity);

  @override
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
    return syncing(totalItems, syncedItems, currentItem);
  }

  @override
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
    return syncing?.call(totalItems, syncedItems, currentItem);
  }

  @override
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
    if (syncing != null) {
      return syncing(totalItems, syncedItems, currentItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Synced value) synced,
    required TResult Function(_SyncFailed value) syncFailed,
    required TResult Function(_PendingSync value) pendingSync,
  }) {
    return syncing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Synced value)? synced,
    TResult? Function(_SyncFailed value)? syncFailed,
    TResult? Function(_PendingSync value)? pendingSync,
  }) {
    return syncing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Synced value)? synced,
    TResult Function(_SyncFailed value)? syncFailed,
    TResult Function(_PendingSync value)? pendingSync,
    required TResult orElse(),
  }) {
    if (syncing != null) {
      return syncing(this);
    }
    return orElse();
  }
}

abstract class _Syncing implements SyncState {
  const factory _Syncing(
      {required final int totalItems,
      required final int syncedItems,
      final String? currentItem}) = _$SyncingImpl;

  int get totalItems;
  int get syncedItems;
  String? get currentItem;
  @JsonKey(ignore: true)
  _$$SyncingImplCopyWith<_$SyncingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SyncedImplCopyWith<$Res> {
  factory _$$SyncedImplCopyWith(
          _$SyncedImpl value, $Res Function(_$SyncedImpl) then) =
      __$$SyncedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime lastSyncTime, int syncedItems});
}

/// @nodoc
class __$$SyncedImplCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$SyncedImpl>
    implements _$$SyncedImplCopyWith<$Res> {
  __$$SyncedImplCopyWithImpl(
      _$SyncedImpl _value, $Res Function(_$SyncedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastSyncTime = null,
    Object? syncedItems = null,
  }) {
    return _then(_$SyncedImpl(
      lastSyncTime: null == lastSyncTime
          ? _value.lastSyncTime
          : lastSyncTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      syncedItems: null == syncedItems
          ? _value.syncedItems
          : syncedItems // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SyncedImpl implements _Synced {
  const _$SyncedImpl({required this.lastSyncTime, required this.syncedItems});

  @override
  final DateTime lastSyncTime;
  @override
  final int syncedItems;

  @override
  String toString() {
    return 'SyncState.synced(lastSyncTime: $lastSyncTime, syncedItems: $syncedItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncedImpl &&
            (identical(other.lastSyncTime, lastSyncTime) ||
                other.lastSyncTime == lastSyncTime) &&
            (identical(other.syncedItems, syncedItems) ||
                other.syncedItems == syncedItems));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lastSyncTime, syncedItems);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncedImplCopyWith<_$SyncedImpl> get copyWith =>
      __$$SyncedImplCopyWithImpl<_$SyncedImpl>(this, _$identity);

  @override
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
    return synced(lastSyncTime, syncedItems);
  }

  @override
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
    return synced?.call(lastSyncTime, syncedItems);
  }

  @override
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
    if (synced != null) {
      return synced(lastSyncTime, syncedItems);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Synced value) synced,
    required TResult Function(_SyncFailed value) syncFailed,
    required TResult Function(_PendingSync value) pendingSync,
  }) {
    return synced(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Synced value)? synced,
    TResult? Function(_SyncFailed value)? syncFailed,
    TResult? Function(_PendingSync value)? pendingSync,
  }) {
    return synced?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Synced value)? synced,
    TResult Function(_SyncFailed value)? syncFailed,
    TResult Function(_PendingSync value)? pendingSync,
    required TResult orElse(),
  }) {
    if (synced != null) {
      return synced(this);
    }
    return orElse();
  }
}

abstract class _Synced implements SyncState {
  const factory _Synced(
      {required final DateTime lastSyncTime,
      required final int syncedItems}) = _$SyncedImpl;

  DateTime get lastSyncTime;
  int get syncedItems;
  @JsonKey(ignore: true)
  _$$SyncedImplCopyWith<_$SyncedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SyncFailedImplCopyWith<$Res> {
  factory _$$SyncFailedImplCopyWith(
          _$SyncFailedImpl value, $Res Function(_$SyncFailedImpl) then) =
      __$$SyncFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error, DateTime failedAt, int pendingItems});
}

/// @nodoc
class __$$SyncFailedImplCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$SyncFailedImpl>
    implements _$$SyncFailedImplCopyWith<$Res> {
  __$$SyncFailedImplCopyWithImpl(
      _$SyncFailedImpl _value, $Res Function(_$SyncFailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? failedAt = null,
    Object? pendingItems = null,
  }) {
    return _then(_$SyncFailedImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      failedAt: null == failedAt
          ? _value.failedAt
          : failedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      pendingItems: null == pendingItems
          ? _value.pendingItems
          : pendingItems // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SyncFailedImpl implements _SyncFailed {
  const _$SyncFailedImpl(
      {required this.error,
      required this.failedAt,
      required this.pendingItems});

  @override
  final String error;
  @override
  final DateTime failedAt;
  @override
  final int pendingItems;

  @override
  String toString() {
    return 'SyncState.syncFailed(error: $error, failedAt: $failedAt, pendingItems: $pendingItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncFailedImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.failedAt, failedAt) ||
                other.failedAt == failedAt) &&
            (identical(other.pendingItems, pendingItems) ||
                other.pendingItems == pendingItems));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, failedAt, pendingItems);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncFailedImplCopyWith<_$SyncFailedImpl> get copyWith =>
      __$$SyncFailedImplCopyWithImpl<_$SyncFailedImpl>(this, _$identity);

  @override
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
    return syncFailed(error, failedAt, pendingItems);
  }

  @override
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
    return syncFailed?.call(error, failedAt, pendingItems);
  }

  @override
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
    if (syncFailed != null) {
      return syncFailed(error, failedAt, pendingItems);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Synced value) synced,
    required TResult Function(_SyncFailed value) syncFailed,
    required TResult Function(_PendingSync value) pendingSync,
  }) {
    return syncFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Synced value)? synced,
    TResult? Function(_SyncFailed value)? syncFailed,
    TResult? Function(_PendingSync value)? pendingSync,
  }) {
    return syncFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Synced value)? synced,
    TResult Function(_SyncFailed value)? syncFailed,
    TResult Function(_PendingSync value)? pendingSync,
    required TResult orElse(),
  }) {
    if (syncFailed != null) {
      return syncFailed(this);
    }
    return orElse();
  }
}

abstract class _SyncFailed implements SyncState {
  const factory _SyncFailed(
      {required final String error,
      required final DateTime failedAt,
      required final int pendingItems}) = _$SyncFailedImpl;

  String get error;
  DateTime get failedAt;
  int get pendingItems;
  @JsonKey(ignore: true)
  _$$SyncFailedImplCopyWith<_$SyncFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PendingSyncImplCopyWith<$Res> {
  factory _$$PendingSyncImplCopyWith(
          _$PendingSyncImpl value, $Res Function(_$PendingSyncImpl) then) =
      __$$PendingSyncImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int pendingItems, DateTime? lastSyncTime});
}

/// @nodoc
class __$$PendingSyncImplCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$PendingSyncImpl>
    implements _$$PendingSyncImplCopyWith<$Res> {
  __$$PendingSyncImplCopyWithImpl(
      _$PendingSyncImpl _value, $Res Function(_$PendingSyncImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pendingItems = null,
    Object? lastSyncTime = freezed,
  }) {
    return _then(_$PendingSyncImpl(
      pendingItems: null == pendingItems
          ? _value.pendingItems
          : pendingItems // ignore: cast_nullable_to_non_nullable
              as int,
      lastSyncTime: freezed == lastSyncTime
          ? _value.lastSyncTime
          : lastSyncTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$PendingSyncImpl implements _PendingSync {
  const _$PendingSyncImpl({required this.pendingItems, this.lastSyncTime});

  @override
  final int pendingItems;
  @override
  final DateTime? lastSyncTime;

  @override
  String toString() {
    return 'SyncState.pendingSync(pendingItems: $pendingItems, lastSyncTime: $lastSyncTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PendingSyncImpl &&
            (identical(other.pendingItems, pendingItems) ||
                other.pendingItems == pendingItems) &&
            (identical(other.lastSyncTime, lastSyncTime) ||
                other.lastSyncTime == lastSyncTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pendingItems, lastSyncTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PendingSyncImplCopyWith<_$PendingSyncImpl> get copyWith =>
      __$$PendingSyncImplCopyWithImpl<_$PendingSyncImpl>(this, _$identity);

  @override
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
    return pendingSync(pendingItems, lastSyncTime);
  }

  @override
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
    return pendingSync?.call(pendingItems, lastSyncTime);
  }

  @override
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
    if (pendingSync != null) {
      return pendingSync(pendingItems, lastSyncTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Synced value) synced,
    required TResult Function(_SyncFailed value) syncFailed,
    required TResult Function(_PendingSync value) pendingSync,
  }) {
    return pendingSync(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Synced value)? synced,
    TResult? Function(_SyncFailed value)? syncFailed,
    TResult? Function(_PendingSync value)? pendingSync,
  }) {
    return pendingSync?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Synced value)? synced,
    TResult Function(_SyncFailed value)? syncFailed,
    TResult Function(_PendingSync value)? pendingSync,
    required TResult orElse(),
  }) {
    if (pendingSync != null) {
      return pendingSync(this);
    }
    return orElse();
  }
}

abstract class _PendingSync implements SyncState {
  const factory _PendingSync(
      {required final int pendingItems,
      final DateTime? lastSyncTime}) = _$PendingSyncImpl;

  int get pendingItems;
  DateTime? get lastSyncTime;
  @JsonKey(ignore: true)
  _$$PendingSyncImplCopyWith<_$PendingSyncImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
