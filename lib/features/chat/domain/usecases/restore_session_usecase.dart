import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/chat_session_entity.dart';
import '../repositories/i_chat_repository.dart';
import 'base_usecase.dart';

/// Use case for restoring a previously active chat session
///
/// This handles:
/// 1. Checking for active session in local storage
/// 2. Validating session is not stale
/// 3. Loading associated conversation history
@injectable
class RestoreSessionUseCase implements UseCaseNoParams<ChatSessionEntity?> {
  final IChatRepository _repository;

  const RestoreSessionUseCase(this._repository);

  @override
  Future<Either<Failure, ChatSessionEntity?>> call() async {
    // Get active session from local storage
    final result = await _repository.getActiveSession();

    return result.fold(
      (failure) => Left(failure),
      (session) async {
        // No active session found
        if (session == null) {
          return const Right(null);
        }

        // Check if session is stale (inactive > 24 hours)
        if (session.isStale) {
          // Session too old, don't restore
          return const Right(null);
        }

        // Session is valid and can be restored
        return Right(session);
      },
    );
  }
}
