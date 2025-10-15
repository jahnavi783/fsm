import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/permission_entity.dart';
import '../repositories/i_permission_repository.dart';

@injectable
class RequestPermissionUseCase {
  final IPermissionRepository _repository;

  RequestPermissionUseCase(this._repository);

  Future<Either<Failure, PermissionResult>> call(AppPermission permission) {
    return _repository.requestPermission(permission);
  }
}
