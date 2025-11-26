// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_order_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkOrderHiveModelAdapter extends TypeAdapter<WorkOrderHiveModel> {
  @override
  final typeId = 5;

  @override
  WorkOrderHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkOrderHiveModel(
      id: (fields[0] as num).toInt(),
      woNumber: fields[1] as String,
      srId: (fields[2] as num).toInt(),
      userId: fields[3] as String?,
      summary: fields[4] as String,
      problemDescription: fields[5] as String,
      priority: (fields[6] as num).toInt(),
      visitDate: fields[7] as DateTime,
      location: fields[8] as String,
      status: (fields[9] as num).toInt(),
      durationDays: (fields[10] as num).toInt(),
      createdAt: fields[11] as DateTime,
      updatedAt: fields[12] as DateTime,
      startedAt: fields[13] as DateTime?,
      resumedAt: fields[14] as DateTime?,
      completedAt: fields[15] as DateTime?,
      pauseLogs: fields[16] as String?,
      workLog: fields[17] as String?,
      partsUsed: (fields[18] as List?)?.cast<PartUsedHiveModel>(),
      images: (fields[19] as List).cast<String>(),
      cachedAt: fields[20] as DateTime,
      isPendingSync: fields[21] as bool,
      pendingAction: fields[22] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, WorkOrderHiveModel obj) {
    writer
      ..writeByte(23)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.woNumber)
      ..writeByte(2)
      ..write(obj.srId)
      ..writeByte(3)
      ..write(obj.userId)
      ..writeByte(4)
      ..write(obj.summary)
      ..writeByte(5)
      ..write(obj.problemDescription)
      ..writeByte(6)
      ..write(obj.priority)
      ..writeByte(7)
      ..write(obj.visitDate)
      ..writeByte(8)
      ..write(obj.location)
      ..writeByte(9)
      ..write(obj.status)
      ..writeByte(10)
      ..write(obj.durationDays)
      ..writeByte(11)
      ..write(obj.createdAt)
      ..writeByte(12)
      ..write(obj.updatedAt)
      ..writeByte(13)
      ..write(obj.startedAt)
      ..writeByte(14)
      ..write(obj.resumedAt)
      ..writeByte(15)
      ..write(obj.completedAt)
      ..writeByte(16)
      ..write(obj.pauseLogs)
      ..writeByte(17)
      ..write(obj.workLog)
      ..writeByte(18)
      ..write(obj.partsUsed)
      ..writeByte(19)
      ..write(obj.images)
      ..writeByte(20)
      ..write(obj.cachedAt)
      ..writeByte(21)
      ..write(obj.isPendingSync)
      ..writeByte(22)
      ..write(obj.pendingAction);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkOrderHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PartUsedHiveModelAdapter extends TypeAdapter<PartUsedHiveModel> {
  @override
  final typeId = 6;

  @override
  PartUsedHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PartUsedHiveModel(
      partNumber: fields[0] as String,
      quantityUsed: (fields[1] as num).toInt(),
      partName: fields[2] as String?,
      description: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PartUsedHiveModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.partNumber)
      ..writeByte(1)
      ..write(obj.quantityUsed)
      ..writeByte(2)
      ..write(obj.partName)
      ..writeByte(3)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PartUsedHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
