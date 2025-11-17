import 'package:hive_ce/hive.dart';

import '../../../../core/constants/hive_boxes.dart';
import '../../domain/entities/chat_session_entity.dart';

part 'chat_session_hive_model.g.dart';

/// Hive model for storing chat sessions locally
///
/// This enables session restoration after app restart.
@HiveType(typeId: HiveBoxes.chatSessionHiveModelTypeId)
class ChatSessionHiveModel {
  @HiveField(0)
  final String sessionId;

  @HiveField(1)
  final int userId;

  @HiveField(2)
  final String userEmail;

  @HiveField(3)
  final String userRole;

  @HiveField(4)
  final DateTime createdAt;

  @HiveField(5)
  final DateTime updatedAt;

  @HiveField(6)
  final bool isActive;

  @HiveField(7)
  final String? firstName;

  @HiveField(8)
  final String? lastName;

  @HiveField(9)
  final int messageCount;

  ChatSessionHiveModel({
    required this.sessionId,
    required this.userId,
    required this.userEmail,
    required this.userRole,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    this.firstName,
    this.lastName,
    required this.messageCount,
  });

  /// Convert domain entity to Hive model
  factory ChatSessionHiveModel.fromEntity(ChatSessionEntity entity) {
    return ChatSessionHiveModel(
      sessionId: entity.sessionId,
      userId: entity.userId,
      userEmail: entity.userEmail,
      userRole: entity.userRole,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      isActive: entity.isActive,
      firstName: entity.firstName,
      lastName: entity.lastName,
      messageCount: entity.messageCount,
    );
  }

  /// Convert Hive model to domain entity
  ChatSessionEntity toEntity() {
    return ChatSessionEntity(
      sessionId: sessionId,
      userId: userId,
      userEmail: userEmail,
      userRole: userRole,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isActive: isActive,
      firstName: firstName,
      lastName: lastName,
      messageCount: messageCount,
    );
  }
}
