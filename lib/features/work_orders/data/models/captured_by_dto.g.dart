// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'captured_by_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CapturedByDto _$CapturedByDtoFromJson(Map<String, dynamic> json) =>
    _CapturedByDto(
      id: _intFromJson(json['id']),
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      roleId: _intFromJson(json['role_id']),
    );

Map<String, dynamic> _$CapturedByDtoToJson(_CapturedByDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'role_id': instance.roleId,
    };
