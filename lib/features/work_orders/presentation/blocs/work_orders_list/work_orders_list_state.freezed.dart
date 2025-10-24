// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_orders_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkOrdersListState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is WorkOrdersListState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WorkOrdersListState()';
  }
}

/// @nodoc
class $WorkOrdersListStateCopyWith<$Res> {
  $WorkOrdersListStateCopyWith(
      WorkOrdersListState _, $Res Function(WorkOrdersListState) __);
}

/// Adds pattern-matching-related methods to [WorkOrdersListState].
extension WorkOrdersListStatePatterns on WorkOrdersListState {
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
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_Syncing value)? syncing,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
      case _Error() when error != null:
        return error(_that);
      case _Syncing() when syncing != null:
        return syncing(_that);
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_Syncing value) syncing,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Loading():
        return loading(_that);
      case _Loaded():
        return loaded(_that);
      case _Error():
        return error(_that);
      case _Syncing():
        return syncing(_that);
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
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_Syncing value)? syncing,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
      case _Error() when error != null:
        return error(_that);
      case _Syncing() when syncing != null:
        return syncing(_that);
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
    TResult Function(
            List<WorkOrderEntity> workOrders,
            List<WorkOrderEntity> unassignedWorkOrders,
            int unassignedCount,
            int currentPage,
            bool hasReachedMax,
            bool isLoadingMore,
            WorkOrderStatus? statusFilter,
            WorkOrderPriority? priorityFilter,
            String? searchQuery,
            bool isOffline,
            bool hasPendingSync)?
        loaded,
    TResult Function(
            Failure failure, List<WorkOrderEntity> workOrders, bool isOffline)?
        error,
    TResult Function(List<WorkOrderEntity> workOrders)? syncing,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Loaded() when loaded != null:
        return loaded(
            _that.workOrders,
            _that.unassignedWorkOrders,
            _that.unassignedCount,
            _that.currentPage,
            _that.hasReachedMax,
            _that.isLoadingMore,
            _that.statusFilter,
            _that.priorityFilter,
            _that.searchQuery,
            _that.isOffline,
            _that.hasPendingSync);
      case _Error() when error != null:
        return error(_that.failure, _that.workOrders, _that.isOffline);
      case _Syncing() when syncing != null:
        return syncing(_that.workOrders);
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
            List<WorkOrderEntity> workOrders,
            List<WorkOrderEntity> unassignedWorkOrders,
            int unassignedCount,
            int currentPage,
            bool hasReachedMax,
            bool isLoadingMore,
            WorkOrderStatus? statusFilter,
            WorkOrderPriority? priorityFilter,
            String? searchQuery,
            bool isOffline,
            bool hasPendingSync)
        loaded,
    required TResult Function(
            Failure failure, List<WorkOrderEntity> workOrders, bool isOffline)
        error,
    required TResult Function(List<WorkOrderEntity> workOrders) syncing,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _Loaded():
        return loaded(
            _that.workOrders,
            _that.unassignedWorkOrders,
            _that.unassignedCount,
            _that.currentPage,
            _that.hasReachedMax,
            _that.isLoadingMore,
            _that.statusFilter,
            _that.priorityFilter,
            _that.searchQuery,
            _that.isOffline,
            _that.hasPendingSync);
      case _Error():
        return error(_that.failure, _that.workOrders, _that.isOffline);
      case _Syncing():
        return syncing(_that.workOrders);
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
    TResult? Function(
            List<WorkOrderEntity> workOrders,
            List<WorkOrderEntity> unassignedWorkOrders,
            int unassignedCount,
            int currentPage,
            bool hasReachedMax,
            bool isLoadingMore,
            WorkOrderStatus? statusFilter,
            WorkOrderPriority? priorityFilter,
            String? searchQuery,
            bool isOffline,
            bool hasPendingSync)?
        loaded,
    TResult? Function(
            Failure failure, List<WorkOrderEntity> workOrders, bool isOffline)?
        error,
    TResult? Function(List<WorkOrderEntity> workOrders)? syncing,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Loaded() when loaded != null:
        return loaded(
            _that.workOrders,
            _that.unassignedWorkOrders,
            _that.unassignedCount,
            _that.currentPage,
            _that.hasReachedMax,
            _that.isLoadingMore,
            _that.statusFilter,
            _that.priorityFilter,
            _that.searchQuery,
            _that.isOffline,
            _that.hasPendingSync);
      case _Error() when error != null:
        return error(_that.failure, _that.workOrders, _that.isOffline);
      case _Syncing() when syncing != null:
        return syncing(_that.workOrders);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements WorkOrdersListState {
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
    return 'WorkOrdersListState.initial()';
  }
}

/// @nodoc

class _Loading implements WorkOrdersListState {
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
    return 'WorkOrdersListState.loading()';
  }
}

/// @nodoc

class _Loaded implements WorkOrdersListState {
  const _Loaded(
      {required final List<WorkOrderEntity> workOrders,
      final List<WorkOrderEntity> unassignedWorkOrders = const [],
      this.unassignedCount = 0,
      this.currentPage = 1,
      this.hasReachedMax = false,
      this.isLoadingMore = false,
      this.statusFilter,
      this.priorityFilter,
      this.searchQuery,
      this.isOffline = false,
      this.hasPendingSync = false})
      : _workOrders = workOrders,
        _unassignedWorkOrders = unassignedWorkOrders;

  final List<WorkOrderEntity> _workOrders;
  List<WorkOrderEntity> get workOrders {
    if (_workOrders is EqualUnmodifiableListView) return _workOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workOrders);
  }

  final List<WorkOrderEntity> _unassignedWorkOrders;
  @JsonKey()
  List<WorkOrderEntity> get unassignedWorkOrders {
    if (_unassignedWorkOrders is EqualUnmodifiableListView)
      return _unassignedWorkOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unassignedWorkOrders);
  }

  @JsonKey()
  final int unassignedCount;
  @JsonKey()
  final int currentPage;
  @JsonKey()
  final bool hasReachedMax;
  @JsonKey()
  final bool isLoadingMore;
  final WorkOrderStatus? statusFilter;
  final WorkOrderPriority? priorityFilter;
  final String? searchQuery;
  @JsonKey()
  final bool isOffline;
  @JsonKey()
  final bool hasPendingSync;

  /// Create a copy of WorkOrdersListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loaded &&
            const DeepCollectionEquality()
                .equals(other._workOrders, _workOrders) &&
            const DeepCollectionEquality()
                .equals(other._unassignedWorkOrders, _unassignedWorkOrders) &&
            (identical(other.unassignedCount, unassignedCount) ||
                other.unassignedCount == unassignedCount) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.statusFilter, statusFilter) ||
                other.statusFilter == statusFilter) &&
            (identical(other.priorityFilter, priorityFilter) ||
                other.priorityFilter == priorityFilter) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.isOffline, isOffline) ||
                other.isOffline == isOffline) &&
            (identical(other.hasPendingSync, hasPendingSync) ||
                other.hasPendingSync == hasPendingSync));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_workOrders),
      const DeepCollectionEquality().hash(_unassignedWorkOrders),
      unassignedCount,
      currentPage,
      hasReachedMax,
      isLoadingMore,
      statusFilter,
      priorityFilter,
      searchQuery,
      isOffline,
      hasPendingSync);

  @override
  String toString() {
    return 'WorkOrdersListState.loaded(workOrders: $workOrders, unassignedWorkOrders: $unassignedWorkOrders, unassignedCount: $unassignedCount, currentPage: $currentPage, hasReachedMax: $hasReachedMax, isLoadingMore: $isLoadingMore, statusFilter: $statusFilter, priorityFilter: $priorityFilter, searchQuery: $searchQuery, isOffline: $isOffline, hasPendingSync: $hasPendingSync)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $WorkOrdersListStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @useResult
  $Res call(
      {List<WorkOrderEntity> workOrders,
      List<WorkOrderEntity> unassignedWorkOrders,
      int unassignedCount,
      int currentPage,
      bool hasReachedMax,
      bool isLoadingMore,
      WorkOrderStatus? statusFilter,
      WorkOrderPriority? priorityFilter,
      String? searchQuery,
      bool isOffline,
      bool hasPendingSync});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of WorkOrdersListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workOrders = null,
    Object? unassignedWorkOrders = null,
    Object? unassignedCount = null,
    Object? currentPage = null,
    Object? hasReachedMax = null,
    Object? isLoadingMore = null,
    Object? statusFilter = freezed,
    Object? priorityFilter = freezed,
    Object? searchQuery = freezed,
    Object? isOffline = null,
    Object? hasPendingSync = null,
  }) {
    return _then(_Loaded(
      workOrders: null == workOrders
          ? _self._workOrders
          : workOrders // ignore: cast_nullable_to_non_nullable
              as List<WorkOrderEntity>,
      unassignedWorkOrders: null == unassignedWorkOrders
          ? _self._unassignedWorkOrders
          : unassignedWorkOrders // ignore: cast_nullable_to_non_nullable
              as List<WorkOrderEntity>,
      unassignedCount: null == unassignedCount
          ? _self.unassignedCount
          : unassignedCount // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasReachedMax: null == hasReachedMax
          ? _self.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _self.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      statusFilter: freezed == statusFilter
          ? _self.statusFilter
          : statusFilter // ignore: cast_nullable_to_non_nullable
              as WorkOrderStatus?,
      priorityFilter: freezed == priorityFilter
          ? _self.priorityFilter
          : priorityFilter // ignore: cast_nullable_to_non_nullable
              as WorkOrderPriority?,
      searchQuery: freezed == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      isOffline: null == isOffline
          ? _self.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPendingSync: null == hasPendingSync
          ? _self.hasPendingSync
          : hasPendingSync // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _Error implements WorkOrdersListState {
  const _Error(
      {required this.failure,
      final List<WorkOrderEntity> workOrders = const [],
      this.isOffline = false})
      : _workOrders = workOrders;

  final Failure failure;
  final List<WorkOrderEntity> _workOrders;
  @JsonKey()
  List<WorkOrderEntity> get workOrders {
    if (_workOrders is EqualUnmodifiableListView) return _workOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workOrders);
  }

  @JsonKey()
  final bool isOffline;

  /// Create a copy of WorkOrdersListState
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
            (identical(other.failure, failure) || other.failure == failure) &&
            const DeepCollectionEquality()
                .equals(other._workOrders, _workOrders) &&
            (identical(other.isOffline, isOffline) ||
                other.isOffline == isOffline));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure,
      const DeepCollectionEquality().hash(_workOrders), isOffline);

  @override
  String toString() {
    return 'WorkOrdersListState.error(failure: $failure, workOrders: $workOrders, isOffline: $isOffline)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $WorkOrdersListStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @useResult
  $Res call(
      {Failure failure, List<WorkOrderEntity> workOrders, bool isOffline});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of WorkOrdersListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? failure = null,
    Object? workOrders = null,
    Object? isOffline = null,
  }) {
    return _then(_Error(
      failure: null == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
      workOrders: null == workOrders
          ? _self._workOrders
          : workOrders // ignore: cast_nullable_to_non_nullable
              as List<WorkOrderEntity>,
      isOffline: null == isOffline
          ? _self.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of WorkOrdersListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res> get failure {
    return $FailureCopyWith<$Res>(_self.failure, (value) {
      return _then(_self.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _Syncing implements WorkOrdersListState {
  const _Syncing({required final List<WorkOrderEntity> workOrders})
      : _workOrders = workOrders;

  final List<WorkOrderEntity> _workOrders;
  List<WorkOrderEntity> get workOrders {
    if (_workOrders is EqualUnmodifiableListView) return _workOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workOrders);
  }

  /// Create a copy of WorkOrdersListState
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
            const DeepCollectionEquality()
                .equals(other._workOrders, _workOrders));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_workOrders));

  @override
  String toString() {
    return 'WorkOrdersListState.syncing(workOrders: $workOrders)';
  }
}

/// @nodoc
abstract mixin class _$SyncingCopyWith<$Res>
    implements $WorkOrdersListStateCopyWith<$Res> {
  factory _$SyncingCopyWith(_Syncing value, $Res Function(_Syncing) _then) =
      __$SyncingCopyWithImpl;
  @useResult
  $Res call({List<WorkOrderEntity> workOrders});
}

/// @nodoc
class __$SyncingCopyWithImpl<$Res> implements _$SyncingCopyWith<$Res> {
  __$SyncingCopyWithImpl(this._self, this._then);

  final _Syncing _self;
  final $Res Function(_Syncing) _then;

  /// Create a copy of WorkOrdersListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workOrders = null,
  }) {
    return _then(_Syncing(
      workOrders: null == workOrders
          ? _self._workOrders
          : workOrders // ignore: cast_nullable_to_non_nullable
              as List<WorkOrderEntity>,
    ));
  }
}

// dart format on
