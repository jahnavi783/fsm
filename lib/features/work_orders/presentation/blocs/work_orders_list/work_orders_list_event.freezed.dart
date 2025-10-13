// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_orders_list_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WorkOrdersListEvent {
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkOrdersListEventCopyWith<$Res> {
  factory $WorkOrdersListEventCopyWith(
          WorkOrdersListEvent value, $Res Function(WorkOrdersListEvent) then) =
      _$WorkOrdersListEventCopyWithImpl<$Res, WorkOrdersListEvent>;
}

/// @nodoc
class _$WorkOrdersListEventCopyWithImpl<$Res, $Val extends WorkOrdersListEvent>
    implements $WorkOrdersListEventCopyWith<$Res> {
  _$WorkOrdersListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadWorkOrdersImplCopyWith<$Res> {
  factory _$$LoadWorkOrdersImplCopyWith(_$LoadWorkOrdersImpl value,
          $Res Function(_$LoadWorkOrdersImpl) then) =
      __$$LoadWorkOrdersImplCopyWithImpl<$Res>;
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
class __$$LoadWorkOrdersImplCopyWithImpl<$Res>
    extends _$WorkOrdersListEventCopyWithImpl<$Res, _$LoadWorkOrdersImpl>
    implements _$$LoadWorkOrdersImplCopyWith<$Res> {
  __$$LoadWorkOrdersImplCopyWithImpl(
      _$LoadWorkOrdersImpl _value, $Res Function(_$LoadWorkOrdersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? status = freezed,
    Object? priority = freezed,
    Object? searchQuery = freezed,
    Object? isRefresh = null,
  }) {
    return _then(_$LoadWorkOrdersImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WorkOrderStatus?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as WorkOrderPriority?,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      isRefresh: null == isRefresh
          ? _value.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadWorkOrdersImpl implements _LoadWorkOrders {
  const _$LoadWorkOrdersImpl(
      {this.page = 1,
      this.limit = 20,
      this.status,
      this.priority,
      this.searchQuery,
      this.isRefresh = false});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;
  @override
  final WorkOrderStatus? status;
  @override
  final WorkOrderPriority? priority;
  @override
  final String? searchQuery;
  @override
  @JsonKey()
  final bool isRefresh;

  @override
  String toString() {
    return 'WorkOrdersListEvent.loadWorkOrders(page: $page, limit: $limit, status: $status, priority: $priority, searchQuery: $searchQuery, isRefresh: $isRefresh)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadWorkOrdersImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadWorkOrdersImplCopyWith<_$LoadWorkOrdersImpl> get copyWith =>
      __$$LoadWorkOrdersImplCopyWithImpl<_$LoadWorkOrdersImpl>(
          this, _$identity);

  @override
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
    return loadWorkOrders(
        page, limit, status, priority, searchQuery, isRefresh);
  }

  @override
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
    return loadWorkOrders?.call(
        page, limit, status, priority, searchQuery, isRefresh);
  }

  @override
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
    if (loadWorkOrders != null) {
      return loadWorkOrders(
          page, limit, status, priority, searchQuery, isRefresh);
    }
    return orElse();
  }

  @override
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
    return loadWorkOrders(this);
  }

  @override
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
    return loadWorkOrders?.call(this);
  }

  @override
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
    if (loadWorkOrders != null) {
      return loadWorkOrders(this);
    }
    return orElse();
  }
}

abstract class _LoadWorkOrders implements WorkOrdersListEvent {
  const factory _LoadWorkOrders(
      {final int page,
      final int limit,
      final WorkOrderStatus? status,
      final WorkOrderPriority? priority,
      final String? searchQuery,
      final bool isRefresh}) = _$LoadWorkOrdersImpl;

  int get page;
  int get limit;
  WorkOrderStatus? get status;
  WorkOrderPriority? get priority;
  String? get searchQuery;
  bool get isRefresh;
  @JsonKey(ignore: true)
  _$$LoadWorkOrdersImplCopyWith<_$LoadWorkOrdersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreWorkOrdersImplCopyWith<$Res> {
  factory _$$LoadMoreWorkOrdersImplCopyWith(_$LoadMoreWorkOrdersImpl value,
          $Res Function(_$LoadMoreWorkOrdersImpl) then) =
      __$$LoadMoreWorkOrdersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMoreWorkOrdersImplCopyWithImpl<$Res>
    extends _$WorkOrdersListEventCopyWithImpl<$Res, _$LoadMoreWorkOrdersImpl>
    implements _$$LoadMoreWorkOrdersImplCopyWith<$Res> {
  __$$LoadMoreWorkOrdersImplCopyWithImpl(_$LoadMoreWorkOrdersImpl _value,
      $Res Function(_$LoadMoreWorkOrdersImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadMoreWorkOrdersImpl implements _LoadMoreWorkOrders {
  const _$LoadMoreWorkOrdersImpl();

  @override
  String toString() {
    return 'WorkOrdersListEvent.loadMoreWorkOrders()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadMoreWorkOrdersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return loadMoreWorkOrders();
  }

  @override
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
    return loadMoreWorkOrders?.call();
  }

  @override
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
    if (loadMoreWorkOrders != null) {
      return loadMoreWorkOrders();
    }
    return orElse();
  }

  @override
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
    return loadMoreWorkOrders(this);
  }

  @override
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
    return loadMoreWorkOrders?.call(this);
  }

  @override
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
    if (loadMoreWorkOrders != null) {
      return loadMoreWorkOrders(this);
    }
    return orElse();
  }
}

abstract class _LoadMoreWorkOrders implements WorkOrdersListEvent {
  const factory _LoadMoreWorkOrders() = _$LoadMoreWorkOrdersImpl;
}

/// @nodoc
abstract class _$$RefreshWorkOrdersImplCopyWith<$Res> {
  factory _$$RefreshWorkOrdersImplCopyWith(_$RefreshWorkOrdersImpl value,
          $Res Function(_$RefreshWorkOrdersImpl) then) =
      __$$RefreshWorkOrdersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshWorkOrdersImplCopyWithImpl<$Res>
    extends _$WorkOrdersListEventCopyWithImpl<$Res, _$RefreshWorkOrdersImpl>
    implements _$$RefreshWorkOrdersImplCopyWith<$Res> {
  __$$RefreshWorkOrdersImplCopyWithImpl(_$RefreshWorkOrdersImpl _value,
      $Res Function(_$RefreshWorkOrdersImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RefreshWorkOrdersImpl implements _RefreshWorkOrders {
  const _$RefreshWorkOrdersImpl();

  @override
  String toString() {
    return 'WorkOrdersListEvent.refreshWorkOrders()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshWorkOrdersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return refreshWorkOrders();
  }

  @override
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
    return refreshWorkOrders?.call();
  }

  @override
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
    if (refreshWorkOrders != null) {
      return refreshWorkOrders();
    }
    return orElse();
  }

  @override
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
    return refreshWorkOrders(this);
  }

  @override
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
    return refreshWorkOrders?.call(this);
  }

  @override
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
    if (refreshWorkOrders != null) {
      return refreshWorkOrders(this);
    }
    return orElse();
  }
}

abstract class _RefreshWorkOrders implements WorkOrdersListEvent {
  const factory _RefreshWorkOrders() = _$RefreshWorkOrdersImpl;
}

/// @nodoc
abstract class _$$FilterByStatusImplCopyWith<$Res> {
  factory _$$FilterByStatusImplCopyWith(_$FilterByStatusImpl value,
          $Res Function(_$FilterByStatusImpl) then) =
      __$$FilterByStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({WorkOrderStatus? status});
}

/// @nodoc
class __$$FilterByStatusImplCopyWithImpl<$Res>
    extends _$WorkOrdersListEventCopyWithImpl<$Res, _$FilterByStatusImpl>
    implements _$$FilterByStatusImplCopyWith<$Res> {
  __$$FilterByStatusImplCopyWithImpl(
      _$FilterByStatusImpl _value, $Res Function(_$FilterByStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$FilterByStatusImpl(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WorkOrderStatus?,
    ));
  }
}

/// @nodoc

class _$FilterByStatusImpl implements _FilterByStatus {
  const _$FilterByStatusImpl(this.status);

  @override
  final WorkOrderStatus? status;

  @override
  String toString() {
    return 'WorkOrdersListEvent.filterByStatus(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterByStatusImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterByStatusImplCopyWith<_$FilterByStatusImpl> get copyWith =>
      __$$FilterByStatusImplCopyWithImpl<_$FilterByStatusImpl>(
          this, _$identity);

  @override
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
    return filterByStatus(status);
  }

  @override
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
    return filterByStatus?.call(status);
  }

  @override
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
    if (filterByStatus != null) {
      return filterByStatus(status);
    }
    return orElse();
  }

  @override
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
    return filterByStatus(this);
  }

  @override
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
    return filterByStatus?.call(this);
  }

  @override
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
    if (filterByStatus != null) {
      return filterByStatus(this);
    }
    return orElse();
  }
}

abstract class _FilterByStatus implements WorkOrdersListEvent {
  const factory _FilterByStatus(final WorkOrderStatus? status) =
      _$FilterByStatusImpl;

  WorkOrderStatus? get status;
  @JsonKey(ignore: true)
  _$$FilterByStatusImplCopyWith<_$FilterByStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterByPriorityImplCopyWith<$Res> {
  factory _$$FilterByPriorityImplCopyWith(_$FilterByPriorityImpl value,
          $Res Function(_$FilterByPriorityImpl) then) =
      __$$FilterByPriorityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({WorkOrderPriority? priority});
}

/// @nodoc
class __$$FilterByPriorityImplCopyWithImpl<$Res>
    extends _$WorkOrdersListEventCopyWithImpl<$Res, _$FilterByPriorityImpl>
    implements _$$FilterByPriorityImplCopyWith<$Res> {
  __$$FilterByPriorityImplCopyWithImpl(_$FilterByPriorityImpl _value,
      $Res Function(_$FilterByPriorityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priority = freezed,
  }) {
    return _then(_$FilterByPriorityImpl(
      freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as WorkOrderPriority?,
    ));
  }
}

/// @nodoc

class _$FilterByPriorityImpl implements _FilterByPriority {
  const _$FilterByPriorityImpl(this.priority);

  @override
  final WorkOrderPriority? priority;

  @override
  String toString() {
    return 'WorkOrdersListEvent.filterByPriority(priority: $priority)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterByPriorityImpl &&
            (identical(other.priority, priority) ||
                other.priority == priority));
  }

  @override
  int get hashCode => Object.hash(runtimeType, priority);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterByPriorityImplCopyWith<_$FilterByPriorityImpl> get copyWith =>
      __$$FilterByPriorityImplCopyWithImpl<_$FilterByPriorityImpl>(
          this, _$identity);

  @override
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
    return filterByPriority(priority);
  }

  @override
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
    return filterByPriority?.call(priority);
  }

  @override
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
    if (filterByPriority != null) {
      return filterByPriority(priority);
    }
    return orElse();
  }

  @override
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
    return filterByPriority(this);
  }

  @override
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
    return filterByPriority?.call(this);
  }

  @override
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
    if (filterByPriority != null) {
      return filterByPriority(this);
    }
    return orElse();
  }
}

abstract class _FilterByPriority implements WorkOrdersListEvent {
  const factory _FilterByPriority(final WorkOrderPriority? priority) =
      _$FilterByPriorityImpl;

  WorkOrderPriority? get priority;
  @JsonKey(ignore: true)
  _$$FilterByPriorityImplCopyWith<_$FilterByPriorityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchWorkOrdersImplCopyWith<$Res> {
  factory _$$SearchWorkOrdersImplCopyWith(_$SearchWorkOrdersImpl value,
          $Res Function(_$SearchWorkOrdersImpl) then) =
      __$$SearchWorkOrdersImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchWorkOrdersImplCopyWithImpl<$Res>
    extends _$WorkOrdersListEventCopyWithImpl<$Res, _$SearchWorkOrdersImpl>
    implements _$$SearchWorkOrdersImplCopyWith<$Res> {
  __$$SearchWorkOrdersImplCopyWithImpl(_$SearchWorkOrdersImpl _value,
      $Res Function(_$SearchWorkOrdersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchWorkOrdersImpl(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchWorkOrdersImpl implements _SearchWorkOrders {
  const _$SearchWorkOrdersImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'WorkOrdersListEvent.searchWorkOrders(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchWorkOrdersImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchWorkOrdersImplCopyWith<_$SearchWorkOrdersImpl> get copyWith =>
      __$$SearchWorkOrdersImplCopyWithImpl<_$SearchWorkOrdersImpl>(
          this, _$identity);

  @override
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
    return searchWorkOrders(query);
  }

  @override
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
    return searchWorkOrders?.call(query);
  }

  @override
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
    if (searchWorkOrders != null) {
      return searchWorkOrders(query);
    }
    return orElse();
  }

  @override
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
    return searchWorkOrders(this);
  }

  @override
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
    return searchWorkOrders?.call(this);
  }

  @override
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
    if (searchWorkOrders != null) {
      return searchWorkOrders(this);
    }
    return orElse();
  }
}

abstract class _SearchWorkOrders implements WorkOrdersListEvent {
  const factory _SearchWorkOrders(final String query) = _$SearchWorkOrdersImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$SearchWorkOrdersImplCopyWith<_$SearchWorkOrdersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearFiltersImplCopyWith<$Res> {
  factory _$$ClearFiltersImplCopyWith(
          _$ClearFiltersImpl value, $Res Function(_$ClearFiltersImpl) then) =
      __$$ClearFiltersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearFiltersImplCopyWithImpl<$Res>
    extends _$WorkOrdersListEventCopyWithImpl<$Res, _$ClearFiltersImpl>
    implements _$$ClearFiltersImplCopyWith<$Res> {
  __$$ClearFiltersImplCopyWithImpl(
      _$ClearFiltersImpl _value, $Res Function(_$ClearFiltersImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearFiltersImpl implements _ClearFilters {
  const _$ClearFiltersImpl();

  @override
  String toString() {
    return 'WorkOrdersListEvent.clearFilters()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearFiltersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return clearFilters();
  }

  @override
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
    return clearFilters?.call();
  }

  @override
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
    if (clearFilters != null) {
      return clearFilters();
    }
    return orElse();
  }

  @override
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
    return clearFilters(this);
  }

  @override
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
    return clearFilters?.call(this);
  }

  @override
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
    if (clearFilters != null) {
      return clearFilters(this);
    }
    return orElse();
  }
}

abstract class _ClearFilters implements WorkOrdersListEvent {
  const factory _ClearFilters() = _$ClearFiltersImpl;
}

/// @nodoc
abstract class _$$SyncPendingWorkOrdersImplCopyWith<$Res> {
  factory _$$SyncPendingWorkOrdersImplCopyWith(
          _$SyncPendingWorkOrdersImpl value,
          $Res Function(_$SyncPendingWorkOrdersImpl) then) =
      __$$SyncPendingWorkOrdersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncPendingWorkOrdersImplCopyWithImpl<$Res>
    extends _$WorkOrdersListEventCopyWithImpl<$Res, _$SyncPendingWorkOrdersImpl>
    implements _$$SyncPendingWorkOrdersImplCopyWith<$Res> {
  __$$SyncPendingWorkOrdersImplCopyWithImpl(_$SyncPendingWorkOrdersImpl _value,
      $Res Function(_$SyncPendingWorkOrdersImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SyncPendingWorkOrdersImpl implements _SyncPendingWorkOrders {
  const _$SyncPendingWorkOrdersImpl();

  @override
  String toString() {
    return 'WorkOrdersListEvent.syncPendingWorkOrders()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncPendingWorkOrdersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return syncPendingWorkOrders();
  }

  @override
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
    return syncPendingWorkOrders?.call();
  }

  @override
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
    if (syncPendingWorkOrders != null) {
      return syncPendingWorkOrders();
    }
    return orElse();
  }

  @override
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
    return syncPendingWorkOrders(this);
  }

  @override
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
    return syncPendingWorkOrders?.call(this);
  }

  @override
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
    if (syncPendingWorkOrders != null) {
      return syncPendingWorkOrders(this);
    }
    return orElse();
  }
}

abstract class _SyncPendingWorkOrders implements WorkOrdersListEvent {
  const factory _SyncPendingWorkOrders() = _$SyncPendingWorkOrdersImpl;
}
