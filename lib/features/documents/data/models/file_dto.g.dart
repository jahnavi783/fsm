// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FileDto _$FileDtoFromJson(Map<String, dynamic> json) => _FileDto(
      id: (json['id'] as num).toInt(),
      filename: json['filename'] as String,
      fileUrl: json['file_url'] as String,
      fileType: json['file_type'] as String,
      fileSize: (json['file_size'] as num).toInt(),
    );

Map<String, dynamic> _$FileDtoToJson(_FileDto instance) => <String, dynamic>{
      'id': instance.id,
      'filename': instance.filename,
      'file_url': instance.fileUrl,
      'file_type': instance.fileType,
      'file_size': instance.fileSize,
    };
