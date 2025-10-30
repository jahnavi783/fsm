import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_event_entity.freezed.dart';

@freezed
abstract class CalendarEventEntity with _$CalendarEventEntity {
  const CalendarEventEntity._();
  
  const factory CalendarEventEntity({
    required int id,
    required String title,
    required DateTime startTime,
    required DateTime endTime,
    required CalendarEventType type,
    required String description,
    int? workOrderId,
    String? location,
    @Default(false) bool isAllDay,
    String? color,
    Map<String, dynamic>? metadata,
  }) = _CalendarEventEntity;
  
  // Business logic methods
  Duration get duration => endTime.difference(startTime);
  
  bool get isToday {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final eventDate = DateTime(startTime.year, startTime.month, startTime.day);
    return eventDate == today;
  }
  
  bool get isPast => endTime.isBefore(DateTime.now());
  bool get isFuture => startTime.isAfter(DateTime.now());
  bool get isOngoing => DateTime.now().isAfter(startTime) && DateTime.now().isBefore(endTime);
  
  bool conflictsWith(CalendarEventEntity other) {
    return startTime.isBefore(other.endTime) && endTime.isAfter(other.startTime);
  }
  
  String get typeDisplayName => type.displayName;
  
  String get durationDisplayName {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    
    if (hours > 0 && minutes > 0) {
      return '${hours}h ${minutes}m';
    } else if (hours > 0) {
      return '${hours}h';
    } else {
      return '${minutes}m';
    }
  }
}

enum CalendarEventType {
  workOrder,
  meeting,
  training,
  maintenance,
  breakTime,
  travel;
  
  String get displayName {
    switch (this) {
      case CalendarEventType.workOrder:
        return 'Work Order';
      case CalendarEventType.meeting:
        return 'Meeting';
      case CalendarEventType.training:
        return 'Training';
      case CalendarEventType.maintenance:
        return 'Maintenance';
      case CalendarEventType.breakTime:
        return 'Break';
      case CalendarEventType.travel:
        return 'Travel';
    }
  }
  
  String get color {
    switch (this) {
      case CalendarEventType.workOrder:
        return '#2196F3'; // Blue
      case CalendarEventType.meeting:
        return '#4CAF50'; // Green
      case CalendarEventType.training:
        return '#FF9800'; // Orange
      case CalendarEventType.maintenance:
        return '#9C27B0'; // Purple
      case CalendarEventType.breakTime:
        return '#607D8B'; // Blue Grey
      case CalendarEventType.travel:
        return '#795548'; // Brown
    }
  }
}