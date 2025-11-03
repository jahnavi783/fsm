import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/design_tokens.dart';
import '../../../../core/theme/extensions/fsm_theme_extension.dart';
import '../../../../core/theme/spacing_theme.dart';
import '../../../../core/widgets/layout/fsm_metadata_row.dart';
import '../../../../core/widgets/priority_indicator.dart';
import '../../../../core/widgets/quick_action_button.dart';
import '../../domain/entities/work_order_entity.dart';

/// WorkOrderListCard - Compact card for work order lists
///
/// Features (Redesign 2025):
/// - Left accent bar (3dp, priority color)
/// - WO number + priority badge
/// - Description (max 2 lines)
/// - Metadata row (location + time + status)
/// - Context-aware action buttons based on status
/// - Swipe for quick actions (optional)
/// - Elevation on press
///
/// Usage:
/// ```dart
/// WorkOrderListCard(
///   workOrder: workOrder,
///   onTap: () => context.router.push(WorkOrderDetailsRoute(id: wo.id)),
///   onStart: () => bloc.add(StartWorkOrder(wo.id)),
///   onPause: () => bloc.add(PauseWorkOrder(wo.id)),
///   onComplete: () => bloc.add(CompleteWorkOrder(wo.id)),
/// )
/// ```
class WorkOrderListCard extends StatelessWidget {
  /// The work order to display
  final WorkOrderEntity workOrder;

  /// Callback when card is tapped
  final VoidCallback onTap;

  /// Callback for Start action (shown for assigned/unassigned)
  final VoidCallback? onStart;

  /// Callback for Pause action (shown for in-progress)
  final VoidCallback? onPause;

  /// Callback for Resume action (shown for paused)
  final VoidCallback? onResume;

  /// Callback for Complete action (shown for in-progress)
  final VoidCallback? onComplete;

  /// Whether actions are loading
  final bool isLoading;

  /// Show action buttons (default true)
  final bool showActions;

  const WorkOrderListCard({
    super.key,
    required this.workOrder,
    required this.onTap,
    this.onStart,
    this.onPause,
    this.onResume,
    this.onComplete,
    this.isLoading = false,
    this.showActions = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;
    final spacing = context.spacing;
    final priorityColor =
        fsmTheme.getPriorityColor(workOrder.priority.name);

    return Container(
      margin: REdgeInsets.symmetric(
        horizontal: DesignTokens.space4,
        vertical: DesignTokens.space2,
      ),
      child: Material(
        color: theme.colorScheme.surfaceContainer,
        elevation: DesignTokens.elevationXSmall,
        borderRadius: BorderRadius.circular(spacing.radiusSm.r),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(spacing.radiusSm.r),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: priorityColor,
                  width: DesignTokens.borderWidthMedium.w,
                ),
              ),
              borderRadius: BorderRadius.circular(spacing.radiusSm.r),
            ),
            child: Padding(
              padding: REdgeInsets.all(DesignTokens.space3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Row: WO Number + Priority
                  Row(
                    children: [
                      // WO Number
                      Expanded(
                        child: Text(
                          'WO #${workOrder.id}',
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: DesignTokens.fontWeightBold,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                      ),

                      // Priority Badge
                      PriorityIndicator(
                        priority: workOrder.priority.name,
                        type: PriorityIndicatorType.badge,
                      ),
                    ],
                  ),

                  DesignTokens.verticalSpace(DesignTokens.space1),

                  // Description (max 2 lines)
                  Text(
                    workOrder.problemDescription,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  DesignTokens.verticalSpaceSmall,

                  // Metadata Row: Location + Time + Status
                  MetadataRowVariants.workOrder(
                    location: workOrder.location,
                    time: _formatTime(workOrder.createdAt),
                    status: workOrder.status.toString(),
                  ),

                  // Action Buttons (context-aware)
                  if (showActions && _hasActions) ...[
                    DesignTokens.verticalSpaceSmall,
                    _buildActions(),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActions() {
    final status = workOrder.status.toString();

    return Wrap(
      spacing: DesignTokens.space2.w,
      runSpacing: DesignTokens.space2.h,
      children: [
        // Start button (for unassigned/assigned)
        if ((status == 'unassigned' || status == 'assigned') && onStart != null)
          QuickActionButtonVariants.primary(
            icon: Icons.play_arrow,
            label: 'Start',
            onPressed: isLoading ? null : onStart,
            isCompact: true,
          ),

        // Pause button (for in-progress)
        if ((status == 'in_progress' || status == 'inprogress') &&
            onPause != null)
          QuickActionButtonVariants.warning(
            icon: Icons.pause,
            label: 'Pause',
            onPressed: isLoading ? null : onPause,
            isCompact: true,
          ),

        // Resume button (for paused)
        if (status == 'paused' && onResume != null)
          QuickActionButtonVariants.primary(
            icon: Icons.play_arrow,
            label: 'Resume',
            onPressed: isLoading ? null : onResume,
            isCompact: true,
          ),

        // Complete button (for in-progress)
        if ((status == 'in_progress' || status == 'inprogress') &&
            onComplete != null)
          QuickActionButtonVariants.success(
            icon: Icons.check_circle_outline,
            label: 'Complete',
            onPressed: isLoading ? null : onComplete,
            isCompact: true,
          ),
      ],
    );
  }

  bool get _hasActions {
    final status = workOrder.status.toString();
    return (status == 'unassigned' || status == 'assigned') &&
            onStart != null ||
        (status == 'in_progress' || status == 'inprogress') &&
            (onPause != null || onComplete != null) ||
        status == 'paused' && onResume != null;
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }
}

/// Compact variant - No actions, just info
class CompactWorkOrderListCard extends StatelessWidget {
  final WorkOrderEntity workOrder;
  final VoidCallback onTap;

  const CompactWorkOrderListCard({
    super.key,
    required this.workOrder,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return WorkOrderListCard(
      workOrder: workOrder,
      onTap: onTap,
      showActions: false,
    );
  }
}

/// Swipeable variant with quick actions in swipe menu
class SwipeableWorkOrderListCard extends StatelessWidget {
  final WorkOrderEntity workOrder;
  final VoidCallback onTap;
  final VoidCallback? onStart;
  final VoidCallback? onPause;
  final VoidCallback? onComplete;
  final VoidCallback? onDelete;

  const SwipeableWorkOrderListCard({
    super.key,
    required this.workOrder,
    required this.onTap,
    this.onStart,
    this.onPause,
    this.onComplete,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('wo_${workOrder.id}'),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        // Show action menu in a bottom sheet
        await showModalBottomSheet<String>(
          context: context,
          builder: (context) => _QuickActionsBottomSheet(
            workOrder: workOrder,
            onStart: onStart,
            onPause: onPause,
            onComplete: onComplete,
            onDelete: onDelete,
          ),
        );

        // Don't actually dismiss, just trigger action
        return false;
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: REdgeInsets.only(right: DesignTokens.space4),
        color: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.more_horiz,
          color: Theme.of(context).colorScheme.onPrimary,
          size: DesignTokens.iconLg.sp,
        ),
      ),
      child: WorkOrderListCard(
        workOrder: workOrder,
        onTap: onTap,
        showActions: false,
      ),
    );
  }
}

/// Quick actions bottom sheet for swipeable cards
class _QuickActionsBottomSheet extends StatelessWidget {
  final WorkOrderEntity workOrder;
  final VoidCallback? onStart;
  final VoidCallback? onPause;
  final VoidCallback? onComplete;
  final VoidCallback? onDelete;

  const _QuickActionsBottomSheet({
    required this.workOrder,
    this.onStart,
    this.onPause,
    this.onComplete,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;
    final spacing = context.spacing;
    final status = workOrder.status.toString();

    return Container(
      padding: REdgeInsets.all(DesignTokens.space4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            width: DesignTokens.space10.w,
            height: DesignTokens.borderWidthMedium.h,
            decoration: BoxDecoration(
              color: theme.colorScheme.outline.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(spacing.radiusXs.r),
            ),
          ),

          DesignTokens.verticalSpaceMedium,

          Text(
            'WO #${workOrder.id}',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: DesignTokens.fontWeightSemiBold,
            ),
          ),

          DesignTokens.verticalSpaceMedium,

          // Actions
          if ((status == 'unassigned' || status == 'assigned') &&
              onStart != null)
            ListTile(
              leading: Icon(Icons.play_arrow, color: fsmTheme.actionStart),
              title: const Text('Start Work Order'),
              onTap: () => _handleStart(context, onStart!),
            ),

          if ((status == 'in_progress' || status == 'inprogress') &&
              onPause != null)
            ListTile(
              leading: Icon(Icons.pause, color: fsmTheme.actionPause),
              title: const Text('Pause Work Order'),
              onTap: () => _handlePause(context, onPause!),
            ),

          if ((status == 'in_progress' || status == 'inprogress') &&
              onComplete != null)
            ListTile(
              leading: Icon(Icons.check_circle, color: fsmTheme.actionComplete),
              title: const Text('Complete Work Order'),
              onTap: () => _handleComplete(context, onComplete!),
            ),

          if (onDelete != null) ...[
            const Divider(),
            ListTile(
              leading: Icon(Icons.delete, color: theme.colorScheme.error),
              title: Text('Delete',
                  style: TextStyle(color: theme.colorScheme.error)),
              onTap: () => _handleDelete(context, onDelete!),
            ),
          ],
        ],
      ),
    );
  }

  void _handleStart(BuildContext context, VoidCallback callback) {
    Navigator.pop(context);
    callback();
  }

  void _handlePause(BuildContext context, VoidCallback callback) {
    Navigator.pop(context);
    callback();
  }

  void _handleComplete(BuildContext context, VoidCallback callback) {
    Navigator.pop(context);
    callback();
  }

  void _handleDelete(BuildContext context, VoidCallback callback) {
    Navigator.pop(context);
    callback();
  }
}
