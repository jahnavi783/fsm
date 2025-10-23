import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fsm/core/config/app_config.dart';
import 'package:fsm/core/router/app_router.gr.dart';
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
    // Frontend filtering - no API call needed
    // The UI will automatically filter based on the current tab
    // when _buildWorkOrdersList is called with the status
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
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            // Modern App Bar with Gradient
            SliverAppBar(
              expandedHeight: 120.h,
              floating: false,
              pinned: true,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFF116587),
                        const Color(0xFF00A74F),
                      ],
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Dashboard',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    'Manage your work orders',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  _buildHeaderAction(
                                    icon: Icons.search,
                                    onTap: () => _showSearchDialog(context),
                                  ),
                                  SizedBox(width: 12.w),
                                  _buildHeaderAction(
                                    icon: Icons.refresh,
                                    onTap: () {
                                      context.read<WorkOrdersListBloc>().add(
                                            const WorkOrdersListEvent
                                                .refreshWorkOrders(),
                                          );
                                    },
                                  ),
                                  if (AppConfig.isDebug) ...[
                                    SizedBox(width: 12.w),
                                    _buildHeaderAction(
                                      icon: Icons.bug_report,
                                      onTap: () => context.router
                                          .push(const DeveloperOptionsRoute()),
                                    ),
                                  ],
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: Container(),
              ),
            ),
          ];
        },
        body: Column(
          children: [
            // Enhanced Stats Cards Section
            BlocBuilder<WorkOrdersListBloc, WorkOrdersListState>(
              builder: (context, state) {
                return Container(
                  margin: EdgeInsets.all(16.w),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: _buildModernStatsCard(
                              'Assigned',
                              _getCountForStatus(
                                  state, WorkOrderStatus.assigned),
                              Icons.assignment_outlined,
                              const Color(0xFF2196F3),
                              () => _switchToTab(0),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: _buildModernStatsCard(
                              'In Progress',
                              _getCountForStatus(
                                  state, WorkOrderStatus.inProgress),
                              Icons.autorenew,
                              const Color(0xFFFF9800),
                              () => _switchToTab(1),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          Expanded(
                            child: _buildModernStatsCard(
                              'Paused',
                              _getCountForStatus(state, WorkOrderStatus.paused),
                              Icons.pause_circle_outlined,
                              const Color(0xFF9C27B0),
                              () => _switchToTab(2),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: _buildModernStatsCard(
                              'Completed',
                              _getCountForStatus(
                                  state, WorkOrderStatus.completed),
                              Icons.check_circle_outline,
                              const Color(0xFF4CAF50),
                              () => _switchToTab(3),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),

            // Modern Tab Navigation
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: const Color(0xFF116587),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey[600],
                labelStyle: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                tabs: [
                  Tab(text: 'Assigned'),
                  Tab(text: 'In Progress'),
                  Tab(text: 'Paused'),
                  Tab(text: 'Completed'),
                ],
              ),
            ),

            SizedBox(height: 16.h),

            // Work Orders List
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildWorkOrdersList(WorkOrderStatus.assigned),
                  _buildWorkOrdersList(WorkOrderStatus.inProgress),
                  _buildWorkOrdersList(WorkOrderStatus.paused),
                  _buildWorkOrdersList(WorkOrderStatus.completed),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.read<WorkOrdersListBloc>().add(
                const WorkOrdersListEvent.syncPendingWorkOrders(),
              );
        },
        icon: const Icon(Icons.sync),
        label: const Text('Sync'),
        backgroundColor: const Color(0xFF116587),
        foregroundColor: Colors.white,
      ),
    );
  }

  // Build header action button
  Widget _buildHeaderAction({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20.sp,
          ),
        ),
      ),
    );
  }

  // Build modern stats card
  Widget _buildModernStatsCard(
    String title,
    String count,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.r),
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(
                        icon,
                        color: color,
                        size: 20.sp,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12.sp,
                      color: Colors.grey[400],
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Text(
                  count,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Switch to specific tab (frontend filtering only)
  void _switchToTab(int index) {
    _tabController.animateTo(index);
  }

  // Build enhanced empty state
  Widget _buildEmptyState(WorkOrderStatus status) {
    final statusInfo = _getEmptyStateInfo(status);

    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(32.w),
              decoration: BoxDecoration(
                color: statusInfo['color'].withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                statusInfo['icon'],
                size: 64.sp,
                color: statusInfo['color'],
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              statusInfo['title'],
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Text(
              statusInfo['subtitle'],
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            ElevatedButton.icon(
              onPressed: () {
                context.read<WorkOrdersListBloc>().add(
                      const WorkOrdersListEvent.refreshWorkOrders(),
                    );
              },
              icon: Icon(Icons.refresh, size: 18.sp),
              label: const Text('Refresh'),
              style: ElevatedButton.styleFrom(
                backgroundColor: statusInfo['color'],
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.r),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Get empty state information based on status
  Map<String, dynamic> _getEmptyStateInfo(WorkOrderStatus status) {
    switch (status) {
      case WorkOrderStatus.assigned:
        return {
          'icon': Icons.assignment_outlined,
          'color': const Color(0xFF2196F3),
          'title': 'No Assigned Work Orders',
          'subtitle':
              'New work orders will appear here when they\'re assigned to you.',
        };
      case WorkOrderStatus.inProgress:
        return {
          'icon': Icons.autorenew,
          'color': const Color(0xFFFF9800),
          'title': 'No Active Work Orders',
          'subtitle': 'Start working on assigned orders to see them here.',
        };
      case WorkOrderStatus.paused:
        return {
          'icon': Icons.pause_circle_outlined,
          'color': const Color(0xFF9C27B0),
          'title': 'No Paused Work Orders',
          'subtitle': 'Work orders you pause will be listed here.',
        };
      case WorkOrderStatus.completed:
        return {
          'icon': Icons.check_circle_outline,
          'color': const Color(0xFF4CAF50),
          'title': 'No Completed Work Orders',
          'subtitle': 'Your completed work orders will be shown here.',
        };
      default:
        return {
          'icon': Icons.work_outline,
          'color': Colors.grey,
          'title': 'No Work Orders',
          'subtitle': 'No work orders found for this status.',
        };
    }
  }

  // Build enhanced error state
  Widget _buildErrorState(String message, bool isOffline) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(32.w),
              decoration: BoxDecoration(
                color: isOffline
                    ? Colors.orange.withOpacity(0.1)
                    : Colors.red.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isOffline ? Icons.wifi_off : Icons.error_outline,
                size: 64.sp,
                color: isOffline ? Colors.orange : Colors.red,
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              isOffline ? 'You\'re Offline' : 'Something Went Wrong',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Text(
              isOffline
                  ? 'Check your internet connection and try again.'
                  : message,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            ElevatedButton.icon(
              onPressed: () {
                context.read<WorkOrdersListBloc>().add(
                      const WorkOrdersListEvent.refreshWorkOrders(),
                    );
              },
              icon: Icon(Icons.refresh, size: 18.sp),
              label: const Text('Try Again'),
              style: ElevatedButton.styleFrom(
                backgroundColor: isOffline ? Colors.orange : Colors.red,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.r),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkOrdersList(WorkOrderStatus status) {
    return BlocBuilder<WorkOrdersListBloc, WorkOrdersListState>(
      builder: (context, state) {
        return state.when(
          initial: () => _buildLoadingState(),
          loading: () => _buildLoadingState(),
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
              return _buildEmptyState(status);
            }

            return RefreshIndicator(
              onRefresh: () async {
                context.read<WorkOrdersListBloc>().add(
                      const WorkOrdersListEvent.refreshWorkOrders(),
                    );
              },
              child: ListView.builder(
                controller: _scrollController,
                itemCount: filteredWorkOrders.length + (isLoadingMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index >= filteredWorkOrders.length) {
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  final workOrder = filteredWorkOrders[index];
                  return WorkOrderCard(
                    workOrder: workOrder,
                    onTap: () {
                      context.router.push(
                          WorkOrderDetailsRoute(workOrderId: workOrder.id));
                    },
                    onActionTap: () {
                      _showWorkOrderActions(workOrder);
                    },
                  );
                },
              ),
            );
          },
          error: (failure, workOrders, isOffline) =>
              _buildErrorState(failure.message, isOffline),
          syncing: (workOrders) => _buildSyncingState(),
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

  // Build enhanced syncing state
  Widget _buildSyncingState() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(32.w),
              decoration: BoxDecoration(
                color: const Color(0xFF116587).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: CircularProgressIndicator(
                color: const Color(0xFF116587),
                strokeWidth: 3,
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              'Syncing Work Orders',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Text(
              'Please wait while we sync your latest work orders...',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Build enhanced loading state
  Widget _buildLoadingState() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(32.w),
              decoration: BoxDecoration(
                color: const Color(0xFF116587).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: CircularProgressIndicator(
                color: const Color(0xFF116587),
                strokeWidth: 3,
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              'Loading Work Orders',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Text(
              'Please wait while we fetch your work orders...',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
