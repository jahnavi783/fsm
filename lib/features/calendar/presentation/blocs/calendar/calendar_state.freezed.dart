// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CalendarState {
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarStateCopyWith<$Res> {
  factory $CalendarStateCopyWith(
          CalendarState value, $Res Function(CalendarState) then) =
      _$CalendarStateCopyWithImpl<$Res, CalendarState>;
}

/// @nodoc
class _$CalendarStateCopyWithImpl<$Res, $Val extends CalendarState>
    implements $CalendarStateCopyWith<$Res> {
  _$CalendarStateCopyWithImpl(this._value, this._then);

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
    extends _$CalendarStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'CalendarState.initial()';
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
    return initial();
  }

  @override
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
    return initial?.call();
  }

  @override
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
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
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
    return initial(this);
  }

  @override
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
    return initial?.call(this);
  }

  @override
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
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CalendarState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'CalendarState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return loading();
  }

  @override
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
    return loading?.call();
  }

  @override
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
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
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
    return loading(this);
  }

  @override
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
    return loading?.call(this);
  }

  @override
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
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CalendarState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
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
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
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
    return _then(_$LoadedImpl(
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<CalendarEventEntity>,
      currentDate: null == currentDate
          ? _value.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      viewType: null == viewType
          ? _value.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as CalendarViewType,
      typeFilter: freezed == typeFilter
          ? _value.typeFilter
          : typeFilter // ignore: cast_nullable_to_non_nullable
              as CalendarEventType?,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      isOffline: null == isOffline
          ? _value.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPendingSync: null == hasPendingSync
          ? _value.hasPendingSync
          : hasPendingSync // ignore: cast_nullable_to_non_nullable
              as bool,
      optimizedRoute: freezed == optimizedRoute
          ? _value._optimizedRoute
          : optimizedRoute // ignore: cast_nullable_to_non_nullable
              as List<CalendarEventEntity>?,
      conflictingEvents: freezed == conflictingEvents
          ? _value._conflictingEvents
          : conflictingEvents // ignore: cast_nullable_to_non_nullable
              as List<CalendarEventEntity>?,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(
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
  @override
  List<CalendarEventEntity> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  final DateTime currentDate;
  @override
  final CalendarViewType viewType;
  @override
  final CalendarEventType? typeFilter;
  @override
  final String? searchQuery;
  @override
  @JsonKey()
  final bool isOffline;
  @override
  @JsonKey()
  final bool hasPendingSync;
  final List<CalendarEventEntity>? _optimizedRoute;
  @override
  List<CalendarEventEntity>? get optimizedRoute {
    final value = _optimizedRoute;
    if (value == null) return null;
    if (_optimizedRoute is EqualUnmodifiableListView) return _optimizedRoute;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CalendarEventEntity>? _conflictingEvents;
  @override
  List<CalendarEventEntity>? get conflictingEvents {
    final value = _conflictingEvents;
    if (value == null) return null;
    if (_conflictingEvents is EqualUnmodifiableListView)
      return _conflictingEvents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CalendarState.loaded(events: $events, currentDate: $currentDate, viewType: $viewType, typeFilter: $typeFilter, searchQuery: $searchQuery, isOffline: $isOffline, hasPendingSync: $hasPendingSync, optimizedRoute: $optimizedRoute, conflictingEvents: $conflictingEvents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
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
    return loaded(events, currentDate, viewType, typeFilter, searchQuery,
        isOffline, hasPendingSync, optimizedRoute, conflictingEvents);
  }

  @override
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
    return loaded?.call(events, currentDate, viewType, typeFilter, searchQuery,
        isOffline, hasPendingSync, optimizedRoute, conflictingEvents);
  }

  @override
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
    if (loaded != null) {
      return loaded(events, currentDate, viewType, typeFilter, searchQuery,
          isOffline, hasPendingSync, optimizedRoute, conflictingEvents);
    }
    return orElse();
  }

  @override
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
    return loaded(this);
  }

  @override
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
    return loaded?.call(this);
  }

  @override
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
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements CalendarState {
  const factory _Loaded(
      {required final List<CalendarEventEntity> events,
      required final DateTime currentDate,
      required final CalendarViewType viewType,
      final CalendarEventType? typeFilter,
      final String? searchQuery,
      final bool isOffline,
      final bool hasPendingSync,
      final List<CalendarEventEntity>? optimizedRoute,
      final List<CalendarEventEntity>? conflictingEvents}) = _$LoadedImpl;

  List<CalendarEventEntity> get events;
  DateTime get currentDate;
  CalendarViewType get viewType;
  CalendarEventType? get typeFilter;
  String? get searchQuery;
  bool get isOffline;
  bool get hasPendingSync;
  List<CalendarEventEntity>? get optimizedRoute;
  List<CalendarEventEntity>? get conflictingEvents;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
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
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
    Object? events = null,
    Object? currentDate = null,
    Object? viewType = null,
    Object? isOffline = null,
  }) {
    return _then(_$ErrorImpl(
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<CalendarEventEntity>,
      currentDate: null == currentDate
          ? _value.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      viewType: null == viewType
          ? _value.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as CalendarViewType,
      isOffline: null == isOffline
          ? _value.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res> get failure {
    return $FailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(
      {required this.failure,
      final List<CalendarEventEntity> events = const [],
      required this.currentDate,
      required this.viewType,
      this.isOffline = false})
      : _events = events;

  @override
  final Failure failure;
  final List<CalendarEventEntity> _events;
  @override
  @JsonKey()
  List<CalendarEventEntity> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  final DateTime currentDate;
  @override
  final CalendarViewType viewType;
  @override
  @JsonKey()
  final bool isOffline;

  @override
  String toString() {
    return 'CalendarState.error(failure: $failure, events: $events, currentDate: $currentDate, viewType: $viewType, isOffline: $isOffline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
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
    return error(failure, events, currentDate, viewType, isOffline);
  }

  @override
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
    return error?.call(failure, events, currentDate, viewType, isOffline);
  }

  @override
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
    if (error != null) {
      return error(failure, events, currentDate, viewType, isOffline);
    }
    return orElse();
  }

  @override
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
    return error(this);
  }

  @override
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
    return error?.call(this);
  }

  @override
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
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements CalendarState {
  const factory _Error(
      {required final Failure failure,
      final List<CalendarEventEntity> events,
      required final DateTime currentDate,
      required final CalendarViewType viewType,
      final bool isOffline}) = _$ErrorImpl;

  Failure get failure;
  List<CalendarEventEntity> get events;
  DateTime get currentDate;
  CalendarViewType get viewType;
  bool get isOffline;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SyncingImplCopyWith<$Res> {
  factory _$$SyncingImplCopyWith(
          _$SyncingImpl value, $Res Function(_$SyncingImpl) then) =
      __$$SyncingImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<CalendarEventEntity> events,
      DateTime currentDate,
      CalendarViewType viewType});
}

/// @nodoc
class __$$SyncingImplCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res, _$SyncingImpl>
    implements _$$SyncingImplCopyWith<$Res> {
  __$$SyncingImplCopyWithImpl(
      _$SyncingImpl _value, $Res Function(_$SyncingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? currentDate = null,
    Object? viewType = null,
  }) {
    return _then(_$SyncingImpl(
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<CalendarEventEntity>,
      currentDate: null == currentDate
          ? _value.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      viewType: null == viewType
          ? _value.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as CalendarViewType,
    ));
  }
}

/// @nodoc

class _$SyncingImpl implements _Syncing {
  const _$SyncingImpl(
      {required final List<CalendarEventEntity> events,
      required this.currentDate,
      required this.viewType})
      : _events = events;

  final List<CalendarEventEntity> _events;
  @override
  List<CalendarEventEntity> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  final DateTime currentDate;
  @override
  final CalendarViewType viewType;

  @override
  String toString() {
    return 'CalendarState.syncing(events: $events, currentDate: $currentDate, viewType: $viewType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncingImpl &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.currentDate, currentDate) ||
                other.currentDate == currentDate) &&
            (identical(other.viewType, viewType) ||
                other.viewType == viewType));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_events), currentDate, viewType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncingImplCopyWith<_$SyncingImpl> get copyWith =>
      __$$SyncingImplCopyWithImpl<_$SyncingImpl>(this, _$identity);

  @override
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
    return syncing(events, currentDate, viewType);
  }

  @override
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
    return syncing?.call(events, currentDate, viewType);
  }

  @override
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
    if (syncing != null) {
      return syncing(events, currentDate, viewType);
    }
    return orElse();
  }

  @override
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
    return syncing(this);
  }

  @override
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
    return syncing?.call(this);
  }

  @override
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
    if (syncing != null) {
      return syncing(this);
    }
    return orElse();
  }
}

abstract class _Syncing implements CalendarState {
  const factory _Syncing(
      {required final List<CalendarEventEntity> events,
      required final DateTime currentDate,
      required final CalendarViewType viewType}) = _$SyncingImpl;

  List<CalendarEventEntity> get events;
  DateTime get currentDate;
  CalendarViewType get viewType;
  @JsonKey(ignore: true)
  _$$SyncingImplCopyWith<_$SyncingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EventCreatedImplCopyWith<$Res> {
  factory _$$EventCreatedImplCopyWith(
          _$EventCreatedImpl value, $Res Function(_$EventCreatedImpl) then) =
      __$$EventCreatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {CalendarEventEntity event,
      List<CalendarEventEntity> events,
      DateTime currentDate,
      CalendarViewType viewType});

  $CalendarEventEntityCopyWith<$Res> get event;
}

/// @nodoc
class __$$EventCreatedImplCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res, _$EventCreatedImpl>
    implements _$$EventCreatedImplCopyWith<$Res> {
  __$$EventCreatedImplCopyWithImpl(
      _$EventCreatedImpl _value, $Res Function(_$EventCreatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
    Object? events = null,
    Object? currentDate = null,
    Object? viewType = null,
  }) {
    return _then(_$EventCreatedImpl(
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as CalendarEventEntity,
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<CalendarEventEntity>,
      currentDate: null == currentDate
          ? _value.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      viewType: null == viewType
          ? _value.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as CalendarViewType,
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

class _$EventCreatedImpl implements _EventCreated {
  const _$EventCreatedImpl(
      {required this.event,
      required final List<CalendarEventEntity> events,
      required this.currentDate,
      required this.viewType})
      : _events = events;

  @override
  final CalendarEventEntity event;
  final List<CalendarEventEntity> _events;
  @override
  List<CalendarEventEntity> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  final DateTime currentDate;
  @override
  final CalendarViewType viewType;

  @override
  String toString() {
    return 'CalendarState.eventCreated(event: $event, events: $events, currentDate: $currentDate, viewType: $viewType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventCreatedImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventCreatedImplCopyWith<_$EventCreatedImpl> get copyWith =>
      __$$EventCreatedImplCopyWithImpl<_$EventCreatedImpl>(this, _$identity);

  @override
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
    return eventCreated(event, events, currentDate, viewType);
  }

  @override
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
    return eventCreated?.call(event, events, currentDate, viewType);
  }

  @override
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
    if (eventCreated != null) {
      return eventCreated(event, events, currentDate, viewType);
    }
    return orElse();
  }

  @override
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
    return eventCreated(this);
  }

  @override
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
    return eventCreated?.call(this);
  }

  @override
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
    if (eventCreated != null) {
      return eventCreated(this);
    }
    return orElse();
  }
}

abstract class _EventCreated implements CalendarState {
  const factory _EventCreated(
      {required final CalendarEventEntity event,
      required final List<CalendarEventEntity> events,
      required final DateTime currentDate,
      required final CalendarViewType viewType}) = _$EventCreatedImpl;

  CalendarEventEntity get event;
  List<CalendarEventEntity> get events;
  DateTime get currentDate;
  CalendarViewType get viewType;
  @JsonKey(ignore: true)
  _$$EventCreatedImplCopyWith<_$EventCreatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EventUpdatedImplCopyWith<$Res> {
  factory _$$EventUpdatedImplCopyWith(
          _$EventUpdatedImpl value, $Res Function(_$EventUpdatedImpl) then) =
      __$$EventUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {CalendarEventEntity event,
      List<CalendarEventEntity> events,
      DateTime currentDate,
      CalendarViewType viewType});

  $CalendarEventEntityCopyWith<$Res> get event;
}

/// @nodoc
class __$$EventUpdatedImplCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res, _$EventUpdatedImpl>
    implements _$$EventUpdatedImplCopyWith<$Res> {
  __$$EventUpdatedImplCopyWithImpl(
      _$EventUpdatedImpl _value, $Res Function(_$EventUpdatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
    Object? events = null,
    Object? currentDate = null,
    Object? viewType = null,
  }) {
    return _then(_$EventUpdatedImpl(
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as CalendarEventEntity,
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<CalendarEventEntity>,
      currentDate: null == currentDate
          ? _value.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      viewType: null == viewType
          ? _value.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as CalendarViewType,
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

class _$EventUpdatedImpl implements _EventUpdated {
  const _$EventUpdatedImpl(
      {required this.event,
      required final List<CalendarEventEntity> events,
      required this.currentDate,
      required this.viewType})
      : _events = events;

  @override
  final CalendarEventEntity event;
  final List<CalendarEventEntity> _events;
  @override
  List<CalendarEventEntity> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  final DateTime currentDate;
  @override
  final CalendarViewType viewType;

  @override
  String toString() {
    return 'CalendarState.eventUpdated(event: $event, events: $events, currentDate: $currentDate, viewType: $viewType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventUpdatedImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventUpdatedImplCopyWith<_$EventUpdatedImpl> get copyWith =>
      __$$EventUpdatedImplCopyWithImpl<_$EventUpdatedImpl>(this, _$identity);

  @override
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
    return eventUpdated(event, events, currentDate, viewType);
  }

  @override
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
    return eventUpdated?.call(event, events, currentDate, viewType);
  }

  @override
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
    if (eventUpdated != null) {
      return eventUpdated(event, events, currentDate, viewType);
    }
    return orElse();
  }

  @override
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
    return eventUpdated(this);
  }

  @override
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
    return eventUpdated?.call(this);
  }

  @override
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
    if (eventUpdated != null) {
      return eventUpdated(this);
    }
    return orElse();
  }
}

abstract class _EventUpdated implements CalendarState {
  const factory _EventUpdated(
      {required final CalendarEventEntity event,
      required final List<CalendarEventEntity> events,
      required final DateTime currentDate,
      required final CalendarViewType viewType}) = _$EventUpdatedImpl;

  CalendarEventEntity get event;
  List<CalendarEventEntity> get events;
  DateTime get currentDate;
  CalendarViewType get viewType;
  @JsonKey(ignore: true)
  _$$EventUpdatedImplCopyWith<_$EventUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EventDeletedImplCopyWith<$Res> {
  factory _$$EventDeletedImplCopyWith(
          _$EventDeletedImpl value, $Res Function(_$EventDeletedImpl) then) =
      __$$EventDeletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int eventId,
      List<CalendarEventEntity> events,
      DateTime currentDate,
      CalendarViewType viewType});
}

/// @nodoc
class __$$EventDeletedImplCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res, _$EventDeletedImpl>
    implements _$$EventDeletedImplCopyWith<$Res> {
  __$$EventDeletedImplCopyWithImpl(
      _$EventDeletedImpl _value, $Res Function(_$EventDeletedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? events = null,
    Object? currentDate = null,
    Object? viewType = null,
  }) {
    return _then(_$EventDeletedImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int,
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<CalendarEventEntity>,
      currentDate: null == currentDate
          ? _value.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      viewType: null == viewType
          ? _value.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as CalendarViewType,
    ));
  }
}

/// @nodoc

class _$EventDeletedImpl implements _EventDeleted {
  const _$EventDeletedImpl(
      {required this.eventId,
      required final List<CalendarEventEntity> events,
      required this.currentDate,
      required this.viewType})
      : _events = events;

  @override
  final int eventId;
  final List<CalendarEventEntity> _events;
  @override
  List<CalendarEventEntity> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  final DateTime currentDate;
  @override
  final CalendarViewType viewType;

  @override
  String toString() {
    return 'CalendarState.eventDeleted(eventId: $eventId, events: $events, currentDate: $currentDate, viewType: $viewType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventDeletedImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventDeletedImplCopyWith<_$EventDeletedImpl> get copyWith =>
      __$$EventDeletedImplCopyWithImpl<_$EventDeletedImpl>(this, _$identity);

  @override
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
    return eventDeleted(eventId, events, currentDate, viewType);
  }

  @override
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
    return eventDeleted?.call(eventId, events, currentDate, viewType);
  }

  @override
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
    if (eventDeleted != null) {
      return eventDeleted(eventId, events, currentDate, viewType);
    }
    return orElse();
  }

  @override
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
    return eventDeleted(this);
  }

  @override
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
    return eventDeleted?.call(this);
  }

  @override
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
    if (eventDeleted != null) {
      return eventDeleted(this);
    }
    return orElse();
  }
}

abstract class _EventDeleted implements CalendarState {
  const factory _EventDeleted(
      {required final int eventId,
      required final List<CalendarEventEntity> events,
      required final DateTime currentDate,
      required final CalendarViewType viewType}) = _$EventDeletedImpl;

  int get eventId;
  List<CalendarEventEntity> get events;
  DateTime get currentDate;
  CalendarViewType get viewType;
  @JsonKey(ignore: true)
  _$$EventDeletedImplCopyWith<_$EventDeletedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RouteOptimizedImplCopyWith<$Res> {
  factory _$$RouteOptimizedImplCopyWith(_$RouteOptimizedImpl value,
          $Res Function(_$RouteOptimizedImpl) then) =
      __$$RouteOptimizedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<CalendarEventEntity> optimizedRoute,
      List<CalendarEventEntity> events,
      DateTime currentDate,
      CalendarViewType viewType});
}

/// @nodoc
class __$$RouteOptimizedImplCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res, _$RouteOptimizedImpl>
    implements _$$RouteOptimizedImplCopyWith<$Res> {
  __$$RouteOptimizedImplCopyWithImpl(
      _$RouteOptimizedImpl _value, $Res Function(_$RouteOptimizedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? optimizedRoute = null,
    Object? events = null,
    Object? currentDate = null,
    Object? viewType = null,
  }) {
    return _then(_$RouteOptimizedImpl(
      optimizedRoute: null == optimizedRoute
          ? _value._optimizedRoute
          : optimizedRoute // ignore: cast_nullable_to_non_nullable
              as List<CalendarEventEntity>,
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<CalendarEventEntity>,
      currentDate: null == currentDate
          ? _value.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      viewType: null == viewType
          ? _value.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as CalendarViewType,
    ));
  }
}

/// @nodoc

class _$RouteOptimizedImpl implements _RouteOptimized {
  const _$RouteOptimizedImpl(
      {required final List<CalendarEventEntity> optimizedRoute,
      required final List<CalendarEventEntity> events,
      required this.currentDate,
      required this.viewType})
      : _optimizedRoute = optimizedRoute,
        _events = events;

  final List<CalendarEventEntity> _optimizedRoute;
  @override
  List<CalendarEventEntity> get optimizedRoute {
    if (_optimizedRoute is EqualUnmodifiableListView) return _optimizedRoute;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_optimizedRoute);
  }

  final List<CalendarEventEntity> _events;
  @override
  List<CalendarEventEntity> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  final DateTime currentDate;
  @override
  final CalendarViewType viewType;

  @override
  String toString() {
    return 'CalendarState.routeOptimized(optimizedRoute: $optimizedRoute, events: $events, currentDate: $currentDate, viewType: $viewType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteOptimizedImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteOptimizedImplCopyWith<_$RouteOptimizedImpl> get copyWith =>
      __$$RouteOptimizedImplCopyWithImpl<_$RouteOptimizedImpl>(
          this, _$identity);

  @override
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
    return routeOptimized(optimizedRoute, events, currentDate, viewType);
  }

  @override
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
    return routeOptimized?.call(optimizedRoute, events, currentDate, viewType);
  }

  @override
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
    if (routeOptimized != null) {
      return routeOptimized(optimizedRoute, events, currentDate, viewType);
    }
    return orElse();
  }

  @override
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
    return routeOptimized(this);
  }

  @override
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
    return routeOptimized?.call(this);
  }

  @override
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
    if (routeOptimized != null) {
      return routeOptimized(this);
    }
    return orElse();
  }
}

abstract class _RouteOptimized implements CalendarState {
  const factory _RouteOptimized(
      {required final List<CalendarEventEntity> optimizedRoute,
      required final List<CalendarEventEntity> events,
      required final DateTime currentDate,
      required final CalendarViewType viewType}) = _$RouteOptimizedImpl;

  List<CalendarEventEntity> get optimizedRoute;
  List<CalendarEventEntity> get events;
  DateTime get currentDate;
  CalendarViewType get viewType;
  @JsonKey(ignore: true)
  _$$RouteOptimizedImplCopyWith<_$RouteOptimizedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConflictsFoundImplCopyWith<$Res> {
  factory _$$ConflictsFoundImplCopyWith(_$ConflictsFoundImpl value,
          $Res Function(_$ConflictsFoundImpl) then) =
      __$$ConflictsFoundImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<CalendarEventEntity> conflictingEvents,
      List<CalendarEventEntity> events,
      DateTime currentDate,
      CalendarViewType viewType});
}

/// @nodoc
class __$$ConflictsFoundImplCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res, _$ConflictsFoundImpl>
    implements _$$ConflictsFoundImplCopyWith<$Res> {
  __$$ConflictsFoundImplCopyWithImpl(
      _$ConflictsFoundImpl _value, $Res Function(_$ConflictsFoundImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conflictingEvents = null,
    Object? events = null,
    Object? currentDate = null,
    Object? viewType = null,
  }) {
    return _then(_$ConflictsFoundImpl(
      conflictingEvents: null == conflictingEvents
          ? _value._conflictingEvents
          : conflictingEvents // ignore: cast_nullable_to_non_nullable
              as List<CalendarEventEntity>,
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<CalendarEventEntity>,
      currentDate: null == currentDate
          ? _value.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      viewType: null == viewType
          ? _value.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as CalendarViewType,
    ));
  }
}

/// @nodoc

class _$ConflictsFoundImpl implements _ConflictsFound {
  const _$ConflictsFoundImpl(
      {required final List<CalendarEventEntity> conflictingEvents,
      required final List<CalendarEventEntity> events,
      required this.currentDate,
      required this.viewType})
      : _conflictingEvents = conflictingEvents,
        _events = events;

  final List<CalendarEventEntity> _conflictingEvents;
  @override
  List<CalendarEventEntity> get conflictingEvents {
    if (_conflictingEvents is EqualUnmodifiableListView)
      return _conflictingEvents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conflictingEvents);
  }

  final List<CalendarEventEntity> _events;
  @override
  List<CalendarEventEntity> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  final DateTime currentDate;
  @override
  final CalendarViewType viewType;

  @override
  String toString() {
    return 'CalendarState.conflictsFound(conflictingEvents: $conflictingEvents, events: $events, currentDate: $currentDate, viewType: $viewType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConflictsFoundImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConflictsFoundImplCopyWith<_$ConflictsFoundImpl> get copyWith =>
      __$$ConflictsFoundImplCopyWithImpl<_$ConflictsFoundImpl>(
          this, _$identity);

  @override
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
    return conflictsFound(conflictingEvents, events, currentDate, viewType);
  }

  @override
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
    return conflictsFound?.call(
        conflictingEvents, events, currentDate, viewType);
  }

  @override
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
    if (conflictsFound != null) {
      return conflictsFound(conflictingEvents, events, currentDate, viewType);
    }
    return orElse();
  }

  @override
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
    return conflictsFound(this);
  }

  @override
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
    return conflictsFound?.call(this);
  }

  @override
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
    if (conflictsFound != null) {
      return conflictsFound(this);
    }
    return orElse();
  }
}

abstract class _ConflictsFound implements CalendarState {
  const factory _ConflictsFound(
      {required final List<CalendarEventEntity> conflictingEvents,
      required final List<CalendarEventEntity> events,
      required final DateTime currentDate,
      required final CalendarViewType viewType}) = _$ConflictsFoundImpl;

  List<CalendarEventEntity> get conflictingEvents;
  List<CalendarEventEntity> get events;
  DateTime get currentDate;
  CalendarViewType get viewType;
  @JsonKey(ignore: true)
  _$$ConflictsFoundImplCopyWith<_$ConflictsFoundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
