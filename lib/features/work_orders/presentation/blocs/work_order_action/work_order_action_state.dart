import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/location_entity.dart';

part 'work_order_action_state.freezed.dart';

@freezed
class WorkOrderActionState with _$WorkOrderActionState {
  const factory WorkOrderActionState.initial() = _Initial;
  
  const factory WorkOrderActionState.loading() = _Loading;
  
  const factory WorkOrderActionState.loaded({
    required WorkOrderEntity workOrder,
    LocationEntity? currentLocation,
    @Default(false) bool isLocationLoading,
    @Default(false) bool isOffline,
  }) = _Loaded;
  
  const factory WorkOrderActionState.actionInProgress({
    required WorkOrderEntity workOrder,
    required String actionType, // 'start', 'pause', 'resume', 'complete', 'reject'
    LocationEntity? currentLocation,
  }) = _ActionInProgress;
  
  const factory WorkOrderActionState.actionSuccess({
    required WorkOrderEntity workOrder,
    required String actionType,
    required String message,
  }) = _ActionSuccess;
  
  const factory WorkOrderActionState.error({
    required Failure failure,
    WorkOrderEntity? workOrder,
    @Default(false) bool isOffline,
  }) = _Error;
  
  const factory WorkOrderActionState.locationError({
    required WorkOrderEntity workOrder,
    required String message,
  }) = _LocationError;
}