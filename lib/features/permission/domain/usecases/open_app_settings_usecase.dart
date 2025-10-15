import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../repositories/i_permission_repository.dart';

@injectable
class OpenAppSettingsUseCase {
  final IPermissionRepository _repository;

  OpenAppSettingsUseCase(this._repository);

  Future<Either<Failure, bool>> call() {
    return _repository.openAppSettings();
  }
}
