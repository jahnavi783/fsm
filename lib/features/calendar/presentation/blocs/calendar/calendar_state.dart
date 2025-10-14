import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/calendar/domain/entities/calendar_event_entity.dart';
import 'package:fsm/features/calendar/presentation/blocs/calendar/calendar_event.dart';

part 'calendar_state.freezed.dart';

@freezed
class CalendarState with _$CalendarState {
  const factory CalendarState.initial() = _Initial;
  
  const factory CalendarState.loading() = _Loading;
  
  const factory CalendarState.loaded({
    required List<CalendarEventEntity> events,
    required DateTime currentDate,
    required CalendarViewType viewType,
    CalendarEventType? typeFilter,
    String? searchQuery,
    @Default(false) bool isOffline,
    @Default(false) bool hasPendingSync,
    List<CalendarEventEntity>? optimizedRoute,
    List<CalendarEventEntity>? conflictingEvents,
  }) = _Loaded;
  
  const factory CalendarState.error({
    required Failure failure,
    @Default([]) List<CalendarEventEntity> events,
    required DateTime currentDate,
    required CalendarViewType viewType,
    @Default(false) bool isOffline,
  }) = _Error;
  
  const factory CalendarState.syncing({
    required List<CalendarEventEntity> events,
    required DateTime currentDate,
    required CalendarViewType viewType,
  }) = _Syncing;
  
  const factory CalendarState.eventCreated({
    required CalendarEventEntity event,
    required List<CalendarEventEntity> events,
    required DateTime currentDate,
    required CalendarViewType viewType,
  }) = _EventCreated;
  
  const factory CalendarState.eventUpdated({
    required CalendarEventEntity event,
    required List<CalendarEventEntity> events,
    required DateTime currentDate,
    required CalendarViewType viewType,
  }) = _EventUpdated;
  
  const factory CalendarState.eventDeleted({
    required int eventId,
    required List<CalendarEventEntity> events,
    required DateTime currentDate,
    required CalendarViewType viewType,
  }) = _EventDeleted;
  
  const factory CalendarState.routeOptimized({
    required List<CalendarEventEntity> optimizedRoute,
    required List<CalendarEventEntity> events,
    required DateTime currentDate,
    required CalendarViewType viewType,
  }) = _RouteOptimized;
  
  const factory CalendarState.conflictsFound({
    required List<CalendarEventEntity> conflictingEvents,
    required List<CalendarEventEntity> events,
    required DateTime currentDate,
    required CalendarViewType viewType,
  }) = _ConflictsFound;
}