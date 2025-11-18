import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/router/app_router.gr.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';
import 'package:fsm/core/theme/spacing_theme.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';

/// Minimal, visually prominent card for in-progress work orders
/// Designed for carousel display with tap-to-navigate interaction
class InProgressWorkOrderCard extends StatelessWidget {
  const InProgressWorkOrderCard({
    super.key,
    required this.workOrder,
  });

  final WorkOrderEntity workOrder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;
    final spacing = context.spacing;

    return SizedBox(
      height: 140.h,
      width: 300.w,
      child: Padding(
        padding: REdgeInsets.only(right: DesignTokens.space3),
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(spacing.radiusMd.r),
          color: theme.colorScheme.surface,
          child: InkWell(
            onTap: () => _navigateToDetails(context),
            borderRadius: BorderRadius.circular(spacing.radiusMd.r),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: fsmTheme.statusInProgress,
                    width: 4.w,
                  ),
                ),
                borderRadius: BorderRadius.circular(spacing.radiusMd.r),
              ),
              child: Padding(
                padding: REdgeInsets.all(DesignTokens.space4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(context, theme, fsmTheme),
                    DesignTokens.verticalSpaceSmall,
                    _buildDescription(context, theme),
                    const Spacer(),
                    _buildMetadata(context, theme),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    ThemeData theme,
    FSMThemeExtension fsmTheme,
  ) {
    return Row(
      children: [
        Expanded(
          child: Text(
            workOrder.woNumber,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        DesignTokens.horizontalSpace(DesignTokens.space2),
        _buildPriorityBadge(context, theme, fsmTheme),
      ],
    );
  }

  Widget _buildPriorityBadge(
    BuildContext context,
    ThemeData theme,
    FSMThemeExtension fsmTheme,
  ) {
    final priorityColor = fsmTheme.getPriorityColor(
      workOrder.priority.name.toLowerCase(),
    );

    return Container(
      padding: REdgeInsets.symmetric(
        horizontal: DesignTokens.space2,
        vertical: 4.h,
      ),
      decoration: BoxDecoration(
        color: priorityColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        _getPriorityLabel(),
        style: theme.textTheme.labelSmall?.copyWith(
          color: priorityColor,
          fontWeight: FontWeight.w600,
          fontSize: DesignTokens.fontSize10.sp,
        ),
      ),
    );
  }

  Widget _buildDescription(BuildContext context, ThemeData theme) {
    return Text(
      workOrder.summary.isNotEmpty
          ? workOrder.summary
          : workOrder.problemDescription,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
        height: 1.4,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildMetadata(BuildContext context, ThemeData theme) {
    return Row(
      children: [
        Icon(
          Icons.location_on_outlined,
          size: DesignTokens.iconXs.sp,
          color: theme.colorScheme.onSurfaceVariant,
        ),
        DesignTokens.horizontalSpace(4.w),
        Expanded(
          child: Text(
            workOrder.locationDetails?.address ?? workOrder.location,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        DesignTokens.horizontalSpace(DesignTokens.space3),
        Icon(
          Icons.access_time,
          size: DesignTokens.iconXs.sp,
          color: theme.colorScheme.onSurfaceVariant,
        ),
        DesignTokens.horizontalSpace(4.w),
        Text(
          _getEstimatedTime(),
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  String _getPriorityLabel() {
    switch (workOrder.priority.name.toLowerCase()) {
      case 'urgent':
        return 'URGENT';
      case 'high':
        return 'HIGH';
      case 'medium':
        return 'MEDIUM';
      case 'low':
        return 'LOW';
      default:
        return 'N/A';
    }
  }

  String _getEstimatedTime() {
    final durationDays = workOrder.durationDays;
    if (durationDays == 0) {
      return 'N/A';
    }

    if (durationDays < 1) {
      // Convert fraction of day to hours
      final hours = (durationDays * 24).round();
      return '${hours}h';
    }

    return '${durationDays}d';
  }

  void _navigateToDetails(BuildContext context) {
    context.router.push(
      WorkOrderDetailsRoute(workOrderId: workOrder.id),
    );
  }
}
