import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/hive_boxes.dart';
import '../../../../core/storage/hive_service.dart';
import '../models/chat_message_hive_model.dart';
import '../models/chat_session_hive_model.dart';

/// Abstract interface for chat local storage operations
abstract class ChatLocalDataSource {
  /// Save a message to local storage
  Future<void> saveMessage(ChatMessageHiveModel message);

  /// Get all messages for a session
  Future<List<ChatMessageHiveModel>> getMessages(String sessionId);

  /// Get pending messages (not yet synced to server)
  Future<List<ChatMessageHiveModel>> getPendingMessages();

  /// Save a session to local storage
  Future<void> saveSession(ChatSessionHiveModel session);

  /// Get the currently active session
  Future<ChatSessionHiveModel?> getActiveSession();

  /// Update session activity timestamp
  Future<void> updateSessionActivity(String sessionId);

  /// Mark session as inactive
  Future<void> deactivateSession(String sessionId);

  /// Clear all chat data (for logout)
  Future<void> clearAllData();

  /// Delete old inactive sessions (cleanup)
  Future<void> deleteOldSessions({int daysOld = 7});
}

/// Implementation of chat local data source
///
/// Handles all Hive database operations for chat persistence.
@Injectable(as: ChatLocalDataSource)
class ChatLocalDataSourceImpl implements ChatLocalDataSource {
  final HiveService _hiveService;

  ChatLocalDataSourceImpl(this._hiveService);

  Future<Box<ChatMessageHiveModel>> get _messagesBox async =>
      await _hiveService.getTypedBox<ChatMessageHiveModel>(
        HiveBoxes.chatMessages,
      );

  Future<Box<ChatSessionHiveModel>> get _sessionsBox async =>
      await _hiveService.getTypedBox<ChatSessionHiveModel>(
        HiveBoxes.chatSessions,
      );

  @override
  Future<void> saveMessage(ChatMessageHiveModel message) async {
    final box = await _messagesBox;
    await box.put(message.id, message);
  }

  @override
  Future<List<ChatMessageHiveModel>> getMessages(String sessionId) async {
    final box = await _messagesBox;
    final allMessages = box.values.toList();

    // Filter messages by session ID and sort by timestamp
    final sessionMessages = allMessages
        .where((msg) => msg.sessionId == sessionId)
        .toList()
      ..sort((a, b) => a.timestamp.compareTo(b.timestamp));

    return sessionMessages;
  }

  @override
  Future<List<ChatMessageHiveModel>> getPendingMessages() async {
    final box = await _messagesBox;
    final allMessages = box.values.toList();

    // Get messages that haven't been synced
    return allMessages.where((msg) => msg.isPending).toList();
  }

  @override
  Future<void> saveSession(ChatSessionHiveModel session) async {
    final box = await _sessionsBox;
    await box.put(session.sessionId, session);
  }

  @override
  Future<ChatSessionHiveModel?> getActiveSession() async {
    final box = await _sessionsBox;
    final allSessions = box.values.toList();

    // Find the most recent active session
    final activeSessions =
        allSessions.where((session) => session.isActive).toList();

    if (activeSessions.isEmpty) {
      return null;
    }

    // Sort by update time and return most recent
    activeSessions.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return activeSessions.first;
  }

  @override
  Future<void> updateSessionActivity(String sessionId) async {
    final box = await _sessionsBox;
    final session = box.get(sessionId);

    if (session != null) {
      final updatedSession = ChatSessionHiveModel(
        sessionId: session.sessionId,
        userId: session.userId,
        userEmail: session.userEmail,
        userRole: session.userRole,
        createdAt: session.createdAt,
        updatedAt: DateTime.now(), // Update timestamp
        isActive: session.isActive,
        firstName: session.firstName,
        lastName: session.lastName,
        messageCount: session.messageCount + 1,
      );

      await box.put(sessionId, updatedSession);
    }
  }

  @override
  Future<void> deactivateSession(String sessionId) async {
    final box = await _sessionsBox;
    final session = box.get(sessionId);

    if (session != null) {
      final deactivatedSession = ChatSessionHiveModel(
        sessionId: session.sessionId,
        userId: session.userId,
        userEmail: session.userEmail,
        userRole: session.userRole,
        createdAt: session.createdAt,
        updatedAt: DateTime.now(),
        isActive: false, // Mark as inactive
        firstName: session.firstName,
        lastName: session.lastName,
        messageCount: session.messageCount,
      );

      await box.put(sessionId, deactivatedSession);
    }
  }

  @override
  Future<void> clearAllData() async {
    final messagesBox = await _messagesBox;
    final sessionsBox = await _sessionsBox;

    await messagesBox.clear();
    await sessionsBox.clear();
  }

  @override
  Future<void> deleteOldSessions({int daysOld = 7}) async {
    final box = await _sessionsBox;
    final cutoffDate = DateTime.now().subtract(Duration(days: daysOld));

    final oldSessions = box.values.where(
      (session) => !session.isActive && session.updatedAt.isBefore(cutoffDate),
    );

    for (final session in oldSessions) {
      await box.delete(session.sessionId);

      // Also delete associated messages
      final messagesBox = await _messagesBox;
      final messagesToDelete = messagesBox.values
          .where((msg) => msg.sessionId == session.sessionId)
          .toList();

      for (final msg in messagesToDelete) {
        await messagesBox.delete(msg.id);
      }
    }
  }
}
