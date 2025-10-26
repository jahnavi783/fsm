// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DocumentDto _$DocumentDtoFromJson(Map<String, dynamic> json) => _DocumentDto(
      uploadId: json['upload_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      relatedModel: json['related_model'] as String?,
      files: (json['files'] as List<dynamic>)
          .map((e) => FileDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      uploadedBy:
          UploadedByDto.fromJson(json['uploaded_by'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String?,
      keywords: (json['keywords'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$DocumentDtoToJson(_DocumentDto instance) =>
    <String, dynamic>{
      'upload_id': instance.uploadId,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'related_model': instance.relatedModel,
      'files': instance.files,
      'uploaded_by': instance.uploadedBy,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'keywords': instance.keywords,
      'tags': instance.tags,
    };

_DocumentResponseDto _$DocumentResponseDtoFromJson(Map<String, dynamic> json) =>
    _DocumentResponseDto(
      documents: (json['uploads'] as List<dynamic>)
          .map((e) => DocumentDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      pages: (json['pages'] as num).toInt(),
    );

Map<String, dynamic> _$DocumentResponseDtoToJson(
        _DocumentResponseDto instance) =>
    <String, dynamic>{
      'uploads': instance.documents,
      'total': instance.total,
      'page': instance.page,
      'pages': instance.pages,
    };
