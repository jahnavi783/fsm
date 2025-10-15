import 'package:injectable/injectable.dart';

import '../datasources/permission_remote_datasource.dart';
import '../repositories/permission_repository_impl.dart';
import '../../domain/repositories/i_permission_repository.dart';

@module
abstract class PermissionModule {
  @LazySingleton(as: IPermissionRepository)
  PermissionRepositoryImpl permissionRepository(
          PermissionRemoteDataSource dataSource) =>
      PermissionRepositoryImpl(dataSource);
}
