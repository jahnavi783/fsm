import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsm_flutter/core/services/location_service.dart';
import 'package:fsm_flutter/data/client.dart';
import 'package:fsm_flutter/data/entity/work_order_entity.dart';
import 'package:fsm_flutter/data/response/wo_complete_request.dart';
import 'package:fsm_flutter/injection.dart';

part 'work_order_job_state.dart';

class WorkOrderJobCubit extends Cubit<WorkOrderJobState> {
  WorkOrderJobCubit() : super(WorkOrderJobInitial());
  final RestClient _restClient = serviceLocator<RestClient>();
  final LocationService _locationService = serviceLocator<LocationService>();

  Future<void> viewWorkOrderDetails(int requestId) async {
    emit(ViewWorkOrderLoadingState());
    try {
      final response = await _restClient.getWorkOrderById(requestId);

      emit(ViewWorkOrderSuccessState(workDetailsModel: response.workOrder));
    } catch (e) {
      return emit(ViewWorkOrderErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> startWorkOrder(
      {required int workOrderId, List<File> files = const []}) async {
    emit(Loading());
    try {
      /**
       * Capture the current GPS coordinates of the user
       */
      final locationData = await _locationService.getCurrentLocation();
      final gpsCoordinates =
          "${locationData.latitude},${locationData.longitude}";
      /**
       * Start the work order with the captured GPS coordinates and any files
       */
      await _restClient.startWorkOrder(
          id: workOrderId, gpsCoordinates: gpsCoordinates, files: files);
      emit(StartJobSuccessState(message: "Work order started successfully"));
    } catch (e) {
      return emit(StartJobErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> pauseWorkOrder(int requestId, String comment) async {
    emit(Loading());
    try {
      final locationData = await _locationService.getCurrentLocation();
      final gpsCoordinates =
          "${locationData.latitude},${locationData.longitude}";
      await _restClient.pauseWorkOrder(
          reason: comment,
          id: requestId,
          gpsCoordinates: gpsCoordinates,
          files: []);
      emit(StartJobSuccessState(message: "Work order paused successfully"));
    } catch (e) {
      return emit(StartJobErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> resumeWorkOrder(int requestId) async {
    emit(Loading());

    try {
      // await _restClient.resumeWorkOrder(requestId);
      emit(StartJobSuccessState(message: "Work order resumed successfully"));
    } catch (e) {
      return emit(StartJobErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> completeWorkOrder(
      int requestId, WoCompleteRequest request) async {
    emit(Loading());
    try {
      // await _restClient.completeWorkOrder(requestId, request);
      emit(StartJobSuccessState(message: "Work order completed successfully"));
    } catch (e) {
      return emit(StartJobErrorState(errorMessage: e.toString()));
    }
  }
}
