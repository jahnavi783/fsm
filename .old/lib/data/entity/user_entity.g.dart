// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => _UserEntity(
      id: (json['id'] as num).toInt(),
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String? ?? '',
      email: json['email'] as String,
      phone: json['phone'] as String?,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      city: json['city'] as String?,
      dob: _$JsonConverterFromJson<String, DateTime>(
          json['dob'], const DateTimeConverter().fromJson),
      roleId: $enumDecodeNullable(_$UserRoleEnumMap, json['role_id']),
      role: json['role'] as String?,
    );

Map<String, dynamic> _$UserEntityToJson(_UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'gender': _$GenderEnumMap[instance.gender],
      'city': instance.city,
      'dob': _$JsonConverterToJson<String, DateTime>(
          instance.dob, const DateTimeConverter().toJson),
      'role_id': _$UserRoleEnumMap[instance.roleId],
      'role': instance.role,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$UserRoleEnumMap = {
  UserRole.superAdmin: 0,
  UserRole.manager: 1,
  UserRole.helpDesk: 2,
  UserRole.partsManager: 3,
  UserRole.technician: 4,
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
