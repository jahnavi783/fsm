// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DashboardEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DashboardEvent()';
  }
}

/// @nodoc
class $DashboardEventCopyWith<$Res> {
  $DashboardEventCopyWith(DashboardEvent _, $Res Function(DashboardEvent) __);
}

/// Adds pattern-matching-related methods to [DashboardEvent].
extension DashboardEventPatterns on DashboardEvent {
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
    TResult Function(_LoadDashboard value)? loadDashboard,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_SelectTab value)? selectTab,
    TResult Function(_RefreshDashboard value)? refreshDashboard,
    TResult Function(_DismissOfflineBanner value)? dismissOfflineBanner,
    TResult Function(_SearchWorkOrders value)? searchWorkOrders,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_SyncPendingWorkOrders value)? syncPendingWorkOrders,
    TResult Function(_AssignWorkOrderToSelf value)? assignWorkOrderToSelf,
    TResult Function(_StartWorkOrder value)? startWorkOrder,
    TResult Function(_PauseWorkOrder value)? pauseWorkOrder,
    TResult Function(_ResumeWorkOrder value)? resumeWorkOrder,
    TResult Function(_CompleteWorkOrder value)? completeWorkOrder,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadDashboard() when loadDashboard != null:
        return loadDashboard(_that);
      case _FilterByStatus() when filterByStatus != null:
        return filterByStatus(_that);
      case _SelectTab() when selectTab != null:
        return selectTab(_that);
      case _RefreshDashboard() when refreshDashboard != null:
        return refreshDashboard(_that);
      case _DismissOfflineBanner() when dismissOfflineBanner != null:
        return dismissOfflineBanner(_that);
      case _SearchWorkOrders() when searchWorkOrders != null:
        return searchWorkOrders(_that);
      case _ClearFilters() when clearFilters != null:
        return clearFilters(_that);
      case _SyncPendingWorkOrders() when syncPendingWorkOrders != null:
        return syncPendingWorkOrders(_that);
      case _AssignWorkOrderToSelf() when assignWorkOrderToSelf != null:
        return assignWorkOrderToSelf(_that);
      case _StartWorkOrder() when startWorkOrder != null:
        return startWorkOrder(_that);
      case _PauseWorkOrder() when pauseWorkOrder != null:
        return pauseWorkOrder(_that);
      case _ResumeWorkOrder() when resumeWorkOrder != null:
        return resumeWorkOrder(_that);
      case _CompleteWorkOrder() when completeWorkOrder != null:
        return completeWorkOrder(_that);
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
    required TResult Function(_LoadDashboard value) loadDashboard,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_SelectTab value) selectTab,
    required TResult Function(_RefreshDashboard value) refreshDashboard,
    required TResult Function(_DismissOfflineBanner value) dismissOfflineBanner,
    required TResult Function(_SearchWorkOrders value) searchWorkOrders,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_SyncPendingWorkOrders value)
        syncPendingWorkOrders,
    required TResult Function(_AssignWorkOrderToSelf value)
        assignWorkOrderToSelf,
    required TResult Function(_StartWorkOrder value) startWorkOrder,
    required TResult Function(_PauseWorkOrder value) pauseWorkOrder,
    required TResult Function(_ResumeWorkOrder value) resumeWorkOrder,
    required TResult Function(_CompleteWorkOrder value) completeWorkOrder,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadDashboard():
        return loadDashboard(_that);
      case _FilterByStatus():
        return filterByStatus(_that);
      case _SelectTab():
        return selectTab(_that);
      case _RefreshDashboard():
        return refreshDashboard(_that);
      case _DismissOfflineBanner():
        return dismissOfflineBanner(_that);
      case _SearchWorkOrders():
        return searchWorkOrders(_that);
      case _ClearFilters():
        return clearFilters(_that);
      case _SyncPendingWorkOrders():
        return syncPendingWorkOrders(_that);
      case _AssignWorkOrderToSelf():
        return assignWorkOrderToSelf(_that);
      case _StartWorkOrder():
        return startWorkOrder(_that);
      case _PauseWorkOrder():
        return pauseWorkOrder(_that);
      case _ResumeWorkOrder():
        return resumeWorkOrder(_that);
      case _CompleteWorkOrder():
        return completeWorkOrder(_that);
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
    TResult? Function(_LoadDashboard value)? loadDashboard,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_SelectTab value)? selectTab,
    TResult? Function(_RefreshDashboard value)? refreshDashboard,
    TResult? Function(_DismissOfflineBanner value)? dismissOfflineBanner,
    TResult? Function(_SearchWorkOrders value)? searchWorkOrders,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_SyncPendingWorkOrders value)? syncPendingWorkOrders,
    TResult? Function(_AssignWorkOrderToSelf value)? assignWorkOrderToSelf,
    TResult? Function(_StartWorkOrder value)? startWorkOrder,
    TResult? Function(_PauseWorkOrder value)? pauseWorkOrder,
    TResult? Function(_ResumeWorkOrder value)? resumeWorkOrder,
    TResult? Function(_CompleteWorkOrder value)? completeWorkOrder,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadDashboard() when loadDashboard != null:
        return loadDashboard(_that);
      case _FilterByStatus() when filterByStatus != null:
        return filterByStatus(_that);
      case _SelectTab() when selectTab != null:
        return selectTab(_that);
      case _RefreshDashboard() when refreshDashboard != null:
        return refreshDashboard(_that);
      case _DismissOfflineBanner() when dismissOfflineBanner != null:
        return dismissOfflineBanner(_that);
      case _SearchWorkOrders() when searchWorkOrders != null:
        return searchWorkOrders(_that);
      case _ClearFilters() when clearFilters != null:
        return clearFilters(_that);
      case _SyncPendingWorkOrders() when syncPendingWorkOrders != null:
        return syncPendingWorkOrders(_that);
      case _AssignWorkOrderToSelf() when assignWorkOrderToSelf != null:
        return assignWorkOrderToSelf(_that);
      case _StartWorkOrder() when startWorkOrder != null:
        return startWorkOrder(_that);
      case _PauseWorkOrder() when pauseWorkOrder != null:
        return pauseWorkOrder(_that);
      case _ResumeWorkOrder() when resumeWorkOrder != null:
        return resumeWorkOrder(_that);
      case _CompleteWorkOrder() when completeWorkOrder != null:
        return completeWorkOrder(_that);
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
    TResult Function()? loadDashboard,
    TResult Function(String status)? filterByStatus,
    TResult Function(int tabIndex)? selectTab,
    TResult Function()? refreshDashboard,
    TResult Function()? dismissOfflineBanner,
    TResult Function(String query)? searchWorkOrders,
    TResult Function()? clearFilters,
    TResult Function()? syncPendingWorkOrders,
    TResult Function(int workOrderId)? assignWorkOrderToSelf,
    TResult Function(int workOrderId)? startWorkOrder,
    TResult Function(int workOrderId)? pauseWorkOrder,
    TResult Function(int workOrderId)? resumeWorkOrder,
    TResult Function(int workOrderId)? completeWorkOrder,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadDashboard() when loadDashboard != null:
        return loadDashboard();
      case _FilterByStatus() when filterByStatus != null:
        return filterByStatus(_that.status);
      case _SelectTab() when selectTab != null:
        return selectTab(_that.tabIndex);
      case _RefreshDashboard() when refreshDashboard != null:
        return refreshDashboard();
      case _DismissOfflineBanner() when dismissOfflineBanner != null:
        return dismissOfflineBanner();
      case _SearchWorkOrders() when searchWorkOrders != null:
        return searchWorkOrders(_that.query);
      case _ClearFilters() when clearFilters != null:
        return clearFilters();
      case _SyncPendingWorkOrders() when syncPendingWorkOrders != null:
        return syncPendingWorkOrders();
      case _AssignWorkOrderToSelf() when assignWorkOrderToSelf != null:
        return assignWorkOrderToSelf(_that.workOrderId);
      case _StartWorkOrder() when startWorkOrder != null:
        return startWorkOrder(_that.workOrderId);
      case _PauseWorkOrder() when pauseWorkOrder != null:
        return pauseWorkOrder(_that.workOrderId);
      case _ResumeWorkOrder() when resumeWorkOrder != null:
        return resumeWorkOrder(_that.workOrderId);
      case _CompleteWorkOrder() when completeWorkOrder != null:
        return completeWorkOrder(_that.workOrderId);
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
    required TResult Function() loadDashboard,
    required TResult Function(String status) filterByStatus,
    required TResult Function(int tabIndex) selectTab,
    required TResult Function() refreshDashboard,
    required TResult Function() dismissOfflineBanner,
    required TResult Function(String query) searchWorkOrders,
    required TResult Function() clearFilters,
    required TResult Function() syncPendingWorkOrders,
    required TResult Function(int workOrderId) assignWorkOrderToSelf,
    required TResult Function(int workOrderId) startWorkOrder,
    required TResult Function(int workOrderId) pauseWorkOrder,
    required TResult Function(int workOrderId) resumeWorkOrder,
    required TResult Function(int workOrderId) completeWorkOrder,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadDashboard():
        return loadDashboard();
      case _FilterByStatus():
        return filterByStatus(_that.status);
      case _SelectTab():
        return selectTab(_that.tabIndex);
      case _RefreshDashboard():
        return refreshDashboard();
      case _DismissOfflineBanner():
        return dismissOfflineBanner();
      case _SearchWorkOrders():
        return searchWorkOrders(_that.query);
      case _ClearFilters():
        return clearFilters();
      case _SyncPendingWorkOrders():
        return syncPendingWorkOrders();
      case _AssignWorkOrderToSelf():
        return assignWorkOrderToSelf(_that.workOrderId);
      case _StartWorkOrder():
        return startWorkOrder(_that.workOrderId);
      case _PauseWorkOrder():
        return pauseWorkOrder(_that.workOrderId);
      case _ResumeWorkOrder():
        return resumeWorkOrder(_that.workOrderId);
      case _CompleteWorkOrder():
        return completeWorkOrder(_that.workOrderId);
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
    TResult? Function()? loadDashboard,
    TResult? Function(String status)? filterByStatus,
    TResult? Function(int tabIndex)? selectTab,
    TResult? Function()? refreshDashboard,
    TResult? Function()? dismissOfflineBanner,
    TResult? Function(String query)? searchWorkOrders,
    TResult? Function()? clearFilters,
    TResult? Function()? syncPendingWorkOrders,
    TResult? Function(int workOrderId)? assignWorkOrderToSelf,
    TResult? Function(int workOrderId)? startWorkOrder,
    TResult? Function(int workOrderId)? pauseWorkOrder,
    TResult? Function(int workOrderId)? resumeWorkOrder,
    TResult? Function(int workOrderId)? completeWorkOrder,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadDashboard() when loadDashboard != null:
        return loadDashboard();
      case _FilterByStatus() when filterByStatus != null:
        return filterByStatus(_that.status);
      case _SelectTab() when selectTab != null:
        return selectTab(_that.tabIndex);
      case _RefreshDashboard() when refreshDashboard != null:
        return refreshDashboard();
      case _DismissOfflineBanner() when dismissOfflineBanner != null:
        return dismissOfflineBanner();
      case _SearchWorkOrders() when searchWorkOrders != null:
        return searchWorkOrders(_that.query);
      case _ClearFilters() when clearFilters != null:
        return clearFilters();
      case _SyncPendingWorkOrders() when syncPendingWorkOrders != null:
        return syncPendingWorkOrders();
      case _AssignWorkOrderToSelf() when assignWorkOrderToSelf != null:
        return assignWorkOrderToSelf(_that.workOrderId);
      case _StartWorkOrder() when startWorkOrder != null:
        return startWorkOrder(_that.workOrderId);
      case _PauseWorkOrder() when pauseWorkOrder != null:
        return pauseWorkOrder(_that.workOrderId);
      case _ResumeWorkOrder() when resumeWorkOrder != null:
        return resumeWorkOrder(_that.workOrderId);
      case _CompleteWorkOrder() when completeWorkOrder != null:
        return completeWorkOrder(_that.workOrderId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LoadDashboard implements DashboardEvent {
  const _LoadDashboard();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadDashboard);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DashboardEvent.loadDashboard()';
  }
}

/// @nodoc

class _FilterByStatus implements DashboardEvent {
  const _FilterByStatus(this.status);

  final String status;

  /// Create a copy of DashboardEvent
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
    return 'DashboardEvent.filterByStatus(status: $status)';
  }
}

/// @nodoc
abstract mixin class _$FilterByStatusCopyWith<$Res>
    implements $DashboardEventCopyWith<$Res> {
  factory _$FilterByStatusCopyWith(
          _FilterByStatus value, $Res Function(_FilterByStatus) _then) =
      __$FilterByStatusCopyWithImpl;
  @useResult
  $Res call({String status});
}

/// @nodoc
class __$FilterByStatusCopyWithImpl<$Res>
    implements _$FilterByStatusCopyWith<$Res> {
  __$FilterByStatusCopyWithImpl(this._self, this._then);

  final _FilterByStatus _self;
  final $Res Function(_FilterByStatus) _then;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
  }) {
    return _then(_FilterByStatus(
      null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _SelectTab implements DashboardEvent {
  const _SelectTab(this.tabIndex);

  final int tabIndex;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SelectTabCopyWith<_SelectTab> get copyWith =>
      __$SelectTabCopyWithImpl<_SelectTab>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SelectTab &&
            (identical(other.tabIndex, tabIndex) ||
                other.tabIndex == tabIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tabIndex);

  @override
  String toString() {
    return 'DashboardEvent.selectTab(tabIndex: $tabIndex)';
  }
}

/// @nodoc
abstract mixin class _$SelectTabCopyWith<$Res>
    implements $DashboardEventCopyWith<$Res> {
  factory _$SelectTabCopyWith(
          _SelectTab value, $Res Function(_SelectTab) _then) =
      __$SelectTabCopyWithImpl;
  @useResult
  $Res call({int tabIndex});
}

/// @nodoc
class __$SelectTabCopyWithImpl<$Res> implements _$SelectTabCopyWith<$Res> {
  __$SelectTabCopyWithImpl(this._self, this._then);

  final _SelectTab _self;
  final $Res Function(_SelectTab) _then;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tabIndex = null,
  }) {
    return _then(_SelectTab(
      null == tabIndex
          ? _self.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _RefreshDashboard implements DashboardEvent {
  const _RefreshDashboard();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _RefreshDashboard);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DashboardEvent.refreshDashboard()';
  }
}

/// @nodoc

class _DismissOfflineBanner implements DashboardEvent {
  const _DismissOfflineBanner();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _DismissOfflineBanner);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DashboardEvent.dismissOfflineBanner()';
  }
}

/// @nodoc

class _SearchWorkOrders implements DashboardEvent {
  const _SearchWorkOrders(this.query);

  final String query;

  /// Create a copy of DashboardEvent
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
    return 'DashboardEvent.searchWorkOrders(query: $query)';
  }
}

/// @nodoc
abstract mixin class _$SearchWorkOrdersCopyWith<$Res>
    implements $DashboardEventCopyWith<$Res> {
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

  /// Create a copy of DashboardEvent
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

class _ClearFilters implements DashboardEvent {
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
    return 'DashboardEvent.clearFilters()';
  }
}

/// @nodoc

class _SyncPendingWorkOrders implements DashboardEvent {
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
    return 'DashboardEvent.syncPendingWorkOrders()';
  }
}

/// @nodoc

class _AssignWorkOrderToSelf implements DashboardEvent {
  const _AssignWorkOrderToSelf({required this.workOrderId});

  final int workOrderId;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AssignWorkOrderToSelfCopyWith<_AssignWorkOrderToSelf> get copyWith =>
      __$AssignWorkOrderToSelfCopyWithImpl<_AssignWorkOrderToSelf>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AssignWorkOrderToSelf &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workOrderId);

  @override
  String toString() {
    return 'DashboardEvent.assignWorkOrderToSelf(workOrderId: $workOrderId)';
  }
}

/// @nodoc
abstract mixin class _$AssignWorkOrderToSelfCopyWith<$Res>
    implements $DashboardEventCopyWith<$Res> {
  factory _$AssignWorkOrderToSelfCopyWith(_AssignWorkOrderToSelf value,
          $Res Function(_AssignWorkOrderToSelf) _then) =
      __$AssignWorkOrderToSelfCopyWithImpl;
  @useResult
  $Res call({int workOrderId});
}

/// @nodoc
class __$AssignWorkOrderToSelfCopyWithImpl<$Res>
    implements _$AssignWorkOrderToSelfCopyWith<$Res> {
  __$AssignWorkOrderToSelfCopyWithImpl(this._self, this._then);

  final _AssignWorkOrderToSelf _self;
  final $Res Function(_AssignWorkOrderToSelf) _then;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workOrderId = null,
  }) {
    return _then(_AssignWorkOrderToSelf(
      workOrderId: null == workOrderId
          ? _self.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _StartWorkOrder implements DashboardEvent {
  const _StartWorkOrder({required this.workOrderId});

  final int workOrderId;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StartWorkOrderCopyWith<_StartWorkOrder> get copyWith =>
      __$StartWorkOrderCopyWithImpl<_StartWorkOrder>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StartWorkOrder &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workOrderId);

  @override
  String toString() {
    return 'DashboardEvent.startWorkOrder(workOrderId: $workOrderId)';
  }
}

/// @nodoc
abstract mixin class _$StartWorkOrderCopyWith<$Res>
    implements $DashboardEventCopyWith<$Res> {
  factory _$StartWorkOrderCopyWith(
          _StartWorkOrder value, $Res Function(_StartWorkOrder) _then) =
      __$StartWorkOrderCopyWithImpl;
  @useResult
  $Res call({int workOrderId});
}

/// @nodoc
class __$StartWorkOrderCopyWithImpl<$Res>
    implements _$StartWorkOrderCopyWith<$Res> {
  __$StartWorkOrderCopyWithImpl(this._self, this._then);

  final _StartWorkOrder _self;
  final $Res Function(_StartWorkOrder) _then;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workOrderId = null,
  }) {
    return _then(_StartWorkOrder(
      workOrderId: null == workOrderId
          ? _self.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _PauseWorkOrder implements DashboardEvent {
  const _PauseWorkOrder({required this.workOrderId});

  final int workOrderId;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PauseWorkOrderCopyWith<_PauseWorkOrder> get copyWith =>
      __$PauseWorkOrderCopyWithImpl<_PauseWorkOrder>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PauseWorkOrder &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workOrderId);

  @override
  String toString() {
    return 'DashboardEvent.pauseWorkOrder(workOrderId: $workOrderId)';
  }
}

/// @nodoc
abstract mixin class _$PauseWorkOrderCopyWith<$Res>
    implements $DashboardEventCopyWith<$Res> {
  factory _$PauseWorkOrderCopyWith(
          _PauseWorkOrder value, $Res Function(_PauseWorkOrder) _then) =
      __$PauseWorkOrderCopyWithImpl;
  @useResult
  $Res call({int workOrderId});
}

/// @nodoc
class __$PauseWorkOrderCopyWithImpl<$Res>
    implements _$PauseWorkOrderCopyWith<$Res> {
  __$PauseWorkOrderCopyWithImpl(this._self, this._then);

  final _PauseWorkOrder _self;
  final $Res Function(_PauseWorkOrder) _then;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workOrderId = null,
  }) {
    return _then(_PauseWorkOrder(
      workOrderId: null == workOrderId
          ? _self.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _ResumeWorkOrder implements DashboardEvent {
  const _ResumeWorkOrder({required this.workOrderId});

  final int workOrderId;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ResumeWorkOrderCopyWith<_ResumeWorkOrder> get copyWith =>
      __$ResumeWorkOrderCopyWithImpl<_ResumeWorkOrder>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResumeWorkOrder &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workOrderId);

  @override
  String toString() {
    return 'DashboardEvent.resumeWorkOrder(workOrderId: $workOrderId)';
  }
}

/// @nodoc
abstract mixin class _$ResumeWorkOrderCopyWith<$Res>
    implements $DashboardEventCopyWith<$Res> {
  factory _$ResumeWorkOrderCopyWith(
          _ResumeWorkOrder value, $Res Function(_ResumeWorkOrder) _then) =
      __$ResumeWorkOrderCopyWithImpl;
  @useResult
  $Res call({int workOrderId});
}

/// @nodoc
class __$ResumeWorkOrderCopyWithImpl<$Res>
    implements _$ResumeWorkOrderCopyWith<$Res> {
  __$ResumeWorkOrderCopyWithImpl(this._self, this._then);

  final _ResumeWorkOrder _self;
  final $Res Function(_ResumeWorkOrder) _then;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workOrderId = null,
  }) {
    return _then(_ResumeWorkOrder(
      workOrderId: null == workOrderId
          ? _self.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _CompleteWorkOrder implements DashboardEvent {
  const _CompleteWorkOrder({required this.workOrderId});

  final int workOrderId;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CompleteWorkOrderCopyWith<_CompleteWorkOrder> get copyWith =>
      __$CompleteWorkOrderCopyWithImpl<_CompleteWorkOrder>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CompleteWorkOrder &&
            (identical(other.workOrderId, workOrderId) ||
                other.workOrderId == workOrderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workOrderId);

  @override
  String toString() {
    return 'DashboardEvent.completeWorkOrder(workOrderId: $workOrderId)';
  }
}

/// @nodoc
abstract mixin class _$CompleteWorkOrderCopyWith<$Res>
    implements $DashboardEventCopyWith<$Res> {
  factory _$CompleteWorkOrderCopyWith(
          _CompleteWorkOrder value, $Res Function(_CompleteWorkOrder) _then) =
      __$CompleteWorkOrderCopyWithImpl;
  @useResult
  $Res call({int workOrderId});
}

/// @nodoc
class __$CompleteWorkOrderCopyWithImpl<$Res>
    implements _$CompleteWorkOrderCopyWith<$Res> {
  __$CompleteWorkOrderCopyWithImpl(this._self, this._then);

  final _CompleteWorkOrder _self;
  final $Res Function(_CompleteWorkOrder) _then;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workOrderId = null,
  }) {
    return _then(_CompleteWorkOrder(
      workOrderId: null == workOrderId
          ? _self.workOrderId
          : workOrderId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
