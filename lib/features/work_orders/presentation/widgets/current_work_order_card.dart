import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';
import 'package:fsm/core/theme/spacing_theme.dart';
import 'package:fsm/core/widgets/status_badge.dart';
import 'package:fsm/core/widgets/priority_indicator.dart';
import 'package:fsm/core/widgets/layout/fsm_metadata_row.dart';
import 'package:fsm/core/widgets/quick_action_button.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:intl/intl.dart';

/// CurrentWorkOrderCard - Prominent card showing FSE's active work order
///
/// Displays the current in-progress work order with:
/// - Left accent border (4dp, orange/amber)
/// - Status badge + WO number + Priority indicator
/// - Issue description (max 2 lines)
/// - Location + Time metadata
/// - Quick action buttons (Pause, Parts, Docs, Complete)
///
/// Full-width with 16dp margins, 12r corners, elevation 4
class CurrentWorkOrderCard extends StatelessWidget {
  final WorkOrderEntity workOrder;
  final VoidCallback? onPause;
  final VoidCallback? onParts;
  final VoidCallback? onDocs;
  final VoidCallback? onComplete;
  final VoidCallback? onTap;

  const CurrentWorkOrderCard({
    super.key,
    required this.workOrder,
    this.onPause,
    this.onParts,
    this.onDocs,
    this.onComplete,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;
    final spacing = context.spacing;

    final startTime = workOrder.startedAt;
    final timeText = startTime != null
        ? 'Started: ${DateFormat('h:mm a').format(startTime)}'
        : 'Not started';

    return Padding(
      padding: REdgeInsets.symmetric(
        horizontal: DesignTokens.space4,
        vertical: DesignTokens.space2,
      ),
      child: Material(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(spacing.radiusMd.r),
        elevation: DesignTokens.elevationSmall,
        shadowColor: theme.colorScheme.shadow.withValues(alpha: 0.26),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(spacing.radiusMd.r),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(spacing.radiusMd.r),
              border: Border(
                left: BorderSide(
                  color: fsmTheme.warning,
                  width: DesignTokens.borderWidthMedium.w,
                ),
              ),
            ),
            child: Padding(
              padding: REdgeInsets.all(DesignTokens.space4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header: Status + WO Number + Priority
                  Row(
                    children: [
                      StatusBadge.status(
                        status: workOrder.status.toString(),
                        variant: StatusBadgeVariant.filled,
                      ),
                      const Spacer(),
                      PriorityIndicator(
                        priority: workOrder.priority.toString(),
                        type: PriorityIndicatorType.badge,
                        showLabel: true,
                      ),
                    ],
                  ),

                  DesignTokens.verticalSpace(DesignTokens.space3),

                  // WO Number
                  Text(
                    workOrder.woNumber,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: DesignTokens.fontWeightBold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),

                  DesignTokens.verticalSpaceSmall,

                  // Issue Description (max 2 lines)
                  Text(
                    workOrder.problemDescription,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  DesignTokens.verticalSpace(DesignTokens.space3),

                  // Metadata: Location + Time
                  MetadataRow(
                    items: [
                      MetadataItem(
                        icon: Icons.location_on_outlined,
                        text: workOrder.location,
                      ),
                      MetadataItem(
                        icon: Icons.access_time,
                        text: timeText,
                      ),
                    ],
                  ),

                  DesignTokens.verticalSpaceMedium,

                  // Quick Actions Row
                  Wrap(
                    spacing: DesignTokens.space2.w,
                    runSpacing: DesignTokens.space2.h,
                    children: [
                      if (onPause != null)
                        QuickActionButton(
                          icon: Icons.pause,
                          label: 'Pause',
                          onPressed: onPause!,
                          backgroundColor: fsmTheme.warning,
                          color: theme.colorScheme.onPrimary,
                        ),
                      if (onParts != null)
                        QuickActionButton(
                          icon: Icons.inventory_2_outlined,
                          label: 'Parts',
                          onPressed: onParts!,
                          backgroundColor: fsmTheme.info,
                          color: theme.colorScheme.onPrimary,
                        ),
                      if (onDocs != null)
                        QuickActionButton(
                          icon: Icons.description_outlined,
                          label: 'Docs',
                          onPressed: onDocs!,
                          backgroundColor: theme.colorScheme.secondary,
                          color: theme.colorScheme.onSecondary,
                        ),
                      if (onComplete != null)
                        QuickActionButton(
                          icon: Icons.check_circle_outline,
                          label: 'Complete',
                          onPressed: onComplete!,
                          backgroundColor: fsmTheme.success,
                          color: theme.colorScheme.onPrimary,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
