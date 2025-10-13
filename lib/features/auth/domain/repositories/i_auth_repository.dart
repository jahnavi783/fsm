import 'package:either_dart/either.dart';
import '../../../../core/error/failures.dart';
import '../entities/user_entity.dart';

abstract class IAuthRepository {
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  });
  
  Future<Either<Failure, void>> logout();
  
  Future<Either<Failure, UserEntity?>> checkAuth();
  
  Future<Either<Failure, String>> refreshToken();
  
  Future<Either<Failure, UserEntity>> getCurrentUser();
}