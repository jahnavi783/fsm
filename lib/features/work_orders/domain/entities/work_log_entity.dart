import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_log_entity.freezed.dart';

@freezed
abstract class WorkLogEntity with _$WorkLogEntity {
  const factory WorkLogEntity({
    required int id,
    required int workOrderId,
    required WorkLogType type,
    required String description,
    required DateTime timestamp,
    String? notes,
    double? latitude,
    double? longitude,
    String? userId,
    String? userName,
  }) = _WorkLogEntity;
}

enum WorkLogType {
  started,
  paused,
  resumed,
  completed,
  rejected,
  note,
  partUsed,
  imageAdded,
}