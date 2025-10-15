import 'package:injectable/injectable.dart';
import 'package:hive/hive.dart';
import 'package:fsm/core/constants/hive_boxes.dart';
import 'package:fsm/features/calendar/data/models/calendar_event_hive_model.dart';
import 'package:fsm/features/calendar/domain/entities/calendar_event_entity.dart';

abstract class CalendarLocalDataSource {
  Future<void> cacheEvents(List<CalendarEventHiveModel> events);
  Future<List<CalendarEventHiveModel>> getCachedEvents({
    DateTime? startDate,
    DateTime? endDate,
    CalendarEventType? type,
  });
  Future<CalendarEventHiveModel?> getCachedEventById(int id);
  Future<void> updateEvent(CalendarEventHiveModel event);
  Future<void> deleteEvent(int id);
  Future<void> clearCache();
  Future<List<CalendarEventHiveModel>> getPendingSyncEvents();
  Future<void> markEventForSync(int id, String action);
  Future<void> clearSyncFlag(int id);
  Future<List<CalendarEventHiveModel>> getEventsForDate(DateTime date);
  Future<List<CalendarEventHiveModel>> getEventsForDateRange({
    required DateTime startDate,
    required DateTime endDate,
  });
}

@Injectable(as: CalendarLocalDataSource)
class CalendarLocalDataSourceImpl implements CalendarLocalDataSource {
  CalendarLocalDataSourceImpl();

  Box<CalendarEventHiveModel> get _eventsBox =>
      Hive.box<CalendarEventHiveModel>(HiveBoxes.calendarEvents);

  @override
  Future<void> cacheEvents(List<CalendarEventHiveModel> events) async {
    final box = _eventsBox;
    for (final event in events) {
      await box.put(event.id, event);
    }
  }

  @override
  Future<List<CalendarEventHiveModel>> getCachedEvents({
    DateTime? startDate,
    DateTime? endDate,
    CalendarEventType? type,
  }) async {
    final box = _eventsBox;
    var allEvents = box.values.toList();

    // Filter by date range if provided
    if (startDate != null && endDate != null) {
      allEvents = allEvents.where((event) {
        return event.startTime.isAfter(startDate.subtract(Duration(days: 1))) &&
            event.startTime.isBefore(endDate.add(Duration(days: 1)));
      }).toList();
    }

    // Filter by type if provided
    if (type != null) {
      allEvents = allEvents.where((event) => event.type == type.index).toList();
    }

    // Sort by start time
    allEvents.sort((a, b) => a.startTime.compareTo(b.startTime));

    return allEvents;
  }

  @override
  Future<CalendarEventHiveModel?> getCachedEventById(int id) async {
    final box = _eventsBox;
    return box.get(id);
  }

  @override
  Future<void> updateEvent(CalendarEventHiveModel event) async {
    final box = _eventsBox;
    await box.put(event.id, event);
  }

  @override
  Future<void> deleteEvent(int id) async {
    final box = _eventsBox;
    await box.delete(id);
  }

  @override
  Future<void> clearCache() async {
    final box = _eventsBox;
    await box.clear();
  }

  @override
  Future<List<CalendarEventHiveModel>> getPendingSyncEvents() async {
    final box = _eventsBox;
    return box.values.where((event) => event.isPendingSync).toList();
  }

  @override
  Future<void> markEventForSync(int id, String action) async {
    final box = _eventsBox;
    final event = box.get(id);
    if (event != null) {
      final updatedEvent = event.copyWith(
        isPendingSync: true,
        pendingAction: action,
      );
      await box.put(id, updatedEvent);
    }
  }

  @override
  Future<void> clearSyncFlag(int id) async {
    final box = _eventsBox;
    final event = box.get(id);
    if (event != null) {
      final updatedEvent = event.copyWith(
        isPendingSync: false,
        pendingAction: null,
      );
      await box.put(id, updatedEvent);
    }
  }

  @override
  Future<List<CalendarEventHiveModel>> getEventsForDate(DateTime date) async {
    final box = _eventsBox;
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(Duration(days: 1));

    return box.values.where((event) {
      return event.startTime
              .isAfter(startOfDay.subtract(Duration(seconds: 1))) &&
          event.startTime.isBefore(endOfDay);
    }).toList()
      ..sort((a, b) => a.startTime.compareTo(b.startTime));
  }

  @override
  Future<List<CalendarEventHiveModel>> getEventsForDateRange({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final box = _eventsBox;

    return box.values.where((event) {
      return event.startTime
              .isAfter(startDate.subtract(Duration(seconds: 1))) &&
          event.startTime.isBefore(endDate.add(Duration(seconds: 1)));
    }).toList()
      ..sort((a, b) => a.startTime.compareTo(b.startTime));
  }
}
