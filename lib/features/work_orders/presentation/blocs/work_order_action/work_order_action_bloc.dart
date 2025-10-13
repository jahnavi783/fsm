import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:fsm/core/network/network_info.dart';
import 'package:fsm/core/services/location_service.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/location_entity.dart';
import 'package:fsm/features/work_orders/domain/usecases/get_work_order_details_usecase.dart';
import 'package:fsm/features/work_orders/domain/usecases/start_work_order_usecase.dart';
import 'package:fsm/features/work_orders/domain/usecases/pause_work_order_usecase.dart';
import 'package:fsm/features/work_orders/domain/usecases/resume_work_order_usecase.dart';
import 'package:fsm/features/work_orders/domain/usecases/complete_work_order_usecase.dart';
import 'package:fsm/features/work_orders/domain/usecases/reject_work_order_usecase.dart';
import 'work_order_action_event.dart';
import 'work_order_action_state.dart';

@injectable
class WorkOrderActionBloc
    extends Bloc<WorkOrderActionEvent, WorkOrderActionState> {
  final GetWorkOrderDetailsUseCase _getWorkOrderDetailsUseCase;
  final StartWorkOrderUseCase _startWorkOrderUseCase;
  final PauseWorkOrderUseCase _pauseWorkOrderUseCase;
  final ResumeWorkOrderUseCase _resumeWorkOrderUseCase;
  final CompleteWorkOrderUseCase _completeWorkOrderUseCase;
  final RejectWorkOrderUseCase _rejectWorkOrderUseCase;
  final LocationService _locationService;
  final NetworkInfo _networkInfo;

  WorkOrderActionBloc(
    this._getWorkOrderDetailsUseCase,
    this._startWorkOrderUseCase,
    this._pauseWorkOrderUseCase,
    this._resumeWorkOrderUseCase,
    this._completeWorkOrderUseCase,
    this._rejectWorkOrderUseCase,
    this._locationService,
    this._networkInfo,
  ) : super(const WorkOrderActionState.initial()) {
    on<WorkOrderActionEvent>(_onWorkOrderActionEvent);
  }

  Future<void> _onWorkOrderActionEvent(
    WorkOrderActionEvent event,
    Emitter<WorkOrderActionState> emit,
  ) async {
    await event.when(
      loadWorkOrder: (workOrderId) => _loadWorkOrder(workOrderId, emit),
      startWorkOrder: (workOrderId, latitude, longitude, files, notes) =>
          _startWorkOrder(workOrderId, latitude, longitude, files, notes, emit),
      pauseWorkOrder: (workOrderId, reason, latitude, longitude, files) =>
          _pauseWorkOrder(
              workOrderId, reason, latitude, longitude, files, emit),
      resumeWorkOrder: (workOrderId, latitude, longitude, files, notes) =>
          _resumeWorkOrder(
              workOrderId, latitude, longitude, files, notes, emit),
      completeWorkOrder: (workOrderId, workLog, partsUsed, files, latitude,
              longitude, completionNotes) =>
          _completeWorkOrder(workOrderId, workLog, partsUsed, files, latitude,
              longitude, completionNotes, emit),
      rejectWorkOrder: (workOrderId, reason, latitude, longitude) =>
          _rejectWorkOrder(workOrderId, reason, latitude, longitude, emit),
      captureLocation: () => _captureLocation(emit),
      clearError: () => _clearError(emit),
    );
  }

  Future<void> _loadWorkOrder(
    int workOrderId,
    Emitter<WorkOrderActionState> emit,
  ) async {
    emit(const WorkOrderActionState.loading());

    final isConnected = await _networkInfo.isConnected;
    final result = await _getWorkOrderDetailsUseCase(workOrderId);

    result.fold(
      (failure) {
        emit(WorkOrderActionState.error(
          failure: failure,
          isOffline: !isConnected,
        ));
      },
      (workOrder) {
        emit(WorkOrderActionState.loaded(
          workOrder: workOrder,
          isOffline: !isConnected,
        ));

        // Automatically capture location when work order is loaded
        add(const WorkOrderActionEvent.captureLocation());
      },
    );
  }

  Future<void> _startWorkOrder(
    int workOrderId,
    double latitude,
    double longitude,
    List<File> files,
    String? notes,
    Emitter<WorkOrderActionState> emit,
  ) async {
    final currentState = state;

    final workOrder = currentState.maybeWhen(
      loaded: (workOrder, _, __, ___) => workOrder,
      orElse: () => null,
    );
    if (workOrder == null) return;

    final currentLocation = currentState.maybeWhen(
      loaded: (_, currentLocation, __, ___) => currentLocation,
      orElse: () => null,
    );

    emit(WorkOrderActionState.actionInProgress(
      workOrder: workOrder,
      actionType: 'start',
      currentLocation: currentLocation,
    ));

    final result = await _startWorkOrderUseCase(StartWorkOrderParams(
      workOrderId: workOrderId,
      latitude: latitude,
      longitude: longitude,
      files: files,
      notes: notes,
    ));

    result.fold(
      (failure) {
        emit(WorkOrderActionState.error(
          failure: failure,
          workOrder: workOrder,
        ));
      },
      (updatedWorkOrder) {
        emit(WorkOrderActionState.actionSuccess(
          workOrder: updatedWorkOrder,
          actionType: 'start',
          message: 'Work order started successfully',
        ));
      },
    );
  }

  Future<void> _pauseWorkOrder(
    int workOrderId,
    String reason,
    double latitude,
    double longitude,
    List<File> files,
    Emitter<WorkOrderActionState> emit,
  ) async {
    final currentState = state;

    final workOrder = currentState.maybeWhen(
      loaded: (workOrder, _, __, ___) => workOrder,
      orElse: () => null,
    );
    if (workOrder == null) return;

    final currentLocation = currentState.maybeWhen(
      loaded: (_, currentLocation, __, ___) => currentLocation,
      orElse: () => null,
    );

    emit(WorkOrderActionState.actionInProgress(
      workOrder: workOrder,
      actionType: 'pause',
      currentLocation: currentLocation,
    ));

    final result = await _pauseWorkOrderUseCase(PauseWorkOrderParams(
      workOrderId: workOrderId,
      reason: reason,
      latitude: latitude,
      longitude: longitude,
      files: files,
    ));

    result.fold(
      (failure) {
        emit(WorkOrderActionState.error(
          failure: failure,
          workOrder: workOrder,
        ));
      },
      (updatedWorkOrder) {
        emit(WorkOrderActionState.actionSuccess(
          workOrder: updatedWorkOrder,
          actionType: 'pause',
          message: 'Work order paused successfully',
        ));
      },
    );
  }

  Future<void> _resumeWorkOrder(
    int workOrderId,
    double latitude,
    double longitude,
    List<File> files,
    String? notes,
    Emitter<WorkOrderActionState> emit,
  ) async {
    final currentState = state;

    final workOrder = currentState.maybeWhen(
      loaded: (workOrder, _, __, ___) => workOrder,
      orElse: () => null,
    );
    if (workOrder == null) return;

    final currentLocation = currentState.maybeWhen(
      loaded: (_, currentLocation, __, ___) => currentLocation,
      orElse: () => null,
    );

    emit(WorkOrderActionState.actionInProgress(
      workOrder: workOrder,
      actionType: 'resume',
      currentLocation: currentLocation,
    ));

    final result = await _resumeWorkOrderUseCase(ResumeWorkOrderParams(
      workOrderId: workOrderId,
      latitude: latitude,
      longitude: longitude,
      files: files,
      notes: notes,
    ));

    result.fold(
      (failure) {
        emit(WorkOrderActionState.error(
          failure: failure,
          workOrder: workOrder,
        ));
      },
      (updatedWorkOrder) {
        emit(WorkOrderActionState.actionSuccess(
          workOrder: updatedWorkOrder,
          actionType: 'resume',
          message: 'Work order resumed successfully',
        ));
      },
    );
  }

  Future<void> _completeWorkOrder(
    int workOrderId,
    String workLog,
    List<PartUsedEntity> partsUsed,
    List<File> files,
    double latitude,
    double longitude,
    String? completionNotes,
    Emitter<WorkOrderActionState> emit,
  ) async {
    final currentState = state;

    final workOrder = currentState.maybeWhen(
      loaded: (workOrder, _, __, ___) => workOrder,
      orElse: () => null,
    );
    if (workOrder == null) return;

    final currentLocation = currentState.maybeWhen(
      loaded: (_, currentLocation, __, ___) => currentLocation,
      orElse: () => null,
    );

    emit(WorkOrderActionState.actionInProgress(
      workOrder: workOrder,
      actionType: 'complete',
      currentLocation: currentLocation,
    ));

    final result = await _completeWorkOrderUseCase(CompleteWorkOrderParams(
      workOrderId: workOrderId,
      workLog: workLog,
      partsUsed: partsUsed,
      files: files,
      latitude: latitude,
      longitude: longitude,
      completionNotes: completionNotes,
    ));

    result.fold(
      (failure) {
        emit(WorkOrderActionState.error(
          failure: failure,
          workOrder: workOrder,
        ));
      },
      (updatedWorkOrder) {
        emit(WorkOrderActionState.actionSuccess(
          workOrder: updatedWorkOrder,
          actionType: 'complete',
          message: 'Work order completed successfully',
        ));
      },
    );
  }

  Future<void> _rejectWorkOrder(
    int workOrderId,
    String reason,
    double latitude,
    double longitude,
    Emitter<WorkOrderActionState> emit,
  ) async {
    final currentState = state;

    final workOrder = currentState.maybeWhen(
      loaded: (workOrder, _, __, ___) => workOrder,
      orElse: () => null,
    );
    if (workOrder == null) return;

    final currentLocation = currentState.maybeWhen(
      loaded: (_, currentLocation, __, ___) => currentLocation,
      orElse: () => null,
    );

    emit(WorkOrderActionState.actionInProgress(
      workOrder: workOrder,
      actionType: 'reject',
      currentLocation: currentLocation,
    ));

    final result = await _rejectWorkOrderUseCase(RejectWorkOrderParams(
      workOrderId: workOrderId,
      reason: reason,
      latitude: latitude,
      longitude: longitude,
    ));

    result.fold(
      (failure) {
        emit(WorkOrderActionState.error(
          failure: failure,
          workOrder: workOrder,
        ));
      },
      (updatedWorkOrder) {
        emit(WorkOrderActionState.actionSuccess(
          workOrder: updatedWorkOrder,
          actionType: 'reject',
          message: 'Work order rejected successfully',
        ));
      },
    );
  }

  Future<void> _captureLocation(Emitter<WorkOrderActionState> emit) async {
    final currentState = state;

    final workOrder = currentState.maybeWhen(
      loaded: (workOrder, _, __, ___) => workOrder,
      orElse: () => null,
    );
    if (workOrder == null) return;

    emit(currentState.maybeWhen(
      loaded: (workOrder, currentLocation, _, isOffline) =>
          WorkOrderActionState.loaded(
        workOrder: workOrder,
        currentLocation: currentLocation,
        isLocationLoading: true,
        isOffline: isOffline,
      ),
      orElse: () => currentState,
    ));

    try {
      final LocationData position = await _locationService.getCurrentLocation();
      final location = LocationEntity(
        latitude: position.latitude!,
        longitude: position.longitude!,
        accuracy: position.accuracy,
        capturedAt: DateTime.now(),
      );

      emit(currentState.maybeWhen(
        loaded: (workOrder, _, __, isOffline) => WorkOrderActionState.loaded(
          workOrder: workOrder,
          currentLocation: location,
          isLocationLoading: false,
          isOffline: isOffline,
        ),
        orElse: () => currentState,
      ));
    } catch (e) {
      emit(WorkOrderActionState.locationError(
        workOrder: workOrder,
        message: 'Failed to capture location: ${e.toString()}',
      ));
    }
  }

  Future<void> _clearError(Emitter<WorkOrderActionState> emit) async {
    final currentState = state;

    currentState.maybeWhen(
      error: (failure, workOrder, isOffline) {
        if (workOrder != null) {
          emit(WorkOrderActionState.loaded(
            workOrder: workOrder,
            isOffline: isOffline,
          ));
        }
      },
      locationError: (workOrder, message) {
        emit(WorkOrderActionState.loaded(workOrder: workOrder));
      },
      orElse: () {},
    );
  }
}
