import 'package:permission_handler/permission_handler.dart' as ph;

import '../../domain/entities/permission_entity.dart';

/// Maps between our app permission types and the permission_handler package types
class PermissionMapper {
  /// Map AppPermission to permission_handler Permission
  static ph.Permission toPermissionHandler(AppPermission permission) {
    switch (permission) {
      case AppPermission.camera:
        return ph.Permission.camera;
      case AppPermission.photos:
        return ph.Permission.photos;
      case AppPermission.location:
        return ph.Permission.location;
      case AppPermission.locationAlways:
        return ph.Permission.locationAlways;
      case AppPermission.locationWhenInUse:
        return ph.Permission.locationWhenInUse;
      case AppPermission.microphone:
        return ph.Permission.microphone;
      case AppPermission.storage:
        return ph.Permission.storage;
      case AppPermission.manageExternalStorage:
        return ph.Permission.manageExternalStorage;
      case AppPermission.notification:
        return ph.Permission.notification;
      case AppPermission.phone:
        return ph.Permission.phone;
      case AppPermission.contacts:
        return ph.Permission.contacts;
      case AppPermission.calendar:
        return ph.Permission.calendarFullAccess;
      case AppPermission.reminders:
        return ph.Permission.reminders;
      case AppPermission.sensors:
        return ph.Permission.sensors;
      case AppPermission.activityRecognition:
        return ph.Permission.activityRecognition;
      case AppPermission.backgroundRefresh:
        return ph.Permission.appTrackingTransparency;
      case AppPermission.ignoreBatteryOptimizations:
        return ph.Permission.ignoreBatteryOptimizations;
      case AppPermission.systemAlertWindow:
        return ph.Permission.systemAlertWindow;
      case AppPermission.requestInstallPackages:
        return ph.Permission.requestInstallPackages;
      case AppPermission.accessNotificationPolicy:
        return ph.Permission.accessNotificationPolicy;
      case AppPermission.bluetoothScan:
        return ph.Permission.bluetoothScan;
      case AppPermission.bluetoothAdvertise:
        return ph.Permission.bluetoothAdvertise;
      case AppPermission.bluetoothConnect:
        return ph.Permission.bluetoothConnect;
      case AppPermission.nearbyWifiDevices:
        return ph.Permission.nearbyWifiDevices;
      case AppPermission.videos:
        return ph.Permission.videos;
      case AppPermission.audio:
        return ph.Permission.audio;
    }
  }

  /// Map permission_handler PermissionStatus to AppPermissionStatus
  static AppPermissionStatus fromPermissionHandlerStatus(
      ph.PermissionStatus status) {
    switch (status) {
      case ph.PermissionStatus.granted:
        return AppPermissionStatus.granted;
      case ph.PermissionStatus.denied:
        return AppPermissionStatus.denied;
      case ph.PermissionStatus.permanentlyDenied:
        return AppPermissionStatus.permanentlyDenied;
      case ph.PermissionStatus.restricted:
        return AppPermissionStatus.restricted;
      case ph.PermissionStatus.limited:
        return AppPermissionStatus.limited;
      case ph.PermissionStatus.provisional:
        return AppPermissionStatus.granted; // Treat provisional as granted
    }
  }

  /// Map list of AppPermissions to permission_handler Permissions
  static List<ph.Permission> toPermissionHandlerList(
      List<AppPermission> permissions) {
    return permissions.map(toPermissionHandler).toList();
  }

  /// Map permission_handler status map to AppPermission status map
  static Map<AppPermission, AppPermissionStatus> fromPermissionHandlerMap(
    Map<ph.Permission, ph.PermissionStatus> statusMap,
    List<AppPermission> originalPermissions,
  ) {
    final Map<AppPermission, AppPermissionStatus> result = {};

    for (final permission in originalPermissions) {
      final phPermission = toPermissionHandler(permission);
      final status = statusMap[phPermission];
      if (status != null) {
        result[permission] = fromPermissionHandlerStatus(status);
      }
    }

    return result;
  }

  /// Get the service name for a permission (for service status checking)
  static String getServiceName(AppPermission permission) {
    switch (permission) {
      case AppPermission.location:
      case AppPermission.locationAlways:
      case AppPermission.locationWhenInUse:
        return 'Location Services';
      case AppPermission.camera:
        return 'Camera';
      case AppPermission.microphone:
        return 'Microphone';
      case AppPermission.bluetoothScan:
      case AppPermission.bluetoothAdvertise:
      case AppPermission.bluetoothConnect:
        return 'Bluetooth';
      default:
        return permission.toString().split('.').last.toUpperCase();
    }
  }

  /// Get user-friendly permission name
  static String getPermissionDisplayName(AppPermission permission) {
    switch (permission) {
      case AppPermission.camera:
        return 'Camera';
      case AppPermission.photos:
        return 'Photos';
      case AppPermission.location:
        return 'Location';
      case AppPermission.locationAlways:
        return 'Location (Always)';
      case AppPermission.locationWhenInUse:
        return 'Location (When In Use)';
      case AppPermission.microphone:
        return 'Microphone';
      case AppPermission.storage:
        return 'Storage';
      case AppPermission.manageExternalStorage:
        return 'Manage External Storage';
      case AppPermission.notification:
        return 'Notifications';
      case AppPermission.phone:
        return 'Phone';
      case AppPermission.contacts:
        return 'Contacts';
      case AppPermission.calendar:
        return 'Calendar';
      case AppPermission.reminders:
        return 'Reminders';
      case AppPermission.sensors:
        return 'Sensors';
      case AppPermission.activityRecognition:
        return 'Activity Recognition';
      case AppPermission.backgroundRefresh:
        return 'Background App Refresh';
      case AppPermission.ignoreBatteryOptimizations:
        return 'Battery Optimization';
      case AppPermission.systemAlertWindow:
        return 'System Alert Window';
      case AppPermission.requestInstallPackages:
        return 'Install Packages';
      case AppPermission.accessNotificationPolicy:
        return 'Notification Policy';
      case AppPermission.bluetoothScan:
        return 'Bluetooth Scan';
      case AppPermission.bluetoothAdvertise:
        return 'Bluetooth Advertise';
      case AppPermission.bluetoothConnect:
        return 'Bluetooth Connect';
      case AppPermission.nearbyWifiDevices:
        return 'Nearby WiFi Devices';
      case AppPermission.videos:
        return 'Videos';
      case AppPermission.audio:
        return 'Audio';
    }
  }
}
