import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../repositories/i_chat_repository.dart';
import 'base_usecase.dart';

/// Parameters for ending a chat session
class EndSessionParams {
  final String sessionId;

  const EndSessionParams({required this.sessionId});
}

/// Use case for ending a chat session
///
/// This handles:
/// 1. Notifying server to end session
/// 2. Marking session as inactive locally
/// 3. Preserving conversation history for later reference
@injectable
class EndSessionUseCase implements UseCase<void, EndSessionParams> {
  final IChatRepository _repository;

  const EndSessionUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(EndSessionParams params) async {
    // End session via API
    final result = await _repository.endSession(
      sessionId: params.sessionId,
    );

    return result.fold(
      (failure) => Left(failure),
      (_) async {
        // Session ended successfully
        // Note: We keep messages in cache for history viewing
        // but mark session as inactive
        return const Right(null);
      },
    );
  }
}
