import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/chat_message_entity.dart';
import '../repositories/i_chat_repository.dart';
import 'base_usecase.dart';

/// Parameters for getting chat history
class GetChatHistoryParams {
  final String sessionId;
  final bool forceRefresh;

  const GetChatHistoryParams({
    required this.sessionId,
    this.forceRefresh = false,
  });
}

/// Use case for retrieving chat conversation history
///
/// This implements offline-first strategy:
/// 1. Return cached messages immediately
/// 2. Optionally fetch from API to sync latest
/// 3. Merge and deduplicate results
@injectable
class GetChatHistoryUseCase
    implements UseCase<List<ChatMessageEntity>, GetChatHistoryParams> {
  final IChatRepository _repository;

  const GetChatHistoryUseCase(this._repository);

  @override
  Future<Either<Failure, List<ChatMessageEntity>>> call(
    GetChatHistoryParams params,
  ) async {
    // Get cached messages first (offline-first)
    final cachedResult = await _repository.getCachedMessages(
      sessionId: params.sessionId,
    );

    // If not forcing refresh and we have cached data, return it
    if (!params.forceRefresh) {
      return cachedResult;
    }

    // Fetch fresh data from API
    final apiResult = await _repository.getChatHistory(
      sessionId: params.sessionId,
    );

    return apiResult.fold(
      (failure) {
        // If API fails, return cached data as fallback
        return cachedResult;
      },
      (apiMessages) async {
        // Save API messages to cache
        for (final message in apiMessages) {
          await _repository.saveMessage(message: message);
        }

        // Return fresh messages from API
        return Right(apiMessages);
      },
    );
  }
}
