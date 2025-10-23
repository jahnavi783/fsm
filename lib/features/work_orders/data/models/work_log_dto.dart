import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm/features/work_orders/domain/entities/work_log_entity.dart';

part 'work_log_dto.freezed.dart';
part 'work_log_dto.g.dart';

@freezed
abstract class WorkLogDto with _$WorkLogDto {
  const factory WorkLogDto({
    required int id,
    @JsonKey(name: 'work_order_id') required int workOrderId,
    required String type,
    required String description,
    required String timestamp,
    String? notes,
    double? latitude,
    double? longitude,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'user_name') String? userName,
  }) = _WorkLogDto;

  factory WorkLogDto.fromJson(Map<String, dynamic> json) =>
      _$WorkLogDtoFromJson(json);
}

extension WorkLogDtoX on WorkLogDto {
  WorkLogEntity toEntity() {
    return WorkLogEntity(
      id: id,
      workOrderId: workOrderId,
      type: _mapType(type),
      description: description,
      timestamp: DateTime.parse(timestamp),
      notes: notes,
      latitude: latitude,
      longitude: longitude,
      userId: userId,
      userName: userName,
    );
  }
  
  WorkLogType _mapType(String type) {
    switch (type.toLowerCase()) {
      case 'started':
        return WorkLogType.started;
      case 'paused':
        return WorkLogType.paused;
      case 'resumed':
        return WorkLogType.resumed;
      case 'completed':
        return WorkLogType.completed;
      case 'rejected':
        return WorkLogType.rejected;
      case 'note':
        return WorkLogType.note;
      case 'part_used':
        return WorkLogType.partUsed;
      case 'image_added':
        return WorkLogType.imageAdded;
      default:
        return WorkLogType.note;
    }
  }
}