import 'package:either_dart/either.dart';

import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/permission_entity.dart';
import '../../domain/repositories/i_permission_repository.dart';
import '../datasources/permission_remote_datasource.dart';

class PermissionRepositoryImpl implements IPermissionRepository {
  final PermissionRemoteDataSource _remoteDataSource;

  PermissionRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, AppPermissionStatus>> checkPermissionStatus(
    AppPermission permission,
  ) async {
    try {
      final status = await _remoteDataSource.checkPermissionStatus(permission);
      return Right(status);
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }

  @override
  Future<Either<Failure, Map<AppPermission, AppPermissionStatus>>>
      checkMultiplePermissionStatus(
    List<AppPermission> permissions,
  ) async {
    try {
      final statusMap =
          await _remoteDataSource.checkMultiplePermissionStatus(permissions);
      return Right(statusMap);
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }

  @override
  Future<Either<Failure, PermissionResult>> requestPermission(
    AppPermission permission,
  ) async {
    try {
      final status = await _remoteDataSource.requestPermission(permission);
      final result = PermissionResult(
        permission: permission,
        status: status,
      );
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }

  @override
  Future<Either<Failure, MultiplePermissionResult>> requestMultiplePermissions(
    List<AppPermission> permissions,
  ) async {
    try {
      final statusMap =
          await _remoteDataSource.requestMultiplePermissions(permissions);

      final grantedPermissions = <AppPermission>[];
      final deniedPermissions = <AppPermission>[];
      final permanentlyDeniedPermissions = <AppPermission>[];
      final restrictedPermissions = <AppPermission>[];

      for (final entry in statusMap.entries) {
        switch (entry.value) {
          case AppPermissionStatus.granted:
          case AppPermissionStatus.limited:
            grantedPermissions.add(entry.key);
            break;
          case AppPermissionStatus.denied:
          case AppPermissionStatus.notDetermined:
            deniedPermissions.add(entry.key);
            break;
          case AppPermissionStatus.permanentlyDenied:
            permanentlyDeniedPermissions.add(entry.key);
            break;
          case AppPermissionStatus.restricted:
            restrictedPermissions.add(entry.key);
            break;
        }
      }

      final result = MultiplePermissionResult(
        results: statusMap,
        grantedPermissions: grantedPermissions,
        deniedPermissions: deniedPermissions,
        permanentlyDeniedPermissions: permanentlyDeniedPermissions,
        restrictedPermissions: restrictedPermissions,
      );

      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }

  @override
  Future<Either<Failure, bool>> openAppSettings() async {
    try {
      final result = await _remoteDataSource.openAppSettings();
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }

  @override
  Future<Either<Failure, bool>> canRequestPermission(
    AppPermission permission,
  ) async {
    try {
      final isPermanentlyDenied =
          await _remoteDataSource.isPermanentlyDenied(permission);
      return Right(!isPermanentlyDenied);
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }

  @override
  Future<Either<Failure, bool>> areAllPermissionsGranted(
    List<AppPermission> permissions,
  ) async {
    try {
      final statusMap =
          await _remoteDataSource.checkMultiplePermissionStatus(permissions);

      final allGranted = statusMap.values.every((status) =>
          status == AppPermissionStatus.granted ||
          status == AppPermissionStatus.limited);

      return Right(allGranted);
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }

  @override
  Future<Either<Failure, bool>> isServiceEnabled(
    AppPermission permission,
  ) async {
    try {
      final isEnabled = await _remoteDataSource.isServiceEnabled(permission);
      return Right(isEnabled);
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }

  @override
  Future<Either<Failure, bool>> requestServiceEnable(
    AppPermission permission,
  ) async {
    try {
      final result = await _remoteDataSource.requestServiceEnable(permission);
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }
}
