import 'package:either_dart/either.dart';

import '../../../../core/error/failures.dart';

/// Base use case interface for all chat use cases
///
/// Type parameters:
/// - [Type]: Return type wrapped in Either
/// - [Params]: Parameters required for the use case
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Use case with no parameters
abstract class UseCaseNoParams<Type> {
  Future<Either<Failure, Type>> call();
}
