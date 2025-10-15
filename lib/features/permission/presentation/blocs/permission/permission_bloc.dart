import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/permission_entity.dart';
import '../../../domain/usecases/check_multiple_permission_status_usecase.dart';
import '../../../domain/usecases/check_permission_status_usecase.dart';
import '../../../domain/usecases/open_app_settings_usecase.dart';
import '../../../domain/usecases/request_multiple_permissions_usecase.dart';
import '../../../domain/usecases/request_permission_usecase.dart';
import '../../../domain/repositories/i_permission_repository.dart';
import 'permission_event.dart';
import 'permission_state.dart';

@injectable
class PermissionBloc extends Bloc<PermissionEvent, PermissionState> {
  final CheckPermissionStatusUseCase _checkPermissionStatusUseCase;
  final CheckMultiplePermissionStatusUseCase
      _checkMultiplePermissionStatusUseCase;
  final RequestPermissionUseCase _requestPermissionUseCase;
  final RequestMultiplePermissionsUseCase _requestMultiplePermissionsUseCase;
  final OpenAppSettingsUseCase _openAppSettingsUseCase;
  final IPermissionRepository _repository;

  PermissionBloc(
    this._checkPermissionStatusUseCase,
    this._checkMultiplePermissionStatusUseCase,
    this._requestPermissionUseCase,
    this._requestMultiplePermissionsUseCase,
    this._openAppSettingsUseCase,
    this._repository,
  ) : super(const PermissionState.initial()) {
    on<PermissionEvent>((event, emit) async {
      event.when(
        checkPermission: (permission) => _onCheckPermission(permission, emit),
        checkMultiplePermissions: (permissions) =>
            _onCheckMultiplePermissions(permissions, emit),
        requestPermission: (permission) =>
            _onRequestPermission(permission, emit),
        requestMultiplePermissions: (permissions) =>
            _onRequestMultiplePermissions(permissions, emit),
        requestPermissionWithConfig: (permission, config) =>
            _onRequestPermissionWithConfig(permission, config, emit),
        requestBatchPermissions: (config) =>
            _onRequestBatchPermissions(config, emit),
        openAppSettings: () => _onOpenAppSettings(emit),
        checkServiceStatus: (permission) =>
            _onCheckServiceStatus(permission, emit),
        requestServiceEnable: (permission) =>
            _onRequestServiceEnable(permission, emit),
        reset: () => emit(const PermissionState.initial()),
      );
    });
  }

  Future<void> _onCheckPermission(
    AppPermission permission,
    Emitter<PermissionState> emit,
  ) async {
    emit(const PermissionState.loading());

    final result = await _checkPermissionStatusUseCase(permission);

    result.fold(
      (failure) => emit(PermissionState.error(
        message: failure.message,
        permission: permission,
      )),
      (status) => emit(PermissionState.permissionChecked(
        permission: permission,
        status: status,
      )),
    );
  }

  Future<void> _onCheckMultiplePermissions(
    List<AppPermission> permissions,
    Emitter<PermissionState> emit,
  ) async {
    emit(const PermissionState.loading());

    final result = await _checkMultiplePermissionStatusUseCase(permissions);

    result.fold(
      (failure) => emit(PermissionState.error(
        message: failure.message,
      )),
      (statusMap) => emit(PermissionState.multiplePermissionsChecked(
        statusMap: statusMap,
      )),
    );
  }

  Future<void> _onRequestPermission(
    AppPermission permission,
    Emitter<PermissionState> emit,
  ) async {
    emit(const PermissionState.loading());

    final result = await _requestPermissionUseCase(permission);

    result.fold(
      (failure) => emit(PermissionState.error(
        message: failure.message,
        permission: permission,
      )),
      (permissionResult) => emit(PermissionState.permissionRequested(
        result: permissionResult,
      )),
    );
  }

  Future<void> _onRequestMultiplePermissions(
    List<AppPermission> permissions,
    Emitter<PermissionState> emit,
  ) async {
    emit(const PermissionState.loading());

    final result = await _requestMultiplePermissionsUseCase(permissions);

    result.fold(
      (failure) => emit(PermissionState.error(
        message: failure.message,
      )),
      (multipleResult) => emit(PermissionState.multiplePermissionsRequested(
        result: multipleResult,
      )),
    );
  }

  Future<void> _onRequestPermissionWithConfig(
    AppPermission permission,
    PermissionRequestConfig config,
    Emitter<PermissionState> emit,
  ) async {
    emit(const PermissionState.loading());

    // Check current status first
    final statusResult = await _checkPermissionStatusUseCase(permission);

    await statusResult.fold(
      (failure) async => emit(PermissionState.error(
        message: failure.message,
        permission: permission,
      )),
      (status) async {
        // If already granted, don't request again
        if (status.isGranted) {
          emit(PermissionState.permissionRequested(
            result: PermissionResult(
              permission: permission,
              status: status,
            ),
          ));
          return;
        }

        // If permanently denied and config allows, open settings
        if (status.isPermanentlyDenied && config.openSettingsOnDenied) {
          final settingsResult = await _openAppSettingsUseCase();
          settingsResult.fold(
            (failure) => emit(PermissionState.error(
              message: 'Failed to open settings: ${failure.message}',
              permission: permission,
            )),
            (opened) => emit(PermissionState.settingsOpened(success: opened)),
          );
          return;
        }

        // Otherwise, request permission
        await _onRequestPermission(permission, emit);
      },
    );
  }

  Future<void> _onRequestBatchPermissions(
    BatchPermissionRequestConfig config,
    Emitter<PermissionState> emit,
  ) async {
    emit(const PermissionState.loading());

    final result = await _requestMultiplePermissionsUseCase(config.permissions);

    result.fold(
      (failure) => emit(PermissionState.error(
        message: failure.message,
      )),
      (multipleResult) {
        // Handle based on config
        if (!config.continueOnPartialGrant && !multipleResult.allGranted) {
          if (multipleResult.requiresSettings && config.openSettingsOnDenied) {
            _onOpenAppSettings(emit);
            return;
          }
        }

        emit(PermissionState.multiplePermissionsRequested(
          result: multipleResult,
        ));
      },
    );
  }

  Future<void> _onOpenAppSettings(Emitter<PermissionState> emit) async {
    final result = await _openAppSettingsUseCase();

    result.fold(
      (failure) => emit(PermissionState.error(
        message: failure.message,
      )),
      (success) => emit(PermissionState.settingsOpened(success: success)),
    );
  }

  Future<void> _onCheckServiceStatus(
    AppPermission permission,
    Emitter<PermissionState> emit,
  ) async {
    emit(const PermissionState.loading());

    final result = await _repository.isServiceEnabled(permission);

    result.fold(
      (failure) => emit(PermissionState.error(
        message: failure.message,
        permission: permission,
      )),
      (isEnabled) => emit(PermissionState.serviceStatusChecked(
        permission: permission,
        isEnabled: isEnabled,
      )),
    );
  }

  Future<void> _onRequestServiceEnable(
    AppPermission permission,
    Emitter<PermissionState> emit,
  ) async {
    emit(const PermissionState.loading());

    final result = await _repository.requestServiceEnable(permission);

    result.fold(
      (failure) => emit(PermissionState.error(
        message: failure.message,
        permission: permission,
      )),
      (success) => emit(PermissionState.settingsOpened(success: success)),
    );
  }
}
