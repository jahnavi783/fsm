import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/chat_message_entity.dart';
import '../../../domain/entities/chat_session_entity.dart';

part 'chat_state.freezed.dart';

/// States that ChatBloc can emit
///
/// Represents all possible UI states for the chat feature.
@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    /// Current session (null if no active session)
    ChatSessionEntity? session,

    /// List of messages in the conversation
    @Default([]) List<ChatMessageEntity> messages,

    /// Loading state
    @Default(false) bool isLoading,

    /// Bot is typing indicator
    @Default(false) bool isBotTyping,

    /// Error message if any
    String? error,

    /// Whether chat is initialized
    @Default(false) bool isInitialized,

    /// Whether user can send messages
    @Default(false) bool canSendMessages,

    /// Offline mode indicator
    @Default(false) bool isOffline,

    /// Number of pending messages waiting to sync
    @Default(0) int pendingMessageCount,

    /// Last sync timestamp
    DateTime? lastSyncTime,
  }) = _ChatState;

  const ChatState._();

  /// Initial state
  factory ChatState.initial() => const ChatState();

  /// Check if session is active
  bool get hasActiveSession => session != null && (session?.isActive ?? false);

  /// Check if there are any messages
  bool get hasMessages => messages.isNotEmpty;

  /// Check if showing error state
  bool get hasError => error != null;

  /// Check if need to sync
  bool get needsSync => pendingMessageCount > 0;
}
