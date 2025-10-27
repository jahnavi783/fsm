import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';

part 'dashboard_state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  /// Initial state when dashboard loads
  const factory DashboardState.initial() = _Initial;

  /// Loading state while fetching dashboard data
  const factory DashboardState.loading() = _Loading;

  /// Loaded state with all dashboard data
  const factory DashboardState.loaded({
    // Current active work order (in progress)
    WorkOrderEntity? currentWorkOrder,

    // All work orders for list
    @Default([]) List<WorkOrderEntity> workOrders,

    // Unassigned work orders
    @Default([]) List<WorkOrderEntity> unassignedWorkOrders,

    // Status counts for summary grid
    @Default(0) int unassignedCount,
    @Default(0) int assignedCount,
    @Default(0) int inProgressCount,
    @Default(0) int pausedCount,
    @Default(0) int completedCount,

    // UI state
    @Default(0) int selectedTab,
    @Default([]) List<WorkOrderEntity> filteredWorkOrders,
    @Default(false) bool offlineBannerDismissed,

    // Search and filter state
    String? searchQuery,
    String? statusFilter,
    WorkOrderPriority? priorityFilter,

    // Network and sync state
    @Default(false) bool isOffline,
    @Default(false) bool hasPendingSync,
    @Default(false) bool isLoadingMore,
    @Default(false) bool hasReachedMax,
    @Default(1) int currentPage,
  }) = _Loaded;

  /// Error state with failure information
  const factory DashboardState.error({
    required Failure failure,
    @Default([]) List<WorkOrderEntity> workOrders,
    @Default(false) bool isOffline,
  }) = _Error;

  /// Syncing state when uploading pending changes
  const factory DashboardState.syncing({
    required List<WorkOrderEntity> workOrders,
    WorkOrderEntity? currentWorkOrder,
    @Default(0) int unassignedCount,
    @Default(0) int assignedCount,
    @Default(0) int inProgressCount,
    @Default(0) int pausedCount,
    @Default(0) int completedCount,
  }) = _Syncing;
}
