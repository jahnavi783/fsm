import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/permission_entity.dart';

part 'permission_state.freezed.dart';

@freezed
class PermissionState with _$PermissionState {
  const factory PermissionState.initial() = _Initial;

  const factory PermissionState.loading() = _Loading;

  const factory PermissionState.permissionChecked({
    required AppPermission permission,
    required AppPermissionStatus status,
  }) = _PermissionChecked;

  const factory PermissionState.multiplePermissionsChecked({
    required Map<AppPermission, AppPermissionStatus> statusMap,
  }) = _MultiplePermissionsChecked;

  const factory PermissionState.permissionRequested({
    required PermissionResult result,
  }) = _PermissionRequested;

  const factory PermissionState.multiplePermissionsRequested({
    required MultiplePermissionResult result,
  }) = _MultiplePermissionsRequested;

  const factory PermissionState.serviceStatusChecked({
    required AppPermission permission,
    required bool isEnabled,
  }) = _ServiceStatusChecked;

  const factory PermissionState.settingsOpened({
    required bool success,
  }) = _SettingsOpened;

  const factory PermissionState.error({
    required String message,
    AppPermission? permission,
  }) = _Error;
}
