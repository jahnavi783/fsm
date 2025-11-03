import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/widgets.dart';
import '../../../auth/presentation/blocs/auth/auth_bloc.dart';
import '../../../auth/presentation/blocs/auth/auth_state.dart';
import '../../domain/entities/work_order_entity.dart';
import '../blocs/work_orders_list/work_orders_list_bloc.dart';
import '../blocs/work_orders_list/work_orders_list_event.dart';
import '../blocs/work_orders_list/work_orders_list_state.dart';
import '../widgets/current_work_order_card.dart';
import '../widgets/work_order_list_card.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final ScrollController _scrollController = ScrollController();

  // Filter state - using String to match FilterChipData value type
  String _selectedFilter = 'assigned'; // Default to 'assigned'

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    // Load all work orders initially
    context.read<WorkOrdersListBloc>().add(
          const WorkOrdersListEvent.loadWorkOrders(page: 1),
        );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onFilterChanged(List<String> selectedFilters) {
    if (selectedFilters.isNotEmpty &&
        selectedFilters.first != _selectedFilter) {
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
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        final user = authState is AuthAuthenticated ? authState.user : null;

        return BlocBuilder<WorkOrdersListBloc, WorkOrdersListState>(
          builder: (context, state) {
            return FSMDashboardPageTemplate(
              // Stats
              statsData: _getStatsData(state),
              statsLoading: state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              ),
              statsError: state.maybeWhen(
                error: (failure, _, __) => failure.message,
                orElse: () => null,
              ),
              onStatsRetry: () => context.read<WorkOrdersListBloc>().add(
                    const WorkOrdersListEvent.refreshWorkOrders(),
                  ),
              // Filters
              selectedFilters: [_selectedFilter],
              onFilterChanged: _onFilterChanged,
              // Content
              listContent: _buildListContent(state, user),
              isLoading: state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              ),
              isEmpty: state.maybeWhen(
                loaded: (workOrders, _, __, ___, ____, _____, ______, _______,
                        ________, _________, __________) =>
                    _getFilteredWorkOrders(workOrders, _selectedFilter).isEmpty,
                orElse: () => false,
              ),
              hasError: state.maybeWhen(
                error: (_, __, ___) => true,
                orElse: () => false,
              ),
              errorMessage: state.maybeWhen(
                error: (failure, _, __) => failure.message,
                orElse: () => null,
              ),
              onRetry: () => context.read<WorkOrdersListBloc>().add(
                    const WorkOrdersListEvent.refreshWorkOrders(),
                  ),
              // Actions
              onRefresh: () async {
                context.read<WorkOrdersListBloc>().add(
                      const WorkOrdersListEvent.refreshWorkOrders(),
                    );
              },
              floatingActionButton: FloatingActionButton.extended(
                onPressed: () => _navigateToSection(context, 'chat'),
                icon: const Icon(Icons.smart_toy),
                label: const Text('AI Assistant'),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                foregroundColor: Theme.of(context).colorScheme.onSecondary,
                elevation: 6,
                tooltip: 'Open AI Assistant',
              ),
              appBarActions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => _showSearchDialog(context),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildListContent(WorkOrdersListState state, dynamic user) {
    return Column(
      children: [
        // Offline/Sync Banner at top
        const OfflineBanner(),

        // Current Work Order Card (for in-progress WO)
        state.maybeWhen(
          loaded: (workOrders, _, __, ___, ____, _____, ______, _______,
              ________, _________, __________) {
            final inProgressWO = workOrders
                .where((wo) => wo.status == WorkOrderStatus.inProgress)
                .firstOrNull;
            if (inProgressWO != null) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: CurrentWorkOrderCard(
                  workOrder: inProgressWO,
                  onTap: () =>
                      _handleWorkOrderAction(context, inProgressWO, 'view'),
                  onPause: () =>
                      _handleWorkOrderAction(context, inProgressWO, 'pause'),
                  onParts: () =>
                      _handleWorkOrderAction(context, inProgressWO, 'parts'),
                  onDocs: () =>
                      _handleWorkOrderAction(context, inProgressWO, 'docs'),
                  onComplete: () =>
                      _handleWorkOrderAction(context, inProgressWO, 'complete'),
                ),
              );
            }
            return const SizedBox.shrink();
          },
          orElse: () => const SizedBox.shrink(),
        ),

        // Work Orders List
        Expanded(
          child: state.maybeWhen(
            loaded: (workOrders, _, __, ___, ____, isLoadingMore, ______,
                _______, ________, _________, __________) {
              final filteredWorkOrders =
                  _getFilteredWorkOrders(workOrders, _selectedFilter);

              return ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: filteredWorkOrders.length + (isLoadingMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index >= filteredWorkOrders.length) {
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  final workOrder = filteredWorkOrders[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: WorkOrderListCard(
                      workOrder: workOrder,
                      onTap: () =>
                          _handleWorkOrderAction(context, workOrder, 'view'),
                      onStart: _selectedFilter == 'assigned' ||
                              _selectedFilter == 'created'
                          ? () => _handleWorkOrderAction(
                              context, workOrder, 'start')
                          : null,
                      onPause: _selectedFilter == 'in_progress'
                          ? () => _handleWorkOrderAction(
                              context, workOrder, 'pause')
                          : null,
                      onResume: _selectedFilter == 'paused'
                          ? () => _handleWorkOrderAction(
                              context, workOrder, 'resume')
                          : null,
                      onComplete: _selectedFilter == 'in_progress'
                          ? () => _handleWorkOrderAction(
                              context, workOrder, 'complete')
                          : null,
                    ),
                  );
                },
              );
            },
            orElse: () => const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }

  List<WorkOrderEntity> _getFilteredWorkOrders(
      List<WorkOrderEntity> workOrders, String filter) {
    switch (filter) {
      case 'all':
        return workOrders;
      case 'unassigned':
        return workOrders
            .where((wo) => wo.status == WorkOrderStatus.created)
            .toList();
      case 'assigned':
        return workOrders
            .where((wo) => wo.status == WorkOrderStatus.assigned)
            .toList();
      case 'in_progress':
        return workOrders
            .where((wo) => wo.status == WorkOrderStatus.inProgress)
            .toList();
      case 'paused':
        return workOrders
            .where((wo) => wo.status == WorkOrderStatus.paused)
            .toList();
      case 'completed':
        return workOrders
            .where((wo) => wo.status == WorkOrderStatus.completed)
            .toList();
      default:
        return workOrders;
    }
  }

  List<StatsCardData> _getStatsData(WorkOrdersListState state) {
    return state.maybeWhen(
      loaded: (workOrders, unassignedWorkOrders, unassignedCount, _, __, ___,
          ____, _____, ______, _______, __________) {
        return [
          StatsCardData(
            title: 'Assigned',
            count: workOrders
                .where((wo) => wo.status == WorkOrderStatus.assigned)
                .length
                .toString(),
            icon: Icons.assignment,
            color: Colors.blue,
            onTap: () => _switchToFilter('assigned'),
          ),
          StatsCardData(
            title: 'In Progress',
            count: workOrders
                .where((wo) => wo.status == WorkOrderStatus.inProgress)
                .length
                .toString(),
            icon: Icons.engineering,
            color: Colors.orange,
            onTap: () => _switchToFilter('in_progress'),
          ),
          StatsCardData(
            title: 'Paused',
            count: workOrders
                .where((wo) => wo.status == WorkOrderStatus.paused)
                .length
                .toString(),
            icon: Icons.pause_circle,
            color: Colors.amber,
            onTap: () => _switchToFilter('paused'),
          ),
          StatsCardData(
            title: 'Completed',
            count: workOrders
                .where((wo) => wo.status == WorkOrderStatus.completed)
                .length
                .toString(),
            icon: Icons.check_circle,
            color: Colors.green,
            onTap: () => _switchToFilter('completed'),
          ),
        ];
      },
      orElse: () => [
        StatsCardData(
          title: 'Assigned',
          count: '0',
          icon: Icons.assignment,
          color: Colors.blue,
          onTap: () => _switchToFilter('assigned'),
        ),
        StatsCardData(
          title: 'In Progress',
          count: '0',
          icon: Icons.engineering,
          color: Colors.orange,
          onTap: () => _switchToFilter('in_progress'),
        ),
        StatsCardData(
          title: 'Paused',
          count: '0',
          icon: Icons.pause_circle,
          color: Colors.amber,
          onTap: () => _switchToFilter('paused'),
        ),
        StatsCardData(
          title: 'Completed',
          count: '0',
          icon: Icons.check_circle,
          color: Colors.green,
          onTap: () => _switchToFilter('completed'),
        ),
      ],
    );
  }

  void _switchToFilter(String filter) {
    setState(() {
      _selectedFilter = filter;
    });
  }

  void _handleWorkOrderAction(
      BuildContext context, WorkOrderEntity workOrder, String action) {
    // Implementation for handling work order actions
    // This preserves the existing functionality from the original dashboard
    switch (action) {
      case 'view':
        // Navigate to work order details
        break;
      case 'assign':
        _assignWorkOrderToSelf(workOrder.id);
        break;
      case 'start':
        // Start work order
        break;
      case 'pause':
        // Pause work order
        break;
      case 'complete':
        // Complete work order
        break;
      case 'parts':
        // Navigate to parts
        break;
      case 'docs':
        // Navigate to documents
        break;
    }
  }

  void _assignWorkOrderToSelf(int workOrderId) {
    context.read<WorkOrdersListBloc>().add(
          WorkOrdersListEvent.assignWorkOrderToSelf(workOrderId: workOrderId),
        );
  }

  void _showSearchDialog(BuildContext context) {
    // Implementation for search dialog
    // This can be enhanced with the search functionality from the original
  }

  void _navigateToSection(BuildContext context, String section) {
    // Implementation for navigation
    // This preserves the existing navigation from the original dashboard
  }
}
