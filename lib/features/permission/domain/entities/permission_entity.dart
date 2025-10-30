import 'package:freezed_annotation/freezed_annotation.dart';

part 'permission_entity.freezed.dart';

/// Enum for all supported app permissions
enum AppPermission {
  camera,
  photos,
  location,
  locationAlways,
  locationWhenInUse,
  microphone,
  storage,
  manageExternalStorage,
  notification,
  phone,
  contacts,
  calendar,
  reminders,
  sensors,
  activityRecognition,
  backgroundRefresh,
  ignoreBatteryOptimizations,
  systemAlertWindow,
  requestInstallPackages,
  accessNotificationPolicy,
  bluetoothScan,
  bluetoothAdvertise,
  bluetoothConnect,
  nearbyWifiDevices,
  videos,
  audio,
}

/// Enum for permission status
enum AppPermissionStatus {
  /// Permission is granted
  granted,

  /// Permission is denied
  denied,

  /// Permission is permanently denied (user selected "Don't ask again")
  permanentlyDenied,

  /// Permission is restricted (iOS only - parental controls, etc.)
  restricted,

  /// Permission is limited (iOS 14+ - limited photo access, etc.)
  limited,

  /// Permission has not been requested yet
  notDetermined,
}

/// Extension to check if permission is granted
extension AppPermissionStatusExtension on AppPermissionStatus {
  bool get isGranted =>
      this == AppPermissionStatus.granted ||
      this == AppPermissionStatus.limited;
  bool get isDenied => this == AppPermissionStatus.denied;
  bool get isPermanentlyDenied => this == AppPermissionStatus.permanentlyDenied;
  bool get isRestricted => this == AppPermissionStatus.restricted;
  bool get isLimited => this == AppPermissionStatus.limited;
  bool get isNotDetermined => this == AppPermissionStatus.notDetermined;
  bool get requiresSettings => isPermanentlyDenied || isRestricted;
}

/// Permission request result entity
@freezed
abstract class PermissionResult with _$PermissionResult {
  const factory PermissionResult({
    required AppPermission permission,
    required AppPermissionStatus status,
    @Default(false) bool openedSettings,
  }) = _PermissionResult;
}

/// Multiple permissions result
@freezed
abstract class MultiplePermissionResult with _$MultiplePermissionResult {
  const factory MultiplePermissionResult({
    required Map<AppPermission, AppPermissionStatus> results,
    @Default([]) List<AppPermission> grantedPermissions,
    @Default([]) List<AppPermission> deniedPermissions,
    @Default([]) List<AppPermission> permanentlyDeniedPermissions,
    @Default([]) List<AppPermission> restrictedPermissions,
  }) = _MultiplePermissionResult;

  const MultiplePermissionResult._();

  /// Check if all permissions are granted
  bool get allGranted =>
      deniedPermissions.isEmpty &&
      permanentlyDeniedPermissions.isEmpty &&
      restrictedPermissions.isEmpty;

  /// Check if any permission requires settings
  bool get requiresSettings =>
      permanentlyDeniedPermissions.isNotEmpty ||
      restrictedPermissions.isNotEmpty;

  /// Get permissions that need to be handled
  List<AppPermission> get pendingPermissions => [
        ...deniedPermissions,
        ...permanentlyDeniedPermissions,
        ...restrictedPermissions,
      ];
}

/// Permission request configuration
@freezed
abstract class PermissionRequestConfig with _$PermissionRequestConfig {
  const factory PermissionRequestConfig({
    required AppPermission permission,
    @Default('') String title,
    @Default('') String description,
    @Default('') String rationale,
    @Default('Grant Permission') String positiveButtonText,
    @Default('Cancel') String negativeButtonText,
    @Default(true) bool showRationale,
    @Default(true) bool openSettingsOnDenied,
    @Default(false) bool showInAppSettings,
  }) = _PermissionRequestConfig;
}

/// Batch permission request configuration
@freezed
abstract class BatchPermissionRequestConfig with _$BatchPermissionRequestConfig {
  const factory BatchPermissionRequestConfig({
    required List<AppPermission> permissions,
    @Default('Permissions Required') String title,
    @Default('This app needs the following permissions to function properly')
    String description,
    @Default('Grant Permissions') String positiveButtonText,
    @Default('Cancel') String negativeButtonText,
    @Default(true) bool showRationale,
    @Default(true) bool openSettingsOnDenied,
    @Default(false) bool continueOnPartialGrant,
  }) = _BatchPermissionRequestConfig;
}
