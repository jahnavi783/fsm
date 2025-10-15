import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/permission_entity.dart';
import '../repositories/i_permission_repository.dart';

@injectable
class RequestMultiplePermissionsUseCase {
  final IPermissionRepository _repository;

  RequestMultiplePermissionsUseCase(this._repository);

  Future<Either<Failure, MultiplePermissionResult>> call(
    List<AppPermission> permissions,
  ) {
    return _repository.requestMultiplePermissions(permissions);
  }
}
