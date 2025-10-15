// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_event_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CalendarEventHiveModelAdapter
    extends TypeAdapter<CalendarEventHiveModel> {
  @override
  final int typeId = 9;

  @override
  CalendarEventHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CalendarEventHiveModel(
      id: fields[0] as int,
      title: fields[1] as String,
      startTime: fields[2] as DateTime,
      endTime: fields[3] as DateTime,
      type: fields[4] as int,
      description: fields[5] as String,
      workOrderId: fields[6] as int?,
      location: fields[7] as String?,
      isAllDay: fields[8] as bool,
      color: fields[9] as String?,
      metadata: (fields[10] as Map?)?.cast<String, dynamic>(),
      cachedAt: fields[11] as DateTime,
      isPendingSync: fields[12] as bool,
      pendingAction: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CalendarEventHiveModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.startTime)
      ..writeByte(3)
      ..write(obj.endTime)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.workOrderId)
      ..writeByte(7)
      ..write(obj.location)
      ..writeByte(8)
      ..write(obj.isAllDay)
      ..writeByte(9)
      ..write(obj.color)
      ..writeByte(10)
      ..write(obj.metadata)
      ..writeByte(11)
      ..write(obj.cachedAt)
      ..writeByte(12)
      ..write(obj.isPendingSync)
      ..writeByte(13)
      ..write(obj.pendingAction);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalendarEventHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalendarEventHiveModelImpl _$$CalendarEventHiveModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CalendarEventHiveModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      type: (json['type'] as num).toInt(),
      description: json['description'] as String,
      workOrderId: (json['workOrderId'] as num?)?.toInt(),
      location: json['location'] as String?,
      isAllDay: json['isAllDay'] as bool? ?? false,
      color: json['color'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      cachedAt: DateTime.parse(json['cachedAt'] as String),
      isPendingSync: json['isPendingSync'] as bool? ?? false,
      pendingAction: json['pendingAction'] as String?,
    );

Map<String, dynamic> _$$CalendarEventHiveModelImplToJson(
        _$CalendarEventHiveModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'type': instance.type,
      'description': instance.description,
      'workOrderId': instance.workOrderId,
      'location': instance.location,
      'isAllDay': instance.isAllDay,
      'color': instance.color,
      'metadata': instance.metadata,
      'cachedAt': instance.cachedAt.toIso8601String(),
      'isPendingSync': instance.isPendingSync,
      'pendingAction': instance.pendingAction,
    };
