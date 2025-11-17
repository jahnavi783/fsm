// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatMessageDto _$ChatMessageDtoFromJson(Map<String, dynamic> json) =>
    _ChatMessageDto(
      sessionId: json['sessionId'] as String,
      role: json['role'] as String,
      content: json['content'] as String,
      timestamp: json['timestamp'] as String,
      toolsUsed: (json['toolsUsed'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ChatMessageDtoToJson(_ChatMessageDto instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'role': instance.role,
      'content': instance.content,
      'timestamp': instance.timestamp,
      'toolsUsed': instance.toolsUsed,
    };

_ChatMessageResponseDto _$ChatMessageResponseDtoFromJson(
        Map<String, dynamic> json) =>
    _ChatMessageResponseDto(
      success: json['success'] as bool,
      message: json['message'] as String,
      toolsUsed: (json['toolsUsed'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ChatMessageResponseDtoToJson(
        _ChatMessageResponseDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'toolsUsed': instance.toolsUsed,
    };

_ChatHistoryResponseDto _$ChatHistoryResponseDtoFromJson(
        Map<String, dynamic> json) =>
    _ChatHistoryResponseDto(
      success: json['success'] as bool,
      history: (json['history'] as List<dynamic>)
          .map((e) => ChatHistoryMessageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatHistoryResponseDtoToJson(
        _ChatHistoryResponseDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'history': instance.history,
    };

_ChatHistoryMessageDto _$ChatHistoryMessageDtoFromJson(
        Map<String, dynamic> json) =>
    _ChatHistoryMessageDto(
      role: json['role'] as String,
      content: json['content'] as String,
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$ChatHistoryMessageDtoToJson(
        _ChatHistoryMessageDto instance) =>
    <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
      'timestamp': instance.timestamp,
    };

_ChatMessageRequestDto _$ChatMessageRequestDtoFromJson(
        Map<String, dynamic> json) =>
    _ChatMessageRequestDto(
      sessionId: json['sessionId'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ChatMessageRequestDtoToJson(
        _ChatMessageRequestDto instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'message': instance.message,
    };
