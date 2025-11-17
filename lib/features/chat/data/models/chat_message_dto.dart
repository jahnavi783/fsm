import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/chat_message_entity.dart';

part 'chat_message_dto.freezed.dart';
part 'chat_message_dto.g.dart';

/// DTO for chat message API responses
///
/// Handles JSON serialization for messages from the chatbot API.
@freezed
class ChatMessageDto with _$ChatMessageDto {
  const factory ChatMessageDto({
    required String sessionId,
    required String role,
    required String content,
    required String timestamp,
    List<String>? toolsUsed,
  }) = _ChatMessageDto;

  const ChatMessageDto._();

  factory ChatMessageDto.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageDtoFromJson(json);

  /// Convert DTO to domain entity
  ChatMessageEntity toDomain() {
    return ChatMessageEntity(
      id: const Uuid().v4(), // Generate ID client-side
      sessionId: sessionId,
      role: role,
      content: content,
      timestamp: DateTime.parse(timestamp),
      toolsUsed: toolsUsed,
      isSynced: true, // From server, so already synced
      isPending: false,
    );
  }

  /// Create from domain entity for API requests
  static ChatMessageDto fromDomain(ChatMessageEntity entity) {
    return ChatMessageDto(
      sessionId: entity.sessionId,
      role: entity.role,
      content: entity.content,
      timestamp: entity.timestamp.toIso8601String(),
      toolsUsed: entity.toolsUsed,
    );
  }
}

/// DTO for message API response
@freezed
class ChatMessageResponseDto with _$ChatMessageResponseDto {
  const factory ChatMessageResponseDto({
    required bool success,
    required String message,
    List<String>? toolsUsed,
  }) = _ChatMessageResponseDto;

  const ChatMessageResponseDto._();

  factory ChatMessageResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageResponseDtoFromJson(json);

  /// Convert to ChatMessageEntity (assistant response)
  ChatMessageEntity toEntity(String sessionId) {
    return ChatMessageEntity(
      id: const Uuid().v4(),
      sessionId: sessionId,
      role: 'assistant',
      content: message,
      timestamp: DateTime.now(),
      toolsUsed: toolsUsed,
      isSynced: true,
      isPending: false,
    );
  }
}

/// DTO for chat history response
@freezed
class ChatHistoryResponseDto with _$ChatHistoryResponseDto {
  const factory ChatHistoryResponseDto({
    required bool success,
    required List<ChatHistoryMessageDto> history,
  }) = _ChatHistoryResponseDto;

  const ChatHistoryResponseDto._();

  factory ChatHistoryResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ChatHistoryResponseDtoFromJson(json);

  /// Convert history to list of entities
  List<ChatMessageEntity> toEntities(String sessionId) {
    return history
        .map((msg) => msg.toEntity(sessionId))
        .toList();
  }
}

/// DTO for individual message in history
@freezed
class ChatHistoryMessageDto with _$ChatHistoryMessageDto {
  const factory ChatHistoryMessageDto({
    required String role,
    required String content,
    required String timestamp,
  }) = _ChatHistoryMessageDto;

  const ChatHistoryMessageDto._();

  factory ChatHistoryMessageDto.fromJson(Map<String, dynamic> json) =>
      _$ChatHistoryMessageDtoFromJson(json);

  /// Convert to entity
  ChatMessageEntity toEntity(String sessionId) {
    return ChatMessageEntity(
      id: const Uuid().v4(),
      sessionId: sessionId,
      role: role,
      content: content,
      timestamp: DateTime.parse(timestamp),
      isSynced: true,
      isPending: false,
    );
  }
}

/// DTO for message request
@freezed
class ChatMessageRequestDto with _$ChatMessageRequestDto {
  const factory ChatMessageRequestDto({
    required String sessionId,
    required String message,
  }) = _ChatMessageRequestDto;

  factory ChatMessageRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageRequestDtoFromJson(json);
}
