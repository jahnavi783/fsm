import 'package:hive_ce/hive.dart';

import '../../domain/entities/work_log_entity.dart';

part 'work_log_hive_model.g.dart';

@HiveType(typeId: 6)
class WorkLogHiveModel {
  @HiveField(0)
  final String action; // 'start', 'pause', 'resume'

  @HiveField(1)
  final DateTime timestamp;

  @HiveField(2)
  final String? notes;

  @HiveField(3)
  final double? latitude;

  @HiveField(4)
  final double? longitude;

  @HiveField(5)
  final List<String>? imageUrls;

  WorkLogHiveModel({
    required this.action,
    required this.timestamp,
    this.notes,
    this.latitude,
    this.longitude,
    this.imageUrls,
  });
  // In work_log_hive_model.dart
  WorkLogEntity toEntity({required int workOrderId}) {
    return WorkLogEntity(
      id: timestamp.millisecondsSinceEpoch, // Use timestamp as unique ID
      workOrderId: workOrderId,
      type: _mapActionToType(action),
      timestamp: timestamp,
      notes: notes,
      latitude: latitude,
      longitude: longitude,
      imageUrls: imageUrls,
      description: _getDescription(action),
    );
  }

  WorkLogType _mapActionToType(String action) {
    switch (action) {
      case 'start':
        return WorkLogType.started;
      case 'pause':
        return WorkLogType.paused;
      case 'resume':
        return WorkLogType.resumed;
      case 'complete':
        return WorkLogType.completed;
      case 'reject':
        return WorkLogType.rejected;
      default:
        return WorkLogType.started;
    }
  }

  String _getDescription(String action) {
    switch (action) {
      case 'start':
        return 'Work started';
      case 'pause':
        return 'Work paused';
      case 'resume':
        return 'Work resumed';
      case 'complete':
        return 'Work completed';
      case 'reject':
        return 'Work rejected';
      default:
        return '';
    }
  }
}
