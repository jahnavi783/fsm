// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DocumentHiveModelAdapter extends TypeAdapter<DocumentHiveModel> {
  @override
  final int typeId = 8;

  @override
  DocumentHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DocumentHiveModel(
      id: fields[0] as int,
      title: fields[1] as String,
      description: fields[2] as String,
      fileUrl: fields[3] as String,
      fileType: fields[4] as String,
      fileSize: fields[5] as int,
      category: fields[6] as String,
      relatedModel: fields[7] as String?,
      keywords: fields[8] as String?,
      uploadedBy: fields[9] as int?,
      createdAt: fields[10] as DateTime,
      updatedAt: fields[11] as DateTime,
      tags: (fields[12] as List).cast<String>(),
      categories: (fields[13] as List).cast<String>(),
      cachedAt: fields[14] as DateTime,
      isDownloaded: fields[15] as bool?,
      localPath: fields[16] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DocumentHiveModel obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.fileUrl)
      ..writeByte(4)
      ..write(obj.fileType)
      ..writeByte(5)
      ..write(obj.fileSize)
      ..writeByte(6)
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.relatedModel)
      ..writeByte(8)
      ..write(obj.keywords)
      ..writeByte(9)
      ..write(obj.uploadedBy)
      ..writeByte(10)
      ..write(obj.createdAt)
      ..writeByte(11)
      ..write(obj.updatedAt)
      ..writeByte(12)
      ..write(obj.tags)
      ..writeByte(13)
      ..write(obj.categories)
      ..writeByte(14)
      ..write(obj.cachedAt)
      ..writeByte(15)
      ..write(obj.isDownloaded)
      ..writeByte(16)
      ..write(obj.localPath);
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

_$DocumentDtoImpl _$$DocumentDtoImplFromJson(Map<String, dynamic> json) =>
    _$DocumentDtoImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      fileUrl: json['file_url'] as String,
      fileType: json['file_type'] as String,
      fileSize: (json['file_size'] as num).toInt(),
      category: json['category'] as String,
      relatedModel: json['related_model'] as String?,
      keywords: json['keywords'] as String?,
      uploadedBy: (json['uploaded_by'] as num?)?.toInt(),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DocumentDtoImplToJson(_$DocumentDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'file_url': instance.fileUrl,
      'file_type': instance.fileType,
      'file_size': instance.fileSize,
      'category': instance.category,
      'related_model': instance.relatedModel,
      'keywords': instance.keywords,
      'uploaded_by': instance.uploadedBy,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'tags': instance.tags,
      'categories': instance.categories,
    };

_$DocumentResponseDtoImpl _$$DocumentResponseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$DocumentResponseDtoImpl(
      documents: (json['documents'] as List<dynamic>)
          .map((e) => DocumentDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      pageSize: (json['pages'] as num).toInt(),
    );

Map<String, dynamic> _$$DocumentResponseDtoImplToJson(
        _$DocumentResponseDtoImpl instance) =>
    <String, dynamic>{
      'documents': instance.documents,
      'total': instance.total,
      'page': instance.page,
      'pages': instance.pageSize,
    };

_$DocumentHiveModelImpl _$$DocumentHiveModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DocumentHiveModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      fileUrl: json['fileUrl'] as String,
      fileType: json['fileType'] as String,
      fileSize: (json['fileSize'] as num).toInt(),
      category: json['category'] as String,
      relatedModel: json['relatedModel'] as String?,
      keywords: json['keywords'] as String?,
      uploadedBy: (json['uploadedBy'] as num?)?.toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      cachedAt: DateTime.parse(json['cachedAt'] as String),
      isDownloaded: json['isDownloaded'] as bool?,
      localPath: json['localPath'] as String?,
    );

Map<String, dynamic> _$$DocumentHiveModelImplToJson(
        _$DocumentHiveModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'fileUrl': instance.fileUrl,
      'fileType': instance.fileType,
      'fileSize': instance.fileSize,
      'category': instance.category,
      'relatedModel': instance.relatedModel,
      'keywords': instance.keywords,
      'uploadedBy': instance.uploadedBy,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'tags': instance.tags,
      'categories': instance.categories,
      'cachedAt': instance.cachedAt.toIso8601String(),
      'isDownloaded': instance.isDownloaded,
      'localPath': instance.localPath,
    };
