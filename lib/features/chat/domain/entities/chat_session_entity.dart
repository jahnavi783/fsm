import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_session_entity.freezed.dart';

/// Domain entity representing a chat session
///
/// A session represents a conversation context between the user
/// and the AI assistant. Messages are grouped by session.
@freezed
class ChatSessionEntity with _$ChatSessionEntity {
  const factory ChatSessionEntity({
    /// Unique session identifier from server
    required String sessionId,

    /// User ID who owns this session
    required int userId,

    /// User email (for reference)
    required String userEmail,

    /// User role (e.g., 'technician')
    required String userRole,

    /// When the session was created
    required DateTime createdAt,

    /// Last activity timestamp
    required DateTime updatedAt,

    /// Whether the session is currently active
    @Default(true) bool isActive,

    /// Optional: User's first name
    String? firstName,

    /// Optional: User's last name
    String? lastName,

    /// Number of messages in this session
    @Default(0) int messageCount,
  }) = _ChatSessionEntity;

  const ChatSessionEntity._();

  /// Get user's full name or email as fallback
  String get displayName {
    if (firstName != null && lastName != null) {
      return '$firstName $lastName';
    }
    return userEmail;
  }

  /// Check if session is stale (inactive for more than 24 hours)
  bool get isStale {
    final hoursSinceUpdate = DateTime.now().difference(updatedAt).inHours;
    return hoursSinceUpdate > 24;
  }

  /// Get session duration in minutes
  int get durationMinutes {
    return updatedAt.difference(createdAt).inMinutes;
  }
}
