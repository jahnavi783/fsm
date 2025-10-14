import 'package:either_dart/either.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/calendar/domain/entities/calendar_event_entity.dart';

abstract class ICalendarRepository {
  /// Get calendar events for a specific date range
  Future<Either<Failure, List<CalendarEventEntity>>> getCalendarEvents({
    required DateTime startDate,
    required DateTime endDate,
    CalendarEventType? type,
    String? searchQuery,
  });

  /// Get events for a specific day
  Future<Either<Failure, List<CalendarEventEntity>>> getDailySchedule({
    required DateTime date,
    CalendarEventType? type,
  });

  /// Get events for a specific week
  Future<Either<Failure, List<CalendarEventEntity>>> getWeeklySchedule({
    required DateTime weekStart,
  });

  /// Get events for a specific month
  Future<Either<Failure, List<CalendarEventEntity>>> getMonthlySchedule({
    required DateTime month,
  });

  /// Get optimized route for work orders on a specific day
  Future<Either<Failure, List<CalendarEventEntity>>> getOptimizedDailyRoute({
    required DateTime date,
    required double currentLatitude,
    required double currentLongitude,
  });

  /// Create a new calendar event
  Future<Either<Failure, CalendarEventEntity>> createEvent({
    required CalendarEventEntity event,
  });

  /// Update an existing calendar event
  Future<Either<Failure, CalendarEventEntity>> updateEvent({
    required CalendarEventEntity event,
  });

  /// Delete a calendar event
  Future<Either<Failure, void>> deleteEvent({
    required int eventId,
  });

  /// Sync pending calendar changes
  Future<Either<Failure, List<CalendarEventEntity>>> syncPendingChanges();

  /// Cache calendar events for offline access
  Future<Either<Failure, void>> cacheEvents(
    List<CalendarEventEntity> events,
  );

  /// Get cached calendar events
  Future<Either<Failure, List<CalendarEventEntity>>> getCachedEvents({
    DateTime? startDate,
    DateTime? endDate,
    CalendarEventType? type,
  });

  /// Check for scheduling conflicts
  Future<Either<Failure, List<CalendarEventEntity>>> getConflictingEvents({
    required DateTime startTime,
    required DateTime endTime,
    int? excludeEventId,
  });
}