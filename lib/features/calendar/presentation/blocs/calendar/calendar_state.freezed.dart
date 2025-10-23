// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CalendarState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CalendarState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CalendarState()';
  }
}

/// @nodoc
class $CalendarStateCopyWith<$Res> {
  $CalendarStateCopyWith(CalendarState _, $Res Function(CalendarState) __);
}

/// Adds pattern-matching-related methods to [CalendarState].
extension CalendarStatePatterns on CalendarState {
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
    TResult Function(_EventCreated value)? eventCreated,
    TResult Function(_EventUpdated value)? eventUpdated,
    TResult Function(_EventDeleted value)? eventDeleted,
    TResult Function(_RouteOptimized value)? routeOptimized,
    TResult Function(_ConflictsFound value)? conflictsFound,
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
      case _EventCreated() when eventCreated != null:
        return eventCreated(_that);
      case _EventUpdated() when eventUpdated != null:
        return eventUpdated(_that);
      case _EventDeleted() when eventDeleted != null:
        return eventDeleted(_that);
      case _RouteOptimized() when routeOptimized != null:
        return routeOptimized(_that);
      case _ConflictsFound() when conflictsFound != null:
        return conflictsFound(_that);
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
    required TResult Function(_EventCreated value) eventCreated,
    required TResult Function(_EventUpdated value) eventUpdated,
    required TResult Function(_EventDeleted value) eventDeleted,
    required TResult Function(_RouteOptimized value) routeOptimized,
    required TResult Function(_ConflictsFound value) conflictsFound,
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
      case _EventCreated():
        return eventCreated(_that);
      case _EventUpdated():
        return eventUpdated(_that);
      case _EventDeleted():
        return eventDeleted(_that);
      case _RouteOptimized():
        return routeOptimized(_that);
      case _ConflictsFound():
        return conflictsFound(_that);
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
    TResult? Function(_EventCreated value)? eventCreated,
    TResult? Function(_EventUpdated value)? eventUpdated,
    TResult? Function(_EventDeleted value)? eventDeleted,
    TResult? Function(_RouteOptimized value)? routeOptimized,
    TResult? Function(_ConflictsFound value)? conflictsFound,
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
      case _EventCreated() when eventCreated != null:
        return eventCreated(_that);
      case _EventUpdated() when eventUpdated != null:
        return eventUpdated(_that);
      case _EventDeleted() when eventDeleted != null:
        return eventDeleted(_that);
      case _RouteOptimized() when routeOptimized != null:
        return routeOptimized(_that);
      case _ConflictsFound() when conflictsFound != null:
        return conflictsFound(_that);
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
            List<CalendarEventEntity> events,
            DateTime currentDate,
            CalendarViewType viewType,
            CalendarEventType? typeFilter,
            String? searchQuery,
            bool isOffline,
            bool hasPendingSync,
            List<CalendarEventEntity>? optimizedRoute,
            List<CalendarEventEntity>? conflictingEvents)?
        loaded,
    TResult Function(Failure failure, List<CalendarEventEntity> events,
            DateTime currentDate, CalendarViewType viewType, bool isOffline)?
        error,
    TResult Function(List<CalendarEventEntity> events, DateTime currentDate,
            CalendarViewType viewType)?
        syncing,
    TResult Function(
            CalendarEventEntity event,
            List<CalendarEventEntity> events,
            DateTime currentDate,
            CalendarViewType viewType)?
        eventCreated,
    TResult Function(
            CalendarEventEntity event,
            List<CalendarEventEntity> events,
            DateTime currentDate,
            CalendarViewType viewType)?
        eventUpdated,
    TResult Function(int eventId, List<CalendarEventEntity> events,
            DateTime currentDate, CalendarViewType viewType)?
        eventDeleted,
    TResult Function(
            List<CalendarEventEntity> optimizedRoute,
            List<CalendarEventEntity> events,
            DateTime currentDate,
            CalendarViewType viewType)?
        routeOptimized,
    TResult Function(
            List<CalendarEventEntity> conflictingEvents,
            List<CalendarEventEntity> events,
            DateTime currentDate,
            CalendarViewType viewType)?
        conflictsFound,
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
            _that.events,
            _that.currentDate,
            _that.viewType,
            _that.typeFilter,
            _that.searchQuery,
            _that.isOffline,
            _that.hasPendingSync,
            _that.optimizedRoute,
            _that.conflictingEvents);
      case _Error() when error != null:
        return error(_that.failure, _that.events, _that.currentDate,
            _that.viewType, _that.isOffline);
      case _Syncing() when syncing != null:
        return syncing(_that.events, _that.currentDate, _that.viewType);
      case _EventCreated() when eventCreated != null:
        return eventCreated(
            _that.event, _that.events, _that.currentDate, _that.viewType);
      case _EventUpdated() when eventUpdated != null:
        return eventUpdated(
            _that.event, _that.events, _that.currentDate, _that.viewType);
      case _EventDeleted() when eventDeleted != null:
        return eventDeleted(
            _that.eventId, _that.events, _that.currentDate, _that.viewType);
      case _RouteOptimized() when routeOptimized != null:
        return routeOptimized(_that.optimizedRoute, _that.events,
            _that.currentDate, _that.viewType);
      case _ConflictsFound() when conflictsFound != null:
        return conflictsFound(_that.conflictingEvents, _that.events,
            _that.currentDate, _that.viewType);
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
            List<CalendarEventEntity> events,
            DateTime currentDate,
            CalendarViewType viewType,
            CalendarEventType? typeFilter,
            String? searchQuery,
            bool isOffline,
            bool hasPendingSync,
            List<CalendarEventEntity>? optimizedRoute,
            List<CalendarEventEntity>? conflictingEvents)
        loaded,
    required TResult Function(Failure failure, List<CalendarEventEntity> events,
            DateTime currentDate, CalendarViewType viewType, bool isOffline)
        error,
    required TResult Function(List<CalendarEventEntity> events,
            DateTime currentDate, CalendarViewType viewType)
        syncing,
    required TResult Function(
            CalendarEventEntity event,
            List<CalendarEventEntity> events,
            DateTime currentDate,
            CalendarViewType viewType)
        eventCreated,
    required TResult Function(
            CalendarEventEntity event,
            List<CalendarEventEntity> events,
            DateTime currentDate,
            CalendarViewType viewType)
        eventUpdated,
    required TResult Function(int eventId, List<CalendarEventEntity> events,
            DateTime currentDate, CalendarViewType viewType)
        eventDeleted,
    required TResult Function(
            List<CalendarEventEntity> optimizedRoute,
            List<CalendarEventEntity> events,
            DateTime currentDate,
            CalendarViewType viewType)
        routeOptimized,
    required TResult Function(
            List<CalendarEventEntity> conflictingEvents,
            List<CalendarEventEntity> events,
            DateTime currentDate,
            CalendarViewType viewType)
        conflictsFound,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _Loaded():
        return loaded(
            _that.events,
            _that.currentDate,
            _that.viewType,
            _that.typeFilter,
            _that.searchQuery,
            _that.isOffline,
            _that.hasPendingSync,
            _that.optimizedRoute,
            _that.conflictingEvents);
      case _Error():
        return error(_that.failure, _that.events, _that.currentDate,
            _that.viewType, _that.isOffline);
      case _Syncing():
        return syncing(_that.events, _that.currentDate, _that.viewType);
      case _EventCreated():
        return eventCreated(
            _that.event, _that.events, _that.currentDate, _that.viewType);
      case _EventUpdated():
        return eventUpdated(
            _that.event, _that.events, _that.currentDate, _that.viewType);
      case _EventDeleted():
        return eventDeleted(
            _that.eventId, _that.events, _that.currentDate, _that.viewType);
      case _RouteOptimized():
        return routeOptimized(_that.optimizedRoute, _that.events,
            _that.currentDate, _that.viewType);
      case _ConflictsFound():
        return conflictsFound(_that.conflictingEvents, _that.events,
            _that.currentDate, _that.viewType);
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
            List<CalendarEventEntity> events,
            DateTime currentDate,
            CalendarViewType viewType,
            CalendarEventType? typeFilter,
            String? searchQuery,
            bool isOffline,
            bool hasPendingSync,
            List<CalendarEventEntity>? optimizedRoute,
            List<CalendarEventEntity>? conflictingEvents)?
        loaded,
    TResult? Function(Failure failure, List<CalendarEventEntity> events,
            DateTime currentDate, CalendarViewType viewType, bool isOffline)?
        error,
    TResult? Function(List<CalendarEventEntity> events, DateTime currentDate,
            CalendarViewType viewType)?
        syncing,
    TResult? Function(
            CalendarEventEntity event,
            List<CalendarEventEntity> events,
            DateTime currentDate,
            CalendarViewType viewType)?
        eventCreated,
    TResult? Function(
            CalendarEventEntity event,
            List<CalendarEventEntity> events,
            DateTime currentDate,
            CalendarViewType viewType)?
        eventUpdated,
    TResult? Function(int eventId, List<CalendarEventEntity> events,
            DateTime currentDate, CalendarViewType viewType)?
        eventDeleted,
    TResult? Function(
            List<CalendarEventEntity> optimizedRoute,
            List<CalendarEventEntity> events,
            DateTime currentDate,
            CalendarViewType viewType)?
        routeOptimized,
    TResult? Function(
            List<CalendarEventEntity> conflictingEvents,
            List<CalendarEventEntity> events,
            DateTime currentDate,
            CalendarViewType viewType)?
        conflictsFound,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Loaded() when loaded != null:
        return loaded(
            _that.events,
            _that.currentDate,
            _that.viewType,
            _that.typeFilter,
            _that.searchQuery,
            _that.isOffline,
            _that.hasPendingSync,
            _that.optimizedRoute,
            _that.conflictingEvents);
      case _Error() when error != null:
        return error(_that.failure, _that.events, _that.currentDate,
            _that.viewType, _that.isOffline);
      case _Syncing() when syncing != null:
        return syncing(_that.events, _that.currentDate, _that.viewType);
      case _EventCreated() when eventCreated != null:
        return eventCreated(
            _that.event, _that.events, _that.currentDate, _that.viewType);
      case _EventUpdated() when eventUpdated != null:
        return eventUpdated(
            _that.event, _that.events, _that.currentDate, _that.viewType);
      case _EventDeleted() when eventDeleted != null:
        return eventDeleted(
            _that.eventId, _that.events, _that.currentDate, _that.viewType);
      case _RouteOptimized() when routeOptimized != null:
        return routeOptimized(_that.optimizedRoute, _that.events,
            _that.currentDate, _that.viewType);
      case _ConflictsFound() when conflictsFound != null:
        return conflictsFound(_that.conflictingEvents, _that.events,
            _that.currentDate, _that.viewType);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements CalendarState {
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
    return 'CalendarState.initial()';
  }
}

/// @nodoc

class _Loading implements CalendarState {
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
    return 'CalendarState.loading()';
  }
}

/// @nodoc

class _Loaded implements CalendarState {
  const _Loaded(
      {required final List<CalendarEventEntity> events,
      required this.currentDate,
      required this.viewType,
      this.typeFilter,
      this.searchQuery,
      this.isOffline = false,
      this.hasPendingSync = false,
      final List<CalendarEventEntity>? optimizedRoute,
      final List<CalendarEventEntity>? conflictingEvents})
      : _events = events,
        _optimizedRoute = optimizedRoute,
        _conflictingEvents = conflictingEvents;

  final List<CalendarEventEntity> _events;
  List<CalendarEventEntity> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  final DateTime currentDate;
  final CalendarViewType viewType;
  final CalendarEventType? typeFilter;
  final String? searchQuery;
  @JsonKey()
  final bool isOffline;
  @JsonKey()
  final bool hasPendingSync;
  final List<CalendarEventEntity>? _optimizedRoute;
  List<CalendarEventEntity>? get optimizedRoute {
    final value = _optimizedRoute;
    if (value == null) return null;
    if (_optimizedRoute is EqualUnmodifiableListView) return _optimizedRoute;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CalendarEventEntity>? _conflictingEvents;
  List<CalendarEventEntity>? get conflictingEvents {
    final value = _conflictingEvents;
    if (value == null) return null;
    if (_conflictingEvents is EqualUnmodifiableListView)
      return _conflictingEvents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of CalendarState
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
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.currentDate, currentDate) ||
                other.currentDate == currentDate) &&
            (identical(other.viewType, viewType) ||
                other.viewType == viewType) &&
            (identical(other.typeFilter, typeFilter) ||
                other.typeFilter == typeFilter) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.isOffline, isOffline) ||
                other.isOffline == isOffline) &&
            (identical(other.hasPendingSync, hasPendingSync) ||
                other.hasPendingSync == hasPendingSync) &&
            const DeepCollectionEquality()
                .equals(other._optimizedRoute, _optimizedRoute) &&
            const DeepCollectionEquality()
                .equals(other._conflictingEvents, _conflictingEvents));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_events),
      currentDate,
      viewType,
      typeFilter,
      searchQuery,
      isOffline,
      hasPendingSync,
      const DeepCollectionEquality().hash(_optimizedRoute),
      const DeepCollectionEquality().hash(_conflictingEvents));

  @override
  String toString() {
    return 'CalendarState.loaded(events: $events, currentDate: $currentDate, viewType: $viewType, typeFilter: $typeFilter, searchQuery: $searchQuery, isOffline: $isOffline, hasPendingSync: $hasPendingSync, optimizedRoute: $optimizedRoute, conflictingEvents: $conflictingEvents)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $CalendarStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @useResult
  $Res call(
      {List<CalendarEventEntity> events,
      DateTime currentDate,
      CalendarViewType viewType,
      CalendarEventType? typeFilter,
      String? searchQuery,
      bool isOffline,
      bool hasPendingSync,
      List<CalendarEventEntity>? optimizedRoute,
      List<CalendarEventEntity>? conflictingEvents});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? events = null,
    Object? currentDate = null,
    Object? viewType = null,
    Object? typeFilter = freezed,
    Object? searchQuery = freezed,
    Object? isOffline = null,
    Object? hasPendingSync = null,
    Object? optimizedRoute = freezed,
    Object? conflictingEvents = freezed,
  }) {
    return _then(_Loaded(
      events: null == events
          ? _self._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<CalendarEventEntity>,
      currentDate: null == currentDate
          ? _self.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      viewType: null == viewType
          ? _self.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as CalendarViewType,
      typeFilter: freezed == typeFilter
          ? _self.typeFilter
          : typeFilter // ignore: cast_nullable_to_non_nullable
              as CalendarEventType?,
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
      optimizedRoute: freezed == optimizedRoute
          ? _self._optimizedRoute
          : optimizedRoute // ignore: cast_nullable_to_non_nullable
              as List<CalendarEventEntity>?,
      conflictingEvents: freezed == conflictingEvents
          ? _self._conflictingEvents
          : conflictingEvents // ignore: cast_nullable_to_non_nullable
              as List<CalendarEventEntity>?,
    ));
  }
}

/// @nodoc

class _Error implements CalendarState {
  const _Error(
      {required this.failure,
      final List<CalendarEventEntity> events = const [],
      required this.currentDate,
      required this.viewType,
      this.isOffline = false})
      : _events = events;

  final Failure failure;
  final List<CalendarEventEntity> _events;
  @JsonKey()
  List<CalendarEventEntity> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  final DateTime currentDate;
  final CalendarViewType viewType;
  @JsonKey()
  final bool isOffline;

  /// Create a copy of CalendarState
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
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.currentDate, currentDate) ||
                other.currentDate == currentDate) &&
            (identical(other.viewType, viewType) ||
                other.viewType == viewType) &&
            (identical(other.isOffline, isOffline) ||
                other.isOffline == isOffline));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      failure,
      const DeepCollectionEquality().hash(_events),
      currentDate,
      viewType,
      isOffline);

  @override
  String toString() {
    return 'CalendarState.error(failure: $failure, events: $events, currentDate: $currentDate, viewType: $viewType, isOffline: $isOffline)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $CalendarStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @useResult
  $Res call(
      {Failure failure,
      List<CalendarEventEntity> events,
      DateTime currentDate,
      CalendarViewType viewType,
      bool isOffline});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? failure = null,
    Object? events = null,
    Object? currentDate = null,
    Object? viewType = null,
    Object? isOffline = null,
  }) {
    return _then(_Error(
      failure: null == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
      events: null == events
          ? _self._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<CalendarEventEntity>,
      currentDate: null == currentDate
          ? _self.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      viewType: null == viewType
          ? _self.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as CalendarViewType,
      isOffline: null == isOffline
          ? _self.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of CalendarState
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

class _Syncing implements CalendarState {
  const _Syncing(
      {required final List<CalendarEventEntity> events,
      required this.currentDate,
      required this.viewType})
      : _events = events;

  final List<CalendarEventEntity> _events;
  List<CalendarEventEntity> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  final DateTime currentDate;
  final CalendarViewType viewType;

  /// Create a copy of CalendarState
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
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.currentDate, currentDate) ||
                other.currentDate == currentDate) &&
            (identical(other.viewType, viewType) ||
                other.viewType == viewType));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_events), currentDate, viewType);

  @override
  String toString() {
    return 'CalendarState.syncing(events: $events, currentDate: $currentDate, viewType: $viewType)';
  }
}

/// @nodoc
abstract mixin class _$SyncingCopyWith<$Res>
    implements $CalendarStateCopyWith<$Res> {
  factory _$SyncingCopyWith(_Syncing value, $Res Function(_Syncing) _then) =
      __$SyncingCopyWithImpl;
  @useResult
  $Res call(
      {List<CalendarEventEntity> events,
      DateTime currentDate,
      CalendarViewType viewType});
}

/// @nodoc
class __$SyncingCopyWithImpl<$Res> implements _$SyncingCopyWith<$Res> {
  __$SyncingCopyWithImpl(this._self, this._then);

  final _Syncing _self;
  final $Res Function(_Syncing) _then;

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? events = null,
    Object? currentDate = null,
    Object? viewType = null,
  }) {
    return _then(_Syncing(
      events: null == events
          ? _self._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<CalendarEventEntity>,
      currentDate: null == currentDate
          ? _self.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      viewType: null == viewType
          ? _self.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as CalendarViewType,
    ));
  }
}

/// @nodoc

class _EventCreated implements CalendarState {
  const _EventCreated(
      {required this.event,
      required final List<CalendarEventEntity> events,
      required this.currentDate,
      required this.viewType})
      : _events = events;

  final CalendarEventEntity event;
  final List<CalendarEventEntity> _events;
  List<CalendarEventEntity> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  final DateTime currentDate;
  final CalendarViewType viewType;

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EventCreatedCopyWith<_EventCreated> get copyWith =>
      __$EventCreatedCopyWithImpl<_EventCreated>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EventCreated &&
            (identical(other.event, event) || other.event == event) &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.currentDate, currentDate) ||
                other.currentDate == currentDate) &&
            (identical(other.viewType, viewType) ||
                other.viewType == viewType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, event,
      const DeepCollectionEquality().hash(_events), currentDate, viewType);

  @override
  String toString() {
    return 'CalendarState.eventCreated(event: $event, events: $events, currentDate: $currentDate, viewType: $viewType)';
  }
}

/// @nodoc
abstract mixin class _$EventCreatedCopyWith<$Res>
    implements $CalendarStateCopyWith<$Res> {
  factory _$EventCreatedCopyWith(
          _EventCreated value, $Res Function(_EventCreated) _then) =
      __$EventCreatedCopyWithImpl;
  @useResult
  $Res call(
      {CalendarEventEntity event,
      List<CalendarEventEntity> events,
      DateTime currentDate,
      CalendarViewType viewType});

  $CalendarEventEntityCopyWith<$Res> get event;
}

/// @nodoc
class __$EventCreatedCopyWithImpl<$Res>
    implements _$EventCreatedCopyWith<$Res> {
  __$EventCreatedCopyWithImpl(this._self, this._then);

  final _EventCreated _self;
  final $Res Function(_EventCreated) _then;

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? event = null,
    Object? events = null,
    Object? currentDate = null,
    Object? viewType = null,
  }) {
    return _then(_EventCreated(
      event: null == event
          ? _self.event
          : event // ignore: cast_nullable_to_non_nullable
              as CalendarEventEntity,
      events: null == events
          ? _self._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<CalendarEventEntity>,
      currentDate: null == currentDate
          ? _self.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      viewType: null == viewType
          ? _self.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as CalendarViewType,
    ));
  }

  /// Create a copy of CalendarState
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

class _EventUpdated implements CalendarState {
  const _EventUpdated(
      {required this.event,
      required final List<CalendarEventEntity> events,
      required this.currentDate,
      required this.viewType})
      : _events = events;

  final CalendarEventEntity event;
  final List<CalendarEventEntity> _events;
  List<CalendarEventEntity> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  final DateTime currentDate;
  final CalendarViewType viewType;

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EventUpdatedCopyWith<_EventUpdated> get copyWith =>
      __$EventUpdatedCopyWithImpl<_EventUpdated>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EventUpdated &&
            (identical(other.event, event) || other.event == event) &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.currentDate, currentDate) ||
                other.currentDate == currentDate) &&
            (identical(other.viewType, viewType) ||
                other.viewType == viewType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, event,
      const DeepCollectionEquality().hash(_events), currentDate, viewType);

  @override
  String toString() {
    return 'CalendarState.eventUpdated(event: $event, events: $events, currentDate: $currentDate, viewType: $viewType)';
  }
}

/// @nodoc
abstract mixin class _$EventUpdatedCopyWith<$Res>
    implements $CalendarStateCopyWith<$Res> {
  factory _$EventUpdatedCopyWith(
          _EventUpdated value, $Res Function(_EventUpdated) _then) =
      __$EventUpdatedCopyWithImpl;
  @useResult
  $Res call(
      {CalendarEventEntity event,
      List<CalendarEventEntity> events,
      DateTime currentDate,
      CalendarViewType viewType});

  $CalendarEventEntityCopyWith<$Res> get event;
}

/// @nodoc
class __$EventUpdatedCopyWithImpl<$Res>
    implements _$EventUpdatedCopyWith<$Res> {
  __$EventUpdatedCopyWithImpl(this._self, this._then);

  final _EventUpdated _self;
  final $Res Function(_EventUpdated) _then;

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? event = null,
    Object? events = null,
    Object? currentDate = null,
    Object? viewType = null,
  }) {
    return _then(_EventUpdated(
      event: null == event
          ? _self.event
          : event // ignore: cast_nullable_to_non_nullable
              as CalendarEventEntity,
      events: null == events
          ? _self._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<CalendarEventEntity>,
      currentDate: null == currentDate
          ? _self.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      viewType: null == viewType
          ? _self.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as CalendarViewType,
    ));
  }

  /// Create a copy of CalendarState
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

class _EventDeleted implements CalendarState {
  const _EventDeleted(
      {required this.eventId,
      required final List<CalendarEventEntity> events,
      required this.currentDate,
      required this.viewType})
      : _events = events;

  final int eventId;
  final List<CalendarEventEntity> _events;
  List<CalendarEventEntity> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  final DateTime currentDate;
  final CalendarViewType viewType;

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EventDeletedCopyWith<_EventDeleted> get copyWith =>
      __$EventDeletedCopyWithImpl<_EventDeleted>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EventDeleted &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.currentDate, currentDate) ||
                other.currentDate == currentDate) &&
            (identical(other.viewType, viewType) ||
                other.viewType == viewType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventId,
      const DeepCollectionEquality().hash(_events), currentDate, viewType);

  @override
  String toString() {
    return 'CalendarState.eventDeleted(eventId: $eventId, events: $events, currentDate: $currentDate, viewType: $viewType)';
  }
}

/// @nodoc
abstract mixin class _$EventDeletedCopyWith<$Res>
    implements $CalendarStateCopyWith<$Res> {
  factory _$EventDeletedCopyWith(
          _EventDeleted value, $Res Function(_EventDeleted) _then) =
      __$EventDeletedCopyWithImpl;
  @useResult
  $Res call(
      {int eventId,
      List<CalendarEventEntity> events,
      DateTime currentDate,
      CalendarViewType viewType});
}

/// @nodoc
class __$EventDeletedCopyWithImpl<$Res>
    implements _$EventDeletedCopyWith<$Res> {
  __$EventDeletedCopyWithImpl(this._self, this._then);

  final _EventDeleted _self;
  final $Res Function(_EventDeleted) _then;

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? events = null,
    Object? currentDate = null,
    Object? viewType = null,
  }) {
    return _then(_EventDeleted(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int,
      events: null == events
          ? _self._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<CalendarEventEntity>,
      currentDate: null == currentDate
          ? _self.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      viewType: null == viewType
          ? _self.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as CalendarViewType,
    ));
  }
}

/// @nodoc

class _RouteOptimized implements CalendarState {
  const _RouteOptimized(
      {required final List<CalendarEventEntity> optimizedRoute,
      required final List<CalendarEventEntity> events,
      required this.currentDate,
      required this.viewType})
      : _optimizedRoute = optimizedRoute,
        _events = events;

  final List<CalendarEventEntity> _optimizedRoute;
  List<CalendarEventEntity> get optimizedRoute {
    if (_optimizedRoute is EqualUnmodifiableListView) return _optimizedRoute;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_optimizedRoute);
  }

  final List<CalendarEventEntity> _events;
  List<CalendarEventEntity> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  final DateTime currentDate;
  final CalendarViewType viewType;

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RouteOptimizedCopyWith<_RouteOptimized> get copyWith =>
      __$RouteOptimizedCopyWithImpl<_RouteOptimized>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RouteOptimized &&
            const DeepCollectionEquality()
                .equals(other._optimizedRoute, _optimizedRoute) &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.currentDate, currentDate) ||
                other.currentDate == currentDate) &&
            (identical(other.viewType, viewType) ||
                other.viewType == viewType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_optimizedRoute),
      const DeepCollectionEquality().hash(_events),
      currentDate,
      viewType);

  @override
  String toString() {
    return 'CalendarState.routeOptimized(optimizedRoute: $optimizedRoute, events: $events, currentDate: $currentDate, viewType: $viewType)';
  }
}

/// @nodoc
abstract mixin class _$RouteOptimizedCopyWith<$Res>
    implements $CalendarStateCopyWith<$Res> {
  factory _$RouteOptimizedCopyWith(
          _RouteOptimized value, $Res Function(_RouteOptimized) _then) =
      __$RouteOptimizedCopyWithImpl;
  @useResult
  $Res call(
      {List<CalendarEventEntity> optimizedRoute,
      List<CalendarEventEntity> events,
      DateTime currentDate,
      CalendarViewType viewType});
}

/// @nodoc
class __$RouteOptimizedCopyWithImpl<$Res>
    implements _$RouteOptimizedCopyWith<$Res> {
  __$RouteOptimizedCopyWithImpl(this._self, this._then);

  final _RouteOptimized _self;
  final $Res Function(_RouteOptimized) _then;

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? optimizedRoute = null,
    Object? events = null,
    Object? currentDate = null,
    Object? viewType = null,
  }) {
    return _then(_RouteOptimized(
      optimizedRoute: null == optimizedRoute
          ? _self._optimizedRoute
          : optimizedRoute // ignore: cast_nullable_to_non_nullable
              as List<CalendarEventEntity>,
      events: null == events
          ? _self._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<CalendarEventEntity>,
      currentDate: null == currentDate
          ? _self.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      viewType: null == viewType
          ? _self.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as CalendarViewType,
    ));
  }
}

/// @nodoc

class _ConflictsFound implements CalendarState {
  const _ConflictsFound(
      {required final List<CalendarEventEntity> conflictingEvents,
      required final List<CalendarEventEntity> events,
      required this.currentDate,
      required this.viewType})
      : _conflictingEvents = conflictingEvents,
        _events = events;

  final List<CalendarEventEntity> _conflictingEvents;
  List<CalendarEventEntity> get conflictingEvents {
    if (_conflictingEvents is EqualUnmodifiableListView)
      return _conflictingEvents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conflictingEvents);
  }

  final List<CalendarEventEntity> _events;
  List<CalendarEventEntity> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  final DateTime currentDate;
  final CalendarViewType viewType;

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ConflictsFoundCopyWith<_ConflictsFound> get copyWith =>
      __$ConflictsFoundCopyWithImpl<_ConflictsFound>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ConflictsFound &&
            const DeepCollectionEquality()
                .equals(other._conflictingEvents, _conflictingEvents) &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.currentDate, currentDate) ||
                other.currentDate == currentDate) &&
            (identical(other.viewType, viewType) ||
                other.viewType == viewType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_conflictingEvents),
      const DeepCollectionEquality().hash(_events),
      currentDate,
      viewType);

  @override
  String toString() {
    return 'CalendarState.conflictsFound(conflictingEvents: $conflictingEvents, events: $events, currentDate: $currentDate, viewType: $viewType)';
  }
}

/// @nodoc
abstract mixin class _$ConflictsFoundCopyWith<$Res>
    implements $CalendarStateCopyWith<$Res> {
  factory _$ConflictsFoundCopyWith(
          _ConflictsFound value, $Res Function(_ConflictsFound) _then) =
      __$ConflictsFoundCopyWithImpl;
  @useResult
  $Res call(
      {List<CalendarEventEntity> conflictingEvents,
      List<CalendarEventEntity> events,
      DateTime currentDate,
      CalendarViewType viewType});
}

/// @nodoc
class __$ConflictsFoundCopyWithImpl<$Res>
    implements _$ConflictsFoundCopyWith<$Res> {
  __$ConflictsFoundCopyWithImpl(this._self, this._then);

  final _ConflictsFound _self;
  final $Res Function(_ConflictsFound) _then;

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? conflictingEvents = null,
    Object? events = null,
    Object? currentDate = null,
    Object? viewType = null,
  }) {
    return _then(_ConflictsFound(
      conflictingEvents: null == conflictingEvents
          ? _self._conflictingEvents
          : conflictingEvents // ignore: cast_nullable_to_non_nullable
              as List<CalendarEventEntity>,
      events: null == events
          ? _self._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<CalendarEventEntity>,
      currentDate: null == currentDate
          ? _self.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      viewType: null == viewType
          ? _self.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as CalendarViewType,
    ));
  }
}

// dart format on
