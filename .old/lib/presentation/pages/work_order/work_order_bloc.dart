import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsm_flutter/core/services/location_service.dart';
import 'package:fsm_flutter/data/client.dart';
import 'package:fsm_flutter/data/entity/work_order_entity.dart';
import 'package:fsm_flutter/data/response/wo_complete_request.dart';
import 'package:fsm_flutter/data/response/wo_reject_request.dart';
import 'package:fsm_flutter/injection.dart';

part 'work_order_event.dart';
part 'work_order_state.dart';

class WorkOrderBloc extends Bloc<WorkOrderEvent, WorkOrderState> {
  final RestClient _restClient = serviceLocator<RestClient>();
  final LocationService _locationService = serviceLocator<LocationService>();

  WorkOrderBloc(WorkOrderEntity workOrder)
      : super(WorkOrderAssignedState(workOrder: workOrder)) {
    on<StartWorkOrderEvent>(_onStartWorkOrder);
    on<PauseWorkOrderEvent>(_onPauseWorkOrder);
    on<ResumeWorkOrderEvent>(_onResumeWorkOrder);
    on<FetchWorkOrderEvent>(_onFetchWorkOrder);
    on<CompleteWorkOrderEvent>(_onCompleteWorkOrder);
    on<RejectWorkOrderEvent>(_onRejectWorkOrder);
    on<CancelWorkOrderEvent>(_onCancelWorkOrder);
  }

  Future<void> _onStartWorkOrder(
      StartWorkOrderEvent event, Emitter<WorkOrderState> emit) async {
    emit(WorkOrderLoadingState(
        workOrder: state.workOrder, message: "Starting Work Order.."));
    try {
      final res = await _restClient.startWorkOrder(
        id: event.workOrderId,
        gpsCoordinates: event.gpsCoordinates,
        files: event.files,
      );
      emit(WorkOrderInProgressState(
          workOrder: res.workOrder.copyWith(
        serviceRequest: state.workOrder.serviceRequest,
      )));
    } catch (e) {
      emit(WorkOrderAssignedState(workOrder: state.workOrder));
    }
  }

  Future<void> _onPauseWorkOrder(
      PauseWorkOrderEvent event, Emitter<WorkOrderState> emit) async {
    emit(WorkOrderLoadingState(
        workOrder: state.workOrder, message: "Pausing Work Order.."));
    try {
      final res = await _restClient.pauseWorkOrder(
        id: event.workOrderId,
        gpsCoordinates: event.gpsCoordinates,
        files: event.files,
        reason: event.reason,
      );
      emit(WorkOrderPausedState(
          workOrder: res.workOrder.copyWith(
        serviceRequest: state.workOrder.serviceRequest,
      )));
    } catch (e) {
      emit(WorkOrderInProgressState(workOrder: state.workOrder));
    }
  }

  Future<void> _onResumeWorkOrder(
      ResumeWorkOrderEvent event, Emitter<WorkOrderState> emit) async {
    emit(WorkOrderLoadingState(
        workOrder: state.workOrder, message: "Resuming Work Order.."));
    try {
      final res = await _restClient.resumeWorkOrder(
        id: event.workOrderId,
        gpsCoordinates: event.gpsCoordinates,
        files: event.files,
      );
      emit(WorkOrderInProgressState(
          workOrder: res.workOrder.copyWith(
        serviceRequest: state.workOrder.serviceRequest,
      )));
    } catch (e) {
      emit(WorkOrderPausedState(workOrder: state.workOrder));
    }
  }

  Future<void> _onFetchWorkOrder(
      FetchWorkOrderEvent event, Emitter<WorkOrderState> emit) async {
    // emit(WorkOrderLoadingState(
    //     workOrder: state.workOrder, message: "Loading Work Order.."));
    // try {
    //   final res = await _restClient.getWorkOrder(id: event.workOrderId);
    //
    //   // Determine the appropriate state based on the work order status
    //   final workOrder = res.workOrder.copyWith(
    //     serviceRequest: state.workOrder.serviceRequest,
    //   );
    //
    //   switch (workOrder.status) {
    //     case 'ASSIGNED':
    //       emit(WorkOrderAssignedState(workOrder: workOrder));
    //       break;
    //     case 'IN_PROGRESS':
    //       emit(WorkOrderInProgressState(workOrder: workOrder));
    //       break;
    //     case 'PAUSED':
    //       emit(WorkOrderPausedState(workOrder: workOrder));
    //       break;
    //     case 'COMPLETED':
    //       emit(WorkOrderCompletedState(workOrder: workOrder));
    //       break;
    //     default:
    //       emit(WorkOrderAssignedState(workOrder: workOrder));
    //   }
    // } catch (e) {
    //   emit(WorkOrderLoadingState(
    //       workOrder: state.workOrder, message: "Failed to load Work Order"));
    // }
  }

  FutureOr<void> _onCompleteWorkOrder(
      CompleteWorkOrderEvent event, Emitter<WorkOrderState> emit) async {
    emit(WorkOrderLoadingState(
        workOrder: state.workOrder, message: "Completing Work Order.."));
    try {
      final res = await _restClient.completeWorkOrder(
        id: event.workOrderId,
        gpsCoordinates: event.gpsCoordinates,
        workLog: event.comment ?? "",
        files: event.files,
        partsUsed: event.partsUsed,
      );
      emit(WorkOrderCompletedState(
          workOrder: res.workOrder.copyWith(
        serviceRequest: state.workOrder.serviceRequest,
      )));
    } catch (e) {
      emit(WorkOrderInProgressState(workOrder: state.workOrder));
    }
  }

  FutureOr<void> _onRejectWorkOrder(
      RejectWorkOrderEvent event, Emitter<WorkOrderState> emit) async {
    emit(WorkOrderLoadingState(
        workOrder: state.workOrder, message: "Rejecting Work Order.."));
    try {
      final res = await _restClient.rejectWorkOrder(
        id: event.workOrderId,
        body: WoRejectRequest(event.reason),
      );
      emit(WorkOrderRejectedState(
          workOrder: state.workOrder.copyWith(
        serviceRequest: state.workOrder.serviceRequest,
      )));
    } catch (e) {
      emit(WorkOrderAssignedState(workOrder: state.workOrder));
    }
  }

  FutureOr<void> _onCancelWorkOrder(
      CancelWorkOrderEvent event, Emitter<WorkOrderState> emit) {
    emit(WorkOrderLoadingState(
        workOrder: state.workOrder, message: "Cancelling Work Order.."));
    try {
      _restClient.rejectWorkOrder(
        id: event.workOrderId,
        body: WoRejectRequest(event.reason),
      );
      emit(WorkOrderCancelledState(
          workOrder: state.workOrder.copyWith(
        serviceRequest: state.workOrder.serviceRequest,
      )));
    } catch (e) {
      emit(WorkOrderPausedState(workOrder: state.workOrder));
    }
  }
}
