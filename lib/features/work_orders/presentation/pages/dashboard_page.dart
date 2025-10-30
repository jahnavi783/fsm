import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';
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
import 'package:fsm/features/work_orders/presentation/widgets/current_work_order_card.dart';

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
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
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
                        onSearch: () => _showSearchDialog(context),
                        onNotifications: () {
                          // TODO: Navigate to notifications page when implemented
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Notifications coming soon!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        notificationCount: 0, // TODO: Get from state/BLoC
                      ),

                      // Stats Cards (kept as existing - already well-designed)
                      _buildStatsGrid(state),

                      // Current Work Order Card (for in-progress WO)
                      _buildCurrentWorkOrderCard(state),

                      // Tab Bar - 4 tabs (Unassigned, Assigned, Paused, Completed)
                      CustomTabBar(
                        controller: _tabController,
                        tabs: const [
                          'Unassigned',
                          'Assigned',
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
      // Simple AI Chatbot FAB (bottom-right)
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Navigate to chatbot page when implemented
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('AI Assistant coming soon!'),
              duration: Duration(seconds: 2),
            ),
          );
        },
        icon: const Icon(Icons.smart_toy),
        label: const Text('AI Assistant'),
        backgroundColor: AppColors.secondary,
        foregroundColor: Colors.white,
        elevation: 6,
        tooltip: 'Open AI Assistant',
      ),
    );
  }

  // Build stats grid for sliver layout
  Widget _buildStatsGrid(WorkOrdersListState state) {
    final statsData = _getStatsData(state);
    return StatsGrid(statsData: statsData);
  }

  // Build Current Work Order Card (for in-progress work order)
  Widget _buildCurrentWorkOrderCard(WorkOrdersListState state) {
    return state.maybeWhen(
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
        // Find the current in-progress work order
        final inProgressWorkOrders = workOrders
            .where((wo) => wo.status == WorkOrderStatus.inProgress)
            .toList();

        // Only show if there's exactly 1 in-progress work order
        if (inProgressWorkOrders.length == 1) {
          final workOrder = inProgressWorkOrders.first;
          return SliverToBoxAdapter(
            child: CurrentWorkOrderCard(
              workOrder: workOrder,
              onPause: workOrder.canBePaused
                  ? () => _handleWorkOrderAction(context, workOrder, 'pause')
                  : null,
              onParts: () {
                // TODO: Navigate to parts screen filtered for this WO
                context.router
                    .push(WorkOrderDetailsRoute(workOrderId: workOrder.id));
              },
              onDocs: () {
                // TODO: Navigate to documents screen filtered for this WO
                context.router
                    .push(WorkOrderDetailsRoute(workOrderId: workOrder.id));
              },
              onComplete: workOrder.canBeCompleted
                  ? () => _handleWorkOrderAction(context, workOrder, 'complete')
                  : null,
              onTap: () {
                context.router
                    .push(WorkOrderDetailsRoute(workOrderId: workOrder.id));
              },
            ),
          );
        }

        // Hide card if no in-progress work order or multiple (edge case)
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
      orElse: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
    );
  }

  // Get stats data for each status - 2x2 grid (4 cards only)
  List<StatsCardData> _getStatsData(WorkOrdersListState state) {
    return [
      StatsCardData(
        title: 'Unassigned',
        count: _getUnassignedCount(state),
        icon: Icons.inbox_outlined,
        color: AppColors.grey600,
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
        title: 'Paused',
        count: _getCountForStatus(state, WorkOrderStatus.paused),
        icon: WorkOrderStatusHelper.getStatusIcon(WorkOrderStatus.paused),
        color: WorkOrderStatusHelper.getStatusColor(WorkOrderStatus.paused),
        onTap: () => _switchToTab(2),
      ),
      StatsCardData(
        title: 'Completed',
        count: _getCountForStatus(state, WorkOrderStatus.completed),
        icon: WorkOrderStatusHelper.getStatusIcon(WorkOrderStatus.completed),
        color: WorkOrderStatusHelper.getStatusColor(WorkOrderStatus.completed),
        onTap: () => _switchToTab(3),
      ),
    ];
  }

  // Build current tab content based on selected tab (4 tabs)
  Widget _buildCurrentTabContent(WorkOrdersListState state) {
    final currentIndex = _tabController.index;

    // Map tab indices to their respective build functions
    switch (currentIndex) {
      case 0:
        // Unassigned tab
        return _buildUnassignedWorkOrdersSliver(state);
      case 1:
        // Assigned tab
        return _buildWorkOrdersSliver(WorkOrderStatus.assigned, state);
      case 2:
        // Paused tab
        return _buildWorkOrdersSliver(WorkOrderStatus.paused, state);
      case 3:
        // Completed tab
        return _buildWorkOrdersSliver(WorkOrderStatus.completed, state);
      default:
        return _buildUnassignedWorkOrdersSliver(state);
    }
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

        // Use WorkOrderSliverList with proper width constraints.
        // Do NOT wrap in SliverPadding - the items handle their own width via SizedBox.
        // Apply horizontal padding at the item level in the itemBuilder to avoid
        // infinite width constraint errors that occur with SliverPadding + SliverList.
        return WorkOrderSliverList(
          workOrders: filteredWorkOrders,
          isLoadingMore: isLoadingMore,
          itemBuilder: (workOrder) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: WorkOrderCard(
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
      loaded: (workOrders, _, __, ___, ____, _____, ______, _______, ________,
          _________, __________) {
        return workOrders.where((wo) => wo.status == status).length.toString();
      },
      orElse: () => '-',
    );
  }

  String _getUnassignedCount(WorkOrdersListState state) {
    return state.maybeWhen(
      loaded: (_, __, unassignedCount, ___, ____, _____, ______, _______,
          ________, _________, __________) {
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
          // Use FSMEmptyStateList for unassigned empty state
          return const FSMEmptyStateList(
            icon: Icons.inbox_outlined,
            title: 'No Unassigned Work Orders',
            description:
                'All work orders have been assigned to field engineers.',
            iconColor: AppColors.grey400,
          );
        }

        // Optimized SliverList with proper width constraints to avoid
        // infinite width errors. Do NOT wrap in SliverPadding - let SizedBox
        // handle width constraints at the item level instead.
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final workOrder = unassignedWorkOrders[index];
              return SizedBox(
                width: double.infinity,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  child: Column(
                    children: [
                      WorkOrderCard(
                        workOrder: workOrder,
                        onTap: () {
                          context.router.push(
                              WorkOrderDetailsRoute(workOrderId: workOrder.id));
                        },
                      ),
                      SizedBox(height: 8.h),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () => _assignWorkOrderToSelf(workOrder.id),
                          icon: Icon(Icons.person_add, size: 18.sp),
                          label: Text('Assign to Me',
                              style: TextStyle(fontSize: 14.sp)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: AppColors.onPrimary,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 12.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            childCount: unassignedWorkOrders.length,
            // Optimize performance and avoid infinite constraint errors
            addAutomaticKeepAlives: false,
            addRepaintBoundaries: false,
            addSemanticIndexes: false,
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
        content: const Text(
            'Are you sure you want to assign this work order to yourself?'),
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
