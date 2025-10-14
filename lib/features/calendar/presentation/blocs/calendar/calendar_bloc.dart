import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:fsm/core/network/network_info.dart';
import 'package:fsm/features/calendar/domain/entities/calendar_event_entity.dart';
import 'package:fsm/features/calendar/domain/usecases/get_calendar_events_usecase.dart';
import 'package:fsm/features/calendar/domain/usecases/get_daily_schedule_usecase.dart';
import 'package:fsm/features/calendar/domain/usecases/optimize_route_usecase.dart';
import 'package:fsm/features/calendar/domain/repositories/i_calendar_repository.dart';
import 'calendar_event.dart';
import 'calendar_state.dart';

@injectable
class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  final GetCalendarEventsUseCase _getCalendarEventsUseCase;
  final GetDailyScheduleUseCase _getDailyScheduleUseCase;
  final OptimizeRouteUseCase _optimizeRouteUseCase;
  final ICalendarRepository _repository;
  final NetworkInfo _networkInfo;

  CalendarBloc(
    this._getCalendarEventsUseCase,
    this._getDailyScheduleUseCase,
    this._optimizeRouteUseCase,
    this._repository,
    this._networkInfo,
  ) : super(const CalendarState.initial()) {
    on<CalendarEvent>(_onCalendarEvent);
  }

  Future<void> _onCalendarEvent(
    CalendarEvent event,
    Emitter<CalendarState> emit,
  ) async {
    await event.when(
      loadEvents: (startDate, endDate, type, searchQuery, isRefresh) =>
          _loadEvents(startDate, endDate, type, searchQuery, isRefresh, emit),
      loadDailySchedule: (date, type, isRefresh) =>
          _loadDailySchedule(date, type, isRefresh, emit),
      loadWeeklySchedule: (weekStart, isRefresh) =>
          _loadWeeklySchedule(weekStart, isRefresh, emit),
      loadMonthlySchedule: (month, isRefresh) =>
          _loadMonthlySchedule(month, isRefresh, emit),
      optimizeRoute: (date, latitude, longitude) =>
          _optimizeRoute(date, latitude, longitude, emit),
      navigateToDate: (date) => _navigateToDate(date, emit),
      changeView: (viewType) => _changeView(viewType, emit),
      filterByType: (type) => _filterByType(type, emit),
      searchEvents: (query) => _searchEvents(query, emit),
      clearFilters: () => _clearFilters(emit),
      refreshEvents: () => _refreshEvents(emit),
      createEvent: (event) => _createEvent(event, emit),
      updateEvent: (event) => _updateEvent(event, emit),
      deleteEvent: (eventId) => _deleteEvent(eventId, emit),
      syncPendingChanges: () => _syncPendingChanges(emit),
      checkConflicts: (startTime, endTime, excludeEventId) =>
          _checkConflicts(startTime, endTime, excludeEventId, emit),
    );
  }

  Future<void> _loadEvents(
    DateTime startDate,
    DateTime endDate,
    CalendarEventType? type,
    String? searchQuery,
    bool isRefresh,
    Emitter<CalendarState> emit,
  ) async {
    if (isRefresh) {
      emit(const CalendarState.loading());
    } else {
      state.maybeWhen(
        loaded: (_, __, ___, ____, _____, ______, _______, ________, _________) {},
        orElse: () => emit(const CalendarState.loading()),
      );
    }

    final isConnected = await _networkInfo.isConnected;
    
    final result = await _getCalendarEventsUseCase(GetCalendarEventsParams(
      startDate: startDate,
      endDate: endDate,
      type: type,
      searchQuery: searchQuery,
    ));

    result.fold(
      (failure) {
        final currentEvents = state.maybeWhen(
          loaded: (events, _, __, ___, ____, _____, ______, _______, ________) => events,
          orElse: () => <CalendarEventEntity>[],
        );
        emit(CalendarState.error(
          failure: failure,
          events: currentEvents,
          currentDate: startDate,
          viewType: CalendarViewType.month,
          isOffline: !isConnected,
        ));
      },
      (events) async {
        final hasPendingSync = await _checkPendingSync();
        emit(CalendarState.loaded(
          events: events,
          currentDate: startDate,
          viewType: CalendarViewType.month,
          typeFilter: type,
          searchQuery: searchQuery,
          isOffline: !isConnected,
          hasPendingSync: hasPendingSync,
        ));
      },
    );
  }

  Future<void> _loadDailySchedule(
    DateTime date,
    CalendarEventType? type,
    bool isRefresh,
    Emitter<CalendarState> emit,
  ) async {
    if (isRefresh) {
      emit(const CalendarState.loading());
    }

    final isConnected = await _networkInfo.isConnected;
    
    final result = await _getDailyScheduleUseCase(GetDailyScheduleParams(
      date: date,
      type: type,
    ));

    result.fold(
      (failure) {
        final currentEvents = state.maybeWhen(
          loaded: (events, _, __, ___, ____, _____, ______, _______, ________) => events,
          orElse: () => <CalendarEventEntity>[],
        );
        emit(CalendarState.error(
          failure: failure,
          events: currentEvents,
          currentDate: date,
          viewType: CalendarViewType.day,
          isOffline: !isConnected,
        ));
      },
      (events) async {
        final hasPendingSync = await _checkPendingSync();
        emit(CalendarState.loaded(
          events: events,
          currentDate: date,
          viewType: CalendarViewType.day,
          typeFilter: type,
          isOffline: !isConnected,
          hasPendingSync: hasPendingSync,
        ));
      },
    );
  }

  Future<void> _loadWeeklySchedule(
    DateTime weekStart,
    bool isRefresh,
    Emitter<CalendarState> emit,
  ) async {
    if (isRefresh) {
      emit(const CalendarState.loading());
    }

    final isConnected = await _networkInfo.isConnected;
    
    final result = await _repository.getWeeklySchedule(weekStart: weekStart);

    result.fold(
      (failure) {
        final currentEvents = state.maybeWhen(
          loaded: (events, _, __, ___, ____, _____, ______, _______, ________) => events,
          orElse: () => <CalendarEventEntity>[],
        );
        emit(CalendarState.error(
          failure: failure,
          events: currentEvents,
          currentDate: weekStart,
          viewType: CalendarViewType.week,
          isOffline: !isConnected,
        ));
      },
      (events) async {
        final hasPendingSync = await _checkPendingSync();
        emit(CalendarState.loaded(
          events: events,
          currentDate: weekStart,
          viewType: CalendarViewType.week,
          isOffline: !isConnected,
          hasPendingSync: hasPendingSync,
        ));
      },
    );
  }

  Future<void> _loadMonthlySchedule(
    DateTime month,
    bool isRefresh,
    Emitter<CalendarState> emit,
  ) async {
    if (isRefresh) {
      emit(const CalendarState.loading());
    }

    final isConnected = await _networkInfo.isConnected;
    
    final result = await _repository.getMonthlySchedule(month: month);

    result.fold(
      (failure) {
        final currentEvents = state.maybeWhen(
          loaded: (events, _, __, ___, ____, _____, ______, _______, ________) => events,
          orElse: () => <CalendarEventEntity>[],
        );
        emit(CalendarState.error(
          failure: failure,
          events: currentEvents,
          currentDate: month,
          viewType: CalendarViewType.month,
          isOffline: !isConnected,
        ));
      },
      (events) async {
        final hasPendingSync = await _checkPendingSync();
        emit(CalendarState.loaded(
          events: events,
          currentDate: month,
          viewType: CalendarViewType.month,
          isOffline: !isConnected,
          hasPendingSync: hasPendingSync,
        ));
      },
    );
  }

  Future<void> _optimizeRoute(
    DateTime date,
    double latitude,
    double longitude,
    Emitter<CalendarState> emit,
  ) async {
    final currentState = state;
    final currentEvents = currentState.maybeWhen(
      loaded: (events, _, __, ___, ____, _____, ______, _______, ________) => events,
      orElse: () => <CalendarEventEntity>[],
    );

    final result = await _optimizeRouteUseCase(OptimizeRouteParams(
      date: date,
      currentLatitude: latitude,
      currentLongitude: longitude,
    ));

    result.fold(
      (failure) {
        emit(CalendarState.error(
          failure: failure,
          events: currentEvents,
          currentDate: date,
          viewType: CalendarViewType.day,
        ));
      },
      (optimizedRoute) {
        emit(CalendarState.routeOptimized(
          optimizedRoute: optimizedRoute,
          events: currentEvents,
          currentDate: date,
          viewType: CalendarViewType.day,
        ));
      },
    );
  }

  Future<void> _navigateToDate(DateTime date, Emitter<CalendarState> emit) async {
    final currentState = state;
    final viewType = currentState.maybeWhen(
      loaded: (_, __, viewType, ___, ____, _____, ______, _______, ________) => viewType,
      orElse: () => CalendarViewType.month,
    );

    switch (viewType) {
      case CalendarViewType.day:
        add(CalendarEvent.loadDailySchedule(date: date, isRefresh: true));
        break;
      case CalendarViewType.week:
        final weekStart = _getWeekStart(date);
        add(CalendarEvent.loadWeeklySchedule(weekStart: weekStart, isRefresh: true));
        break;
      case CalendarViewType.month:
        add(CalendarEvent.loadMonthlySchedule(month: date, isRefresh: true));
        break;
    }
  }

  Future<void> _changeView(CalendarViewType viewType, Emitter<CalendarState> emit) async {
    final currentState = state;
    final currentDate = currentState.maybeWhen(
      loaded: (_, currentDate, __, ___, ____, _____, ______, _______, ________) => currentDate,
      orElse: () => DateTime.now(),
    );

    switch (viewType) {
      case CalendarViewType.day:
        add(CalendarEvent.loadDailySchedule(date: currentDate, isRefresh: true));
        break;
      case CalendarViewType.week:
        final weekStart = _getWeekStart(currentDate);
        add(CalendarEvent.loadWeeklySchedule(weekStart: weekStart, isRefresh: true));
        break;
      case CalendarViewType.month:
        add(CalendarEvent.loadMonthlySchedule(month: currentDate, isRefresh: true));
        break;
    }
  }

  Future<void> _filterByType(CalendarEventType? type, Emitter<CalendarState> emit) async {
    final currentState = state;
    final currentDate = currentState.maybeWhen(
      loaded: (_, currentDate, __, ___, ____, _____, ______, _______, ________) => currentDate,
      orElse: () => DateTime.now(),
    );
    final viewType = currentState.maybeWhen(
      loaded: (_, __, viewType, ___, ____, _____, ______, _______, ________) => viewType,
      orElse: () => CalendarViewType.month,
    );

    switch (viewType) {
      case CalendarViewType.day:
        add(CalendarEvent.loadDailySchedule(date: currentDate, type: type, isRefresh: true));
        break;
      case CalendarViewType.week:
        add(CalendarEvent.loadWeeklySchedule(weekStart: currentDate, isRefresh: true));
        break;
      case CalendarViewType.month:
        add(CalendarEvent.loadMonthlySchedule(month: currentDate, isRefresh: true));
        break;
    }
  }

  Future<void> _searchEvents(String query, Emitter<CalendarState> emit) async {
    final currentState = state;
    final currentDate = currentState.maybeWhen(
      loaded: (_, currentDate, __, ___, ____, _____, ______, _______, ________) => currentDate,
      orElse: () => DateTime.now(),
    );
    final typeFilter = currentState.maybeWhen(
      loaded: (_, __, ___, typeFilter, ____, _____, ______, _______, ________) => typeFilter,
      orElse: () => null,
    );

    final endDate = currentDate.add(Duration(days: 30)); // Search in next 30 days
    add(CalendarEvent.loadEvents(
      startDate: currentDate,
      endDate: endDate,
      type: typeFilter,
      searchQuery: query.isEmpty ? null : query,
      isRefresh: true,
    ));
  }

  Future<void> _clearFilters(Emitter<CalendarState> emit) async {
    final currentState = state;
    final currentDate = currentState.maybeWhen(
      loaded: (_, currentDate, __, ___, ____, _____, ______, _______, ________) => currentDate,
      orElse: () => DateTime.now(),
    );
    final viewType = currentState.maybeWhen(
      loaded: (_, __, viewType, ___, ____, _____, ______, _______, ________) => viewType,
      orElse: () => CalendarViewType.month,
    );

    switch (viewType) {
      case CalendarViewType.day:
        add(CalendarEvent.loadDailySchedule(date: currentDate, isRefresh: true));
        break;
      case CalendarViewType.week:
        add(CalendarEvent.loadWeeklySchedule(weekStart: currentDate, isRefresh: true));
        break;
      case CalendarViewType.month:
        add(CalendarEvent.loadMonthlySchedule(month: currentDate, isRefresh: true));
        break;
    }
  }

  Future<void> _refreshEvents(Emitter<CalendarState> emit) async {
    final currentState = state;
    final currentDate = currentState.maybeWhen(
      loaded: (_, currentDate, __, ___, ____, _____, ______, _______, ________) => currentDate,
      orElse: () => DateTime.now(),
    );
    final viewType = currentState.maybeWhen(
      loaded: (_, __, viewType, ___, ____, _____, ______, _______, ________) => viewType,
      orElse: () => CalendarViewType.month,
    );

    switch (viewType) {
      case CalendarViewType.day:
        add(CalendarEvent.loadDailySchedule(date: currentDate, isRefresh: true));
        break;
      case CalendarViewType.week:
        add(CalendarEvent.loadWeeklySchedule(weekStart: currentDate, isRefresh: true));
        break;
      case CalendarViewType.month:
        add(CalendarEvent.loadMonthlySchedule(month: currentDate, isRefresh: true));
        break;
    }
  }

  Future<void> _createEvent(CalendarEventEntity event, Emitter<CalendarState> emit) async {
    final currentState = state;
    final currentEvents = currentState.maybeWhen(
      loaded: (events, _, __, ___, ____, _____, ______, _______, ________) => events,
      orElse: () => <CalendarEventEntity>[],
    );

    final result = await _repository.createEvent(event: event);

    result.fold(
      (failure) {
        emit(CalendarState.error(
          failure: failure,
          events: currentEvents,
          currentDate: event.startTime,
          viewType: CalendarViewType.day,
        ));
      },
      (createdEvent) {
        final updatedEvents = [...currentEvents, createdEvent];
        emit(CalendarState.eventCreated(
          event: createdEvent,
          events: updatedEvents,
          currentDate: createdEvent.startTime,
          viewType: CalendarViewType.day,
        ));
      },
    );
  }

  Future<void> _updateEvent(CalendarEventEntity event, Emitter<CalendarState> emit) async {
    final currentState = state;
    final currentEvents = currentState.maybeWhen(
      loaded: (events, _, __, ___, ____, _____, ______, _______, ________) => events,
      orElse: () => <CalendarEventEntity>[],
    );

    final result = await _repository.updateEvent(event: event);

    result.fold(
      (failure) {
        emit(CalendarState.error(
          failure: failure,
          events: currentEvents,
          currentDate: event.startTime,
          viewType: CalendarViewType.day,
        ));
      },
      (updatedEvent) {
        final updatedEvents = currentEvents
            .map((e) => e.id == updatedEvent.id ? updatedEvent : e)
            .toList();
        emit(CalendarState.eventUpdated(
          event: updatedEvent,
          events: updatedEvents,
          currentDate: updatedEvent.startTime,
          viewType: CalendarViewType.day,
        ));
      },
    );
  }

  Future<void> _deleteEvent(int eventId, Emitter<CalendarState> emit) async {
    final currentState = state;
    final currentEvents = currentState.maybeWhen(
      loaded: (events, _, __, ___, ____, _____, ______, _______, ________) => events,
      orElse: () => <CalendarEventEntity>[],
    );

    final result = await _repository.deleteEvent(eventId: eventId);

    result.fold(
      (failure) {
        emit(CalendarState.error(
          failure: failure,
          events: currentEvents,
          currentDate: DateTime.now(),
          viewType: CalendarViewType.day,
        ));
      },
      (_) {
        final updatedEvents = currentEvents
            .where((e) => e.id != eventId)
            .toList();
        emit(CalendarState.eventDeleted(
          eventId: eventId,
          events: updatedEvents,
          currentDate: DateTime.now(),
          viewType: CalendarViewType.day,
        ));
      },
    );
  }

  Future<void> _syncPendingChanges(Emitter<CalendarState> emit) async {
    final currentState = state;
    final currentEvents = currentState.maybeWhen(
      loaded: (events, _, __, ___, ____, _____, ______, _______, ________) => events,
      orElse: () => <CalendarEventEntity>[],
    );
    final currentDate = currentState.maybeWhen(
      loaded: (_, currentDate, __, ___, ____, _____, ______, _______, ________) => currentDate,
      orElse: () => DateTime.now(),
    );
    final viewType = currentState.maybeWhen(
      loaded: (_, __, viewType, ___, ____, _____, ______, _______, ________) => viewType,
      orElse: () => CalendarViewType.month,
    );

    emit(CalendarState.syncing(
      events: currentEvents,
      currentDate: currentDate,
      viewType: viewType,
    ));

    final result = await _repository.syncPendingChanges();
    
    result.fold(
      (failure) {
        emit(CalendarState.error(
          failure: failure,
          events: currentEvents,
          currentDate: currentDate,
          viewType: viewType,
        ));
      },
      (syncedEvents) {
        // Refresh the events list after sync
        add(const CalendarEvent.refreshEvents());
      },
    );
  }

  Future<void> _checkConflicts(
    DateTime startTime,
    DateTime endTime,
    int? excludeEventId,
    Emitter<CalendarState> emit,
  ) async {
    final currentState = state;
    final currentEvents = currentState.maybeWhen(
      loaded: (events, _, __, ___, ____, _____, ______, _______, ________) => events,
      orElse: () => <CalendarEventEntity>[],
    );

    final result = await _repository.getConflictingEvents(
      startTime: startTime,
      endTime: endTime,
      excludeEventId: excludeEventId,
    );

    result.fold(
      (failure) {
        emit(CalendarState.error(
          failure: failure,
          events: currentEvents,
          currentDate: startTime,
          viewType: CalendarViewType.day,
        ));
      },
      (conflictingEvents) {
        emit(CalendarState.conflictsFound(
          conflictingEvents: conflictingEvents,
          events: currentEvents,
          currentDate: startTime,
          viewType: CalendarViewType.day,
        ));
      },
    );
  }

  Future<bool> _checkPendingSync() async {
    final result = await _repository.getCachedEvents();
    return result.fold(
      (failure) => false,
      (events) => events.any((event) => 
        // This would check the isPendingSync flag from Hive model
        // For now, return false until fully implemented
        false
      ),
    );
  }

  DateTime _getWeekStart(DateTime date) {
    final weekday = date.weekday;
    return date.subtract(Duration(days: weekday - 1));
  }
}