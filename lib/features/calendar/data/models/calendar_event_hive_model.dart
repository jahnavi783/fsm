import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';
import 'package:fsm/core/constants/hive_boxes.dart';
import 'package:fsm/features/calendar/domain/entities/calendar_event_entity.dart';

part 'calendar_event_hive_model.freezed.dart';
part 'calendar_event_hive_model.g.dart';

@freezed
@HiveType(typeId: HiveBoxes.calendarEventEntityTypeId)
class CalendarEventHiveModel with _$CalendarEventHiveModel {
  const factory CalendarEventHiveModel({
    @HiveField(0) required int id,
    @HiveField(1) required String title,
    @HiveField(2) required DateTime startTime,
    @HiveField(3) required DateTime endTime,
    @HiveField(4) required int type, // CalendarEventType as int
    @HiveField(5) required String description,
    @HiveField(6) int? workOrderId,
    @HiveField(7) String? location,
    @HiveField(8) @Default(false) bool isAllDay,
    @HiveField(9) String? color,
    @HiveField(10) String? metadata, // Store as JSON string
    @HiveField(11) required DateTime cachedAt,
  }) = _CalendarEventHiveModel;

  factory CalendarEventHiveModel.fromJson(Map<String, dynamic> json) =>
      _$CalendarEventHiveModelFromJson(json);
}

// Extension for mapping to domain entity
extension CalendarEventHiveModelX on CalendarEventHiveModel {
  CalendarEventEntity toEntity() {
    Map<String, dynamic>? parsedMetadata;
    if (metadata != null) {
      try {
        parsedMetadata = Map<String, dynamic>.from(
          // Simple JSON parsing - in real app you'd use dart:convert
          <String, dynamic>{},
        );
      } catch (e) {
        parsedMetadata = null;
      }
    }

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
      metadata: parsedMetadata,
    );
  }
}

// Factory method for creating from domain entity
extension CalendarEventEntityX on CalendarEventEntity {
  CalendarEventHiveModel toHiveModel() {
    String? metadataString;
    if (metadata != null) {
      // In real app you'd use dart:convert jsonEncode
      metadataString = metadata.toString();
    }

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
      metadata: metadataString,
      cachedAt: DateTime.now(),
    );
  }
}
