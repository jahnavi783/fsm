import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/chat_session_entity.dart';
import '../repositories/i_chat_repository.dart';
import 'base_usecase.dart';

/// Use case for starting a new chat session
///
/// This initiates a new conversation with the AI assistant.
/// The session is persisted locally for offline access.
@injectable
class StartSessionUseCase implements UseCaseNoParams<ChatSessionEntity> {
  final IChatRepository _repository;

  const StartSessionUseCase(this._repository);

  @override
  Future<Either<Failure, ChatSessionEntity>> call() async {
    // Start session via API
    final result = await _repository.startSession();

    // Save session locally if successful
    return result.fold(
      (failure) => Left(failure),
      (session) async {
        // Persist session for offline access
        await _repository.saveSession(session: session);
        return Right(session);
      },
    );
  }
}
