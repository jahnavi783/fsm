import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/permission_entity.dart';
import '../repositories/i_permission_repository.dart';

@injectable
class CheckMultiplePermissionStatusUseCase {
  final IPermissionRepository _repository;

  CheckMultiplePermissionStatusUseCase(this._repository);

  Future<Either<Failure, Map<AppPermission, AppPermissionStatus>>> call(
    List<AppPermission> permissions,
  ) {
    return _repository.checkMultiplePermissionStatus(permissions);
  }
}
