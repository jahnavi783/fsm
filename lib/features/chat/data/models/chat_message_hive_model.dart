import 'package:hive_ce/hive.dart';

import '../../../../core/constants/hive_boxes.dart';
import '../../domain/entities/chat_message_entity.dart';

part 'chat_message_hive_model.g.dart';

/// Hive model for storing chat messages locally
///
/// This enables offline-first chat history persistence.
@HiveType(typeId: HiveBoxes.chatMessageHiveModelTypeId)
class ChatMessageHiveModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String sessionId;

  @HiveField(2)
  final String role;

  @HiveField(3)
  final String content;

  @HiveField(4)
  final DateTime timestamp;

  @HiveField(5)
  final List<String>? toolsUsed;

  @HiveField(6)
  final bool isSynced;

  @HiveField(7)
  final bool isPending;

  ChatMessageHiveModel({
    required this.id,
    required this.sessionId,
    required this.role,
    required this.content,
    required this.timestamp,
    this.toolsUsed,
    required this.isSynced,
    required this.isPending,
  });

  /// Convert domain entity to Hive model
  factory ChatMessageHiveModel.fromEntity(ChatMessageEntity entity) {
    return ChatMessageHiveModel(
      id: entity.id,
      sessionId: entity.sessionId,
      role: entity.role,
      content: entity.content,
      timestamp: entity.timestamp,
      toolsUsed: entity.toolsUsed,
      isSynced: entity.isSynced,
      isPending: entity.isPending,
    );
  }

  /// Convert Hive model to domain entity
  ChatMessageEntity toEntity() {
    return ChatMessageEntity(
      id: id,
      sessionId: sessionId,
      role: role,
      content: content,
      timestamp: timestamp,
      toolsUsed: toolsUsed,
      isSynced: isSynced,
      isPending: isPending,
    );
  }
}
