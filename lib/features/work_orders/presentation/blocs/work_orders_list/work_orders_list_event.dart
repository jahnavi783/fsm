import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';

part 'work_orders_list_event.freezed.dart';

@freezed
class WorkOrdersListEvent with _$WorkOrdersListEvent {
  const factory WorkOrdersListEvent.loadWorkOrders({
    @Default(1) int page,
    @Default(20) int limit,
    WorkOrderStatus? status,
    WorkOrderPriority? priority,
    String? searchQuery,
    @Default(false) bool isRefresh,
  }) = _LoadWorkOrders;

  const factory WorkOrdersListEvent.loadMoreWorkOrders() = _LoadMoreWorkOrders;

  const factory WorkOrdersListEvent.refreshWorkOrders() = _RefreshWorkOrders;

  const factory WorkOrdersListEvent.filterByStatus(WorkOrderStatus? status) =
      _FilterByStatus;

  const factory WorkOrdersListEvent.filterByPriority(
      WorkOrderPriority? priority) = _FilterByPriority;

  const factory WorkOrdersListEvent.searchWorkOrders(String query) =
      _SearchWorkOrders;

  const factory WorkOrdersListEvent.clearFilters() = _ClearFilters;

  const factory WorkOrdersListEvent.syncPendingWorkOrders() =
      _SyncPendingWorkOrders;

  const factory WorkOrdersListEvent.assignWorkOrderToSelf({
    required int workOrderId,
  }) = _AssignWorkOrderToSelf;

  /// ⭐ REQUIRED FOR OFFLINE AUTO REFRESH
  const factory WorkOrdersListEvent.refreshAfterSync() = _RefreshAfterSync;
}
