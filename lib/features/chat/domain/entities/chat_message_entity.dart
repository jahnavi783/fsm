import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message_entity.freezed.dart';

/// Domain entity representing a chat message
///
/// This is a pure business model with no external dependencies.
/// It represents the core concept of a chat message in the domain.
@freezed
abstract class ChatMessageEntity with _$ChatMessageEntity {
  const factory ChatMessageEntity({
    /// Unique identifier for the message
    required String id,

    /// Session ID this message belongs to
    required String sessionId,

    /// Role of the message sender: 'user' or 'assistant'
    required String role,

    /// Message content/text
    required String content,

    /// When the message was created
    required DateTime timestamp,

    /// Optional: Tools used by assistant to generate response
    List<String>? toolsUsed,

    /// Whether this message has been synced to the server
    /// Used for offline-first functionality
    @Default(false) bool isSynced,

    /// Whether this message is pending send (in offline queue)
    @Default(false) bool isPending,
  }) = _ChatMessageEntity;

  const ChatMessageEntity._();

  /// Check if this is a user message
  bool get isUser => role == 'user';

  /// Check if this is an assistant message
  bool get isAssistant => role == 'assistant';

  /// Check if message needs to be synced
  bool get needsSync => !isSynced;
}
