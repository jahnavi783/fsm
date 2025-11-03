import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/router/app_router.gr.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/design_tokens.dart';

import '../../../../core/theme/spacing_theme.dart';
import '../../../../core/utils/work_order_status_helper.dart';
import '../../../../core/widgets/widgets.dart'
    hide
        StatsGrid,
        StatsCardData; // Barrel import, hide duplicates
import '../../../../core/widgets/dashboard_states.dart';
import '../../../../core/widgets/stats_card.dart';
import '../../../auth/presentation/blocs/auth/auth_bloc.dart';
import '../../../auth/presentation/blocs/auth/auth_state.dart';
import '../../../auth/presentation/blocs/auth/auth_event.dart';
import '../../domain/entities/work_order_entity.dart';
import '../blocs/work_orders_list/work_orders_list_bloc.dart';
import '../blocs/work_orders_list/work_orders_list_event.dart';
import '../blocs/work_orders_list/work_orders_list_state.dart';
import '../widgets/current_work_order_card.dart';
import '../widgets/work_order_action_sheet.dart';
import '../widgets/work_order_list_card.dart';

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

class _DashboardPageState extends State<DashboardPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Filter state - using String to match FilterChipData value type
  String _selectedFilter = 'assigned'; // Default to 'assigned' (previously tab index 1)

  @override
  void initState() {
    super.initState();
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
    _scrollController.dispose();
    super.dispose();
  }

  void _onFilterChanged(List<String> selectedFilters) {
    if (selectedFilters.isNotEmpty && selectedFilters.first != _selectedFilter) {
      setState(() {
        _selectedFilter = selectedFilters.first;
      });
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
    final theme = Theme.of(context);

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        // Get user name from auth state
        final userName = authState.maybeWhen(
          authenticated: (user) => user.firstName,
          orElse: () => 'User',
        );
        final user = authState is AuthAuthenticated ? authState.user : null;

        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: theme.colorScheme.surface,

          // ═══════════════════════════════════════════════════════════
          // APP BAR - Navigation style with hamburger menu
          // ═══════════════════════════════════════════════════════════
          appBar: FSMAppBar.navigation(
            title: 'Welcome, $userName',
            onMenuTap: () => _scaffoldKey.currentState?.openDrawer(),
            onSearchTap: () => _showSearchDialog(context),
          ),

          // ═══════════════════════════════════════════════════════════
          // DRAWER - FSM Navigation Drawer
          // ═══════════════════════════════════════════════════════════
          drawer: FSMDrawer(
            currentRoute: '/app/dashboard',
            profileName: user?.fullName ?? 'FSM Technician',
            profileEmail: user?.email ?? 'technician@fsm.app',
            employeeId: user?.id.toString() ?? 'EMP-001',
            profileImageUrl: null,
            onNavigate: (section) => _navigateToSection(context, section),
            onLogout: () => _handleLogout(context),
          ),

          // ═══════════════════════════════════════════════════════════
          // BODY - Main dashboard content
          // ═══════════════════════════════════════════════════════════
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
                          // Stats Cards (kept as existing - already well-designed)
                          _buildStatsGrid(state),

                          // Current Work Order Card (for in-progress WO)
                          _buildCurrentWorkOrderCard(state),

                          // Filter Chips - 4 status filters (pinned header)
                          SliverPersistentHeader(
                            pinned: true,
                            delegate: _FilterChipHeaderDelegate(
                              selectedFilter: _selectedFilter,
                              onFilterChanged: _onFilterChanged,
                            ),
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

          // ═══════════════════════════════════════════════════════════
          // FLOATING ACTION BUTTON - AI Assistant
          // ═══════════════════════════════════════════════════════════
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => _navigateToSection(context, 'chat'),
            icon: const Icon(Icons.smart_toy),
            label: const Text('AI Assistant'),
            backgroundColor: theme.colorScheme.secondary,
            foregroundColor: theme.colorScheme.onSecondary,
            elevation: 6,
            tooltip: 'Open AI Assistant',
          ),
        );
      },
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
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        onTap: () => _switchToFilter('unassigned'),
      ),
      StatsCardData(
        title: 'Assigned',
        count: _getCountForStatus(state, WorkOrderStatus.assigned),
        icon: WorkOrderStatusHelper.getStatusIcon(WorkOrderStatus.assigned),
        color: WorkOrderStatusHelper.getStatusColor(WorkOrderStatus.assigned),
        onTap: () => _switchToFilter('assigned'),
      ),
      StatsCardData(
        title: 'Paused',
        count: _getCountForStatus(state, WorkOrderStatus.paused),
        icon: WorkOrderStatusHelper.getStatusIcon(WorkOrderStatus.paused),
        color: WorkOrderStatusHelper.getStatusColor(WorkOrderStatus.paused),
        onTap: () => _switchToFilter('paused'),
      ),
      StatsCardData(
        title: 'Completed',
        count: _getCountForStatus(state, WorkOrderStatus.completed),
        icon: WorkOrderStatusHelper.getStatusIcon(WorkOrderStatus.completed),
        color: WorkOrderStatusHelper.getStatusColor(WorkOrderStatus.completed),
        onTap: () => _switchToFilter('completed'),
      ),
    ];
  }

  // Build current filter content based on selected filter
  Widget _buildCurrentTabContent(WorkOrdersListState state) {
    // Map filter values to their respective build functions
    switch (_selectedFilter) {
      case 'unassigned':
        return _buildUnassignedWorkOrdersSliver(state);
      case 'assigned':
        return _buildWorkOrdersSliver(WorkOrderStatus.assigned, state);
      case 'paused':
        return _buildWorkOrdersSliver(WorkOrderStatus.paused, state);
      case 'completed':
        return _buildWorkOrdersSliver(WorkOrderStatus.completed, state);
      default:
        return _buildWorkOrdersSliver(WorkOrderStatus.assigned, state);
    }
  }

  // Switch to specific filter (frontend filtering only)
  void _switchToFilter(String filter) {
    setState(() {
      _selectedFilter = filter;
    });
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
          itemBuilder: (workOrder) => WorkOrderListCard(
            workOrder: workOrder,
            onTap: () {
              context.router
                  .push(WorkOrderDetailsRoute(workOrderId: workOrder.id));
            },
            onStart: () => _handleWorkOrderAction(context, workOrder, 'start'),
            onPause: () => _handleWorkOrderAction(context, workOrder, 'pause'),
            onResume: () => _handleWorkOrderAction(context, workOrder, 'resume'),
            onComplete: () =>
                _handleWorkOrderAction(context, workOrder, 'complete'),
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
          return FSMEmptyStateList(
            icon: Icons.inbox_outlined,
            title: 'No Unassigned Work Orders',
            description:
                'All work orders have been assigned to field engineers.',
            iconColor: Theme.of(context).colorScheme.onSurfaceVariant,
          );
        }

        // Optimized SliverList with proper width constraints to avoid
        // infinite width errors. Do NOT wrap in SliverPadding - let SizedBox
        // handle width constraints at the item level instead.
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final workOrder = unassignedWorkOrders[index];
              final theme = Theme.of(context);
              final spacing = context.spacing;

              return SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: REdgeInsets.symmetric(
                    horizontal: DesignTokens.space4,
                    vertical: DesignTokens.space3,
                  ),
                  child: Column(
                    children: [
                      CompactWorkOrderListCard(
                        workOrder: workOrder,
                        onTap: () {
                          context.router.push(
                              WorkOrderDetailsRoute(workOrderId: workOrder.id));
                        },
                      ),
                      DesignTokens.verticalSpaceSmall,
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () => _assignWorkOrderToSelf(workOrder.id),
                          icon: Icon(Icons.person_add,
                              size: DesignTokens.iconSm.sp),
                          label: Text('Assign to Me',
                              style: theme.textTheme.labelLarge),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.colorScheme.primary,
                            foregroundColor: theme.colorScheme.onPrimary,
                            padding: REdgeInsets.symmetric(
                              horizontal: DesignTokens.space4,
                              vertical: DesignTokens.space3,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(spacing.radiusSm.r),
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
              // Switch to Assigned filter after assignment
              _switchToFilter('assigned');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
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

  // ═══════════════════════════════════════════════════════════════════════
  // NAVIGATION & DRAWER ACTION HELPERS
  // ═══════════════════════════════════════════════════════════════════════

  /// Navigate to drawer section using Auto Route extensions
  void _navigateToSection(BuildContext context, String section) {
    final router = context.router;
    final drawerSection = _mapStringToDrawerSection(section);

    if (drawerSection != null) {
      router.navigateToDrawerSection(drawerSection);
    }
  }

  /// Map section string to DrawerSection enum
  DrawerSection? _mapStringToDrawerSection(String section) {
    switch (section.toLowerCase()) {
      case 'dashboard':
        return DrawerSection.dashboard;
      case 'work_orders':
      case 'workorders':
        return DrawerSection.workOrders;
      case 'calendar':
        return DrawerSection.calendar;
      case 'documents':
        return DrawerSection.documents;
      case 'parts':
        return DrawerSection.parts;
      case 'profile':
        return DrawerSection.profile;
      case 'settings':
        return DrawerSection.settings;
      case 'chat':
        return DrawerSection.chat;
      default:
        return null;
    }
  }

  /// Handle user logout
  void _handleLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.read<AuthBloc>().add(const AuthEvent.logout());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// FILTER CHIP PERSISTENT HEADER DELEGATE
// ═══════════════════════════════════════════════════════════

class _FilterChipHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String selectedFilter;
  final ValueChanged<List<String>> onFilterChanged;

  _FilterChipHeaderDelegate({
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  double get minExtent => 70.h;

  @override
  double get maxExtent => 70.h;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: REdgeInsets.only(
        left: DesignTokens.space4,
        right: DesignTokens.space4,
        top: DesignTokens.space2,
        bottom: DesignTokens.space2,
      ),
      child: FSMFilterChipGroup<String>(
        options: [
          FilterChipData(
            value: 'unassigned',
            label: 'Unassigned',
            leadingIcon: Icons.inbox_outlined,
          ),
          FilterChipData(
            value: 'assigned',
            label: 'Assigned',
            leadingIcon: Icons.assignment_outlined,
          ),
          FilterChipData(
            value: 'paused',
            label: 'Paused',
            leadingIcon: Icons.pause_circle_outline,
          ),
          FilterChipData(
            value: 'completed',
            label: 'Completed',
            leadingIcon: Icons.check_circle_outline,
          ),
        ],
        selectedValues: [selectedFilter],
        onSelectionChanged: onFilterChanged,
        multiSelect: false, // Single-select mode (like tabs)
        showClearAll: false, // Don't show clear all for status filters
        showFilterCount: false, // Don't show count badge
        height: 50.h,
      ),
    );
  }

  @override
  bool shouldRebuild(_FilterChipHeaderDelegate oldDelegate) {
    return oldDelegate.selectedFilter != selectedFilter;
  }
}
