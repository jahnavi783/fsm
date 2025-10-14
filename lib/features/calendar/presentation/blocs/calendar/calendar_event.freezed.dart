// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CalendarEvent {
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarEventCopyWith<$Res> {
  factory $CalendarEventCopyWith(
          CalendarEvent value, $Res Function(CalendarEvent) then) =
      _$CalendarEventCopyWithImpl<$Res, CalendarEvent>;
}

/// @nodoc
class _$CalendarEventCopyWithImpl<$Res, $Val extends CalendarEvent>
    implements $CalendarEventCopyWith<$Res> {
  _$CalendarEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadEventsImplCopyWith<$Res> {
  factory _$$LoadEventsImplCopyWith(
          _$LoadEventsImpl value, $Res Function(_$LoadEventsImpl) then) =
      __$$LoadEventsImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {DateTime startDate,
      DateTime endDate,
      CalendarEventType? type,
      String? searchQuery,
      bool isRefresh});
}

/// @nodoc
class __$$LoadEventsImplCopyWithImpl<$Res>
    extends _$CalendarEventCopyWithImpl<$Res, _$LoadEventsImpl>
    implements _$$LoadEventsImplCopyWith<$Res> {
  __$$LoadEventsImplCopyWithImpl(
      _$LoadEventsImpl _value, $Res Function(_$LoadEventsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? type = freezed,
    Object? searchQuery = freezed,
    Object? isRefresh = null,
  }) {
    return _then(_$LoadEventsImpl(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CalendarEventType?,
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

class _$LoadEventsImpl implements _LoadEvents {
  const _$LoadEventsImpl(
      {required this.startDate,
      required this.endDate,
      this.type,
      this.searchQuery,
      this.isRefresh = false});

  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final CalendarEventType? type;
  @override
  final String? searchQuery;
  @override
  @JsonKey()
  final bool isRefresh;

  @override
  String toString() {
    return 'CalendarEvent.loadEvents(startDate: $startDate, endDate: $endDate, type: $type, searchQuery: $searchQuery, isRefresh: $isRefresh)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadEventsImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadEventsImplCopyWith<_$LoadEventsImpl> get copyWith =>
      __$$LoadEventsImplCopyWithImpl<_$LoadEventsImpl>(this, _$identity);

  @override
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
    return loadEvents(startDate, endDate, type, searchQuery, isRefresh);
  }

  @override
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
    return loadEvents?.call(startDate, endDate, type, searchQuery, isRefresh);
  }

  @override
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
    if (loadEvents != null) {
      return loadEvents(startDate, endDate, type, searchQuery, isRefresh);
    }
    return orElse();
  }

  @override
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
    return loadEvents(this);
  }

  @override
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
    return loadEvents?.call(this);
  }

  @override
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
    if (loadEvents != null) {
      return loadEvents(this);
    }
    return orElse();
  }
}

abstract class _LoadEvents implements CalendarEvent {
  const factory _LoadEvents(
      {required final DateTime startDate,
      required final DateTime endDate,
      final CalendarEventType? type,
      final String? searchQuery,
      final bool isRefresh}) = _$LoadEventsImpl;

  DateTime get startDate;
  DateTime get endDate;
  CalendarEventType? get type;
  String? get searchQuery;
  bool get isRefresh;
  @JsonKey(ignore: true)
  _$$LoadEventsImplCopyWith<_$LoadEventsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadDailyScheduleImplCopyWith<$Res> {
  factory _$$LoadDailyScheduleImplCopyWith(_$LoadDailyScheduleImpl value,
          $Res Function(_$LoadDailyScheduleImpl) then) =
      __$$LoadDailyScheduleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime date, CalendarEventType? type, bool isRefresh});
}

/// @nodoc
class __$$LoadDailyScheduleImplCopyWithImpl<$Res>
    extends _$CalendarEventCopyWithImpl<$Res, _$LoadDailyScheduleImpl>
    implements _$$LoadDailyScheduleImplCopyWith<$Res> {
  __$$LoadDailyScheduleImplCopyWithImpl(_$LoadDailyScheduleImpl _value,
      $Res Function(_$LoadDailyScheduleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? type = freezed,
    Object? isRefresh = null,
  }) {
    return _then(_$LoadDailyScheduleImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CalendarEventType?,
      isRefresh: null == isRefresh
          ? _value.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadDailyScheduleImpl implements _LoadDailySchedule {
  const _$LoadDailyScheduleImpl(
      {required this.date, this.type, this.isRefresh = false});

  @override
  final DateTime date;
  @override
  final CalendarEventType? type;
  @override
  @JsonKey()
  final bool isRefresh;

  @override
  String toString() {
    return 'CalendarEvent.loadDailySchedule(date: $date, type: $type, isRefresh: $isRefresh)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadDailyScheduleImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, type, isRefresh);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadDailyScheduleImplCopyWith<_$LoadDailyScheduleImpl> get copyWith =>
      __$$LoadDailyScheduleImplCopyWithImpl<_$LoadDailyScheduleImpl>(
          this, _$identity);

  @override
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
    return loadDailySchedule(date, type, isRefresh);
  }

  @override
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
    return loadDailySchedule?.call(date, type, isRefresh);
  }

  @override
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
    if (loadDailySchedule != null) {
      return loadDailySchedule(date, type, isRefresh);
    }
    return orElse();
  }

  @override
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
    return loadDailySchedule(this);
  }

  @override
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
    return loadDailySchedule?.call(this);
  }

  @override
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
    if (loadDailySchedule != null) {
      return loadDailySchedule(this);
    }
    return orElse();
  }
}

abstract class _LoadDailySchedule implements CalendarEvent {
  const factory _LoadDailySchedule(
      {required final DateTime date,
      final CalendarEventType? type,
      final bool isRefresh}) = _$LoadDailyScheduleImpl;

  DateTime get date;
  CalendarEventType? get type;
  bool get isRefresh;
  @JsonKey(ignore: true)
  _$$LoadDailyScheduleImplCopyWith<_$LoadDailyScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadWeeklyScheduleImplCopyWith<$Res> {
  factory _$$LoadWeeklyScheduleImplCopyWith(_$LoadWeeklyScheduleImpl value,
          $Res Function(_$LoadWeeklyScheduleImpl) then) =
      __$$LoadWeeklyScheduleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime weekStart, bool isRefresh});
}

/// @nodoc
class __$$LoadWeeklyScheduleImplCopyWithImpl<$Res>
    extends _$CalendarEventCopyWithImpl<$Res, _$LoadWeeklyScheduleImpl>
    implements _$$LoadWeeklyScheduleImplCopyWith<$Res> {
  __$$LoadWeeklyScheduleImplCopyWithImpl(_$LoadWeeklyScheduleImpl _value,
      $Res Function(_$LoadWeeklyScheduleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekStart = null,
    Object? isRefresh = null,
  }) {
    return _then(_$LoadWeeklyScheduleImpl(
      weekStart: null == weekStart
          ? _value.weekStart
          : weekStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRefresh: null == isRefresh
          ? _value.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadWeeklyScheduleImpl implements _LoadWeeklySchedule {
  const _$LoadWeeklyScheduleImpl(
      {required this.weekStart, this.isRefresh = false});

  @override
  final DateTime weekStart;
  @override
  @JsonKey()
  final bool isRefresh;

  @override
  String toString() {
    return 'CalendarEvent.loadWeeklySchedule(weekStart: $weekStart, isRefresh: $isRefresh)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadWeeklyScheduleImpl &&
            (identical(other.weekStart, weekStart) ||
                other.weekStart == weekStart) &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh));
  }

  @override
  int get hashCode => Object.hash(runtimeType, weekStart, isRefresh);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadWeeklyScheduleImplCopyWith<_$LoadWeeklyScheduleImpl> get copyWith =>
      __$$LoadWeeklyScheduleImplCopyWithImpl<_$LoadWeeklyScheduleImpl>(
          this, _$identity);

  @override
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
    return loadWeeklySchedule(weekStart, isRefresh);
  }

  @override
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
    return loadWeeklySchedule?.call(weekStart, isRefresh);
  }

  @override
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
    if (loadWeeklySchedule != null) {
      return loadWeeklySchedule(weekStart, isRefresh);
    }
    return orElse();
  }

  @override
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
    return loadWeeklySchedule(this);
  }

  @override
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
    return loadWeeklySchedule?.call(this);
  }

  @override
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
    if (loadWeeklySchedule != null) {
      return loadWeeklySchedule(this);
    }
    return orElse();
  }
}

abstract class _LoadWeeklySchedule implements CalendarEvent {
  const factory _LoadWeeklySchedule(
      {required final DateTime weekStart,
      final bool isRefresh}) = _$LoadWeeklyScheduleImpl;

  DateTime get weekStart;
  bool get isRefresh;
  @JsonKey(ignore: true)
  _$$LoadWeeklyScheduleImplCopyWith<_$LoadWeeklyScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMonthlyScheduleImplCopyWith<$Res> {
  factory _$$LoadMonthlyScheduleImplCopyWith(_$LoadMonthlyScheduleImpl value,
          $Res Function(_$LoadMonthlyScheduleImpl) then) =
      __$$LoadMonthlyScheduleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime month, bool isRefresh});
}

/// @nodoc
class __$$LoadMonthlyScheduleImplCopyWithImpl<$Res>
    extends _$CalendarEventCopyWithImpl<$Res, _$LoadMonthlyScheduleImpl>
    implements _$$LoadMonthlyScheduleImplCopyWith<$Res> {
  __$$LoadMonthlyScheduleImplCopyWithImpl(_$LoadMonthlyScheduleImpl _value,
      $Res Function(_$LoadMonthlyScheduleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? isRefresh = null,
  }) {
    return _then(_$LoadMonthlyScheduleImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRefresh: null == isRefresh
          ? _value.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadMonthlyScheduleImpl implements _LoadMonthlySchedule {
  const _$LoadMonthlyScheduleImpl(
      {required this.month, this.isRefresh = false});

  @override
  final DateTime month;
  @override
  @JsonKey()
  final bool isRefresh;

  @override
  String toString() {
    return 'CalendarEvent.loadMonthlySchedule(month: $month, isRefresh: $isRefresh)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMonthlyScheduleImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh));
  }

  @override
  int get hashCode => Object.hash(runtimeType, month, isRefresh);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadMonthlyScheduleImplCopyWith<_$LoadMonthlyScheduleImpl> get copyWith =>
      __$$LoadMonthlyScheduleImplCopyWithImpl<_$LoadMonthlyScheduleImpl>(
          this, _$identity);

  @override
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
    return loadMonthlySchedule(month, isRefresh);
  }

  @override
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
    return loadMonthlySchedule?.call(month, isRefresh);
  }

  @override
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
    if (loadMonthlySchedule != null) {
      return loadMonthlySchedule(month, isRefresh);
    }
    return orElse();
  }

  @override
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
    return loadMonthlySchedule(this);
  }

  @override
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
    return loadMonthlySchedule?.call(this);
  }

  @override
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
    if (loadMonthlySchedule != null) {
      return loadMonthlySchedule(this);
    }
    return orElse();
  }
}

abstract class _LoadMonthlySchedule implements CalendarEvent {
  const factory _LoadMonthlySchedule(
      {required final DateTime month,
      final bool isRefresh}) = _$LoadMonthlyScheduleImpl;

  DateTime get month;
  bool get isRefresh;
  @JsonKey(ignore: true)
  _$$LoadMonthlyScheduleImplCopyWith<_$LoadMonthlyScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OptimizeRouteImplCopyWith<$Res> {
  factory _$$OptimizeRouteImplCopyWith(
          _$OptimizeRouteImpl value, $Res Function(_$OptimizeRouteImpl) then) =
      __$$OptimizeRouteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime date, double currentLatitude, double currentLongitude});
}

/// @nodoc
class __$$OptimizeRouteImplCopyWithImpl<$Res>
    extends _$CalendarEventCopyWithImpl<$Res, _$OptimizeRouteImpl>
    implements _$$OptimizeRouteImplCopyWith<$Res> {
  __$$OptimizeRouteImplCopyWithImpl(
      _$OptimizeRouteImpl _value, $Res Function(_$OptimizeRouteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? currentLatitude = null,
    Object? currentLongitude = null,
  }) {
    return _then(_$OptimizeRouteImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currentLatitude: null == currentLatitude
          ? _value.currentLatitude
          : currentLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      currentLongitude: null == currentLongitude
          ? _value.currentLongitude
          : currentLongitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$OptimizeRouteImpl implements _OptimizeRoute {
  const _$OptimizeRouteImpl(
      {required this.date,
      required this.currentLatitude,
      required this.currentLongitude});

  @override
  final DateTime date;
  @override
  final double currentLatitude;
  @override
  final double currentLongitude;

  @override
  String toString() {
    return 'CalendarEvent.optimizeRoute(date: $date, currentLatitude: $currentLatitude, currentLongitude: $currentLongitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptimizeRouteImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.currentLatitude, currentLatitude) ||
                other.currentLatitude == currentLatitude) &&
            (identical(other.currentLongitude, currentLongitude) ||
                other.currentLongitude == currentLongitude));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, date, currentLatitude, currentLongitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OptimizeRouteImplCopyWith<_$OptimizeRouteImpl> get copyWith =>
      __$$OptimizeRouteImplCopyWithImpl<_$OptimizeRouteImpl>(this, _$identity);

  @override
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
    return optimizeRoute(date, currentLatitude, currentLongitude);
  }

  @override
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
    return optimizeRoute?.call(date, currentLatitude, currentLongitude);
  }

  @override
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
    if (optimizeRoute != null) {
      return optimizeRoute(date, currentLatitude, currentLongitude);
    }
    return orElse();
  }

  @override
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
    return optimizeRoute(this);
  }

  @override
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
    return optimizeRoute?.call(this);
  }

  @override
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
    if (optimizeRoute != null) {
      return optimizeRoute(this);
    }
    return orElse();
  }
}

abstract class _OptimizeRoute implements CalendarEvent {
  const factory _OptimizeRoute(
      {required final DateTime date,
      required final double currentLatitude,
      required final double currentLongitude}) = _$OptimizeRouteImpl;

  DateTime get date;
  double get currentLatitude;
  double get currentLongitude;
  @JsonKey(ignore: true)
  _$$OptimizeRouteImplCopyWith<_$OptimizeRouteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NavigateToDateImplCopyWith<$Res> {
  factory _$$NavigateToDateImplCopyWith(_$NavigateToDateImpl value,
          $Res Function(_$NavigateToDateImpl) then) =
      __$$NavigateToDateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class __$$NavigateToDateImplCopyWithImpl<$Res>
    extends _$CalendarEventCopyWithImpl<$Res, _$NavigateToDateImpl>
    implements _$$NavigateToDateImplCopyWith<$Res> {
  __$$NavigateToDateImplCopyWithImpl(
      _$NavigateToDateImpl _value, $Res Function(_$NavigateToDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_$NavigateToDateImpl(
      null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$NavigateToDateImpl implements _NavigateToDate {
  const _$NavigateToDateImpl(this.date);

  @override
  final DateTime date;

  @override
  String toString() {
    return 'CalendarEvent.navigateToDate(date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigateToDateImpl &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NavigateToDateImplCopyWith<_$NavigateToDateImpl> get copyWith =>
      __$$NavigateToDateImplCopyWithImpl<_$NavigateToDateImpl>(
          this, _$identity);

  @override
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
    return navigateToDate(date);
  }

  @override
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
    return navigateToDate?.call(date);
  }

  @override
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
    if (navigateToDate != null) {
      return navigateToDate(date);
    }
    return orElse();
  }

  @override
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
    return navigateToDate(this);
  }

  @override
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
    return navigateToDate?.call(this);
  }

  @override
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
    if (navigateToDate != null) {
      return navigateToDate(this);
    }
    return orElse();
  }
}

abstract class _NavigateToDate implements CalendarEvent {
  const factory _NavigateToDate(final DateTime date) = _$NavigateToDateImpl;

  DateTime get date;
  @JsonKey(ignore: true)
  _$$NavigateToDateImplCopyWith<_$NavigateToDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeViewImplCopyWith<$Res> {
  factory _$$ChangeViewImplCopyWith(
          _$ChangeViewImpl value, $Res Function(_$ChangeViewImpl) then) =
      __$$ChangeViewImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CalendarViewType viewType});
}

/// @nodoc
class __$$ChangeViewImplCopyWithImpl<$Res>
    extends _$CalendarEventCopyWithImpl<$Res, _$ChangeViewImpl>
    implements _$$ChangeViewImplCopyWith<$Res> {
  __$$ChangeViewImplCopyWithImpl(
      _$ChangeViewImpl _value, $Res Function(_$ChangeViewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewType = null,
  }) {
    return _then(_$ChangeViewImpl(
      null == viewType
          ? _value.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as CalendarViewType,
    ));
  }
}

/// @nodoc

class _$ChangeViewImpl implements _ChangeView {
  const _$ChangeViewImpl(this.viewType);

  @override
  final CalendarViewType viewType;

  @override
  String toString() {
    return 'CalendarEvent.changeView(viewType: $viewType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeViewImpl &&
            (identical(other.viewType, viewType) ||
                other.viewType == viewType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, viewType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeViewImplCopyWith<_$ChangeViewImpl> get copyWith =>
      __$$ChangeViewImplCopyWithImpl<_$ChangeViewImpl>(this, _$identity);

  @override
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
    return changeView(viewType);
  }

  @override
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
    return changeView?.call(viewType);
  }

  @override
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
    if (changeView != null) {
      return changeView(viewType);
    }
    return orElse();
  }

  @override
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
    return changeView(this);
  }

  @override
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
    return changeView?.call(this);
  }

  @override
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
    if (changeView != null) {
      return changeView(this);
    }
    return orElse();
  }
}

abstract class _ChangeView implements CalendarEvent {
  const factory _ChangeView(final CalendarViewType viewType) = _$ChangeViewImpl;

  CalendarViewType get viewType;
  @JsonKey(ignore: true)
  _$$ChangeViewImplCopyWith<_$ChangeViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterByTypeImplCopyWith<$Res> {
  factory _$$FilterByTypeImplCopyWith(
          _$FilterByTypeImpl value, $Res Function(_$FilterByTypeImpl) then) =
      __$$FilterByTypeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CalendarEventType? type});
}

/// @nodoc
class __$$FilterByTypeImplCopyWithImpl<$Res>
    extends _$CalendarEventCopyWithImpl<$Res, _$FilterByTypeImpl>
    implements _$$FilterByTypeImplCopyWith<$Res> {
  __$$FilterByTypeImplCopyWithImpl(
      _$FilterByTypeImpl _value, $Res Function(_$FilterByTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
  }) {
    return _then(_$FilterByTypeImpl(
      freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CalendarEventType?,
    ));
  }
}

/// @nodoc

class _$FilterByTypeImpl implements _FilterByType {
  const _$FilterByTypeImpl(this.type);

  @override
  final CalendarEventType? type;

  @override
  String toString() {
    return 'CalendarEvent.filterByType(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterByTypeImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterByTypeImplCopyWith<_$FilterByTypeImpl> get copyWith =>
      __$$FilterByTypeImplCopyWithImpl<_$FilterByTypeImpl>(this, _$identity);

  @override
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
    return filterByType(type);
  }

  @override
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
    return filterByType?.call(type);
  }

  @override
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
    if (filterByType != null) {
      return filterByType(type);
    }
    return orElse();
  }

  @override
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
    return filterByType(this);
  }

  @override
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
    return filterByType?.call(this);
  }

  @override
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
    if (filterByType != null) {
      return filterByType(this);
    }
    return orElse();
  }
}

abstract class _FilterByType implements CalendarEvent {
  const factory _FilterByType(final CalendarEventType? type) =
      _$FilterByTypeImpl;

  CalendarEventType? get type;
  @JsonKey(ignore: true)
  _$$FilterByTypeImplCopyWith<_$FilterByTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchEventsImplCopyWith<$Res> {
  factory _$$SearchEventsImplCopyWith(
          _$SearchEventsImpl value, $Res Function(_$SearchEventsImpl) then) =
      __$$SearchEventsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchEventsImplCopyWithImpl<$Res>
    extends _$CalendarEventCopyWithImpl<$Res, _$SearchEventsImpl>
    implements _$$SearchEventsImplCopyWith<$Res> {
  __$$SearchEventsImplCopyWithImpl(
      _$SearchEventsImpl _value, $Res Function(_$SearchEventsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchEventsImpl(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchEventsImpl implements _SearchEvents {
  const _$SearchEventsImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'CalendarEvent.searchEvents(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchEventsImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchEventsImplCopyWith<_$SearchEventsImpl> get copyWith =>
      __$$SearchEventsImplCopyWithImpl<_$SearchEventsImpl>(this, _$identity);

  @override
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
    return searchEvents(query);
  }

  @override
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
    return searchEvents?.call(query);
  }

  @override
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
    if (searchEvents != null) {
      return searchEvents(query);
    }
    return orElse();
  }

  @override
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
    return searchEvents(this);
  }

  @override
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
    return searchEvents?.call(this);
  }

  @override
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
    if (searchEvents != null) {
      return searchEvents(this);
    }
    return orElse();
  }
}

abstract class _SearchEvents implements CalendarEvent {
  const factory _SearchEvents(final String query) = _$SearchEventsImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$SearchEventsImplCopyWith<_$SearchEventsImpl> get copyWith =>
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
    extends _$CalendarEventCopyWithImpl<$Res, _$ClearFiltersImpl>
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
    return 'CalendarEvent.clearFilters()';
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
    return clearFilters();
  }

  @override
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
    return clearFilters?.call();
  }

  @override
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
    if (clearFilters != null) {
      return clearFilters();
    }
    return orElse();
  }

  @override
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
    return clearFilters(this);
  }

  @override
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
    return clearFilters?.call(this);
  }

  @override
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
    if (clearFilters != null) {
      return clearFilters(this);
    }
    return orElse();
  }
}

abstract class _ClearFilters implements CalendarEvent {
  const factory _ClearFilters() = _$ClearFiltersImpl;
}

/// @nodoc
abstract class _$$RefreshEventsImplCopyWith<$Res> {
  factory _$$RefreshEventsImplCopyWith(
          _$RefreshEventsImpl value, $Res Function(_$RefreshEventsImpl) then) =
      __$$RefreshEventsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshEventsImplCopyWithImpl<$Res>
    extends _$CalendarEventCopyWithImpl<$Res, _$RefreshEventsImpl>
    implements _$$RefreshEventsImplCopyWith<$Res> {
  __$$RefreshEventsImplCopyWithImpl(
      _$RefreshEventsImpl _value, $Res Function(_$RefreshEventsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RefreshEventsImpl implements _RefreshEvents {
  const _$RefreshEventsImpl();

  @override
  String toString() {
    return 'CalendarEvent.refreshEvents()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshEventsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return refreshEvents();
  }

  @override
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
    return refreshEvents?.call();
  }

  @override
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
    if (refreshEvents != null) {
      return refreshEvents();
    }
    return orElse();
  }

  @override
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
    return refreshEvents(this);
  }

  @override
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
    return refreshEvents?.call(this);
  }

  @override
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
    if (refreshEvents != null) {
      return refreshEvents(this);
    }
    return orElse();
  }
}

abstract class _RefreshEvents implements CalendarEvent {
  const factory _RefreshEvents() = _$RefreshEventsImpl;
}

/// @nodoc
abstract class _$$CreateEventImplCopyWith<$Res> {
  factory _$$CreateEventImplCopyWith(
          _$CreateEventImpl value, $Res Function(_$CreateEventImpl) then) =
      __$$CreateEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CalendarEventEntity event});

  $CalendarEventEntityCopyWith<$Res> get event;
}

/// @nodoc
class __$$CreateEventImplCopyWithImpl<$Res>
    extends _$CalendarEventCopyWithImpl<$Res, _$CreateEventImpl>
    implements _$$CreateEventImplCopyWith<$Res> {
  __$$CreateEventImplCopyWithImpl(
      _$CreateEventImpl _value, $Res Function(_$CreateEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
  }) {
    return _then(_$CreateEventImpl(
      null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as CalendarEventEntity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CalendarEventEntityCopyWith<$Res> get event {
    return $CalendarEventEntityCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc

class _$CreateEventImpl implements _CreateEvent {
  const _$CreateEventImpl(this.event);

  @override
  final CalendarEventEntity event;

  @override
  String toString() {
    return 'CalendarEvent.createEvent(event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateEventImpl &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(runtimeType, event);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateEventImplCopyWith<_$CreateEventImpl> get copyWith =>
      __$$CreateEventImplCopyWithImpl<_$CreateEventImpl>(this, _$identity);

  @override
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
    return createEvent(event);
  }

  @override
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
    return createEvent?.call(event);
  }

  @override
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
    if (createEvent != null) {
      return createEvent(event);
    }
    return orElse();
  }

  @override
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
    return createEvent(this);
  }

  @override
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
    return createEvent?.call(this);
  }

  @override
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
    if (createEvent != null) {
      return createEvent(this);
    }
    return orElse();
  }
}

abstract class _CreateEvent implements CalendarEvent {
  const factory _CreateEvent(final CalendarEventEntity event) =
      _$CreateEventImpl;

  CalendarEventEntity get event;
  @JsonKey(ignore: true)
  _$$CreateEventImplCopyWith<_$CreateEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateEventImplCopyWith<$Res> {
  factory _$$UpdateEventImplCopyWith(
          _$UpdateEventImpl value, $Res Function(_$UpdateEventImpl) then) =
      __$$UpdateEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CalendarEventEntity event});

  $CalendarEventEntityCopyWith<$Res> get event;
}

/// @nodoc
class __$$UpdateEventImplCopyWithImpl<$Res>
    extends _$CalendarEventCopyWithImpl<$Res, _$UpdateEventImpl>
    implements _$$UpdateEventImplCopyWith<$Res> {
  __$$UpdateEventImplCopyWithImpl(
      _$UpdateEventImpl _value, $Res Function(_$UpdateEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
  }) {
    return _then(_$UpdateEventImpl(
      null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as CalendarEventEntity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CalendarEventEntityCopyWith<$Res> get event {
    return $CalendarEventEntityCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc

class _$UpdateEventImpl implements _UpdateEvent {
  const _$UpdateEventImpl(this.event);

  @override
  final CalendarEventEntity event;

  @override
  String toString() {
    return 'CalendarEvent.updateEvent(event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateEventImpl &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(runtimeType, event);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateEventImplCopyWith<_$UpdateEventImpl> get copyWith =>
      __$$UpdateEventImplCopyWithImpl<_$UpdateEventImpl>(this, _$identity);

  @override
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
    return updateEvent(event);
  }

  @override
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
    return updateEvent?.call(event);
  }

  @override
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
    if (updateEvent != null) {
      return updateEvent(event);
    }
    return orElse();
  }

  @override
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
    return updateEvent(this);
  }

  @override
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
    return updateEvent?.call(this);
  }

  @override
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
    if (updateEvent != null) {
      return updateEvent(this);
    }
    return orElse();
  }
}

abstract class _UpdateEvent implements CalendarEvent {
  const factory _UpdateEvent(final CalendarEventEntity event) =
      _$UpdateEventImpl;

  CalendarEventEntity get event;
  @JsonKey(ignore: true)
  _$$UpdateEventImplCopyWith<_$UpdateEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteEventImplCopyWith<$Res> {
  factory _$$DeleteEventImplCopyWith(
          _$DeleteEventImpl value, $Res Function(_$DeleteEventImpl) then) =
      __$$DeleteEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int eventId});
}

/// @nodoc
class __$$DeleteEventImplCopyWithImpl<$Res>
    extends _$CalendarEventCopyWithImpl<$Res, _$DeleteEventImpl>
    implements _$$DeleteEventImplCopyWith<$Res> {
  __$$DeleteEventImplCopyWithImpl(
      _$DeleteEventImpl _value, $Res Function(_$DeleteEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
  }) {
    return _then(_$DeleteEventImpl(
      null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteEventImpl implements _DeleteEvent {
  const _$DeleteEventImpl(this.eventId);

  @override
  final int eventId;

  @override
  String toString() {
    return 'CalendarEvent.deleteEvent(eventId: $eventId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteEventImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteEventImplCopyWith<_$DeleteEventImpl> get copyWith =>
      __$$DeleteEventImplCopyWithImpl<_$DeleteEventImpl>(this, _$identity);

  @override
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
    return deleteEvent(eventId);
  }

  @override
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
    return deleteEvent?.call(eventId);
  }

  @override
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
    if (deleteEvent != null) {
      return deleteEvent(eventId);
    }
    return orElse();
  }

  @override
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
    return deleteEvent(this);
  }

  @override
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
    return deleteEvent?.call(this);
  }

  @override
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
    if (deleteEvent != null) {
      return deleteEvent(this);
    }
    return orElse();
  }
}

abstract class _DeleteEvent implements CalendarEvent {
  const factory _DeleteEvent(final int eventId) = _$DeleteEventImpl;

  int get eventId;
  @JsonKey(ignore: true)
  _$$DeleteEventImplCopyWith<_$DeleteEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SyncPendingChangesImplCopyWith<$Res> {
  factory _$$SyncPendingChangesImplCopyWith(_$SyncPendingChangesImpl value,
          $Res Function(_$SyncPendingChangesImpl) then) =
      __$$SyncPendingChangesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncPendingChangesImplCopyWithImpl<$Res>
    extends _$CalendarEventCopyWithImpl<$Res, _$SyncPendingChangesImpl>
    implements _$$SyncPendingChangesImplCopyWith<$Res> {
  __$$SyncPendingChangesImplCopyWithImpl(_$SyncPendingChangesImpl _value,
      $Res Function(_$SyncPendingChangesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SyncPendingChangesImpl implements _SyncPendingChanges {
  const _$SyncPendingChangesImpl();

  @override
  String toString() {
    return 'CalendarEvent.syncPendingChanges()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SyncPendingChangesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return syncPendingChanges();
  }

  @override
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
    return syncPendingChanges?.call();
  }

  @override
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
    if (syncPendingChanges != null) {
      return syncPendingChanges();
    }
    return orElse();
  }

  @override
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
    return syncPendingChanges(this);
  }

  @override
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
    return syncPendingChanges?.call(this);
  }

  @override
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
    if (syncPendingChanges != null) {
      return syncPendingChanges(this);
    }
    return orElse();
  }
}

abstract class _SyncPendingChanges implements CalendarEvent {
  const factory _SyncPendingChanges() = _$SyncPendingChangesImpl;
}

/// @nodoc
abstract class _$$CheckConflictsImplCopyWith<$Res> {
  factory _$$CheckConflictsImplCopyWith(_$CheckConflictsImpl value,
          $Res Function(_$CheckConflictsImpl) then) =
      __$$CheckConflictsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime startTime, DateTime endTime, int? excludeEventId});
}

/// @nodoc
class __$$CheckConflictsImplCopyWithImpl<$Res>
    extends _$CalendarEventCopyWithImpl<$Res, _$CheckConflictsImpl>
    implements _$$CheckConflictsImplCopyWith<$Res> {
  __$$CheckConflictsImplCopyWithImpl(
      _$CheckConflictsImpl _value, $Res Function(_$CheckConflictsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
    Object? excludeEventId = freezed,
  }) {
    return _then(_$CheckConflictsImpl(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      excludeEventId: freezed == excludeEventId
          ? _value.excludeEventId
          : excludeEventId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$CheckConflictsImpl implements _CheckConflicts {
  const _$CheckConflictsImpl(
      {required this.startTime, required this.endTime, this.excludeEventId});

  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final int? excludeEventId;

  @override
  String toString() {
    return 'CalendarEvent.checkConflicts(startTime: $startTime, endTime: $endTime, excludeEventId: $excludeEventId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckConflictsImpl &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.excludeEventId, excludeEventId) ||
                other.excludeEventId == excludeEventId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, startTime, endTime, excludeEventId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckConflictsImplCopyWith<_$CheckConflictsImpl> get copyWith =>
      __$$CheckConflictsImplCopyWithImpl<_$CheckConflictsImpl>(
          this, _$identity);

  @override
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
    return checkConflicts(startTime, endTime, excludeEventId);
  }

  @override
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
    return checkConflicts?.call(startTime, endTime, excludeEventId);
  }

  @override
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
    if (checkConflicts != null) {
      return checkConflicts(startTime, endTime, excludeEventId);
    }
    return orElse();
  }

  @override
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
    return checkConflicts(this);
  }

  @override
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
    return checkConflicts?.call(this);
  }

  @override
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
    if (checkConflicts != null) {
      return checkConflicts(this);
    }
    return orElse();
  }
}

abstract class _CheckConflicts implements CalendarEvent {
  const factory _CheckConflicts(
      {required final DateTime startTime,
      required final DateTime endTime,
      final int? excludeEventId}) = _$CheckConflictsImpl;

  DateTime get startTime;
  DateTime get endTime;
  int? get excludeEventId;
  @JsonKey(ignore: true)
  _$$CheckConflictsImplCopyWith<_$CheckConflictsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
