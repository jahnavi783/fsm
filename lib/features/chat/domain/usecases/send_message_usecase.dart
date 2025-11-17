import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/error/failures.dart';
import '../entities/chat_message_entity.dart';
import '../repositories/i_chat_repository.dart';
import 'base_usecase.dart';

/// Parameters for sending a chat message
class SendMessageParams {
  final String sessionId;
  final String message;

  const SendMessageParams({
    required this.sessionId,
    required this.message,
  });
}

/// Use case for sending a message to the chatbot
///
/// This handles:
/// 1. Creating user message entity
/// 2. Saving message locally (offline-first)
/// 3. Sending to API
/// 4. Receiving assistant response
/// 5. Saving assistant response locally
@injectable
class SendMessageUseCase implements UseCase<ChatMessageEntity, SendMessageParams> {
  final IChatRepository _repository;
  final Uuid _uuid;

  const SendMessageUseCase(
    this._repository,
    this._uuid,
  );

  @override
  Future<Either<Failure, ChatMessageEntity>> call(SendMessageParams params) async {
    // Create user message entity
    final userMessage = ChatMessageEntity(
      id: _uuid.v4(),
      sessionId: params.sessionId,
      role: 'user',
      content: params.message,
      timestamp: DateTime.now(),
      isSynced: false, // Not yet sent to server
      isPending: true, // In pending queue
    );

    // Save user message locally first (optimistic update)
    await _repository.saveMessage(message: userMessage);

    // Send message to API
    final result = await _repository.sendMessage(
      sessionId: params.sessionId,
      message: params.message,
    );

    return result.fold(
      (failure) async {
        // Message failed to send, keep it in pending state
        return Left(failure);
      },
      (assistantMessage) async {
        // Update user message as synced
        final syncedUserMessage = userMessage.copyWith(
          isSynced: true,
          isPending: false,
        );
        await _repository.saveMessage(message: syncedUserMessage);

        // Save assistant response
        await _repository.saveMessage(message: assistantMessage);

        return Right(assistantMessage);
      },
    );
  }
}
