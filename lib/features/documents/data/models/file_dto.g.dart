// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FileDto _$FileDtoFromJson(Map<String, dynamic> json) => _FileDto(
      id: (json['id'] as num).toInt(),
      fileName: json['file_name'] as String?,
      fileUrl: json['file_url'] as String,
      fileType: json['file_type'] as String,
      fileSize: (json['file_size'] as num).toInt(),
    );

Map<String, dynamic> _$FileDtoToJson(_FileDto instance) => <String, dynamic>{
      'id': instance.id,
      'file_name': instance.fileName,
      'file_url': instance.fileUrl,
      'file_type': instance.fileType,
      'file_size': instance.fileSize,
    };
