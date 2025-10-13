import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsm_flutter/data/client.dart';
import 'package:fsm_flutter/data/entity/work_order_entity.dart';
import 'package:fsm_flutter/injection.dart' show serviceLocator;

part 'fsm_work_orders_state.dart';

class FsmWorkOrdersCubit extends Cubit<FsmWorkOrdersState> {
  FsmWorkOrdersCubit() : super(FsmWorkOrderInitial());
  final RestClient _restClient = serviceLocator<RestClient>();

  // Track loaded statuses to avoid unnecessary API calls
  final Set<WorkOrderStatus> _loadedStatuses = {};

  Future<void> workOrder(int page, int limit, WorkOrderStatus status) async {
    // If we already have data for this status, don't reload unless forced
    if (_loadedStatuses.contains(status)) {
      if (state is FsmWorkOrdersSuccess) {
        final currentState = state as FsmWorkOrdersSuccess;
        emit(currentState.copyWith(activeStatus: status));
        return;
      }
    }

    // If we're already in a loading state for this status, don't request again
    if (state is FsmWorkOrdersLoading &&
        (state as FsmWorkOrdersLoading).status == status) {
      return;
    }

    emit(FsmWorkOrdersLoading(status: status));
    try {
      final response = await _restClient.getWorkOrders(
        page: page,
        limit: limit,
      );

      // Prepare the work order map
      Map<WorkOrderStatus, List<WorkOrderEntity>> workOrderMap;

      // If we already have a successful state, preserve the existing data
      if (state is FsmWorkOrdersSuccess) {
        workOrderMap = Map.from((state as FsmWorkOrdersSuccess).workOrderMap);
      } else {
        workOrderMap = {
          WorkOrderStatus.assigned: [],
          WorkOrderStatus.inProgress: [],
          WorkOrderStatus.paused: [],
          WorkOrderStatus.completed: [],
          WorkOrderStatus.created: [], // Including 'New' status
        };
      }

      // Process all work orders and sort them by status
      for (var workOrder in response.workOrders) {
        // Make sure we have an entry for this status
        if (!workOrderMap.containsKey(workOrder.status)) {
          workOrderMap[workOrder.status] = [];
        }

        // Add the work order to the appropriate status list
        workOrderMap[workOrder.status]!.add(workOrder);

        // If the work order is reassigned, add it to the assigned work order list
        if (workOrder.status == WorkOrderStatus.reAssigned) {
          workOrderMap[WorkOrderStatus.assigned]!.add(workOrder);
        }
      }

      // Mark this status as loaded
      _loadedStatuses.add(status);

      emit(FsmWorkOrdersSuccess(
        workOrderMap: workOrderMap,
        activeStatus: status,
        page: response.page,
        total: response.total,
      ));
    } catch (e) {
      debugPrint("Error:--------- $e");
      return emit(FsmWorkOrdersFailure(error: e.toString(), status: status));
    }
  }

  // Method to refresh data for the current active status
  Future<void> refreshWorkOrders(
      int page, int limit, WorkOrderStatus status) async {
    // Remove this status from loaded statuses to force a reload
    _loadedStatuses.remove(status);

    // Show loading state with refresh flag
    emit(FsmWorkOrdersLoading(status: status, isRefreshing: true));

    try {
      final response = await _restClient.getWorkOrders(
        page: page,
        limit: limit,
      );

      // Prepare the work order map
      Map<WorkOrderStatus, List<WorkOrderEntity>> workOrderMap;

      // If we already have a successful state, preserve the existing data
      if (state is FsmWorkOrdersSuccess) {
        workOrderMap = Map.from((state as FsmWorkOrdersSuccess).workOrderMap);
      } else {
        workOrderMap = {
          WorkOrderStatus.assigned: [],
          WorkOrderStatus.inProgress: [],
          WorkOrderStatus.paused: [],
          WorkOrderStatus.completed: [],
          WorkOrderStatus.created: [],
        };
      }

      // Clear existing data for all statuses
      for (var entry in workOrderMap.entries) {
        workOrderMap[entry.key] = [];
      }

      // Process all work orders and sort them by status
      for (var workOrder in response.workOrders) {
        // Make sure we have an entry for this status
        if (!workOrderMap.containsKey(workOrder.status)) {
          workOrderMap[workOrder.status] = [];
        }

        // Add the work order to the appropriate status list
        workOrderMap[workOrder.status]!.add(workOrder);

        // If the work order is reassigned, add it to the assigned work order list
        if (workOrder.status == WorkOrderStatus.reAssigned) {
          workOrderMap[WorkOrderStatus.assigned]!.add(workOrder);
        }
      }

      // Mark this status as loaded
      _loadedStatuses.add(status);

      emit(FsmWorkOrdersSuccess(
        workOrderMap: workOrderMap,
        activeStatus: status,
        page: response.page,
        total: response.total,
      ));

      return;
    } catch (e) {
      debugPrint("Error during refresh: $e");
      // If refresh fails, we should still show existing data
      if (state is FsmWorkOrdersSuccess) {
        final currentState = state as FsmWorkOrdersSuccess;
        emit(currentState.copyWith(activeStatus: status));
      } else {
        emit(FsmWorkOrdersFailure(error: e.toString(), status: status));
      }
    }
  }
}
