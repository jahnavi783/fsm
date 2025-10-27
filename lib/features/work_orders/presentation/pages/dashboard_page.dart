import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fsm/core/config/app_config.dart';
import 'package:fsm/core/router/app_router.gr.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/core/widgets/dashboard_sliver_app_bar.dart';
import 'package:fsm/core/widgets/stats_card.dart';
import 'package:fsm/core/widgets/custom_tab_bar.dart';
import 'package:fsm/core/widgets/dashboard_states.dart';
import 'package:fsm/core/widgets/work_order_sliver_list.dart';
import 'package:fsm/core/widgets/fsm_action_button.dart';
import 'package:fsm/core/widgets/fsm_empty_state.dart';
import 'package:fsm/core/widgets/offline_banner.dart';
import 'package:fsm/core/utils/work_order_status_helper.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_orders_list/work_orders_list_bloc.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_orders_list/work_orders_list_event.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_orders_list/work_orders_list_state.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_card.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_action_sheet.dart';

/// DashboardPage - Work Orders dashboard with tabs and statistics
///
/// Refactored to use shared components:
/// - [FSMActionButton.extended] for sync FAB
/// - [FSMEmptyState] for empty list states
/// - [OfflineBanner] for connectivity indicator
///
/// Maintains all existing functionality:
/// - Tab-based filtering (Unassigned, Assigned, In Progress, Paused, Completed)
/// - Stats grid display
/// - Pull-to-refresh
/// - Infinite scroll pagination
/// - Work order action sheets
/// - BLoC state management
@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(_onTabChanged);
    _scrollController.addListener(_onScroll);

    // Load all work orders initially without status filter
    context.read<WorkOrdersListBloc>().add(
          const WorkOrdersListEvent.loadWorkOrders(
            page: 1,
          ),
        );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    // Trigger a rebuild when tab changes to show filtered content
    if (mounted) {
      setState(() {});
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      context.read<WorkOrdersListBloc>().add(
            const WorkOrdersListEvent.loadMoreWorkOrders(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Offline/Sync Banner at top
          const OfflineBanner(),

          // Main content
          Expanded(
            child: BlocBuilder<WorkOrdersListBloc, WorkOrdersListState>(
              builder: (context, state) {
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<WorkOrdersListBloc>().add(
                          const WorkOrdersListEvent.refreshWorkOrders(),
                        );
                  },
                  child: CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      // App Bar
                      DashboardSliverAppBar(
                        showDebugButton: AppConfig.isDebug,
                        onSearch: () => _showSearchDialog(context),
                        onRefresh: () {
                          context.read<WorkOrdersListBloc>().add(
                                const WorkOrdersListEvent.refreshWorkOrders(),
                              );
                        },
                      ),

                      // Stats Cards (kept as existing - already well-designed)
                      _buildStatsGrid(state),

                      // Tab Bar (kept as existing - custom tab bar)
                      CustomTabBar(
                        controller: _tabController,
                        tabs: const [
                          'Unassigned',
                          'Assigned',
                          'In Progress',
                          'Paused',
                          'Completed'
                        ],
                      ),

                      // Current tab content
                      _buildCurrentTabContent(state),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // Refactored: Use FSMActionButton.extended for sync FAB
      floatingActionButton: BlocBuilder<WorkOrdersListBloc, WorkOrdersListState>(
        builder: (context, state) {
          // Show badge if there are pending changes
          final hasPendingSync = state.maybeWhen(
            loaded: (_, __, ___, ____, _____, ______, _______, ________, _________, __________, hasPendingSync) =>
                hasPendingSync,
            orElse: () => false,
          );

          return FSMActionButton.extended(
            icon: Icons.sync_rounded,
            label: 'Sync',
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.onPrimary,
            onPressed: () {
              context.read<WorkOrdersListBloc>().add(
                    const WorkOrdersListEvent.syncPendingWorkOrders(),
                  );
            },
            tooltip: 'Sync pending changes',
            badge: hasPendingSync
                ? Container(
                    width: 10.w,
                    height: 10.h,
                    decoration: const BoxDecoration(
                      color: AppColors.warning,
                      shape: BoxShape.circle,
                    ),
                  )
                : null,
          );
        },
      ),
    );
  }

  // Build stats grid for sliver layout (kept as existing)
  Widget _buildStatsGrid(WorkOrdersListState state) {
    final statsData = _getStatsData(state);
    return StatsGrid(statsData: statsData);
  }

  // Get stats data for each status (kept as existing)
  List<StatsCardData> _getStatsData(WorkOrdersListState state) {
    return [
      StatsCardData(
        title: 'Unassigned',
        count: _getUnassignedCount(state),
        icon: Icons.inbox_outlined,
        color: Colors.grey,
        onTap: () => _switchToTab(0),
      ),
      StatsCardData(
        title: 'Assigned',
        count: _getCountForStatus(state, WorkOrderStatus.assigned),
        icon: WorkOrderStatusHelper.getStatusIcon(WorkOrderStatus.assigned),
        color: WorkOrderStatusHelper.getStatusColor(WorkOrderStatus.assigned),
        onTap: () => _switchToTab(1),
      ),
      StatsCardData(
        title: 'In Progress',
        count: _getCountForStatus(state, WorkOrderStatus.inProgress),
        icon: WorkOrderStatusHelper.getStatusIcon(WorkOrderStatus.inProgress),
        color: WorkOrderStatusHelper.getStatusColor(WorkOrderStatus.inProgress),
        onTap: () => _switchToTab(2),
      ),
      StatsCardData(
        title: 'Paused',
        count: _getCountForStatus(state, WorkOrderStatus.paused),
        icon: WorkOrderStatusHelper.getStatusIcon(WorkOrderStatus.paused),
        color: WorkOrderStatusHelper.getStatusColor(WorkOrderStatus.paused),
        onTap: () => _switchToTab(3),
      ),
      StatsCardData(
        title: 'Completed',
        count: _getCountForStatus(state, WorkOrderStatus.completed),
        icon: WorkOrderStatusHelper.getStatusIcon(WorkOrderStatus.completed),
        color: WorkOrderStatusHelper.getStatusColor(WorkOrderStatus.completed),
        onTap: () => _switchToTab(4),
      ),
    ];
  }

  // Build current tab content based on selected tab
  Widget _buildCurrentTabContent(WorkOrdersListState state) {
    final currentIndex = _tabController.index;

    // First tab (index 0) is for unassigned work orders
    if (currentIndex == 0) {
      return _buildUnassignedWorkOrdersSliver(state);
    }

    // Remaining tabs map to statuses (shifted by 1)
    final statuses = [
      WorkOrderStatus.assigned,
      WorkOrderStatus.inProgress,
      WorkOrderStatus.paused,
      WorkOrderStatus.completed,
    ];

    final currentStatus = statuses[currentIndex - 1];
    return _buildWorkOrdersSliver(currentStatus, state);
  }

  // Switch to specific tab (frontend filtering only)
  void _switchToTab(int index) {
    _tabController.animateTo(index);
  }

  Widget _buildWorkOrdersSliver(
      WorkOrderStatus status, WorkOrdersListState state) {
    return state.when(
      initial: () => const LoadingState(),
      loading: () => const LoadingState(),
      loaded: (workOrders,
          unassignedWorkOrders,
          unassignedCount,
          currentPage,
          hasReachedMax,
          isLoadingMore,
          statusFilter,
          priorityFilter,
          searchQuery,
          isOffline,
          hasPendingSync) {
        // Filter work orders by current tab status
        final filteredWorkOrders =
            workOrders.where((wo) => wo.status == status).toList();

        if (filteredWorkOrders.isEmpty) {
          return _buildEmptyStateSliver(status);
        }

        return SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          sliver: WorkOrderSliverList(
            workOrders: filteredWorkOrders,
            isLoadingMore: isLoadingMore,
            itemBuilder: (workOrder) => WorkOrderCard(
              workOrder: workOrder,
              onTap: () {
                context.router
                    .push(WorkOrderDetailsRoute(workOrderId: workOrder.id));
              },
              onActionTap: () {
                _showWorkOrderActions(workOrder);
              },
            ),
          ),
        );
      },
      error: (failure, workOrders, isOffline) => ErrorState(
        message: failure.message,
        isOffline: isOffline,
        onRetry: () {
          context.read<WorkOrdersListBloc>().add(
                const WorkOrdersListEvent.refreshWorkOrders(),
              );
        },
      ),
      syncing: (workOrders) => const SyncingState(),
    );
  }

  // Refactored: Use FSMEmptyStateList for empty states
  Widget _buildEmptyStateSliver(WorkOrderStatus status) {
    final emptyStateInfo = WorkOrderStatusHelper.getEmptyStateInfo(status);

    return FSMEmptyStateList(
      icon: emptyStateInfo['icon'],
      title: emptyStateInfo['title'],
      description: emptyStateInfo['subtitle'],
      iconColor: emptyStateInfo['color'],
      actionLabel: 'Refresh',
      onAction: () {
        context.read<WorkOrdersListBloc>().add(
              const WorkOrdersListEvent.refreshWorkOrders(),
            );
      },
    );
  }

  void _showWorkOrderActions(WorkOrderEntity workOrder) {
    WorkOrderActionSheet.show(
      context,
      workOrder: workOrder,
      onStart: workOrder.canBeStarted
          ? () {
              _handleWorkOrderAction(context, workOrder, 'start');
            }
          : null,
      onPause: workOrder.canBePaused
          ? () {
              _handleWorkOrderAction(context, workOrder, 'pause');
            }
          : null,
      onResume: workOrder.canBeResumed
          ? () {
              _handleWorkOrderAction(context, workOrder, 'resume');
            }
          : null,
      onComplete: workOrder.canBeCompleted
          ? () {
              _handleWorkOrderAction(context, workOrder, 'complete');
            }
          : null,
      onReject: workOrder.canBeRejected
          ? () {
              _handleWorkOrderAction(context, workOrder, 'reject');
            }
          : null,
      onViewDetails: () {
        context.router.push(WorkOrderDetailsRoute(workOrderId: workOrder.id));
      },
    );
  }

  String _getCountForStatus(WorkOrdersListState state, WorkOrderStatus status) {
    return state.maybeWhen(
      loaded: (workOrders, _, __, ___, ____, _____, ______, _______, ________, _________, __________) {
        return workOrders.where((wo) => wo.status == status).length.toString();
      },
      orElse: () => '-',
    );
  }

  String _getUnassignedCount(WorkOrdersListState state) {
    return state.maybeWhen(
      loaded: (_, __, unassignedCount, ___, ____, _____, ______, _______, ________, _________, __________) {
        return unassignedCount.toString();
      },
      orElse: () => '-',
    );
  }

  Widget _buildUnassignedWorkOrdersSliver(WorkOrdersListState state) {
    return state.when(
      initial: () => const LoadingState(),
      loading: () => const LoadingState(),
      loaded: (workOrders,
          unassignedWorkOrders,
          unassignedCount,
          currentPage,
          hasReachedMax,
          isLoadingMore,
          statusFilter,
          priorityFilter,
          searchQuery,
          isOffline,
          hasPendingSync) {
        if (unassignedWorkOrders.isEmpty) {
          // Refactored: Use FSMEmptyState for unassigned empty state
          return const FSMEmptyStateList(
            icon: Icons.inbox_outlined,
            title: 'No Unassigned Work Orders',
            description: 'All work orders have been assigned to field engineers.',
            iconColor: AppColors.grey400,
          );
        }

        return SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final workOrder = unassignedWorkOrders[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: Column(
                    children: [
                      WorkOrderCard(
                        workOrder: workOrder,
                        onTap: () {
                          context.router
                              .push(WorkOrderDetailsRoute(workOrderId: workOrder.id));
                        },
                      ),
                      SizedBox(height: 8.h),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () => _assignWorkOrderToSelf(workOrder.id),
                          icon: Icon(Icons.person_add, size: 18.sp),
                          label: Text('Assign to Me', style: TextStyle(fontSize: 14.sp)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: AppColors.onPrimary,
                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: unassignedWorkOrders.length,
            ),
          ),
        );
      },
      error: (failure, workOrders, isOffline) => ErrorState(
        message: failure.message,
        isOffline: isOffline,
        onRetry: () {
          context.read<WorkOrdersListBloc>().add(
                const WorkOrdersListEvent.refreshWorkOrders(),
              );
        },
      ),
      syncing: (workOrders) => const LoadingState(),
    );
  }

  void _assignWorkOrderToSelf(int workOrderId) {
    // Capture the outer context that has access to the WorkOrdersListBloc
    final outerContext = context;

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Assign Work Order'),
        content: const Text('Are you sure you want to assign this work order to yourself?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              // Use the captured outer context instead
              outerContext.read<WorkOrdersListBloc>().add(
                    WorkOrdersListEvent.assignWorkOrderToSelf(
                      workOrderId: workOrderId,
                    ),
                  );
              // Switch to Assigned tab after assignment
              _switchToTab(1);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.onPrimary,
            ),
            child: const Text('Assign'),
          ),
        ],
      ),
    );
  }

  void _showSearchDialog(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    // Capture the outer context that has access to the WorkOrdersListBloc
    final outerContext = context;

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Search Work Orders'),
        content: TextField(
          controller: searchController,
          decoration: const InputDecoration(
            hintText: 'Enter work order number or description...',
            prefixIcon: Icon(Icons.search),
          ),
          autofocus: true,
          onSubmitted: (query) {
            Navigator.of(dialogContext).pop();
            if (query.isNotEmpty) {
              outerContext.read<WorkOrdersListBloc>().add(
                    WorkOrdersListEvent.searchWorkOrders(query),
                  );
            }
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              final query = searchController.text.trim();
              if (query.isNotEmpty) {
                outerContext.read<WorkOrdersListBloc>().add(
                      WorkOrdersListEvent.searchWorkOrders(query),
                    );
              }
            },
            child: const Text('Search'),
          ),
        ],
      ),
    );
  }

  void _handleWorkOrderAction(
      BuildContext context, WorkOrderEntity workOrder, String action) {
    // Navigate to work order details page where the actual action will be performed
    // This ensures we have the WorkOrderActionBloc available and can capture GPS location
    context.router.push(WorkOrderDetailsRoute(workOrderId: workOrder.id));

    // Show a snackbar to inform the user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            Text('Navigate to work order details to $action the work order'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
