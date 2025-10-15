import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:fsm/features/calendar/domain/entities/calendar_event_entity.dart';

part 'calendar_event_hive_model.freezed.dart';
part 'calendar_event_hive_model.g.dart';

@freezed
@HiveType(typeId: 9)
class CalendarEventHiveModel with _$CalendarEventHiveModel {
  const factory CalendarEventHiveModel({
    @HiveField(0) required int id,
    @HiveField(1) required String title,
    @HiveField(2) required DateTime startTime,
    @HiveField(3) required DateTime endTime,
    @HiveField(4) required int type, // Store as int for enum
    @HiveField(5) required String description,
    @HiveField(6) int? workOrderId,
    @HiveField(7) String? location,
    @HiveField(8) @Default(false) bool isAllDay,
    @HiveField(9) String? color,
    @HiveField(10) Map<String, dynamic>? metadata,
    @HiveField(11) required DateTime cachedAt,
    @HiveField(12) @Default(false) bool isPendingSync,
    @HiveField(13) String? pendingAction,
  }) = _CalendarEventHiveModel;

  factory CalendarEventHiveModel.fromJson(Map<String, dynamic> json) =>
      _$CalendarEventHiveModelFromJson(json);
}

// Extension for mapping to domain entity
extension CalendarEventHiveModelX on CalendarEventHiveModel {
  CalendarEventEntity toEntity() {
    return CalendarEventEntity(
      id: id,
      title: title,
      startTime: startTime,
      endTime: endTime,
      type: CalendarEventType.values[type],
      description: description,
      workOrderId: workOrderId,
      location: location,
      isAllDay: isAllDay,
      color: color,
      metadata: metadata,
    );
  }
}

// Extension for mapping from domain entity
extension CalendarEventEntityToHiveX on CalendarEventEntity {
  CalendarEventHiveModel toHiveModel() {
    return CalendarEventHiveModel(
      id: id,
      title: title,
      startTime: startTime,
      endTime: endTime,
      type: type.index,
      description: description,
      workOrderId: workOrderId,
      location: location,
      isAllDay: isAllDay,
      color: color,
      metadata: metadata,
      cachedAt: DateTime.now(),
    );
  }
}
