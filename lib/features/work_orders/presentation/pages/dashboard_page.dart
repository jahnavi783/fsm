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
import 'package:fsm/features/work_orders/presentation/widgets/work_order_shimmer.dart';
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
    
    // Load initial data
    context.read<WorkOrdersListBloc>().add(
      const WorkOrdersListEvent.loadWorkOrders(
        page: 1,
        status: WorkOrderStatus.assigned,
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
    if (!_tabController.indexIsChanging) {
      final status = _getStatusForTab(_tabController.index);
      context.read<WorkOrdersListBloc>().add(
        WorkOrdersListEvent.filterByStatus(status),
      );
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

  WorkOrderStatus _getStatusForTab(int index) {
    switch (index) {
      case 0:
        return WorkOrderStatus.assigned;
      case 1:
        return WorkOrderStatus.inProgress;
      case 2:
        return WorkOrderStatus.paused;
      case 3:
        return WorkOrderStatus.completed;
      default:
        return WorkOrderStatus.assigned;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Work Orders'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                theme.primaryColor,
                theme.primaryColor.withOpacity(0.8),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<WorkOrdersListBloc>().add(
                const WorkOrdersListEvent.refreshWorkOrders(),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              _showSearchDialog(context);
            },
          ),
          // Debug options button (only visible in debug mode)
          if (AppConfig.isDebug) 
            IconButton(
              icon: const Icon(Icons.bug_report, color: Colors.orange),
              onPressed: () {
                context.router.push(const DeveloperOptionsRoute());
              },
            ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Assigned'),
            Tab(text: 'In Progress'),
            Tab(text: 'Paused'),
            Tab(text: 'Completed'),
          ],
        ),
      ),
      body: Column(
        children: [
          // Stats Cards
          BlocBuilder<WorkOrdersListBloc, WorkOrdersListState>(
            builder: (context, state) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      theme.primaryColor.withOpacity(0.8),
                      theme.primaryColor.withOpacity(0.6),
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Row(
                    children: [
                      _buildStatsCard('Assigned', _getCountForStatus(state, WorkOrderStatus.assigned)),
                      _buildStatsCard('In Progress', _getCountForStatus(state, WorkOrderStatus.inProgress)),
                      _buildStatsCard('Paused', _getCountForStatus(state, WorkOrderStatus.paused)),
                      _buildStatsCard('Completed', _getCountForStatus(state, WorkOrderStatus.completed)),
                    ],
                  ),
                ),
              );
            },
          ),
          
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<WorkOrdersListBloc>().add(
            const WorkOrdersListEvent.syncPendingWorkOrders(),
          );
        },
        child: const Icon(Icons.sync),
      ),
    );
  }

  Widget _buildStatsCard(String title, String count) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: Colors.white.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Text(
              count,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              title,
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
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
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const WorkOrderListShimmer(),
          loaded: (workOrders, currentPage, hasReachedMax, isLoadingMore, 
                  statusFilter, priorityFilter, searchQuery, isOffline, hasPendingSync) {
            
            // Filter work orders by current tab status
            final filteredWorkOrders = workOrders
                .where((wo) => wo.status == status)
                .toList();
            
            if (filteredWorkOrders.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.work_outline,
                      size: 64.sp,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'No ${status.displayName.toLowerCase()} work orders',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
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
                      context.router.push(WorkOrderDetailsRoute(workOrderId: workOrder.id));
                    },
                    onActionTap: () {
                      _showWorkOrderActions(workOrder);
                    },
                  );
                },
              ),
            );
          },
          error: (failure, workOrders, isOffline) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isOffline ? Icons.wifi_off : Icons.error_outline,
                  size: 64.sp,
                  color: Colors.red,
                ),
                SizedBox(height: 16.h),
                Text(
                  isOffline ? 'You are offline' : 'Error loading work orders',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  failure.message,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                ElevatedButton(
                  onPressed: () {
                    context.read<WorkOrdersListBloc>().add(
                      const WorkOrdersListEvent.refreshWorkOrders(),
                    );
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
          syncing: (workOrders) => const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Syncing work orders...'),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showWorkOrderActions(WorkOrderEntity workOrder) {
    WorkOrderActionSheet.show(
      context,
      workOrder: workOrder,
      onStart: workOrder.canBeStarted ? () {
        _handleWorkOrderAction(context, workOrder, 'start');
      } : null,
      onPause: workOrder.canBePaused ? () {
        _handleWorkOrderAction(context, workOrder, 'pause');
      } : null,
      onResume: workOrder.canBeResumed ? () {
        _handleWorkOrderAction(context, workOrder, 'resume');
      } : null,
      onComplete: workOrder.canBeCompleted ? () {
        _handleWorkOrderAction(context, workOrder, 'complete');
      } : null,
      onReject: workOrder.canBeRejected ? () {
        _handleWorkOrderAction(context, workOrder, 'reject');
      } : null,
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

  void _handleWorkOrderAction(BuildContext context, WorkOrderEntity workOrder, String action) {
    // Navigate to work order details page where the actual action will be performed
    // This ensures we have the WorkOrderActionBloc available and can capture GPS location
    context.router.push(WorkOrderDetailsRoute(workOrderId: workOrder.id));
    
    // Show a snackbar to inform the user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Navigate to work order details to $action the work order'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}