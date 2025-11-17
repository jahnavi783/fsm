import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_event.freezed.dart';

/// Events that can be sent to ChatBloc
///
/// These represent user actions and system triggers
/// related to chat functionality.
@freezed
class ChatEvent with _$ChatEvent {
  /// Initialize chat feature (check for active session)
  const factory ChatEvent.initialize() = _Initialize;

  /// Start a new chat session
  const factory ChatEvent.startSession() = _StartSession;

  /// Send a message in the current session
  const factory ChatEvent.sendMessage({
    required String message,
  }) = _SendMessage;

  /// Load chat history for current session
  const factory ChatEvent.loadHistory({
    @Default(false) bool forceRefresh,
  }) = _LoadHistory;

  /// End the current chat session
  const factory ChatEvent.endSession() = _EndSession;

  /// Restore a previously active session
  const factory ChatEvent.restoreSession() = _RestoreSession;

  /// Sync pending messages (when connection restored)
  const factory ChatEvent.syncPendingMessages() = _SyncPendingMessages;

  /// Clear all chat data (on logout)
  const factory ChatEvent.clearData() = _ClearData;

  /// Mark a message as seen (for UI state)
  const factory ChatEvent.markMessageSeen({
    required String messageId,
  }) = _MarkMessageSeen;
}
