// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PartHiveModelAdapter extends TypeAdapter<PartHiveModel> {
  @override
  final int typeId = 4;

  @override
  PartHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PartHiveModel(
      id: fields[0] as int,
      partNumber: fields[1] as String,
      partName: fields[2] as String,
      description: fields[3] as String,
      category: fields[4] as String,
      unitPrice: fields[5] as double,
      quantityAvailable: fields[6] as int,
      minQuantity: fields[7] as int,
      maxQuantity: fields[8] as int,
      unit: fields[9] as String,
      status: fields[10] as int,
      compatibleModels: (fields[11] as List).cast<String>(),
      imageUrl: fields[12] as String?,
      specifications: fields[13] as String?,
      lastUpdated: fields[14] as DateTime?,
      cachedAt: fields[15] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, PartHiveModel obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.partNumber)
      ..writeByte(2)
      ..write(obj.partName)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.unitPrice)
      ..writeByte(6)
      ..write(obj.quantityAvailable)
      ..writeByte(7)
      ..write(obj.minQuantity)
      ..writeByte(8)
      ..write(obj.maxQuantity)
      ..writeByte(9)
      ..write(obj.unit)
      ..writeByte(10)
      ..write(obj.status)
      ..writeByte(11)
      ..write(obj.compatibleModels)
      ..writeByte(12)
      ..write(obj.imageUrl)
      ..writeByte(13)
      ..write(obj.specifications)
      ..writeByte(14)
      ..write(obj.lastUpdated)
      ..writeByte(15)
      ..write(obj.cachedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PartHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class InventoryHiveModelAdapter extends TypeAdapter<InventoryHiveModel> {
  @override
  final int typeId = 5;

  @override
  InventoryHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InventoryHiveModel(
      partId: fields[0] as int,
      partNumber: fields[1] as String,
      quantity: fields[2] as int,
      minQuantity: fields[3] as int,
      maxQuantity: fields[4] as int,
      lastUpdated: fields[5] as DateTime,
      location: fields[6] as String,
      notes: fields[7] as String?,
      cachedAt: fields[8] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, InventoryHiveModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.partId)
      ..writeByte(1)
      ..write(obj.partNumber)
      ..writeByte(2)
      ..write(obj.quantity)
      ..writeByte(3)
      ..write(obj.minQuantity)
      ..writeByte(4)
      ..write(obj.maxQuantity)
      ..writeByte(5)
      ..write(obj.lastUpdated)
      ..writeByte(6)
      ..write(obj.location)
      ..writeByte(7)
      ..write(obj.notes)
      ..writeByte(8)
      ..write(obj.cachedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InventoryHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PartHiveModelImpl _$$PartHiveModelImplFromJson(Map<String, dynamic> json) =>
    _$PartHiveModelImpl(
      id: (json['id'] as num).toInt(),
      partNumber: json['partNumber'] as String,
      partName: json['partName'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      unitPrice: (json['unitPrice'] as num).toDouble(),
      quantityAvailable: (json['quantityAvailable'] as num).toInt(),
      minQuantity: (json['minQuantity'] as num).toInt(),
      maxQuantity: (json['maxQuantity'] as num).toInt(),
      unit: json['unit'] as String,
      status: (json['status'] as num).toInt(),
      compatibleModels: (json['compatibleModels'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      imageUrl: json['imageUrl'] as String?,
      specifications: json['specifications'] as String?,
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
      cachedAt: DateTime.parse(json['cachedAt'] as String),
    );

Map<String, dynamic> _$$PartHiveModelImplToJson(_$PartHiveModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'partNumber': instance.partNumber,
      'partName': instance.partName,
      'description': instance.description,
      'category': instance.category,
      'unitPrice': instance.unitPrice,
      'quantityAvailable': instance.quantityAvailable,
      'minQuantity': instance.minQuantity,
      'maxQuantity': instance.maxQuantity,
      'unit': instance.unit,
      'status': instance.status,
      'compatibleModels': instance.compatibleModels,
      'imageUrl': instance.imageUrl,
      'specifications': instance.specifications,
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
      'cachedAt': instance.cachedAt.toIso8601String(),
    };

_$InventoryHiveModelImpl _$$InventoryHiveModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InventoryHiveModelImpl(
      partId: (json['partId'] as num).toInt(),
      partNumber: json['partNumber'] as String,
      quantity: (json['quantity'] as num).toInt(),
      minQuantity: (json['minQuantity'] as num).toInt(),
      maxQuantity: (json['maxQuantity'] as num).toInt(),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
      location: json['location'] as String,
      notes: json['notes'] as String?,
      cachedAt: DateTime.parse(json['cachedAt'] as String),
    );

Map<String, dynamic> _$$InventoryHiveModelImplToJson(
        _$InventoryHiveModelImpl instance) =>
    <String, dynamic>{
      'partId': instance.partId,
      'partNumber': instance.partNumber,
      'quantity': instance.quantity,
      'minQuantity': instance.minQuantity,
      'maxQuantity': instance.maxQuantity,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
      'location': instance.location,
      'notes': instance.notes,
      'cachedAt': instance.cachedAt.toIso8601String(),
    };
