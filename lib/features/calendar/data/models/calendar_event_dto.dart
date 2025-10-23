import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm/features/calendar/domain/entities/calendar_event_entity.dart';

part 'calendar_event_dto.freezed.dart';
part 'calendar_event_dto.g.dart';

@freezed
abstract class CalendarEventDto with _$CalendarEventDto {
  const factory CalendarEventDto({
    required int id,
    required String title,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') required String endTime,
    required String type,
    required String description,
    @JsonKey(name: 'work_order_id') int? workOrderId,
    String? location,
    @JsonKey(name: 'is_all_day') @Default(false) bool isAllDay,
    String? color,
    Map<String, dynamic>? metadata,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _CalendarEventDto;

  factory CalendarEventDto.fromJson(Map<String, dynamic> json) =>
      _$CalendarEventDtoFromJson(json);
}

// Extension for mapping to domain entity
extension CalendarEventDtoX on CalendarEventDto {
  CalendarEventEntity toEntity() {
    return CalendarEventEntity(
      id: id,
      title: title,
      startTime: DateTime.parse(startTime),
      endTime: DateTime.parse(endTime),
      type: _mapType(type),
      description: description,
      workOrderId: workOrderId,
      location: location,
      isAllDay: isAllDay,
      color: color,
      metadata: metadata,
    );
  }
  
  CalendarEventType _mapType(String type) {
    switch (type.toLowerCase()) {
      case 'work_order':
        return CalendarEventType.workOrder;
      case 'meeting':
        return CalendarEventType.meeting;
      case 'training':
        return CalendarEventType.training;
      case 'maintenance':
        return CalendarEventType.maintenance;
      case 'break':
      case 'break_time':
        return CalendarEventType.breakTime;
      case 'travel':
        return CalendarEventType.travel;
      default:
        return CalendarEventType.workOrder;
    }
  }
}

// Extension for mapping from domain entity
extension CalendarEventEntityX on CalendarEventEntity {
  CalendarEventDto toDto() {
    return CalendarEventDto(
      id: id,
      title: title,
      startTime: startTime.toIso8601String(),
      endTime: endTime.toIso8601String(),
      type: _mapTypeToString(type),
      description: description,
      workOrderId: workOrderId,
      location: location,
      isAllDay: isAllDay,
      color: color,
      metadata: metadata,
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
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