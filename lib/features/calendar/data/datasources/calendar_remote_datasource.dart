import 'package:injectable/injectable.dart';
import 'package:fsm/features/calendar/data/api/calendar_api_client.dart';
import 'package:fsm/features/calendar/data/models/calendar_event_dto.dart';
import 'package:fsm/features/calendar/domain/entities/calendar_event_entity.dart';

abstract class CalendarRemoteDataSource {
  Future<List<CalendarEventDto>> getCalendarEvents({
    required DateTime startDate,
    required DateTime endDate,
    CalendarEventType? type,
    String? searchQuery,
  });

  Future<List<CalendarEventDto>> getDailySchedule({
    required DateTime date,
    CalendarEventType? type,
  });

  Future<List<CalendarEventDto>> getWeeklySchedule({
    required DateTime weekStart,
  });

  Future<List<CalendarEventDto>> getMonthlySchedule({
    required DateTime month,
  });

  Future<List<CalendarEventDto>> getOptimizedDailyRoute({
    required DateTime date,
    required double currentLatitude,
    required double currentLongitude,
  });

  Future<CalendarEventDto> createEvent({
    required CalendarEventEntity event,
  });

  Future<CalendarEventDto> updateEvent({
    required CalendarEventEntity event,
  });

  Future<void> deleteEvent({
    required int eventId,
  });

  Future<List<CalendarEventDto>> getConflictingEvents({
    required DateTime startTime,
    required DateTime endTime,
    int? excludeEventId,
  });
}

@Injectable(as: CalendarRemoteDataSource)
class CalendarRemoteDataSourceImpl implements CalendarRemoteDataSource {
  final CalendarApiClient _apiClient;

  CalendarRemoteDataSourceImpl(this._apiClient);

  @override
  Future<List<CalendarEventDto>> getCalendarEvents({
    required DateTime startDate,
    required DateTime endDate,
    CalendarEventType? type,
    String? searchQuery,
  }) async {
    return await _apiClient.getCalendarEvents(
      startDate: startDate.toIso8601String(),
      endDate: endDate.toIso8601String(),
      type: type != null ? _mapTypeToString(type) : null,
      searchQuery: searchQuery,
    );
  }

  @override
  Future<List<CalendarEventDto>> getDailySchedule({
    required DateTime date,
    CalendarEventType? type,
  }) async {
    return await _apiClient.getDailySchedule(
      date: date.toIso8601String(),
      type: type != null ? _mapTypeToString(type) : null,
    );
  }

  @override
  Future<List<CalendarEventDto>> getWeeklySchedule({
    required DateTime weekStart,
  }) async {
    return await _apiClient.getWeeklySchedule(
      weekStart: weekStart.toIso8601String(),
    );
  }

  @override
  Future<List<CalendarEventDto>> getMonthlySchedule({
    required DateTime month,
  }) async {
    return await _apiClient.getMonthlySchedule(
      month: month.toIso8601String(),
    );
  }

  @override
  Future<List<CalendarEventDto>> getOptimizedDailyRoute({
    required DateTime date,
    required double currentLatitude,
    required double currentLongitude,
  }) async {
    return await _apiClient.getOptimizedDailyRoute(
      date: date.toIso8601String(),
      latitude: currentLatitude,
      longitude: currentLongitude,
    );
  }

  @override
  Future<CalendarEventDto> createEvent({
    required CalendarEventEntity event,
  }) async {
    return await _apiClient.createEvent(
      event: event.toDto(),
    );
  }

  @override
  Future<CalendarEventDto> updateEvent({
    required CalendarEventEntity event,
  }) async {
    return await _apiClient.updateEvent(
      id: event.id,
      event: event.toDto(),
    );
  }

  @override
  Future<void> deleteEvent({
    required int eventId,
  }) async {
    return await _apiClient.deleteEvent(id: eventId);
  }

  @override
  Future<List<CalendarEventDto>> getConflictingEvents({
    required DateTime startTime,
    required DateTime endTime,
    int? excludeEventId,
  }) async {
    return await _apiClient.getConflictingEvents(
      startTime: startTime.toIso8601String(),
      endTime: endTime.toIso8601String(),
      excludeEventId: excludeEventId,
    );
  }

  String _mapTypeToString(CalendarEventType type) {
    switch (type) {
      case CalendarEventType.workOrder:
        return 'work_order';
      case CalendarEventType.meeting:
        return 'meeting';
      case CalendarEventType.training:
        return 'training';
      case CalendarEventType.maintenance:
        return 'maintenance';
      case CalendarEventType.breakTime:
        return 'break_time';
      case CalendarEventType.travel:
        return 'travel';
    }
  }
}