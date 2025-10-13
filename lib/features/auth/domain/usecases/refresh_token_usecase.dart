import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../repositories/i_auth_repository.dart';

@injectable
class RefreshTokenUseCase {
  final IAuthRepository _repository;

  RefreshTokenUseCase(this._repository);

  Future<Either<Failure, String>> call() async {
    return await _repository.refreshToken();
  }
}