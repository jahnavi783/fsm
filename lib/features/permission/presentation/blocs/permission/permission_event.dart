import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/permission_entity.dart';

part 'permission_event.freezed.dart';

@freezed
class PermissionEvent with _$PermissionEvent {
  const factory PermissionEvent.checkPermission(AppPermission permission) =
      _CheckPermission;

  const factory PermissionEvent.checkMultiplePermissions(
      List<AppPermission> permissions) = _CheckMultiplePermissions;

  const factory PermissionEvent.requestPermission(AppPermission permission) =
      _RequestPermission;

  const factory PermissionEvent.requestMultiplePermissions(
      List<AppPermission> permissions) = _RequestMultiplePermissions;

  const factory PermissionEvent.requestPermissionWithConfig({
    required AppPermission permission,
    required PermissionRequestConfig config,
  }) = _RequestPermissionWithConfig;

  const factory PermissionEvent.requestBatchPermissions({
    required BatchPermissionRequestConfig config,
  }) = _RequestBatchPermissions;

  const factory PermissionEvent.openAppSettings() = _OpenAppSettings;

  const factory PermissionEvent.checkServiceStatus(AppPermission permission) =
      _CheckServiceStatus;

  const factory PermissionEvent.requestServiceEnable(AppPermission permission) =
      _RequestServiceEnable;

  const factory PermissionEvent.reset() = _Reset;
}
