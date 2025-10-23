// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CalendarEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CalendarEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CalendarEvent()';
  }
}

/// @nodoc
class $CalendarEventCopyWith<$Res> {
  $CalendarEventCopyWith(CalendarEvent _, $Res Function(CalendarEvent) __);
}

/// Adds pattern-matching-related methods to [CalendarEvent].
extension CalendarEventPatterns on CalendarEvent {
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
    TResult Function(_LoadEvents value)? loadEvents,
    TResult Function(_LoadDailySchedule value)? loadDailySchedule,
    TResult Function(_LoadWeeklySchedule value)? loadWeeklySchedule,
    TResult Function(_LoadMonthlySchedule value)? loadMonthlySchedule,
    TResult Function(_OptimizeRoute value)? optimizeRoute,
    TResult Function(_NavigateToDate value)? navigateToDate,
    TResult Function(_ChangeView value)? changeView,
    TResult Function(_FilterByType value)? filterByType,
    TResult Function(_SearchEvents value)? searchEvents,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_RefreshEvents value)? refreshEvents,
    TResult Function(_CreateEvent value)? createEvent,
    TResult Function(_UpdateEvent value)? updateEvent,
    TResult Function(_DeleteEvent value)? deleteEvent,
    TResult Function(_SyncPendingChanges value)? syncPendingChanges,
    TResult Function(_CheckConflicts value)? checkConflicts,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadEvents() when loadEvents != null:
        return loadEvents(_that);
      case _LoadDailySchedule() when loadDailySchedule != null:
        return loadDailySchedule(_that);
      case _LoadWeeklySchedule() when loadWeeklySchedule != null:
        return loadWeeklySchedule(_that);
      case _LoadMonthlySchedule() when loadMonthlySchedule != null:
        return loadMonthlySchedule(_that);
      case _OptimizeRoute() when optimizeRoute != null:
        return optimizeRoute(_that);
      case _NavigateToDate() when navigateToDate != null:
        return navigateToDate(_that);
      case _ChangeView() when changeView != null:
        return changeView(_that);
      case _FilterByType() when filterByType != null:
        return filterByType(_that);
      case _SearchEvents() when searchEvents != null:
        return searchEvents(_that);
      case _ClearFilters() when clearFilters != null:
        return clearFilters(_that);
      case _RefreshEvents() when refreshEvents != null:
        return refreshEvents(_that);
      case _CreateEvent() when createEvent != null:
        return createEvent(_that);
      case _UpdateEvent() when updateEvent != null:
        return updateEvent(_that);
      case _DeleteEvent() when deleteEvent != null:
        return deleteEvent(_that);
      case _SyncPendingChanges() when syncPendingChanges != null:
        return syncPendingChanges(_that);
      case _CheckConflicts() when checkConflicts != null:
        return checkConflicts(_that);
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
    required TResult Function(_LoadEvents value) loadEvents,
    required TResult Function(_LoadDailySchedule value) loadDailySchedule,
    required TResult Function(_LoadWeeklySchedule value) loadWeeklySchedule,
    required TResult Function(_LoadMonthlySchedule value) loadMonthlySchedule,
    required TResult Function(_OptimizeRoute value) optimizeRoute,
    required TResult Function(_NavigateToDate value) navigateToDate,
    required TResult Function(_ChangeView value) changeView,
    required TResult Function(_FilterByType value) filterByType,
    required TResult Function(_SearchEvents value) searchEvents,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_RefreshEvents value) refreshEvents,
    required TResult Function(_CreateEvent value) createEvent,
    required TResult Function(_UpdateEvent value) updateEvent,
    required TResult Function(_DeleteEvent value) deleteEvent,
    required TResult Function(_SyncPendingChanges value) syncPendingChanges,
    required TResult Function(_CheckConflicts value) checkConflicts,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadEvents():
        return loadEvents(_that);
      case _LoadDailySchedule():
        return loadDailySchedule(_that);
      case _LoadWeeklySchedule():
        return loadWeeklySchedule(_that);
      case _LoadMonthlySchedule():
        return loadMonthlySchedule(_that);
      case _OptimizeRoute():
        return optimizeRoute(_that);
      case _NavigateToDate():
        return navigateToDate(_that);
      case _ChangeView():
        return changeView(_that);
      case _FilterByType():
        return filterByType(_that);
      case _SearchEvents():
        return searchEvents(_that);
      case _ClearFilters():
        return clearFilters(_that);
      case _RefreshEvents():
        return refreshEvents(_that);
      case _CreateEvent():
        return createEvent(_that);
      case _UpdateEvent():
        return updateEvent(_that);
      case _DeleteEvent():
        return deleteEvent(_that);
      case _SyncPendingChanges():
        return syncPendingChanges(_that);
      case _CheckConflicts():
        return checkConflicts(_that);
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
    TResult? Function(_LoadEvents value)? loadEvents,
    TResult? Function(_LoadDailySchedule value)? loadDailySchedule,
    TResult? Function(_LoadWeeklySchedule value)? loadWeeklySchedule,
    TResult? Function(_LoadMonthlySchedule value)? loadMonthlySchedule,
    TResult? Function(_OptimizeRoute value)? optimizeRoute,
    TResult? Function(_NavigateToDate value)? navigateToDate,
    TResult? Function(_ChangeView value)? changeView,
    TResult? Function(_FilterByType value)? filterByType,
    TResult? Function(_SearchEvents value)? searchEvents,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_RefreshEvents value)? refreshEvents,
    TResult? Function(_CreateEvent value)? createEvent,
    TResult? Function(_UpdateEvent value)? updateEvent,
    TResult? Function(_DeleteEvent value)? deleteEvent,
    TResult? Function(_SyncPendingChanges value)? syncPendingChanges,
    TResult? Function(_CheckConflicts value)? checkConflicts,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadEvents() when loadEvents != null:
        return loadEvents(_that);
      case _LoadDailySchedule() when loadDailySchedule != null:
        return loadDailySchedule(_that);
      case _LoadWeeklySchedule() when loadWeeklySchedule != null:
        return loadWeeklySchedule(_that);
      case _LoadMonthlySchedule() when loadMonthlySchedule != null:
        return loadMonthlySchedule(_that);
      case _OptimizeRoute() when optimizeRoute != null:
        return optimizeRoute(_that);
      case _NavigateToDate() when navigateToDate != null:
        return navigateToDate(_that);
      case _ChangeView() when changeView != null:
        return changeView(_that);
      case _FilterByType() when filterByType != null:
        return filterByType(_that);
      case _SearchEvents() when searchEvents != null:
        return searchEvents(_that);
      case _ClearFilters() when clearFilters != null:
        return clearFilters(_that);
      case _RefreshEvents() when refreshEvents != null:
        return refreshEvents(_that);
      case _CreateEvent() when createEvent != null:
        return createEvent(_that);
      case _UpdateEvent() when updateEvent != null:
        return updateEvent(_that);
      case _DeleteEvent() when deleteEvent != null:
        return deleteEvent(_that);
      case _SyncPendingChanges() when syncPendingChanges != null:
        return syncPendingChanges(_that);
      case _CheckConflicts() when checkConflicts != null:
        return checkConflicts(_that);
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
    TResult Function(DateTime startDate, DateTime endDate,
            CalendarEventType? type, String? searchQuery, bool isRefresh)?
        loadEvents,
    TResult Function(DateTime date, CalendarEventType? type, bool isRefresh)?
        loadDailySchedule,
    TResult Function(DateTime weekStart, bool isRefresh)? loadWeeklySchedule,
    TResult Function(DateTime month, bool isRefresh)? loadMonthlySchedule,
    TResult Function(
            DateTime date, double currentLatitude, double currentLongitude)?
        optimizeRoute,
    TResult Function(DateTime date)? navigateToDate,
    TResult Function(CalendarViewType viewType)? changeView,
    TResult Function(CalendarEventType? type)? filterByType,
    TResult Function(String query)? searchEvents,
    TResult Function()? clearFilters,
    TResult Function()? refreshEvents,
    TResult Function(CalendarEventEntity event)? createEvent,
    TResult Function(CalendarEventEntity event)? updateEvent,
    TResult Function(int eventId)? deleteEvent,
    TResult Function()? syncPendingChanges,
    TResult Function(DateTime startTime, DateTime endTime, int? excludeEventId)?
        checkConflicts,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadEvents() when loadEvents != null:
        return loadEvents(_that.startDate, _that.endDate, _that.type,
            _that.searchQuery, _that.isRefresh);
      case _LoadDailySchedule() when loadDailySchedule != null:
        return loadDailySchedule(_that.date, _that.type, _that.isRefresh);
      case _LoadWeeklySchedule() when loadWeeklySchedule != null:
        return loadWeeklySchedule(_that.weekStart, _that.isRefresh);
      case _LoadMonthlySchedule() when loadMonthlySchedule != null:
        return loadMonthlySchedule(_that.month, _that.isRefresh);
      case _OptimizeRoute() when optimizeRoute != null:
        return optimizeRoute(
            _that.date, _that.currentLatitude, _that.currentLongitude);
      case _NavigateToDate() when navigateToDate != null:
        return navigateToDate(_that.date);
      case _ChangeView() when changeView != null:
        return changeView(_that.viewType);
      case _FilterByType() when filterByType != null:
        return filterByType(_that.type);
      case _SearchEvents() when searchEvents != null:
        return searchEvents(_that.query);
      case _ClearFilters() when clearFilters != null:
        return clearFilters();
      case _RefreshEvents() when refreshEvents != null:
        return refreshEvents();
      case _CreateEvent() when createEvent != null:
        return createEvent(_that.event);
      case _UpdateEvent() when updateEvent != null:
        return updateEvent(_that.event);
      case _DeleteEvent() when deleteEvent != null:
        return deleteEvent(_that.eventId);
      case _SyncPendingChanges() when syncPendingChanges != null:
        return syncPendingChanges();
      case _CheckConflicts() when checkConflicts != null:
        return checkConflicts(
            _that.startTime, _that.endTime, _that.excludeEventId);
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
    required TResult Function(DateTime startDate, DateTime endDate,
            CalendarEventType? type, String? searchQuery, bool isRefresh)
        loadEvents,
    required TResult Function(
            DateTime date, CalendarEventType? type, bool isRefresh)
        loadDailySchedule,
    required TResult Function(DateTime weekStart, bool isRefresh)
        loadWeeklySchedule,
    required TResult Function(DateTime month, bool isRefresh)
        loadMonthlySchedule,
    required TResult Function(
            DateTime date, double currentLatitude, double currentLongitude)
        optimizeRoute,
    required TResult Function(DateTime date) navigateToDate,
    required TResult Function(CalendarViewType viewType) changeView,
    required TResult Function(CalendarEventType? type) filterByType,
    required TResult Function(String query) searchEvents,
    required TResult Function() clearFilters,
    required TResult Function() refreshEvents,
    required TResult Function(CalendarEventEntity event) createEvent,
    required TResult Function(CalendarEventEntity event) updateEvent,
    required TResult Function(int eventId) deleteEvent,
    required TResult Function() syncPendingChanges,
    required TResult Function(
            DateTime startTime, DateTime endTime, int? excludeEventId)
        checkConflicts,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadEvents():
        return loadEvents(_that.startDate, _that.endDate, _that.type,
            _that.searchQuery, _that.isRefresh);
      case _LoadDailySchedule():
        return loadDailySchedule(_that.date, _that.type, _that.isRefresh);
      case _LoadWeeklySchedule():
        return loadWeeklySchedule(_that.weekStart, _that.isRefresh);
      case _LoadMonthlySchedule():
        return loadMonthlySchedule(_that.month, _that.isRefresh);
      case _OptimizeRoute():
        return optimizeRoute(
            _that.date, _that.currentLatitude, _that.currentLongitude);
      case _NavigateToDate():
        return navigateToDate(_that.date);
      case _ChangeView():
        return changeView(_that.viewType);
      case _FilterByType():
        return filterByType(_that.type);
      case _SearchEvents():
        return searchEvents(_that.query);
      case _ClearFilters():
        return clearFilters();
      case _RefreshEvents():
        return refreshEvents();
      case _CreateEvent():
        return createEvent(_that.event);
      case _UpdateEvent():
        return updateEvent(_that.event);
      case _DeleteEvent():
        return deleteEvent(_that.eventId);
      case _SyncPendingChanges():
        return syncPendingChanges();
      case _CheckConflicts():
        return checkConflicts(
            _that.startTime, _that.endTime, _that.excludeEventId);
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
    TResult? Function(DateTime startDate, DateTime endDate,
            CalendarEventType? type, String? searchQuery, bool isRefresh)?
        loadEvents,
    TResult? Function(DateTime date, CalendarEventType? type, bool isRefresh)?
        loadDailySchedule,
    TResult? Function(DateTime weekStart, bool isRefresh)? loadWeeklySchedule,
    TResult? Function(DateTime month, bool isRefresh)? loadMonthlySchedule,
    TResult? Function(
            DateTime date, double currentLatitude, double currentLongitude)?
        optimizeRoute,
    TResult? Function(DateTime date)? navigateToDate,
    TResult? Function(CalendarViewType viewType)? changeView,
    TResult? Function(CalendarEventType? type)? filterByType,
    TResult? Function(String query)? searchEvents,
    TResult? Function()? clearFilters,
    TResult? Function()? refreshEvents,
    TResult? Function(CalendarEventEntity event)? createEvent,
    TResult? Function(CalendarEventEntity event)? updateEvent,
    TResult? Function(int eventId)? deleteEvent,
    TResult? Function()? syncPendingChanges,
    TResult? Function(
            DateTime startTime, DateTime endTime, int? excludeEventId)?
        checkConflicts,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadEvents() when loadEvents != null:
        return loadEvents(_that.startDate, _that.endDate, _that.type,
            _that.searchQuery, _that.isRefresh);
      case _LoadDailySchedule() when loadDailySchedule != null:
        return loadDailySchedule(_that.date, _that.type, _that.isRefresh);
      case _LoadWeeklySchedule() when loadWeeklySchedule != null:
        return loadWeeklySchedule(_that.weekStart, _that.isRefresh);
      case _LoadMonthlySchedule() when loadMonthlySchedule != null:
        return loadMonthlySchedule(_that.month, _that.isRefresh);
      case _OptimizeRoute() when optimizeRoute != null:
        return optimizeRoute(
            _that.date, _that.currentLatitude, _that.currentLongitude);
      case _NavigateToDate() when navigateToDate != null:
        return navigateToDate(_that.date);
      case _ChangeView() when changeView != null:
        return changeView(_that.viewType);
      case _FilterByType() when filterByType != null:
        return filterByType(_that.type);
      case _SearchEvents() when searchEvents != null:
        return searchEvents(_that.query);
      case _ClearFilters() when clearFilters != null:
        return clearFilters();
      case _RefreshEvents() when refreshEvents != null:
        return refreshEvents();
      case _CreateEvent() when createEvent != null:
        return createEvent(_that.event);
      case _UpdateEvent() when updateEvent != null:
        return updateEvent(_that.event);
      case _DeleteEvent() when deleteEvent != null:
        return deleteEvent(_that.eventId);
      case _SyncPendingChanges() when syncPendingChanges != null:
        return syncPendingChanges();
      case _CheckConflicts() when checkConflicts != null:
        return checkConflicts(
            _that.startTime, _that.endTime, _that.excludeEventId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LoadEvents implements CalendarEvent {
  const _LoadEvents(
      {required this.startDate,
      required this.endDate,
      this.type,
      this.searchQuery,
      this.isRefresh = false});

  final DateTime startDate;
  final DateTime endDate;
  final CalendarEventType? type;
  final String? searchQuery;
  @JsonKey()
  final bool isRefresh;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadEventsCopyWith<_LoadEvents> get copyWith =>
      __$LoadEventsCopyWithImpl<_LoadEvents>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadEvents &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, startDate, endDate, type, searchQuery, isRefresh);

  @override
  String toString() {
    return 'CalendarEvent.loadEvents(startDate: $startDate, endDate: $endDate, type: $type, searchQuery: $searchQuery, isRefresh: $isRefresh)';
  }
}

/// @nodoc
abstract mixin class _$LoadEventsCopyWith<$Res>
    implements $CalendarEventCopyWith<$Res> {
  factory _$LoadEventsCopyWith(
          _LoadEvents value, $Res Function(_LoadEvents) _then) =
      __$LoadEventsCopyWithImpl;
  @useResult
  $Res call(
      {DateTime startDate,
      DateTime endDate,
      CalendarEventType? type,
      String? searchQuery,
      bool isRefresh});
}

/// @nodoc
class __$LoadEventsCopyWithImpl<$Res> implements _$LoadEventsCopyWith<$Res> {
  __$LoadEventsCopyWithImpl(this._self, this._then);

  final _LoadEvents _self;
  final $Res Function(_LoadEvents) _then;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? type = freezed,
    Object? searchQuery = freezed,
    Object? isRefresh = null,
  }) {
    return _then(_LoadEvents(
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as CalendarEventType?,
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

class _LoadDailySchedule implements CalendarEvent {
  const _LoadDailySchedule(
      {required this.date, this.type, this.isRefresh = false});

  final DateTime date;
  final CalendarEventType? type;
  @JsonKey()
  final bool isRefresh;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadDailyScheduleCopyWith<_LoadDailySchedule> get copyWith =>
      __$LoadDailyScheduleCopyWithImpl<_LoadDailySchedule>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadDailySchedule &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, type, isRefresh);

  @override
  String toString() {
    return 'CalendarEvent.loadDailySchedule(date: $date, type: $type, isRefresh: $isRefresh)';
  }
}

/// @nodoc
abstract mixin class _$LoadDailyScheduleCopyWith<$Res>
    implements $CalendarEventCopyWith<$Res> {
  factory _$LoadDailyScheduleCopyWith(
          _LoadDailySchedule value, $Res Function(_LoadDailySchedule) _then) =
      __$LoadDailyScheduleCopyWithImpl;
  @useResult
  $Res call({DateTime date, CalendarEventType? type, bool isRefresh});
}

/// @nodoc
class __$LoadDailyScheduleCopyWithImpl<$Res>
    implements _$LoadDailyScheduleCopyWith<$Res> {
  __$LoadDailyScheduleCopyWithImpl(this._self, this._then);

  final _LoadDailySchedule _self;
  final $Res Function(_LoadDailySchedule) _then;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = null,
    Object? type = freezed,
    Object? isRefresh = null,
  }) {
    return _then(_LoadDailySchedule(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as CalendarEventType?,
      isRefresh: null == isRefresh
          ? _self.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _LoadWeeklySchedule implements CalendarEvent {
  const _LoadWeeklySchedule({required this.weekStart, this.isRefresh = false});

  final DateTime weekStart;
  @JsonKey()
  final bool isRefresh;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadWeeklyScheduleCopyWith<_LoadWeeklySchedule> get copyWith =>
      __$LoadWeeklyScheduleCopyWithImpl<_LoadWeeklySchedule>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadWeeklySchedule &&
            (identical(other.weekStart, weekStart) ||
                other.weekStart == weekStart) &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh));
  }

  @override
  int get hashCode => Object.hash(runtimeType, weekStart, isRefresh);

  @override
  String toString() {
    return 'CalendarEvent.loadWeeklySchedule(weekStart: $weekStart, isRefresh: $isRefresh)';
  }
}

/// @nodoc
abstract mixin class _$LoadWeeklyScheduleCopyWith<$Res>
    implements $CalendarEventCopyWith<$Res> {
  factory _$LoadWeeklyScheduleCopyWith(
          _LoadWeeklySchedule value, $Res Function(_LoadWeeklySchedule) _then) =
      __$LoadWeeklyScheduleCopyWithImpl;
  @useResult
  $Res call({DateTime weekStart, bool isRefresh});
}

/// @nodoc
class __$LoadWeeklyScheduleCopyWithImpl<$Res>
    implements _$LoadWeeklyScheduleCopyWith<$Res> {
  __$LoadWeeklyScheduleCopyWithImpl(this._self, this._then);

  final _LoadWeeklySchedule _self;
  final $Res Function(_LoadWeeklySchedule) _then;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? weekStart = null,
    Object? isRefresh = null,
  }) {
    return _then(_LoadWeeklySchedule(
      weekStart: null == weekStart
          ? _self.weekStart
          : weekStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRefresh: null == isRefresh
          ? _self.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _LoadMonthlySchedule implements CalendarEvent {
  const _LoadMonthlySchedule({required this.month, this.isRefresh = false});

  final DateTime month;
  @JsonKey()
  final bool isRefresh;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadMonthlyScheduleCopyWith<_LoadMonthlySchedule> get copyWith =>
      __$LoadMonthlyScheduleCopyWithImpl<_LoadMonthlySchedule>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadMonthlySchedule &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh));
  }

  @override
  int get hashCode => Object.hash(runtimeType, month, isRefresh);

  @override
  String toString() {
    return 'CalendarEvent.loadMonthlySchedule(month: $month, isRefresh: $isRefresh)';
  }
}

/// @nodoc
abstract mixin class _$LoadMonthlyScheduleCopyWith<$Res>
    implements $CalendarEventCopyWith<$Res> {
  factory _$LoadMonthlyScheduleCopyWith(_LoadMonthlySchedule value,
          $Res Function(_LoadMonthlySchedule) _then) =
      __$LoadMonthlyScheduleCopyWithImpl;
  @useResult
  $Res call({DateTime month, bool isRefresh});
}

/// @nodoc
class __$LoadMonthlyScheduleCopyWithImpl<$Res>
    implements _$LoadMonthlyScheduleCopyWith<$Res> {
  __$LoadMonthlyScheduleCopyWithImpl(this._self, this._then);

  final _LoadMonthlySchedule _self;
  final $Res Function(_LoadMonthlySchedule) _then;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? month = null,
    Object? isRefresh = null,
  }) {
    return _then(_LoadMonthlySchedule(
      month: null == month
          ? _self.month
          : month // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRefresh: null == isRefresh
          ? _self.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _OptimizeRoute implements CalendarEvent {
  const _OptimizeRoute(
      {required this.date,
      required this.currentLatitude,
      required this.currentLongitude});

  final DateTime date;
  final double currentLatitude;
  final double currentLongitude;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OptimizeRouteCopyWith<_OptimizeRoute> get copyWith =>
      __$OptimizeRouteCopyWithImpl<_OptimizeRoute>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OptimizeRoute &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.currentLatitude, currentLatitude) ||
                other.currentLatitude == currentLatitude) &&
            (identical(other.currentLongitude, currentLongitude) ||
                other.currentLongitude == currentLongitude));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, date, currentLatitude, currentLongitude);

  @override
  String toString() {
    return 'CalendarEvent.optimizeRoute(date: $date, currentLatitude: $currentLatitude, currentLongitude: $currentLongitude)';
  }
}

/// @nodoc
abstract mixin class _$OptimizeRouteCopyWith<$Res>
    implements $CalendarEventCopyWith<$Res> {
  factory _$OptimizeRouteCopyWith(
          _OptimizeRoute value, $Res Function(_OptimizeRoute) _then) =
      __$OptimizeRouteCopyWithImpl;
  @useResult
  $Res call({DateTime date, double currentLatitude, double currentLongitude});
}

/// @nodoc
class __$OptimizeRouteCopyWithImpl<$Res>
    implements _$OptimizeRouteCopyWith<$Res> {
  __$OptimizeRouteCopyWithImpl(this._self, this._then);

  final _OptimizeRoute _self;
  final $Res Function(_OptimizeRoute) _then;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = null,
    Object? currentLatitude = null,
    Object? currentLongitude = null,
  }) {
    return _then(_OptimizeRoute(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currentLatitude: null == currentLatitude
          ? _self.currentLatitude
          : currentLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      currentLongitude: null == currentLongitude
          ? _self.currentLongitude
          : currentLongitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _NavigateToDate implements CalendarEvent {
  const _NavigateToDate(this.date);

  final DateTime date;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NavigateToDateCopyWith<_NavigateToDate> get copyWith =>
      __$NavigateToDateCopyWithImpl<_NavigateToDate>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NavigateToDate &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @override
  String toString() {
    return 'CalendarEvent.navigateToDate(date: $date)';
  }
}

/// @nodoc
abstract mixin class _$NavigateToDateCopyWith<$Res>
    implements $CalendarEventCopyWith<$Res> {
  factory _$NavigateToDateCopyWith(
          _NavigateToDate value, $Res Function(_NavigateToDate) _then) =
      __$NavigateToDateCopyWithImpl;
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class __$NavigateToDateCopyWithImpl<$Res>
    implements _$NavigateToDateCopyWith<$Res> {
  __$NavigateToDateCopyWithImpl(this._self, this._then);

  final _NavigateToDate _self;
  final $Res Function(_NavigateToDate) _then;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = null,
  }) {
    return _then(_NavigateToDate(
      null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _ChangeView implements CalendarEvent {
  const _ChangeView(this.viewType);

  final CalendarViewType viewType;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChangeViewCopyWith<_ChangeView> get copyWith =>
      __$ChangeViewCopyWithImpl<_ChangeView>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangeView &&
            (identical(other.viewType, viewType) ||
                other.viewType == viewType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, viewType);

  @override
  String toString() {
    return 'CalendarEvent.changeView(viewType: $viewType)';
  }
}

/// @nodoc
abstract mixin class _$ChangeViewCopyWith<$Res>
    implements $CalendarEventCopyWith<$Res> {
  factory _$ChangeViewCopyWith(
          _ChangeView value, $Res Function(_ChangeView) _then) =
      __$ChangeViewCopyWithImpl;
  @useResult
  $Res call({CalendarViewType viewType});
}

/// @nodoc
class __$ChangeViewCopyWithImpl<$Res> implements _$ChangeViewCopyWith<$Res> {
  __$ChangeViewCopyWithImpl(this._self, this._then);

  final _ChangeView _self;
  final $Res Function(_ChangeView) _then;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? viewType = null,
  }) {
    return _then(_ChangeView(
      null == viewType
          ? _self.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as CalendarViewType,
    ));
  }
}

/// @nodoc

class _FilterByType implements CalendarEvent {
  const _FilterByType(this.type);

  final CalendarEventType? type;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FilterByTypeCopyWith<_FilterByType> get copyWith =>
      __$FilterByTypeCopyWithImpl<_FilterByType>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FilterByType &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  @override
  String toString() {
    return 'CalendarEvent.filterByType(type: $type)';
  }
}

/// @nodoc
abstract mixin class _$FilterByTypeCopyWith<$Res>
    implements $CalendarEventCopyWith<$Res> {
  factory _$FilterByTypeCopyWith(
          _FilterByType value, $Res Function(_FilterByType) _then) =
      __$FilterByTypeCopyWithImpl;
  @useResult
  $Res call({CalendarEventType? type});
}

/// @nodoc
class __$FilterByTypeCopyWithImpl<$Res>
    implements _$FilterByTypeCopyWith<$Res> {
  __$FilterByTypeCopyWithImpl(this._self, this._then);

  final _FilterByType _self;
  final $Res Function(_FilterByType) _then;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = freezed,
  }) {
    return _then(_FilterByType(
      freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as CalendarEventType?,
    ));
  }
}

/// @nodoc

class _SearchEvents implements CalendarEvent {
  const _SearchEvents(this.query);

  final String query;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchEventsCopyWith<_SearchEvents> get copyWith =>
      __$SearchEventsCopyWithImpl<_SearchEvents>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchEvents &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @override
  String toString() {
    return 'CalendarEvent.searchEvents(query: $query)';
  }
}

/// @nodoc
abstract mixin class _$SearchEventsCopyWith<$Res>
    implements $CalendarEventCopyWith<$Res> {
  factory _$SearchEventsCopyWith(
          _SearchEvents value, $Res Function(_SearchEvents) _then) =
      __$SearchEventsCopyWithImpl;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$SearchEventsCopyWithImpl<$Res>
    implements _$SearchEventsCopyWith<$Res> {
  __$SearchEventsCopyWithImpl(this._self, this._then);

  final _SearchEvents _self;
  final $Res Function(_SearchEvents) _then;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
  }) {
    return _then(_SearchEvents(
      null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _ClearFilters implements CalendarEvent {
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
    return 'CalendarEvent.clearFilters()';
  }
}

/// @nodoc

class _RefreshEvents implements CalendarEvent {
  const _RefreshEvents();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _RefreshEvents);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CalendarEvent.refreshEvents()';
  }
}

/// @nodoc

class _CreateEvent implements CalendarEvent {
  const _CreateEvent(this.event);

  final CalendarEventEntity event;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateEventCopyWith<_CreateEvent> get copyWith =>
      __$CreateEventCopyWithImpl<_CreateEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateEvent &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(runtimeType, event);

  @override
  String toString() {
    return 'CalendarEvent.createEvent(event: $event)';
  }
}

/// @nodoc
abstract mixin class _$CreateEventCopyWith<$Res>
    implements $CalendarEventCopyWith<$Res> {
  factory _$CreateEventCopyWith(
          _CreateEvent value, $Res Function(_CreateEvent) _then) =
      __$CreateEventCopyWithImpl;
  @useResult
  $Res call({CalendarEventEntity event});

  $CalendarEventEntityCopyWith<$Res> get event;
}

/// @nodoc
class __$CreateEventCopyWithImpl<$Res> implements _$CreateEventCopyWith<$Res> {
  __$CreateEventCopyWithImpl(this._self, this._then);

  final _CreateEvent _self;
  final $Res Function(_CreateEvent) _then;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? event = null,
  }) {
    return _then(_CreateEvent(
      null == event
          ? _self.event
          : event // ignore: cast_nullable_to_non_nullable
              as CalendarEventEntity,
    ));
  }

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CalendarEventEntityCopyWith<$Res> get event {
    return $CalendarEventEntityCopyWith<$Res>(_self.event, (value) {
      return _then(_self.copyWith(event: value));
    });
  }
}

/// @nodoc

class _UpdateEvent implements CalendarEvent {
  const _UpdateEvent(this.event);

  final CalendarEventEntity event;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateEventCopyWith<_UpdateEvent> get copyWith =>
      __$UpdateEventCopyWithImpl<_UpdateEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateEvent &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(runtimeType, event);

  @override
  String toString() {
    return 'CalendarEvent.updateEvent(event: $event)';
  }
}

/// @nodoc
abstract mixin class _$UpdateEventCopyWith<$Res>
    implements $CalendarEventCopyWith<$Res> {
  factory _$UpdateEventCopyWith(
          _UpdateEvent value, $Res Function(_UpdateEvent) _then) =
      __$UpdateEventCopyWithImpl;
  @useResult
  $Res call({CalendarEventEntity event});

  $CalendarEventEntityCopyWith<$Res> get event;
}

/// @nodoc
class __$UpdateEventCopyWithImpl<$Res> implements _$UpdateEventCopyWith<$Res> {
  __$UpdateEventCopyWithImpl(this._self, this._then);

  final _UpdateEvent _self;
  final $Res Function(_UpdateEvent) _then;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? event = null,
  }) {
    return _then(_UpdateEvent(
      null == event
          ? _self.event
          : event // ignore: cast_nullable_to_non_nullable
              as CalendarEventEntity,
    ));
  }

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CalendarEventEntityCopyWith<$Res> get event {
    return $CalendarEventEntityCopyWith<$Res>(_self.event, (value) {
      return _then(_self.copyWith(event: value));
    });
  }
}

/// @nodoc

class _DeleteEvent implements CalendarEvent {
  const _DeleteEvent(this.eventId);

  final int eventId;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeleteEventCopyWith<_DeleteEvent> get copyWith =>
      __$DeleteEventCopyWithImpl<_DeleteEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeleteEvent &&
            (identical(other.eventId, eventId) || other.eventId == eventId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventId);

  @override
  String toString() {
    return 'CalendarEvent.deleteEvent(eventId: $eventId)';
  }
}

/// @nodoc
abstract mixin class _$DeleteEventCopyWith<$Res>
    implements $CalendarEventCopyWith<$Res> {
  factory _$DeleteEventCopyWith(
          _DeleteEvent value, $Res Function(_DeleteEvent) _then) =
      __$DeleteEventCopyWithImpl;
  @useResult
  $Res call({int eventId});
}

/// @nodoc
class __$DeleteEventCopyWithImpl<$Res> implements _$DeleteEventCopyWith<$Res> {
  __$DeleteEventCopyWithImpl(this._self, this._then);

  final _DeleteEvent _self;
  final $Res Function(_DeleteEvent) _then;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
  }) {
    return _then(_DeleteEvent(
      null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _SyncPendingChanges implements CalendarEvent {
  const _SyncPendingChanges();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SyncPendingChanges);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CalendarEvent.syncPendingChanges()';
  }
}

/// @nodoc

class _CheckConflicts implements CalendarEvent {
  const _CheckConflicts(
      {required this.startTime, required this.endTime, this.excludeEventId});

  final DateTime startTime;
  final DateTime endTime;
  final int? excludeEventId;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CheckConflictsCopyWith<_CheckConflicts> get copyWith =>
      __$CheckConflictsCopyWithImpl<_CheckConflicts>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CheckConflicts &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.excludeEventId, excludeEventId) ||
                other.excludeEventId == excludeEventId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, startTime, endTime, excludeEventId);

  @override
  String toString() {
    return 'CalendarEvent.checkConflicts(startTime: $startTime, endTime: $endTime, excludeEventId: $excludeEventId)';
  }
}

/// @nodoc
abstract mixin class _$CheckConflictsCopyWith<$Res>
    implements $CalendarEventCopyWith<$Res> {
  factory _$CheckConflictsCopyWith(
          _CheckConflicts value, $Res Function(_CheckConflicts) _then) =
      __$CheckConflictsCopyWithImpl;
  @useResult
  $Res call({DateTime startTime, DateTime endTime, int? excludeEventId});
}

/// @nodoc
class __$CheckConflictsCopyWithImpl<$Res>
    implements _$CheckConflictsCopyWith<$Res> {
  __$CheckConflictsCopyWithImpl(this._self, this._then);

  final _CheckConflicts _self;
  final $Res Function(_CheckConflicts) _then;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
    Object? excludeEventId = freezed,
  }) {
    return _then(_CheckConflicts(
      startTime: null == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      excludeEventId: freezed == excludeEventId
          ? _self.excludeEventId
          : excludeEventId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
