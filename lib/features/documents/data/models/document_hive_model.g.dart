// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DocumentHiveModelAdapter extends TypeAdapter<DocumentHiveModel> {
  @override
  final typeId = 8;

  @override
  DocumentHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DocumentHiveModel(
      id: (fields[0] as num).toInt(),
      title: fields[1] as String,
      description: fields[2] as String,
      type: (fields[3] as num).toInt(),
      fileUrl: fields[4] as String,
      fileName: fields[5] as String,
      fileSize: (fields[6] as num).toInt(),
      createdAt: fields[7] as DateTime,
      updatedAt: fields[8] as DateTime,
      tags: (fields[9] as List).cast<String>(),
      categories: (fields[10] as List).cast<String>(),
      relatedModel: fields[11] as String?,
      keywords: fields[12] as String?,
      uploadedBy: (fields[13] as num?)?.toInt(),
      isDownloaded: fields[14] as bool?,
      localPath: fields[15] as String?,
      cachedAt: fields[16] as DateTime,
      category: fields[17] as String,
      fileType: fields[18] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DocumentHiveModel obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.fileUrl)
      ..writeByte(5)
      ..write(obj.fileName)
      ..writeByte(6)
      ..write(obj.fileSize)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.updatedAt)
      ..writeByte(9)
      ..write(obj.tags)
      ..writeByte(10)
      ..write(obj.categories)
      ..writeByte(11)
      ..write(obj.relatedModel)
      ..writeByte(12)
      ..write(obj.keywords)
      ..writeByte(13)
      ..write(obj.uploadedBy)
      ..writeByte(14)
      ..write(obj.isDownloaded)
      ..writeByte(15)
      ..write(obj.localPath)
      ..writeByte(16)
      ..write(obj.cachedAt)
      ..writeByte(17)
      ..write(obj.category)
      ..writeByte(18)
      ..write(obj.fileType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DocumentHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DocumentHiveModel _$DocumentHiveModelFromJson(Map<String, dynamic> json) =>
    _DocumentHiveModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      type: (json['type'] as num).toInt(),
      fileUrl: json['fileUrl'] as String,
      fileName: json['fileName'] as String,
      fileSize: (json['fileSize'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      relatedModel: json['relatedModel'] as String?,
      keywords: json['keywords'] as String?,
      uploadedBy: (json['uploadedBy'] as num?)?.toInt(),
      isDownloaded: json['isDownloaded'] as bool?,
      localPath: json['localPath'] as String?,
      cachedAt: DateTime.parse(json['cachedAt'] as String),
      category: json['category'] as String,
      fileType: json['fileType'] as String,
    );

Map<String, dynamic> _$DocumentHiveModelToJson(_DocumentHiveModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': instance.type,
      'fileUrl': instance.fileUrl,
      'fileName': instance.fileName,
      'fileSize': instance.fileSize,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'tags': instance.tags,
      'categories': instance.categories,
      'relatedModel': instance.relatedModel,
      'keywords': instance.keywords,
      'uploadedBy': instance.uploadedBy,
      'isDownloaded': instance.isDownloaded,
      'localPath': instance.localPath,
      'cachedAt': instance.cachedAt.toIso8601String(),
      'category': instance.category,
      'fileType': instance.fileType,
    };
