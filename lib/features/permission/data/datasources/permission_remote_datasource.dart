import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart' as ph;

import '../../../../core/error/exceptions.dart';
import '../../domain/entities/permission_entity.dart';
import 'permission_mapper.dart';

@injectable
class PermissionRemoteDataSource {
  /// Check the status of a single permission
  Future<AppPermissionStatus> checkPermissionStatus(
      AppPermission permission) async {
    try {
      final phPermission = PermissionMapper.toPermissionHandler(permission);
      final status = await phPermission.status;
      return PermissionMapper.fromPermissionHandlerStatus(status);
    } catch (e) {
      throw PermissionException(
        'Failed to check permission status: ${e.toString()}',
        permission.toString(),
      );
    }
  }

  /// Check the status of multiple permissions
  Future<Map<AppPermission, AppPermissionStatus>> checkMultiplePermissionStatus(
    List<AppPermission> permissions,
  ) async {
    try {
      final phPermissions =
          PermissionMapper.toPermissionHandlerList(permissions);
      final statusMap = <ph.Permission, ph.PermissionStatus>{};

      // Check all permissions
      for (final phPermission in phPermissions) {
        statusMap[phPermission] = await phPermission.status;
      }

      return PermissionMapper.fromPermissionHandlerMap(statusMap, permissions);
    } catch (e) {
      throw PermissionException(
        'Failed to check multiple permission status: ${e.toString()}',
        permissions.toString(),
      );
    }
  }

  /// Request a single permission
  Future<AppPermissionStatus> requestPermission(
      AppPermission permission) async {
    try {
      final phPermission = PermissionMapper.toPermissionHandler(permission);
      final status = await phPermission.request();
      return PermissionMapper.fromPermissionHandlerStatus(status);
    } catch (e) {
      throw PermissionException(
        'Failed to request permission: ${e.toString()}',
        permission.toString(),
      );
    }
  }

  /// Request multiple permissions
  Future<Map<AppPermission, AppPermissionStatus>> requestMultiplePermissions(
    List<AppPermission> permissions,
  ) async {
    try {
      final phPermissions =
          PermissionMapper.toPermissionHandlerList(permissions);
      final statusMap = await phPermissions.request();

      return PermissionMapper.fromPermissionHandlerMap(statusMap, permissions);
    } catch (e) {
      throw PermissionException(
        'Failed to request multiple permissions: ${e.toString()}',
        permissions.toString(),
      );
    }
  }

  /// Open app settings
  Future<bool> openAppSettings() async {
    try {
      return await ph.openAppSettings();
    } catch (e) {
      throw PermissionException(
        'Failed to open app settings: ${e.toString()}',
        'app_settings',
      );
    }
  }

  /// Check if a permission is permanently denied
  Future<bool> isPermanentlyDenied(AppPermission permission) async {
    try {
      final phPermission = PermissionMapper.toPermissionHandler(permission);
      return await phPermission.isPermanentlyDenied;
    } catch (e) {
      throw PermissionException(
        'Failed to check if permission is permanently denied: ${e.toString()}',
        permission.toString(),
      );
    }
  }

  /// Check if service is enabled for a permission
  Future<bool> isServiceEnabled(AppPermission permission) async {
    try {
      // For location permissions, check if location service is enabled
      if (permission == AppPermission.location ||
          permission == AppPermission.locationAlways ||
          permission == AppPermission.locationWhenInUse) {
        final status = await ph.Permission.locationWhenInUse.serviceStatus;
        return status == ph.ServiceStatus.enabled;
      }

      // For other permissions, assume service is available
      return true;
    } catch (e) {
      // Some permissions don't have service status, return true by default
      return true;
    }
  }

  /// Request service to be enabled
  Future<bool> requestServiceEnable(AppPermission permission) async {
    try {
      // For location permission, we can try to request service
      if (permission == AppPermission.location ||
          permission == AppPermission.locationAlways ||
          permission == AppPermission.locationWhenInUse) {
        final status = await ph.Permission.locationWhenInUse.serviceStatus;

        if (status != ph.ServiceStatus.enabled) {
          // Open settings for manual service enablement
          return await openAppSettings();
        }
        return true;
      }

      // For other permissions, assume service is available
      return true;
    } catch (e) {
      throw PermissionException(
        'Failed to request service enable: ${e.toString()}',
        permission.toString(),
      );
    }
  }
}
