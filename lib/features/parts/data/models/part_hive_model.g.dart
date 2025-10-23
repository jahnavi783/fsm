// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PartHiveModelAdapter extends TypeAdapter<PartHiveModel> {
  @override
  final typeId = 7;

  @override
  PartHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PartHiveModel(
      partNumber: fields[0] as String,
      partName: fields[1] as String,
      category: fields[2] as String,
      quantityAvailable: (fields[3] as num).toInt(),
      unitPrice: (fields[4] as num).toDouble(),
      status: (fields[5] as num).toInt(),
      cachedAt: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, PartHiveModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.partNumber)
      ..writeByte(1)
      ..write(obj.partName)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.quantityAvailable)
      ..writeByte(4)
      ..write(obj.unitPrice)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PartHiveModel _$PartHiveModelFromJson(Map<String, dynamic> json) =>
    _PartHiveModel(
      partNumber: json['partNumber'] as String,
      partName: json['partName'] as String,
      category: json['category'] as String,
      quantityAvailable: (json['quantityAvailable'] as num).toInt(),
      unitPrice: (json['unitPrice'] as num).toDouble(),
      status: (json['status'] as num).toInt(),
      cachedAt: DateTime.parse(json['cachedAt'] as String),
    );

Map<String, dynamic> _$PartHiveModelToJson(_PartHiveModel instance) =>
    <String, dynamic>{
      'partNumber': instance.partNumber,
      'partName': instance.partName,
      'category': instance.category,
      'quantityAvailable': instance.quantityAvailable,
      'unitPrice': instance.unitPrice,
      'status': instance.status,
      'cachedAt': instance.cachedAt.toIso8601String(),
    };
