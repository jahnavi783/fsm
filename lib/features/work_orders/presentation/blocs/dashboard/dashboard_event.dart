import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_event.freezed.dart';

@freezed
class DashboardEvent with _$DashboardEvent {
  /// Load all dashboard data (work orders, counts, current WO)
  const factory DashboardEvent.loadDashboard() = _LoadDashboard;

  /// Filter work orders by status (from status grid tap)
  const factory DashboardEvent.filterByStatus(String status) = _FilterByStatus;

  /// Select tab in work order list
  const factory DashboardEvent.selectTab(int tabIndex) = _SelectTab;

  /// Refresh all dashboard data (pull-to-refresh)
  const factory DashboardEvent.refreshDashboard() = _RefreshDashboard;

  /// Dismiss offline banner
  const factory DashboardEvent.dismissOfflineBanner() = _DismissOfflineBanner;

  /// Search work orders
  const factory DashboardEvent.searchWorkOrders(String query) =
      _SearchWorkOrders;

  /// Clear search and filters
  const factory DashboardEvent.clearFilters() = _ClearFilters;

  /// Sync pending work orders
  const factory DashboardEvent.syncPendingWorkOrders() = _SyncPendingWorkOrders;

  /// Assign work order to current user
  const factory DashboardEvent.assignWorkOrderToSelf({
    required int workOrderId,
  }) = _AssignWorkOrderToSelf;

  /// Start work order
  const factory DashboardEvent.startWorkOrder({
    required int workOrderId,
  }) = _StartWorkOrder;

  /// Pause work order
  const factory DashboardEvent.pauseWorkOrder({
    required int workOrderId,
  }) = _PauseWorkOrder;

  /// Resume work order
  const factory DashboardEvent.resumeWorkOrder({
    required int workOrderId,
  }) = _ResumeWorkOrder;

  /// Complete work order
  const factory DashboardEvent.completeWorkOrder({
    required int workOrderId,
  }) = _CompleteWorkOrder;
}
