// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_orders_list_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkOrdersListEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is WorkOrdersListEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WorkOrdersListEvent()';
  }
}

/// @nodoc
class $WorkOrdersListEventCopyWith<$Res> {
  $WorkOrdersListEventCopyWith(
      WorkOrdersListEvent _, $Res Function(WorkOrdersListEvent) __);
}

/// Adds pattern-matching-related methods to [WorkOrdersListEvent].
extension WorkOrdersListEventPatterns on WorkOrdersListEvent {
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
    TResult Function(_LoadWorkOrders value)? loadWorkOrders,
    TResult Function(_LoadMoreWorkOrders value)? loadMoreWorkOrders,
    TResult Function(_RefreshWorkOrders value)? refreshWorkOrders,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_FilterByPriority value)? filterByPriority,
    TResult Function(_SearchWorkOrders value)? searchWorkOrders,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_SyncPendingWorkOrders value)? syncPendingWorkOrders,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadWorkOrders() when loadWorkOrders != null:
        return loadWorkOrders(_that);
      case _LoadMoreWorkOrders() when loadMoreWorkOrders != null:
        return loadMoreWorkOrders(_that);
      case _RefreshWorkOrders() when refreshWorkOrders != null:
        return refreshWorkOrders(_that);
      case _FilterByStatus() when filterByStatus != null:
        return filterByStatus(_that);
      case _FilterByPriority() when filterByPriority != null:
        return filterByPriority(_that);
      case _SearchWorkOrders() when searchWorkOrders != null:
        return searchWorkOrders(_that);
      case _ClearFilters() when clearFilters != null:
        return clearFilters(_that);
      case _SyncPendingWorkOrders() when syncPendingWorkOrders != null:
        return syncPendingWorkOrders(_that);
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
    required TResult Function(_LoadWorkOrders value) loadWorkOrders,
    required TResult Function(_LoadMoreWorkOrders value) loadMoreWorkOrders,
    required TResult Function(_RefreshWorkOrders value) refreshWorkOrders,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_FilterByPriority value) filterByPriority,
    required TResult Function(_SearchWorkOrders value) searchWorkOrders,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_SyncPendingWorkOrders value)
        syncPendingWorkOrders,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadWorkOrders():
        return loadWorkOrders(_that);
      case _LoadMoreWorkOrders():
        return loadMoreWorkOrders(_that);
      case _RefreshWorkOrders():
        return refreshWorkOrders(_that);
      case _FilterByStatus():
        return filterByStatus(_that);
      case _FilterByPriority():
        return filterByPriority(_that);
      case _SearchWorkOrders():
        return searchWorkOrders(_that);
      case _ClearFilters():
        return clearFilters(_that);
      case _SyncPendingWorkOrders():
        return syncPendingWorkOrders(_that);
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
    TResult? Function(_LoadWorkOrders value)? loadWorkOrders,
    TResult? Function(_LoadMoreWorkOrders value)? loadMoreWorkOrders,
    TResult? Function(_RefreshWorkOrders value)? refreshWorkOrders,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_FilterByPriority value)? filterByPriority,
    TResult? Function(_SearchWorkOrders value)? searchWorkOrders,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_SyncPendingWorkOrders value)? syncPendingWorkOrders,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadWorkOrders() when loadWorkOrders != null:
        return loadWorkOrders(_that);
      case _LoadMoreWorkOrders() when loadMoreWorkOrders != null:
        return loadMoreWorkOrders(_that);
      case _RefreshWorkOrders() when refreshWorkOrders != null:
        return refreshWorkOrders(_that);
      case _FilterByStatus() when filterByStatus != null:
        return filterByStatus(_that);
      case _FilterByPriority() when filterByPriority != null:
        return filterByPriority(_that);
      case _SearchWorkOrders() when searchWorkOrders != null:
        return searchWorkOrders(_that);
      case _ClearFilters() when clearFilters != null:
        return clearFilters(_that);
      case _SyncPendingWorkOrders() when syncPendingWorkOrders != null:
        return syncPendingWorkOrders(_that);
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
    TResult Function(int page, int limit, WorkOrderStatus? status,
            WorkOrderPriority? priority, String? searchQuery, bool isRefresh)?
        loadWorkOrders,
    TResult Function()? loadMoreWorkOrders,
    TResult Function()? refreshWorkOrders,
    TResult Function(WorkOrderStatus? status)? filterByStatus,
    TResult Function(WorkOrderPriority? priority)? filterByPriority,
    TResult Function(String query)? searchWorkOrders,
    TResult Function()? clearFilters,
    TResult Function()? syncPendingWorkOrders,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadWorkOrders() when loadWorkOrders != null:
        return loadWorkOrders(_that.page, _that.limit, _that.status,
            _that.priority, _that.searchQuery, _that.isRefresh);
      case _LoadMoreWorkOrders() when loadMoreWorkOrders != null:
        return loadMoreWorkOrders();
      case _RefreshWorkOrders() when refreshWorkOrders != null:
        return refreshWorkOrders();
      case _FilterByStatus() when filterByStatus != null:
        return filterByStatus(_that.status);
      case _FilterByPriority() when filterByPriority != null:
        return filterByPriority(_that.priority);
      case _SearchWorkOrders() when searchWorkOrders != null:
        return searchWorkOrders(_that.query);
      case _ClearFilters() when clearFilters != null:
        return clearFilters();
      case _SyncPendingWorkOrders() when syncPendingWorkOrders != null:
        return syncPendingWorkOrders();
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
    required TResult Function(int page, int limit, WorkOrderStatus? status,
            WorkOrderPriority? priority, String? searchQuery, bool isRefresh)
        loadWorkOrders,
    required TResult Function() loadMoreWorkOrders,
    required TResult Function() refreshWorkOrders,
    required TResult Function(WorkOrderStatus? status) filterByStatus,
    required TResult Function(WorkOrderPriority? priority) filterByPriority,
    required TResult Function(String query) searchWorkOrders,
    required TResult Function() clearFilters,
    required TResult Function() syncPendingWorkOrders,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadWorkOrders():
        return loadWorkOrders(_that.page, _that.limit, _that.status,
            _that.priority, _that.searchQuery, _that.isRefresh);
      case _LoadMoreWorkOrders():
        return loadMoreWorkOrders();
      case _RefreshWorkOrders():
        return refreshWorkOrders();
      case _FilterByStatus():
        return filterByStatus(_that.status);
      case _FilterByPriority():
        return filterByPriority(_that.priority);
      case _SearchWorkOrders():
        return searchWorkOrders(_that.query);
      case _ClearFilters():
        return clearFilters();
      case _SyncPendingWorkOrders():
        return syncPendingWorkOrders();
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
    TResult? Function(int page, int limit, WorkOrderStatus? status,
            WorkOrderPriority? priority, String? searchQuery, bool isRefresh)?
        loadWorkOrders,
    TResult? Function()? loadMoreWorkOrders,
    TResult? Function()? refreshWorkOrders,
    TResult? Function(WorkOrderStatus? status)? filterByStatus,
    TResult? Function(WorkOrderPriority? priority)? filterByPriority,
    TResult? Function(String query)? searchWorkOrders,
    TResult? Function()? clearFilters,
    TResult? Function()? syncPendingWorkOrders,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadWorkOrders() when loadWorkOrders != null:
        return loadWorkOrders(_that.page, _that.limit, _that.status,
            _that.priority, _that.searchQuery, _that.isRefresh);
      case _LoadMoreWorkOrders() when loadMoreWorkOrders != null:
        return loadMoreWorkOrders();
      case _RefreshWorkOrders() when refreshWorkOrders != null:
        return refreshWorkOrders();
      case _FilterByStatus() when filterByStatus != null:
        return filterByStatus(_that.status);
      case _FilterByPriority() when filterByPriority != null:
        return filterByPriority(_that.priority);
      case _SearchWorkOrders() when searchWorkOrders != null:
        return searchWorkOrders(_that.query);
      case _ClearFilters() when clearFilters != null:
        return clearFilters();
      case _SyncPendingWorkOrders() when syncPendingWorkOrders != null:
        return syncPendingWorkOrders();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LoadWorkOrders implements WorkOrdersListEvent {
  const _LoadWorkOrders(
      {this.page = 1,
      this.limit = 20,
      this.status,
      this.priority,
      this.searchQuery,
      this.isRefresh = false});

  @JsonKey()
  final int page;
  @JsonKey()
  final int limit;
  final WorkOrderStatus? status;
  final WorkOrderPriority? priority;
  final String? searchQuery;
  @JsonKey()
  final bool isRefresh;

  /// Create a copy of WorkOrdersListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadWorkOrdersCopyWith<_LoadWorkOrders> get copyWith =>
      __$LoadWorkOrdersCopyWithImpl<_LoadWorkOrders>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadWorkOrders &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, page, limit, status, priority, searchQuery, isRefresh);

  @override
  String toString() {
    return 'WorkOrdersListEvent.loadWorkOrders(page: $page, limit: $limit, status: $status, priority: $priority, searchQuery: $searchQuery, isRefresh: $isRefresh)';
  }
}

/// @nodoc
abstract mixin class _$LoadWorkOrdersCopyWith<$Res>
    implements $WorkOrdersListEventCopyWith<$Res> {
  factory _$LoadWorkOrdersCopyWith(
          _LoadWorkOrders value, $Res Function(_LoadWorkOrders) _then) =
      __$LoadWorkOrdersCopyWithImpl;
  @useResult
  $Res call(
      {int page,
      int limit,
      WorkOrderStatus? status,
      WorkOrderPriority? priority,
      String? searchQuery,
      bool isRefresh});
}

/// @nodoc
class __$LoadWorkOrdersCopyWithImpl<$Res>
    implements _$LoadWorkOrdersCopyWith<$Res> {
  __$LoadWorkOrdersCopyWithImpl(this._self, this._then);

  final _LoadWorkOrders _self;
  final $Res Function(_LoadWorkOrders) _then;

  /// Create a copy of WorkOrdersListEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? status = freezed,
    Object? priority = freezed,
    Object? searchQuery = freezed,
    Object? isRefresh = null,
  }) {
    return _then(_LoadWorkOrders(
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as WorkOrderStatus?,
      priority: freezed == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as WorkOrderPriority?,
      searchQuery: freezed == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      isRefresh: null == isRefresh
          ? _self.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _LoadMoreWorkOrders implements WorkOrdersListEvent {
  const _LoadMoreWorkOrders();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadMoreWorkOrders);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WorkOrdersListEvent.loadMoreWorkOrders()';
  }
}

/// @nodoc

class _RefreshWorkOrders implements WorkOrdersListEvent {
  const _RefreshWorkOrders();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _RefreshWorkOrders);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WorkOrdersListEvent.refreshWorkOrders()';
  }
}

/// @nodoc

class _FilterByStatus implements WorkOrdersListEvent {
  const _FilterByStatus(this.status);

  final WorkOrderStatus? status;

  /// Create a copy of WorkOrdersListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FilterByStatusCopyWith<_FilterByStatus> get copyWith =>
      __$FilterByStatusCopyWithImpl<_FilterByStatus>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FilterByStatus &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @override
  String toString() {
    return 'WorkOrdersListEvent.filterByStatus(status: $status)';
  }
}

/// @nodoc
abstract mixin class _$FilterByStatusCopyWith<$Res>
    implements $WorkOrdersListEventCopyWith<$Res> {
  factory _$FilterByStatusCopyWith(
          _FilterByStatus value, $Res Function(_FilterByStatus) _then) =
      __$FilterByStatusCopyWithImpl;
  @useResult
  $Res call({WorkOrderStatus? status});
}

/// @nodoc
class __$FilterByStatusCopyWithImpl<$Res>
    implements _$FilterByStatusCopyWith<$Res> {
  __$FilterByStatusCopyWithImpl(this._self, this._then);

  final _FilterByStatus _self;
  final $Res Function(_FilterByStatus) _then;

  /// Create a copy of WorkOrdersListEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_FilterByStatus(
      freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as WorkOrderStatus?,
    ));
  }
}

/// @nodoc

class _FilterByPriority implements WorkOrdersListEvent {
  const _FilterByPriority(this.priority);

  final WorkOrderPriority? priority;

  /// Create a copy of WorkOrdersListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FilterByPriorityCopyWith<_FilterByPriority> get copyWith =>
      __$FilterByPriorityCopyWithImpl<_FilterByPriority>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FilterByPriority &&
            (identical(other.priority, priority) ||
                other.priority == priority));
  }

  @override
  int get hashCode => Object.hash(runtimeType, priority);

  @override
  String toString() {
    return 'WorkOrdersListEvent.filterByPriority(priority: $priority)';
  }
}

/// @nodoc
abstract mixin class _$FilterByPriorityCopyWith<$Res>
    implements $WorkOrdersListEventCopyWith<$Res> {
  factory _$FilterByPriorityCopyWith(
          _FilterByPriority value, $Res Function(_FilterByPriority) _then) =
      __$FilterByPriorityCopyWithImpl;
  @useResult
  $Res call({WorkOrderPriority? priority});
}

/// @nodoc
class __$FilterByPriorityCopyWithImpl<$Res>
    implements _$FilterByPriorityCopyWith<$Res> {
  __$FilterByPriorityCopyWithImpl(this._self, this._then);

  final _FilterByPriority _self;
  final $Res Function(_FilterByPriority) _then;

  /// Create a copy of WorkOrdersListEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? priority = freezed,
  }) {
    return _then(_FilterByPriority(
      freezed == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as WorkOrderPriority?,
    ));
  }
}

/// @nodoc

class _SearchWorkOrders implements WorkOrdersListEvent {
  const _SearchWorkOrders(this.query);

  final String query;

  /// Create a copy of WorkOrdersListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchWorkOrdersCopyWith<_SearchWorkOrders> get copyWith =>
      __$SearchWorkOrdersCopyWithImpl<_SearchWorkOrders>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchWorkOrders &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @override
  String toString() {
    return 'WorkOrdersListEvent.searchWorkOrders(query: $query)';
  }
}

/// @nodoc
abstract mixin class _$SearchWorkOrdersCopyWith<$Res>
    implements $WorkOrdersListEventCopyWith<$Res> {
  factory _$SearchWorkOrdersCopyWith(
          _SearchWorkOrders value, $Res Function(_SearchWorkOrders) _then) =
      __$SearchWorkOrdersCopyWithImpl;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$SearchWorkOrdersCopyWithImpl<$Res>
    implements _$SearchWorkOrdersCopyWith<$Res> {
  __$SearchWorkOrdersCopyWithImpl(this._self, this._then);

  final _SearchWorkOrders _self;
  final $Res Function(_SearchWorkOrders) _then;

  /// Create a copy of WorkOrdersListEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
  }) {
    return _then(_SearchWorkOrders(
      null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _ClearFilters implements WorkOrdersListEvent {
  const _ClearFilters();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ClearFilters);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WorkOrdersListEvent.clearFilters()';
  }
}

/// @nodoc

class _SyncPendingWorkOrders implements WorkOrdersListEvent {
  const _SyncPendingWorkOrders();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SyncPendingWorkOrders);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WorkOrdersListEvent.syncPendingWorkOrders()';
  }
}

// dart format on
