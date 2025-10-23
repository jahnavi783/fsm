// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDto _$UserDtoFromJson(Map<String, dynamic> json) => _UserDto(
      id: (json['id'] as num).toInt(),
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String? ?? '',
      email: json['email'] as String,
      phone: json['phone'] as String?,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      city: json['city'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      roleId: $enumDecodeNullable(_$UserRoleEnumMap, json['role_id']),
      role: json['role'] as String?,
    );

Map<String, dynamic> _$UserDtoToJson(_UserDto instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'gender': _$GenderEnumMap[instance.gender],
      'city': instance.city,
      'dob': instance.dob?.toIso8601String(),
      'role_id': _$UserRoleEnumMap[instance.roleId],
      'role': instance.role,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
};

const _$UserRoleEnumMap = {
  UserRole.superAdmin: 0,
  UserRole.manager: 1,
  UserRole.helpDesk: 2,
  UserRole.partsManager: 3,
  UserRole.technician: 4,
};
