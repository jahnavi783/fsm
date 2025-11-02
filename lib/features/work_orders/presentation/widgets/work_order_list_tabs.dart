import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/design_tokens.dart';
import '../../domain/entities/work_order_entity.dart';
import 'work_order_list_card.dart';

/// WorkOrderListTabs - Tabbed work order list with status filters
///
/// Features (Redesign 2025):
/// - Tabs: Unassigned, Assigned, In Progress, Paused, Completed
/// - Tab indicator with primary color
/// - Scrollable tab bar if needed
/// - List of WorkOrderListCard per tab
/// - Empty state when no work orders
/// - Pull to refresh
///
/// Usage:
/// ```dart
/// WorkOrderListTabs(
///   workOrders: workOrders,
///   onWorkOrderTap: (wo) => context.router.push(WorkOrderDetailsRoute(id: wo.id)),
///   onStart: (wo) => bloc.add(StartWorkOrder(wo.id)),
///   onPause: (wo) => bloc.add(PauseWorkOrder(wo.id)),
///   onResume: (wo) => bloc.add(ResumeWorkOrder(wo.id)),
///   onComplete: (wo) => bloc.add(CompleteWorkOrder(wo.id)),
///   onRefresh: () async => bloc.add(RefreshWorkOrders()),
/// )
/// ```
class WorkOrderListTabs extends StatelessWidget {
  /// All work orders (will be filtered by tab)
  final List<WorkOrderEntity> workOrders;

  /// Callback when a work order is tapped
  final Function(WorkOrderEntity) onWorkOrderTap;

  /// Callback for Start action
  final Function(WorkOrderEntity)? onStart;

  /// Callback for Pause action
  final Function(WorkOrderEntity)? onPause;

  /// Callback for Resume action
  final Function(WorkOrderEntity)? onResume;

  /// Callback for Complete action
  final Function(WorkOrderEntity)? onComplete;

  /// Callback for pull to refresh
  final Future<void> Function()? onRefresh;

  /// Whether the list is loading
  final bool isLoading;

  const WorkOrderListTabs({
    super.key,
    required this.workOrders,
    required this.onWorkOrderTap,
    this.onStart,
    this.onPause,
    this.onResume,
    this.onComplete,
    this.onRefresh,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Column(
        children: [
          // Tab Bar
          Container(
            color: Theme.of(context).colorScheme.surface,
            child: TabBar(
              isScrollable: true,
              labelColor: Theme.of(context).colorScheme.primary,
              unselectedLabelColor:
                  Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
              labelStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
              indicatorColor: Theme.of(context).colorScheme.primary,
              indicatorWeight: 3.h,
              tabs: [
                _buildTab(context, 'Unassigned', _getCountForStatus('unassigned')),
                _buildTab(context, 'Assigned', _getCountForStatus('assigned')),
                _buildTab(context, 'In Progress', _getCountForStatus('in_progress')),
                _buildTab(context, 'Paused', _getCountForStatus('paused')),
                _buildTab(context, 'Completed', _getCountForStatus('completed')),
              ],
            ),
          ),

          // Tab Views
          Expanded(
            child: TabBarView(
              children: [
                _buildTabContent(context, 'unassigned'),
                _buildTabContent(context, 'assigned'),
                _buildTabContent(context, 'in_progress'),
                _buildTabContent(context, 'paused'),
                _buildTabContent(context, 'completed'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(BuildContext context, String label, int count) {
    return Tab(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label),
          if (count > 0) ...[
            DesignTokens.horizontalSpace(DesignTokens.space1 + 2),
            Container(
              padding: REdgeInsets.symmetric(
                horizontal: DesignTokens.space1,
                vertical: DesignTokens.space1 / 2,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .primary
                    .withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
              ),
              child: Text(
                count.toString(),
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTabContent(BuildContext context, String status) {
    final filteredWorkOrders = _filterByStatus(status);

    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.primary),
        ),
      );
    }

    if (filteredWorkOrders.isEmpty) {
      return _buildEmptyState(context, status);
    }

    Widget listView = ListView.builder(
      padding: REdgeInsets.only(
        top: DesignTokens.space2,
        bottom: DesignTokens.space6,
      ),
      itemCount: filteredWorkOrders.length,
      itemBuilder: (context, index) {
        final workOrder = filteredWorkOrders[index];
        return WorkOrderListCard(
          workOrder: workOrder,
          onTap: () => onWorkOrderTap(workOrder),
          onStart: onStart != null ? () => onStart!(workOrder) : null,
          onPause: onPause != null ? () => onPause!(workOrder) : null,
          onResume: onResume != null ? () => onResume!(workOrder) : null,
          onComplete: onComplete != null ? () => onComplete!(workOrder) : null,
        );
      },
    );

    // Add pull to refresh if callback provided
    if (onRefresh != null) {
      listView = RefreshIndicator(
        onRefresh: onRefresh!,
        color: Theme.of(context).colorScheme.primary,
        child: listView,
      );
    }

    return listView;
  }

  Widget _buildEmptyState(BuildContext context, String status) {
    String message;
    IconData icon;

    switch (status) {
      case 'unassigned':
        message = 'No unassigned work orders';
        icon = Icons.assignment_outlined;
        break;
      case 'assigned':
        message = 'No assigned work orders';
        icon = Icons.assignment_ind_outlined;
        break;
      case 'in_progress':
        message = 'No work orders in progress';
        icon = Icons.play_circle_outline;
        break;
      case 'paused':
        message = 'No paused work orders';
        icon = Icons.pause_circle_outline;
        break;
      case 'completed':
        message = 'No completed work orders';
        icon = Icons.check_circle_outline;
        break;
      default:
        message = 'No work orders';
        icon = Icons.assignment_outlined;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 64.sp,
            color:
                Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
          ),
          DesignTokens.verticalSpaceMedium,
          Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  List<WorkOrderEntity> _filterByStatus(String status) {
    return workOrders.where((wo) {
      final woStatus = wo.status.toString().replaceAll(' ', '_');
      final targetStatus = status.toLowerCase().replaceAll(' ', '_');
      return woStatus == targetStatus;
    }).toList();
  }

  int _getCountForStatus(String status) {
    return _filterByStatus(status).length;
  }
}

/// Compact variant - Single status tab without tab bar
///
/// Use this when you only want to show work orders of a specific status
class WorkOrderListForStatus extends StatelessWidget {
  final String status;
  final List<WorkOrderEntity> workOrders;
  final Function(WorkOrderEntity) onWorkOrderTap;
  final Function(WorkOrderEntity)? onStart;
  final Function(WorkOrderEntity)? onPause;
  final Function(WorkOrderEntity)? onResume;
  final Function(WorkOrderEntity)? onComplete;
  final Future<void> Function()? onRefresh;
  final bool isLoading;

  const WorkOrderListForStatus({
    super.key,
    required this.status,
    required this.workOrders,
    required this.onWorkOrderTap,
    this.onStart,
    this.onPause,
    this.onResume,
    this.onComplete,
    this.onRefresh,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final filteredWorkOrders = workOrders.where((wo) {
      final woStatus = wo.status.toString().replaceAll(' ', '_');
      final targetStatus = status.toLowerCase().replaceAll(' ', '_');
      return woStatus == targetStatus;
    }).toList();

    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.primary),
        ),
      );
    }

    if (filteredWorkOrders.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.assignment_outlined,
              size: 64.sp,
              color: Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withValues(alpha: 0.5),
            ),
            DesignTokens.verticalSpaceMedium,
            Text(
              'No work orders',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
      );
    }

    Widget listView = ListView.builder(
      padding: REdgeInsets.only(
        top: DesignTokens.space2,
        bottom: DesignTokens.space6,
      ),
      itemCount: filteredWorkOrders.length,
      itemBuilder: (context, index) {
        final workOrder = filteredWorkOrders[index];
        return WorkOrderListCard(
          workOrder: workOrder,
          onTap: () => onWorkOrderTap(workOrder),
          onStart: onStart != null ? () => onStart!(workOrder) : null,
          onPause: onPause != null ? () => onPause!(workOrder) : null,
          onResume: onResume != null ? () => onResume!(workOrder) : null,
          onComplete: onComplete != null ? () => onComplete!(workOrder) : null,
        );
      },
    );

    if (onRefresh != null) {
      listView = RefreshIndicator(
        onRefresh: onRefresh!,
        color: Theme.of(context).colorScheme.primary,
        child: listView,
      );
    }

    return listView;
  }
}
