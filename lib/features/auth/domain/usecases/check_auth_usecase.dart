import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/user_entity.dart';
import '../repositories/i_auth_repository.dart';

@injectable
class CheckAuthUseCase {
  final IAuthRepository _repository;

  CheckAuthUseCase(this._repository);

  Future<Either<Failure, UserEntity?>> call() async {
    return await _repository.checkAuth();
  }
}