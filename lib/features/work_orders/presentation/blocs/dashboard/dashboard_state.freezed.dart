// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DashboardState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DashboardState()';
  }
}

/// @nodoc
class $DashboardStateCopyWith<$Res> {
  $DashboardStateCopyWith(DashboardState _, $Res Function(DashboardState) __);
}

/// Adds pattern-matching-related methods to [DashboardState].
extension DashboardStatePatterns on DashboardState {
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
            WorkOrderEntity? currentWorkOrder,
            List<WorkOrderEntity> workOrders,
            List<WorkOrderEntity> unassignedWorkOrders,
            int unassignedCount,
            int assignedCount,
            int inProgressCount,
            int pausedCount,
            int completedCount,
            int selectedTab,
            List<WorkOrderEntity> filteredWorkOrders,
            bool offlineBannerDismissed,
            String? searchQuery,
            String? statusFilter,
            WorkOrderPriority? priorityFilter,
            bool isOffline,
            bool hasPendingSync,
            bool isLoadingMore,
            bool hasReachedMax,
            int currentPage)?
        loaded,
    TResult Function(
            Failure failure, List<WorkOrderEntity> workOrders, bool isOffline)?
        error,
    TResult Function(
            List<WorkOrderEntity> workOrders,
            WorkOrderEntity? currentWorkOrder,
            int unassignedCount,
            int assignedCount,
            int inProgressCount,
            int pausedCount,
            int completedCount)?
        syncing,
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
            _that.currentWorkOrder,
            _that.workOrders,
            _that.unassignedWorkOrders,
            _that.unassignedCount,
            _that.assignedCount,
            _that.inProgressCount,
            _that.pausedCount,
            _that.completedCount,
            _that.selectedTab,
            _that.filteredWorkOrders,
            _that.offlineBannerDismissed,
            _that.searchQuery,
            _that.statusFilter,
            _that.priorityFilter,
            _that.isOffline,
            _that.hasPendingSync,
            _that.isLoadingMore,
            _that.hasReachedMax,
            _that.currentPage);
      case _Error() when error != null:
        return error(_that.failure, _that.workOrders, _that.isOffline);
      case _Syncing() when syncing != null:
        return syncing(
            _that.workOrders,
            _that.currentWorkOrder,
            _that.unassignedCount,
            _that.assignedCount,
            _that.inProgressCount,
            _that.pausedCount,
            _that.completedCount);
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
            WorkOrderEntity? currentWorkOrder,
            List<WorkOrderEntity> workOrders,
            List<WorkOrderEntity> unassignedWorkOrders,
            int unassignedCount,
            int assignedCount,
            int inProgressCount,
            int pausedCount,
            int completedCount,
            int selectedTab,
            List<WorkOrderEntity> filteredWorkOrders,
            bool offlineBannerDismissed,
            String? searchQuery,
            String? statusFilter,
            WorkOrderPriority? priorityFilter,
            bool isOffline,
            bool hasPendingSync,
            bool isLoadingMore,
            bool hasReachedMax,
            int currentPage)
        loaded,
    required TResult Function(
            Failure failure, List<WorkOrderEntity> workOrders, bool isOffline)
        error,
    required TResult Function(
            List<WorkOrderEntity> workOrders,
            WorkOrderEntity? currentWorkOrder,
            int unassignedCount,
            int assignedCount,
            int inProgressCount,
            int pausedCount,
            int completedCount)
        syncing,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _Loaded():
        return loaded(
            _that.currentWorkOrder,
            _that.workOrders,
            _that.unassignedWorkOrders,
            _that.unassignedCount,
            _that.assignedCount,
            _that.inProgressCount,
            _that.pausedCount,
            _that.completedCount,
            _that.selectedTab,
            _that.filteredWorkOrders,
            _that.offlineBannerDismissed,
            _that.searchQuery,
            _that.statusFilter,
            _that.priorityFilter,
            _that.isOffline,
            _that.hasPendingSync,
            _that.isLoadingMore,
            _that.hasReachedMax,
            _that.currentPage);
      case _Error():
        return error(_that.failure, _that.workOrders, _that.isOffline);
      case _Syncing():
        return syncing(
            _that.workOrders,
            _that.currentWorkOrder,
            _that.unassignedCount,
            _that.assignedCount,
            _that.inProgressCount,
            _that.pausedCount,
            _that.completedCount);
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
            WorkOrderEntity? currentWorkOrder,
            List<WorkOrderEntity> workOrders,
            List<WorkOrderEntity> unassignedWorkOrders,
            int unassignedCount,
            int assignedCount,
            int inProgressCount,
            int pausedCount,
            int completedCount,
            int selectedTab,
            List<WorkOrderEntity> filteredWorkOrders,
            bool offlineBannerDismissed,
            String? searchQuery,
            String? statusFilter,
            WorkOrderPriority? priorityFilter,
            bool isOffline,
            bool hasPendingSync,
            bool isLoadingMore,
            bool hasReachedMax,
            int currentPage)?
        loaded,
    TResult? Function(
            Failure failure, List<WorkOrderEntity> workOrders, bool isOffline)?
        error,
    TResult? Function(
            List<WorkOrderEntity> workOrders,
            WorkOrderEntity? currentWorkOrder,
            int unassignedCount,
            int assignedCount,
            int inProgressCount,
            int pausedCount,
            int completedCount)?
        syncing,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Loaded() when loaded != null:
        return loaded(
            _that.currentWorkOrder,
            _that.workOrders,
            _that.unassignedWorkOrders,
            _that.unassignedCount,
            _that.assignedCount,
            _that.inProgressCount,
            _that.pausedCount,
            _that.completedCount,
            _that.selectedTab,
            _that.filteredWorkOrders,
            _that.offlineBannerDismissed,
            _that.searchQuery,
            _that.statusFilter,
            _that.priorityFilter,
            _that.isOffline,
            _that.hasPendingSync,
            _that.isLoadingMore,
            _that.hasReachedMax,
            _that.currentPage);
      case _Error() when error != null:
        return error(_that.failure, _that.workOrders, _that.isOffline);
      case _Syncing() when syncing != null:
        return syncing(
            _that.workOrders,
            _that.currentWorkOrder,
            _that.unassignedCount,
            _that.assignedCount,
            _that.inProgressCount,
            _that.pausedCount,
            _that.completedCount);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements DashboardState {
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
    return 'DashboardState.initial()';
  }
}

/// @nodoc

class _Loading implements DashboardState {
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
    return 'DashboardState.loading()';
  }
}

/// @nodoc

class _Loaded implements DashboardState {
  const _Loaded(
      {this.currentWorkOrder,
      final List<WorkOrderEntity> workOrders = const [],
      final List<WorkOrderEntity> unassignedWorkOrders = const [],
      this.unassignedCount = 0,
      this.assignedCount = 0,
      this.inProgressCount = 0,
      this.pausedCount = 0,
      this.completedCount = 0,
      this.selectedTab = 0,
      final List<WorkOrderEntity> filteredWorkOrders = const [],
      this.offlineBannerDismissed = false,
      this.searchQuery,
      this.statusFilter,
      this.priorityFilter,
      this.isOffline = false,
      this.hasPendingSync = false,
      this.isLoadingMore = false,
      this.hasReachedMax = false,
      this.currentPage = 1})
      : _workOrders = workOrders,
        _unassignedWorkOrders = unassignedWorkOrders,
        _filteredWorkOrders = filteredWorkOrders;

// Current active work order (in progress)
  final WorkOrderEntity? currentWorkOrder;
// All work orders for list
  final List<WorkOrderEntity> _workOrders;
// All work orders for list
  @JsonKey()
  List<WorkOrderEntity> get workOrders {
    if (_workOrders is EqualUnmodifiableListView) return _workOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workOrders);
  }

// Unassigned work orders
  final List<WorkOrderEntity> _unassignedWorkOrders;
// Unassigned work orders
  @JsonKey()
  List<WorkOrderEntity> get unassignedWorkOrders {
    if (_unassignedWorkOrders is EqualUnmodifiableListView)
      return _unassignedWorkOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unassignedWorkOrders);
  }

// Status counts for summary grid
  @JsonKey()
  final int unassignedCount;
  @JsonKey()
  final int assignedCount;
  @JsonKey()
  final int inProgressCount;
  @JsonKey()
  final int pausedCount;
  @JsonKey()
  final int completedCount;
// UI state
  @JsonKey()
  final int selectedTab;
  final List<WorkOrderEntity> _filteredWorkOrders;
  @JsonKey()
  List<WorkOrderEntity> get filteredWorkOrders {
    if (_filteredWorkOrders is EqualUnmodifiableListView)
      return _filteredWorkOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredWorkOrders);
  }

  @JsonKey()
  final bool offlineBannerDismissed;
// Search and filter state
  final String? searchQuery;
  final String? statusFilter;
  final WorkOrderPriority? priorityFilter;
// Network and sync state
  @JsonKey()
  final bool isOffline;
  @JsonKey()
  final bool hasPendingSync;
  @JsonKey()
  final bool isLoadingMore;
  @JsonKey()
  final bool hasReachedMax;
  @JsonKey()
  final int currentPage;

  /// Create a copy of DashboardState
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
            (identical(other.currentWorkOrder, currentWorkOrder) ||
                other.currentWorkOrder == currentWorkOrder) &&
            const DeepCollectionEquality()
                .equals(other._workOrders, _workOrders) &&
            const DeepCollectionEquality()
                .equals(other._unassignedWorkOrders, _unassignedWorkOrders) &&
            (identical(other.unassignedCount, unassignedCount) ||
                other.unassignedCount == unassignedCount) &&
            (identical(other.assignedCount, assignedCount) ||
                other.assignedCount == assignedCount) &&
            (identical(other.inProgressCount, inProgressCount) ||
                other.inProgressCount == inProgressCount) &&
            (identical(other.pausedCount, pausedCount) ||
                other.pausedCount == pausedCount) &&
            (identical(other.completedCount, completedCount) ||
                other.completedCount == completedCount) &&
            (identical(other.selectedTab, selectedTab) ||
                other.selectedTab == selectedTab) &&
            const DeepCollectionEquality()
                .equals(other._filteredWorkOrders, _filteredWorkOrders) &&
            (identical(other.offlineBannerDismissed, offlineBannerDismissed) ||
                other.offlineBannerDismissed == offlineBannerDismissed) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.statusFilter, statusFilter) ||
                other.statusFilter == statusFilter) &&
            (identical(other.priorityFilter, priorityFilter) ||
                other.priorityFilter == priorityFilter) &&
            (identical(other.isOffline, isOffline) ||
                other.isOffline == isOffline) &&
            (identical(other.hasPendingSync, hasPendingSync) ||
                other.hasPendingSync == hasPendingSync) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        currentWorkOrder,
        const DeepCollectionEquality().hash(_workOrders),
        const DeepCollectionEquality().hash(_unassignedWorkOrders),
        unassignedCount,
        assignedCount,
        inProgressCount,
        pausedCount,
        completedCount,
        selectedTab,
        const DeepCollectionEquality().hash(_filteredWorkOrders),
        offlineBannerDismissed,
        searchQuery,
        statusFilter,
        priorityFilter,
        isOffline,
        hasPendingSync,
        isLoadingMore,
        hasReachedMax,
        currentPage
      ]);

  @override
  String toString() {
    return 'DashboardState.loaded(currentWorkOrder: $currentWorkOrder, workOrders: $workOrders, unassignedWorkOrders: $unassignedWorkOrders, unassignedCount: $unassignedCount, assignedCount: $assignedCount, inProgressCount: $inProgressCount, pausedCount: $pausedCount, completedCount: $completedCount, selectedTab: $selectedTab, filteredWorkOrders: $filteredWorkOrders, offlineBannerDismissed: $offlineBannerDismissed, searchQuery: $searchQuery, statusFilter: $statusFilter, priorityFilter: $priorityFilter, isOffline: $isOffline, hasPendingSync: $hasPendingSync, isLoadingMore: $isLoadingMore, hasReachedMax: $hasReachedMax, currentPage: $currentPage)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @useResult
  $Res call(
      {WorkOrderEntity? currentWorkOrder,
      List<WorkOrderEntity> workOrders,
      List<WorkOrderEntity> unassignedWorkOrders,
      int unassignedCount,
      int assignedCount,
      int inProgressCount,
      int pausedCount,
      int completedCount,
      int selectedTab,
      List<WorkOrderEntity> filteredWorkOrders,
      bool offlineBannerDismissed,
      String? searchQuery,
      String? statusFilter,
      WorkOrderPriority? priorityFilter,
      bool isOffline,
      bool hasPendingSync,
      bool isLoadingMore,
      bool hasReachedMax,
      int currentPage});

  $WorkOrderEntityCopyWith<$Res>? get currentWorkOrder;
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentWorkOrder = freezed,
    Object? workOrders = null,
    Object? unassignedWorkOrders = null,
    Object? unassignedCount = null,
    Object? assignedCount = null,
    Object? inProgressCount = null,
    Object? pausedCount = null,
    Object? completedCount = null,
    Object? selectedTab = null,
    Object? filteredWorkOrders = null,
    Object? offlineBannerDismissed = null,
    Object? searchQuery = freezed,
    Object? statusFilter = freezed,
    Object? priorityFilter = freezed,
    Object? isOffline = null,
    Object? hasPendingSync = null,
    Object? isLoadingMore = null,
    Object? hasReachedMax = null,
    Object? currentPage = null,
  }) {
    return _then(_Loaded(
      currentWorkOrder: freezed == currentWorkOrder
          ? _self.currentWorkOrder
          : currentWorkOrder // ignore: cast_nullable_to_non_nullable
              as WorkOrderEntity?,
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
      assignedCount: null == assignedCount
          ? _self.assignedCount
          : assignedCount // ignore: cast_nullable_to_non_nullable
              as int,
      inProgressCount: null == inProgressCount
          ? _self.inProgressCount
          : inProgressCount // ignore: cast_nullable_to_non_nullable
              as int,
      pausedCount: null == pausedCount
          ? _self.pausedCount
          : pausedCount // ignore: cast_nullable_to_non_nullable
              as int,
      completedCount: null == completedCount
          ? _self.completedCount
          : completedCount // ignore: cast_nullable_to_non_nullable
              as int,
      selectedTab: null == selectedTab
          ? _self.selectedTab
          : selectedTab // ignore: cast_nullable_to_non_nullable
              as int,
      filteredWorkOrders: null == filteredWorkOrders
          ? _self._filteredWorkOrders
          : filteredWorkOrders // ignore: cast_nullable_to_non_nullable
              as List<WorkOrderEntity>,
      offlineBannerDismissed: null == offlineBannerDismissed
          ? _self.offlineBannerDismissed
          : offlineBannerDismissed // ignore: cast_nullable_to_non_nullable
              as bool,
      searchQuery: freezed == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      statusFilter: freezed == statusFilter
          ? _self.statusFilter
          : statusFilter // ignore: cast_nullable_to_non_nullable
              as String?,
      priorityFilter: freezed == priorityFilter
          ? _self.priorityFilter
          : priorityFilter // ignore: cast_nullable_to_non_nullable
              as WorkOrderPriority?,
      isOffline: null == isOffline
          ? _self.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPendingSync: null == hasPendingSync
          ? _self.hasPendingSync
          : hasPendingSync // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _self.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      hasReachedMax: null == hasReachedMax
          ? _self.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkOrderEntityCopyWith<$Res>? get currentWorkOrder {
    if (_self.currentWorkOrder == null) {
      return null;
    }

    return $WorkOrderEntityCopyWith<$Res>(_self.currentWorkOrder!, (value) {
      return _then(_self.copyWith(currentWorkOrder: value));
    });
  }
}

/// @nodoc

class _Error implements DashboardState {
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

  /// Create a copy of DashboardState
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
    return 'DashboardState.error(failure: $failure, workOrders: $workOrders, isOffline: $isOffline)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
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

  /// Create a copy of DashboardState
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

  /// Create a copy of DashboardState
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

class _Syncing implements DashboardState {
  const _Syncing(
      {required final List<WorkOrderEntity> workOrders,
      this.currentWorkOrder,
      this.unassignedCount = 0,
      this.assignedCount = 0,
      this.inProgressCount = 0,
      this.pausedCount = 0,
      this.completedCount = 0})
      : _workOrders = workOrders;

  final List<WorkOrderEntity> _workOrders;
  List<WorkOrderEntity> get workOrders {
    if (_workOrders is EqualUnmodifiableListView) return _workOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workOrders);
  }

  final WorkOrderEntity? currentWorkOrder;
  @JsonKey()
  final int unassignedCount;
  @JsonKey()
  final int assignedCount;
  @JsonKey()
  final int inProgressCount;
  @JsonKey()
  final int pausedCount;
  @JsonKey()
  final int completedCount;

  /// Create a copy of DashboardState
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
                .equals(other._workOrders, _workOrders) &&
            (identical(other.currentWorkOrder, currentWorkOrder) ||
                other.currentWorkOrder == currentWorkOrder) &&
            (identical(other.unassignedCount, unassignedCount) ||
                other.unassignedCount == unassignedCount) &&
            (identical(other.assignedCount, assignedCount) ||
                other.assignedCount == assignedCount) &&
            (identical(other.inProgressCount, inProgressCount) ||
                other.inProgressCount == inProgressCount) &&
            (identical(other.pausedCount, pausedCount) ||
                other.pausedCount == pausedCount) &&
            (identical(other.completedCount, completedCount) ||
                other.completedCount == completedCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_workOrders),
      currentWorkOrder,
      unassignedCount,
      assignedCount,
      inProgressCount,
      pausedCount,
      completedCount);

  @override
  String toString() {
    return 'DashboardState.syncing(workOrders: $workOrders, currentWorkOrder: $currentWorkOrder, unassignedCount: $unassignedCount, assignedCount: $assignedCount, inProgressCount: $inProgressCount, pausedCount: $pausedCount, completedCount: $completedCount)';
  }
}

/// @nodoc
abstract mixin class _$SyncingCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory _$SyncingCopyWith(_Syncing value, $Res Function(_Syncing) _then) =
      __$SyncingCopyWithImpl;
  @useResult
  $Res call(
      {List<WorkOrderEntity> workOrders,
      WorkOrderEntity? currentWorkOrder,
      int unassignedCount,
      int assignedCount,
      int inProgressCount,
      int pausedCount,
      int completedCount});

  $WorkOrderEntityCopyWith<$Res>? get currentWorkOrder;
}

/// @nodoc
class __$SyncingCopyWithImpl<$Res> implements _$SyncingCopyWith<$Res> {
  __$SyncingCopyWithImpl(this._self, this._then);

  final _Syncing _self;
  final $Res Function(_Syncing) _then;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workOrders = null,
    Object? currentWorkOrder = freezed,
    Object? unassignedCount = null,
    Object? assignedCount = null,
    Object? inProgressCount = null,
    Object? pausedCount = null,
    Object? completedCount = null,
  }) {
    return _then(_Syncing(
      workOrders: null == workOrders
          ? _self._workOrders
          : workOrders // ignore: cast_nullable_to_non_nullable
              as List<WorkOrderEntity>,
      currentWorkOrder: freezed == currentWorkOrder
          ? _self.currentWorkOrder
          : currentWorkOrder // ignore: cast_nullable_to_non_nullable
              as WorkOrderEntity?,
      unassignedCount: null == unassignedCount
          ? _self.unassignedCount
          : unassignedCount // ignore: cast_nullable_to_non_nullable
              as int,
      assignedCount: null == assignedCount
          ? _self.assignedCount
          : assignedCount // ignore: cast_nullable_to_non_nullable
              as int,
      inProgressCount: null == inProgressCount
          ? _self.inProgressCount
          : inProgressCount // ignore: cast_nullable_to_non_nullable
              as int,
      pausedCount: null == pausedCount
          ? _self.pausedCount
          : pausedCount // ignore: cast_nullable_to_non_nullable
              as int,
      completedCount: null == completedCount
          ? _self.completedCount
          : completedCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkOrderEntityCopyWith<$Res>? get currentWorkOrder {
    if (_self.currentWorkOrder == null) {
      return null;
    }

    return $WorkOrderEntityCopyWith<$Res>(_self.currentWorkOrder!, (value) {
      return _then(_self.copyWith(currentWorkOrder: value));
    });
  }
}

// dart format on
