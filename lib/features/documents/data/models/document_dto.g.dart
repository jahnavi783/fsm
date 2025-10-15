// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_dto.dart';

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
