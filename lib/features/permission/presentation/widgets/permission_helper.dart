import 'package:flutter/material.dart';

import '../../domain/entities/permission_entity.dart';
import '../../domain/repositories/i_permission_repository.dart';
import '../widgets/permission_widgets.dart';

/// Utility class for common permission operations
class PermissionHelper {
  final IPermissionRepository _repository;

  PermissionHelper(this._repository);

  /// Show permission request dialog with customizable options
  static Future<bool?> showPermissionDialog({
    required BuildContext context,
    required AppPermission permission,
    String? customTitle,
    String? customMessage,
    bool showSettings = true,
    VoidCallback? onSettingsPressed,
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => PermissionRequestDialog(
        permission: permission,
        customTitle: customTitle,
        customMessage: customMessage,
        onGrant: () => Navigator.of(context).pop(true),
        onDeny: () => Navigator.of(context).pop(false),
        onSettings: showSettings ? onSettingsPressed : null,
      ),
    );
  }

  /// Show batch permission request dialog
  static Future<bool?> showBatchPermissionDialog({
    required BuildContext context,
    required List<AppPermission> permissions,
    String? customTitle,
    String? customMessage,
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => BatchPermissionRequestDialog(
        permissions: permissions,
        customTitle: customTitle,
        customMessage: customMessage,
        onGrant: () => Navigator.of(context).pop(true),
        onDeny: () => Navigator.of(context).pop(false),
      ),
    );
  }

  /// Request permission with dialog if needed
  Future<AppPermissionStatus> requestPermissionWithDialog({
    required BuildContext context,
    required AppPermission permission,
    String? title,
    String? message,
  }) async {
    // First check current status
    final statusResult = await _repository.checkPermissionStatus(permission);

    return await statusResult.fold(
      (failure) async {
        _showErrorSnackBar(
            context, 'Failed to check permission: ${failure.message}');
        return AppPermissionStatus.denied;
      },
      (status) async {
        // If already granted, return
        if (status.isGranted) {
          return status;
        }

        // If permanently denied, show settings option
        if (status.isPermanentlyDenied || status.isRestricted) {
          final shouldOpenSettings = await showPermissionDialog(
            context: context,
            permission: permission,
            customTitle: title ?? 'Permission Required',
            customMessage: message ??
                'This permission has been permanently denied. Please enable it in app settings.',
            onSettingsPressed: () async {
              Navigator.of(context).pop(true);
              await _repository.openAppSettings();
            },
          );

          return shouldOpenSettings == true
              ? AppPermissionStatus.permanentlyDenied
              : AppPermissionStatus.denied;
        }

        // Show rationale dialog first
        final shouldRequest = await showPermissionDialog(
          context: context,
          permission: permission,
          customTitle: title,
          customMessage: message,
          showSettings: false,
        );

        if (shouldRequest != true) {
          return AppPermissionStatus.denied;
        }

        // Request permission
        final requestResult = await _repository.requestPermission(permission);

        return requestResult.fold(
          (failure) {
            _showErrorSnackBar(
                context, 'Failed to request permission: ${failure.message}');
            return AppPermissionStatus.denied;
          },
          (result) => result.status,
        );
      },
    );
  }

  /// Request multiple permissions with dialog
  Future<MultiplePermissionResult?> requestMultiplePermissionsWithDialog({
    required BuildContext context,
    required List<AppPermission> permissions,
    String? title,
    String? message,
  }) async {
    // Show batch dialog
    final shouldRequest = await showBatchPermissionDialog(
      context: context,
      permissions: permissions,
      customTitle: title,
      customMessage: message,
    );

    if (shouldRequest != true) return null;

    // Request permissions
    final result = await _repository.requestMultiplePermissions(permissions);

    return result.fold(
      (failure) {
        _showErrorSnackBar(
            context, 'Failed to request permissions: ${failure.message}');
        return null;
      },
      (multipleResult) {
        // Show result summary
        if (!multipleResult.allGranted) {
          _showPermissionResultSnackBar(context, multipleResult);
        }
        return multipleResult;
      },
    );
  }

  /// Check if critical permissions are granted
  Future<bool> checkCriticalPermissions({
    required List<AppPermission> criticalPermissions,
  }) async {
    final result =
        await _repository.checkMultiplePermissionStatus(criticalPermissions);

    return result.fold(
      (failure) => false,
      (statusMap) => statusMap.values.every((status) => status.isGranted),
    );
  }

  /// Request critical permissions on app startup
  Future<bool> ensureCriticalPermissions({
    required BuildContext context,
    required List<AppPermission> criticalPermissions,
    String? title,
    String? message,
  }) async {
    final isGranted = await checkCriticalPermissions(
      criticalPermissions: criticalPermissions,
    );

    if (isGranted) return true;

    final result = await requestMultiplePermissionsWithDialog(
      context: context,
      permissions: criticalPermissions,
      title: title ?? 'Required Permissions',
      message: message ??
          'This app requires the following permissions to function properly. Please grant all permissions to continue.',
    );

    return result?.allGranted ?? false;
  }

  /// Show permission settings page
  static Future<void> openAppSettings() async {
    // This would be handled by the repository
  }

  /// Utility method to show error snackbar
  void _showErrorSnackBar(BuildContext context, String message) {
    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  /// Show permission result summary
  void _showPermissionResultSnackBar(
    BuildContext context,
    MultiplePermissionResult result,
  ) {
    if (!context.mounted) return;

    final grantedCount = result.grantedPermissions.length;
    final totalCount = result.results.length;

    String message;
    Color backgroundColor;

    if (grantedCount == totalCount) {
      message = 'All permissions granted successfully';
      backgroundColor = Colors.green;
    } else if (grantedCount > 0) {
      message = '$grantedCount of $totalCount permissions granted';
      backgroundColor = Colors.orange;
    } else {
      message = 'No permissions granted';
      backgroundColor = Colors.red;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        action: result.requiresSettings
            ? SnackBarAction(
                label: 'Settings',
                textColor: Colors.white,
                onPressed: () => openAppSettings(),
              )
            : null,
      ),
    );
  }
}

/// Extension methods for easier permission handling
extension PermissionListExtension on List<AppPermission> {
  /// Get only location permissions
  List<AppPermission> get locationPermissions => where((p) =>
      p == AppPermission.location ||
      p == AppPermission.locationAlways ||
      p == AppPermission.locationWhenInUse).toList();

  /// Get only media permissions
  List<AppPermission> get mediaPermissions => where((p) =>
      p == AppPermission.camera ||
      p == AppPermission.photos ||
      p == AppPermission.storage ||
      p == AppPermission.manageExternalStorage).toList();

  /// Get only communication permissions
  List<AppPermission> get communicationPermissions =>
      where((p) => p == AppPermission.phone || p == AppPermission.contacts)
          .toList();
}

/// Predefined permission groups for FSM app
class FSMPermissionGroups {
  /// Critical permissions required for basic app functionality
  static const List<AppPermission> critical = [
    AppPermission.locationWhenInUse,
    AppPermission.storage,
  ];

  /// Media permissions for documentation
  static const List<AppPermission> media = [
    AppPermission.camera,
    AppPermission.photos,
    AppPermission.storage,
  ];

  /// Communication permissions for work orders
  static const List<AppPermission> communication = [
    AppPermission.phone,
    AppPermission.contacts,
  ];

  /// Full permissions for complete functionality
  static const List<AppPermission> full = [
    AppPermission.locationWhenInUse,
    AppPermission.camera,
    AppPermission.photos,
    AppPermission.storage,
    AppPermission.phone,
    AppPermission.contacts,
    AppPermission.notification,
    AppPermission.calendar,
  ];

  /// Background permissions for enhanced tracking
  static const List<AppPermission> background = [
    AppPermission.locationAlways,
    AppPermission.notification,
    AppPermission.backgroundRefresh,
  ];
}
