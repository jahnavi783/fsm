import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/permission_entity.dart';
import '../repositories/i_permission_repository.dart';

@injectable
class CheckPermissionStatusUseCase {
  final IPermissionRepository _repository;

  CheckPermissionStatusUseCase(this._repository);

  Future<Either<Failure, AppPermissionStatus>> call(AppPermission permission) {
    return _repository.checkPermissionStatus(permission);
  }
}
