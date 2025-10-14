import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm/features/calendar/domain/entities/calendar_event_entity.dart';

part 'calendar_event.freezed.dart';

@freezed
class CalendarEvent with _$CalendarEvent {
  const factory CalendarEvent.loadEvents({
    required DateTime startDate,
    required DateTime endDate,
    CalendarEventType? type,
    String? searchQuery,
    @Default(false) bool isRefresh,
  }) = _LoadEvents;
  
  const factory CalendarEvent.loadDailySchedule({
    required DateTime date,
    CalendarEventType? type,
    @Default(false) bool isRefresh,
  }) = _LoadDailySchedule;
  
  const factory CalendarEvent.loadWeeklySchedule({
    required DateTime weekStart,
    @Default(false) bool isRefresh,
  }) = _LoadWeeklySchedule;
  
  const factory CalendarEvent.loadMonthlySchedule({
    required DateTime month,
    @Default(false) bool isRefresh,
  }) = _LoadMonthlySchedule;
  
  const factory CalendarEvent.optimizeRoute({
    required DateTime date,
    required double currentLatitude,
    required double currentLongitude,
  }) = _OptimizeRoute;
  
  const factory CalendarEvent.navigateToDate(DateTime date) = _NavigateToDate;
  
  const factory CalendarEvent.changeView(CalendarViewType viewType) = _ChangeView;
  
  const factory CalendarEvent.filterByType(CalendarEventType? type) = _FilterByType;
  
  const factory CalendarEvent.searchEvents(String query) = _SearchEvents;
  
  const factory CalendarEvent.clearFilters() = _ClearFilters;
  
  const factory CalendarEvent.refreshEvents() = _RefreshEvents;
  
  const factory CalendarEvent.createEvent(CalendarEventEntity event) = _CreateEvent;
  
  const factory CalendarEvent.updateEvent(CalendarEventEntity event) = _UpdateEvent;
  
  const factory CalendarEvent.deleteEvent(int eventId) = _DeleteEvent;
  
  const factory CalendarEvent.syncPendingChanges() = _SyncPendingChanges;
  
  const factory CalendarEvent.checkConflicts({
    required DateTime startTime,
    required DateTime endTime,
    int? excludeEventId,
  }) = _CheckConflicts;
}

enum CalendarViewType {
  day,
  week,
  month;
  
  String get displayName {
    switch (this) {
      case CalendarViewType.day:
        return 'Day';
      case CalendarViewType.week:
        return 'Week';
      case CalendarViewType.month:
        return 'Month';
    }
  }
}