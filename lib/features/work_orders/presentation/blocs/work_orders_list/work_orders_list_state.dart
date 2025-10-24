import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';

part 'work_orders_list_state.freezed.dart';

@freezed
class WorkOrdersListState with _$WorkOrdersListState {
  const factory WorkOrdersListState.initial() = _Initial;
  
  const factory WorkOrdersListState.loading() = _Loading;
  
  const factory WorkOrdersListState.loaded({
    required List<WorkOrderEntity> workOrders,
    @Default([]) List<WorkOrderEntity> unassignedWorkOrders,
    @Default(0) int unassignedCount,
    @Default(1) int currentPage,
    @Default(false) bool hasReachedMax,
    @Default(false) bool isLoadingMore,
    WorkOrderStatus? statusFilter,
    WorkOrderPriority? priorityFilter,
    String? searchQuery,
    @Default(false) bool isOffline,
    @Default(false) bool hasPendingSync,
  }) = _Loaded;
  
  const factory WorkOrdersListState.error({
    required Failure failure,
    @Default([]) List<WorkOrderEntity> workOrders,
    @Default(false) bool isOffline,
  }) = _Error;
  
  const factory WorkOrdersListState.syncing({
    required List<WorkOrderEntity> workOrders,
  }) = _Syncing;
}