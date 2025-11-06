// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DocumentEntity _$DocumentEntityFromJson(Map<String, dynamic> json) =>
    _DocumentEntity(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      fileUrl: json['file_url'] as String,
      fileType: json['file_type'] as String,
      fileSize: (json['file_size'] as num).toInt(),
      category: json['category'] as String,
      relatedModel: json['related_model'] as String,
      keywords: json['keywords'] as String,
      uploadedBy: (json['uploaded_by'] as num).toInt(),
      createdAt:
          const DateTimeConverter().fromJson(json['createdAt'] as String),
      updatedAt:
          const DateTimeConverter().fromJson(json['updatedAt'] as String),
    );

Map<String, dynamic> _$DocumentEntityToJson(_DocumentEntity instance) =>
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
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'updatedAt': const DateTimeConverter().toJson(instance.updatedAt),
    };
