// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uploaded_by_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UploadedByDto _$UploadedByDtoFromJson(Map<String, dynamic> json) =>
    _UploadedByDto(
      id: (json['id'] as num).toInt(),
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String?,
      email: json['email'] as String,
    );

Map<String, dynamic> _$UploadedByDtoToJson(_UploadedByDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
    };
