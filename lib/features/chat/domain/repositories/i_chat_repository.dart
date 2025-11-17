import 'package:either_dart/either.dart';

import '../../../../core/error/failures.dart';
import '../entities/chat_message_entity.dart';
import '../entities/chat_session_entity.dart';

/// Abstract repository interface for chat operations
///
/// This defines the contract for chat data operations without
/// specifying implementation details. The data layer will
/// implement this interface.
abstract class IChatRepository {
  /// Start a new chat session
  ///
  /// Returns [ChatSessionEntity] on success, [Failure] on error
  Future<Either<Failure, ChatSessionEntity>> startSession();

  /// Send a message in the current session
  ///
  /// Parameters:
  /// - [sessionId]: Current session identifier
  /// - [message]: User message content
  ///
  /// Returns the assistant's [ChatMessageEntity] response
  Future<Either<Failure, ChatMessageEntity>> sendMessage({
    required String sessionId,
    required String message,
  });

  /// Get conversation history for a session
  ///
  /// Parameters:
  /// - [sessionId]: Session to retrieve history for
  ///
  /// Returns list of [ChatMessageEntity] in chronological order
  Future<Either<Failure, List<ChatMessageEntity>>> getChatHistory({
    required String sessionId,
  });

  /// End the current chat session
  ///
  /// Parameters:
  /// - [sessionId]: Session to terminate
  ///
  /// Returns [void] on success, [Failure] on error
  Future<Either<Failure, void>> endSession({
    required String sessionId,
  });

  /// Get the currently active session from local storage
  ///
  /// Returns [ChatSessionEntity] if an active session exists,
  /// null otherwise
  Future<Either<Failure, ChatSessionEntity?>> getActiveSession();

  /// Save session to local storage
  ///
  /// Parameters:
  /// - [session]: Session entity to persist
  Future<Either<Failure, void>> saveSession({
    required ChatSessionEntity session,
  });

  /// Save message to local storage
  ///
  /// Parameters:
  /// - [message]: Message entity to persist
  Future<Either<Failure, void>> saveMessage({
    required ChatMessageEntity message,
  });

  /// Get all messages for a session from local storage
  ///
  /// Parameters:
  /// - [sessionId]: Session ID to get messages for
  ///
  /// Returns list of cached messages
  Future<Either<Failure, List<ChatMessageEntity>>> getCachedMessages({
    required String sessionId,
  });

  /// Clear all local chat data (for logout)
  Future<Either<Failure, void>> clearLocalData();

  /// Sync pending messages when connection is restored
  ///
  /// Returns number of messages successfully synced
  Future<Either<Failure, int>> syncPendingMessages();
}
