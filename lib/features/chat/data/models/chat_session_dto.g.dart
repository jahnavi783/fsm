// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_session_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatSessionDto _$ChatSessionDtoFromJson(Map<String, dynamic> json) =>
    _ChatSessionDto(
      sessionId: json['sessionId'] as String,
      user: UserInfoDto.fromJson(json['user'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ChatSessionDtoToJson(_ChatSessionDto instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'user': instance.user,
      'message': instance.message,
    };

_UserInfoDto _$UserInfoDtoFromJson(Map<String, dynamic> json) => _UserInfoDto(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String,
      role: json['role'] as String,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
    );

Map<String, dynamic> _$UserInfoDtoToJson(_UserInfoDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'role': instance.role,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };

_ChatSessionResponseDto _$ChatSessionResponseDtoFromJson(
        Map<String, dynamic> json) =>
    _ChatSessionResponseDto(
      success: json['success'] as bool,
      sessionId: json['sessionId'] as String,
      user: json['user'] == null
          ? null
          : UserInfoDto.fromJson(json['user'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ChatSessionResponseDtoToJson(
        _ChatSessionResponseDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'sessionId': instance.sessionId,
      'user': instance.user,
      'message': instance.message,
    };
