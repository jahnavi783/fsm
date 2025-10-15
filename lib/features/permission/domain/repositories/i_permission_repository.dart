import 'package:either_dart/either.dart';

import '../../../../core/error/failures.dart';
import '../entities/permission_entity.dart';

/// Abstract repository interface for permission operations
abstract class IPermissionRepository {
  /// Check the status of a single permission
  Future<Either<Failure, AppPermissionStatus>> checkPermissionStatus(
    AppPermission permission,
  );

  /// Check the status of multiple permissions
  Future<Either<Failure, Map<AppPermission, AppPermissionStatus>>>
      checkMultiplePermissionStatus(
    List<AppPermission> permissions,
  );

  /// Request a single permission
  Future<Either<Failure, PermissionResult>> requestPermission(
    AppPermission permission,
  );

  /// Request multiple permissions
  Future<Either<Failure, MultiplePermissionResult>> requestMultiplePermissions(
    List<AppPermission> permissions,
  );

  /// Open app settings for the user to manually grant permissions
  Future<Either<Failure, bool>> openAppSettings();

  /// Check if the permission can be requested (not permanently denied)
  Future<Either<Failure, bool>> canRequestPermission(
    AppPermission permission,
  );

  /// Check if all given permissions are granted
  Future<Either<Failure, bool>> areAllPermissionsGranted(
    List<AppPermission> permissions,
  );

  /// Get the service status for a permission (e.g., location service enabled)
  Future<Either<Failure, bool>> isServiceEnabled(
    AppPermission permission,
  );

  /// Request service to be enabled (e.g., enable location service)
  Future<Either<Failure, bool>> requestServiceEnable(
    AppPermission permission,
  );
}
