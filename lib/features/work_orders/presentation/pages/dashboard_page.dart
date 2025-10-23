import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fsm/core/config/app_config.dart';
import 'package:fsm/core/router/app_router.gr.dart';
import 'package:fsm/core/widgets/dashboard_sliver_app_bar.dart';
import 'package:fsm/core/widgets/stats_card.dart';
import 'package:fsm/core/widgets/custom_tab_bar.dart';
import 'package:fsm/core/widgets/dashboard_states.dart';
import 'package:fsm/core/widgets/work_order_sliver_list.dart';
import 'package:fsm/core/utils/work_order_status_helper.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_orders_list/work_orders_list_bloc.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_orders_list/work_orders_list_event.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_orders_list/work_orders_list_state.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_card.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_action_sheet.dart';

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
    _tabController = TabController(length: 4, vsync: this);
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
      body: BlocBuilder<WorkOrdersListBloc, WorkOrdersListState>(
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

                // Stats Cards
                _buildStatsGrid(state),

                // Tab Bar
                CustomTabBar(
                  controller: _tabController,
                  tabs: const [
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
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF116587).withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: FloatingActionButton.extended(
          onPressed: () {
            context.read<WorkOrdersListBloc>().add(
                  const WorkOrdersListEvent.syncPendingWorkOrders(),
                );
          },
          icon: Icon(Icons.sync_rounded, size: 20.sp),
          label: Text(
            'Sync',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              letterSpacing: 0.5,
            ),
          ),
          backgroundColor: const Color(0xFF116587),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28.r),
          ),
        ),
      ),
    );
  }

  // Build stats grid for sliver layout
  Widget _buildStatsGrid(WorkOrdersListState state) {
    final statsData = _getStatsData(state);
    return StatsGrid(statsData: statsData);
  }

  // Get stats data for each status
  List<StatsCardData> _getStatsData(WorkOrdersListState state) {
    return [
      StatsCardData(
        title: 'Assigned',
        count: _getCountForStatus(state, WorkOrderStatus.assigned),
        icon: WorkOrderStatusHelper.getStatusIcon(WorkOrderStatus.assigned),
        color: WorkOrderStatusHelper.getStatusColor(WorkOrderStatus.assigned),
        onTap: () => _switchToTab(0),
      ),
      StatsCardData(
        title: 'In Progress',
        count: _getCountForStatus(state, WorkOrderStatus.inProgress),
        icon: WorkOrderStatusHelper.getStatusIcon(WorkOrderStatus.inProgress),
        color: WorkOrderStatusHelper.getStatusColor(WorkOrderStatus.inProgress),
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

  // Build current tab content based on selected tab
  Widget _buildCurrentTabContent(WorkOrdersListState state) {
    final currentIndex = _tabController.index;
    final statuses = [
      WorkOrderStatus.assigned,
      WorkOrderStatus.inProgress,
      WorkOrderStatus.paused,
      WorkOrderStatus.completed,
    ];

    final currentStatus = statuses[currentIndex];
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

  Widget _buildEmptyStateSliver(WorkOrderStatus status) {
    final emptyStateInfo = WorkOrderStatusHelper.getEmptyStateInfo(status);
    return EmptyState(
      title: emptyStateInfo['title'],
      subtitle: emptyStateInfo['subtitle'],
      icon: emptyStateInfo['icon'],
      color: emptyStateInfo['color'],
      onRetry: () {
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
      loaded: (workOrders, _, __, ___, ____, _____, ______, _______, ________) {
        return workOrders.where((wo) => wo.status == status).length.toString();
      },
      orElse: () => '-',
    );
  }

  void _showSearchDialog(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Search Work Orders'),
        content: TextField(
          controller: searchController,
          decoration: const InputDecoration(
            hintText: 'Enter work order number or description...',
            prefixIcon: Icon(Icons.search),
          ),
          autofocus: true,
          onSubmitted: (query) {
            Navigator.of(context).pop();
            if (query.isNotEmpty) {
              context.read<WorkOrdersListBloc>().add(
                    WorkOrdersListEvent.searchWorkOrders(query),
                  );
            }
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              final query = searchController.text.trim();
              if (query.isNotEmpty) {
                context.read<WorkOrdersListBloc>().add(
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
