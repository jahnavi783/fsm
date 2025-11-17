import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/chat_session_entity.dart';

part 'chat_session_dto.freezed.dart';
part 'chat_session_dto.g.dart';

/// DTO for chat session API responses
///
/// Handles JSON serialization/deserialization for session data
/// from the chatbot API endpoints.
@freezed
abstract class ChatSessionDto with _$ChatSessionDto {
  const factory ChatSessionDto({
    required String sessionId,
    required UserInfoDto user,
    String? message,
  }) = _ChatSessionDto;

  const ChatSessionDto._();

  factory ChatSessionDto.fromJson(Map<String, dynamic> json) =>
      _$ChatSessionDtoFromJson(json);

  /// Convert DTO to domain entity
  ChatSessionEntity toDomain() {
    return ChatSessionEntity(
      sessionId: sessionId,
      userId: user.id ?? 0,
      userEmail: user.email,
      userRole: user.role,
      firstName: user.firstName,
      lastName: user.lastName,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      isActive: true,
      messageCount: 0,
    );
  }
}

/// DTO for user information in session response
@freezed
abstract class UserInfoDto with _$UserInfoDto {
  const factory UserInfoDto({
    int? id,
    required String email,
    required String role,
    String? firstName,
    String? lastName,
  }) = _UserInfoDto;

  const UserInfoDto._();

  factory UserInfoDto.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDtoFromJson(json);
}

/// DTO for session API response wrapper
@freezed
abstract class ChatSessionResponseDto with _$ChatSessionResponseDto {
  const factory ChatSessionResponseDto({
    required bool success,
    required String sessionId,
    UserInfoDto? user,
    String? message,
  }) = _ChatSessionResponseDto;

  const ChatSessionResponseDto._();

  factory ChatSessionResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ChatSessionResponseDtoFromJson(json);

  /// Convert to ChatSessionDto
  ChatSessionDto toSessionDto() {
    return ChatSessionDto(
      sessionId: sessionId,
      user: user ?? const UserInfoDto(email: '', role: ''),
      message: message,
    );
  }
}
