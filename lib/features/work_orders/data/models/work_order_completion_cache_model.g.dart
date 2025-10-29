// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_order_completion_cache_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkOrderCompletionCacheModelAdapter
    extends TypeAdapter<WorkOrderCompletionCacheModel> {
  @override
  final typeId = 13;

  @override
  WorkOrderCompletionCacheModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkOrderCompletionCacheModel(
      workOrderId: (fields[0] as num).toInt(),
      currentStep: fields[1] == null ? 0 : (fields[1] as num).toInt(),
      customerName: fields[2] as String?,
      workLog: fields[3] as String?,
      partsUsed: fields[4] == null
          ? []
          : (fields[4] as List).cast<CachedPartUsedModel>(),
      images: fields[5] == null ? [] : (fields[5] as List).cast<String>(),
      signaturePath: fields[6] as String?,
      completionNotes: fields[7] as String?,
      lastUpdated: fields[8] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, WorkOrderCompletionCacheModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.workOrderId)
      ..writeByte(1)
      ..write(obj.currentStep)
      ..writeByte(2)
      ..write(obj.customerName)
      ..writeByte(3)
      ..write(obj.workLog)
      ..writeByte(4)
      ..write(obj.partsUsed)
      ..writeByte(5)
      ..write(obj.images)
      ..writeByte(6)
      ..write(obj.signaturePath)
      ..writeByte(7)
      ..write(obj.completionNotes)
      ..writeByte(8)
      ..write(obj.lastUpdated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkOrderCompletionCacheModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CachedPartUsedModelAdapter extends TypeAdapter<CachedPartUsedModel> {
  @override
  final typeId = 14;

  @override
  CachedPartUsedModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CachedPartUsedModel(
      partNumber: fields[0] as String,
      quantity: (fields[1] as num).toInt(),
      partName: fields[2] as String,
      category: fields[3] as String,
      quantityAvailable: (fields[4] as num).toInt(),
      unitPrice: (fields[5] as num).toDouble(),
      status: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CachedPartUsedModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.partNumber)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.partName)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.quantityAvailable)
      ..writeByte(5)
      ..write(obj.unitPrice)
      ..writeByte(6)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CachedPartUsedModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkOrderCompletionCacheModel _$WorkOrderCompletionCacheModelFromJson(
        Map<String, dynamic> json) =>
    _WorkOrderCompletionCacheModel(
      workOrderId: (json['workOrderId'] as num).toInt(),
      currentStep: (json['currentStep'] as num?)?.toInt() ?? 0,
      customerName: json['customerName'] as String?,
      workLog: json['workLog'] as String?,
      partsUsed: (json['partsUsed'] as List<dynamic>?)
              ?.map((e) =>
                  CachedPartUsedModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      signaturePath: json['signaturePath'] as String?,
      completionNotes: json['completionNotes'] as String?,
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$WorkOrderCompletionCacheModelToJson(
        _WorkOrderCompletionCacheModel instance) =>
    <String, dynamic>{
      'workOrderId': instance.workOrderId,
      'currentStep': instance.currentStep,
      'customerName': instance.customerName,
      'workLog': instance.workLog,
      'partsUsed': instance.partsUsed,
      'images': instance.images,
      'signaturePath': instance.signaturePath,
      'completionNotes': instance.completionNotes,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
    };

_CachedPartUsedModel _$CachedPartUsedModelFromJson(Map<String, dynamic> json) =>
    _CachedPartUsedModel(
      partNumber: json['partNumber'] as String,
      quantity: (json['quantity'] as num).toInt(),
      partName: json['partName'] as String,
      category: json['category'] as String,
      quantityAvailable: (json['quantityAvailable'] as num).toInt(),
      unitPrice: (json['unitPrice'] as num).toDouble(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$CachedPartUsedModelToJson(
        _CachedPartUsedModel instance) =>
    <String, dynamic>{
      'partNumber': instance.partNumber,
      'quantity': instance.quantity,
      'partName': instance.partName,
      'category': instance.category,
      'quantityAvailable': instance.quantityAvailable,
      'unitPrice': instance.unitPrice,
      'status': instance.status,
    };
