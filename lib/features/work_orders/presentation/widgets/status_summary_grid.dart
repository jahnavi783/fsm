import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/design_tokens.dart';
import '../../../../core/theme/extensions/fsm_theme_extension.dart';

/// StatusSummaryGrid - 2x2 grid showing work order counts by status
///
/// Features (Redesign 2025):
/// - 2x2 grid layout (Unassigned, Assigned, Paused, Completed)
/// - Equal height cards (1:1 aspect ratio)
/// - Color-coded status backgrounds (light variants)
/// - Icon + Number + Label layout
/// - Tap to filter work orders by status
/// - Ripple effect on tap
/// - 12dp gap between cards
///
/// Usage:
/// ```dart
/// StatusSummaryGrid(
///   unassignedCount: 5,
///   assignedCount: 12,
///   pausedCount: 3,
///   completedCount: 47,
///   onStatusTap: (status) {
///     dashboardBloc.add(FilterByStatus(status));
///   },
/// )
/// ```
class StatusSummaryGrid extends StatelessWidget {
  /// Count of unassigned work orders
  final int unassignedCount;

  /// Count of assigned work orders
  final int assignedCount;

  /// Count of paused work orders
  final int pausedCount;

  /// Count of completed work orders
  final int completedCount;

  /// Callback when a status card is tapped (passes status string)
  final Function(String status)? onStatusTap;

  /// Whether the grid is loading
  final bool isLoading;

  const StatusSummaryGrid({
    super.key,
    required this.unassignedCount,
    required this.assignedCount,
    required this.pausedCount,
    required this.completedCount,
    this.onStatusTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final fsmTheme = context.fsmTheme;

    if (isLoading) {
      return _LoadingGrid();
    }

    return Container(
      margin: REdgeInsets.symmetric(
        horizontal: DesignTokens.space4,
        vertical: DesignTokens.space2,
      ),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: DesignTokens.space4.h,
        crossAxisSpacing: DesignTokens.space4.w,
        childAspectRatio: 1.0, // 1:1 aspect ratio for equal height
        children: [
          _StatusCard(
            icon: Icons.assignment_outlined,
            count: unassignedCount,
            label: 'Unassigned',
            backgroundColor: fsmTheme.statusUnassigned,
            textColor: fsmTheme.statusTextUnassigned,
            onTap: () => onStatusTap?.call('unassigned'),
          ),
          _StatusCard(
            icon: Icons.assignment_ind_outlined,
            count: assignedCount,
            label: 'Assigned',
            backgroundColor: fsmTheme.statusAssigned,
            textColor: fsmTheme.statusTextAssigned,
            onTap: () => onStatusTap?.call('assigned'),
          ),
          _StatusCard(
            icon: Icons.pause_circle_outline,
            count: pausedCount,
            label: 'Paused',
            backgroundColor: fsmTheme.statusPaused,
            textColor: fsmTheme.statusTextPaused,
            onTap: () => onStatusTap?.call('paused'),
          ),
          _StatusCard(
            icon: Icons.check_circle_outline,
            count: completedCount,
            label: 'Completed',
            backgroundColor: fsmTheme.statusCompleted,
            textColor: fsmTheme.statusTextCompleted,
            onTap: () => onStatusTap?.call('completed'),
          ),
        ],
      ),
    );
  }
}

/// Individual status card in the grid
class _StatusCard extends StatelessWidget {
  final IconData icon;
  final int count;
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback? onTap;

  const _StatusCard({
    required this.icon,
    required this.count,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: backgroundColor,
      elevation: 2,
      borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
        child: Container(
          padding: REdgeInsets.all(DesignTokens.space4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon
              Icon(
                icon,
                size: 40.sp,
                color: textColor,
              ),

              RSizedBox(height: DesignTokens.space2),

              // Count
              Text(
                count.toString(),
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w700,
                ),
              ),

              RSizedBox(height: DesignTokens.space1),

              // Label
              Text(
                label,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Loading state for status summary grid
class _LoadingGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: REdgeInsets.symmetric(
        horizontal: DesignTokens.space4,
        vertical: DesignTokens.space2,
      ),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: DesignTokens.space4.h,
        crossAxisSpacing: DesignTokens.space4.w,
        childAspectRatio: 1.0,
        children: List.generate(
          4,
          (index) => Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
            ),
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2.w,
                valueColor: AlwaysStoppedAnimation<Color>(
                  theme.colorScheme.primary.withValues(alpha: 0.5),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Compact variant - Single row of status chips instead of grid
///
/// Use this when vertical space is limited
class StatusSummaryChips extends StatelessWidget {
  final int unassignedCount;
  final int assignedCount;
  final int pausedCount;
  final int completedCount;
  final Function(String status)? onStatusTap;

  const StatusSummaryChips({
    super.key,
    required this.unassignedCount,
    required this.assignedCount,
    required this.pausedCount,
    required this.completedCount,
    this.onStatusTap,
  });

  @override
  Widget build(BuildContext context) {
    final fsmTheme = context.fsmTheme;

    return Container(
      margin: REdgeInsets.symmetric(
        horizontal: DesignTokens.space4,
        vertical: DesignTokens.space2,
      ),
      child: Wrap(
        spacing: DesignTokens.space2.w,
        runSpacing: DesignTokens.space2.h,
        children: [
          _StatusChip(
            label: 'Unassigned',
            count: unassignedCount,
            backgroundColor: fsmTheme.statusUnassigned,
            textColor: fsmTheme.statusTextUnassigned,
            onTap: () => onStatusTap?.call('unassigned'),
          ),
          _StatusChip(
            label: 'Assigned',
            count: assignedCount,
            backgroundColor: fsmTheme.statusAssigned,
            textColor: fsmTheme.statusTextAssigned,
            onTap: () => onStatusTap?.call('assigned'),
          ),
          _StatusChip(
            label: 'Paused',
            count: pausedCount,
            backgroundColor: fsmTheme.statusPaused,
            textColor: fsmTheme.statusTextPaused,
            onTap: () => onStatusTap?.call('paused'),
          ),
          _StatusChip(
            label: 'Completed',
            count: completedCount,
            backgroundColor: fsmTheme.statusCompleted,
            textColor: fsmTheme.statusTextCompleted,
            onTap: () => onStatusTap?.call('completed'),
          ),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String label;
  final int count;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback? onTap;

  const _StatusChip({
    required this.label,
    required this.count,
    required this.backgroundColor,
    required this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
        child: Padding(
          padding: REdgeInsets.symmetric(
            horizontal: DesignTokens.space4,
            vertical: DesignTokens.space2,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              RSizedBox(width: DesignTokens.space1),
              Container(
                padding: REdgeInsets.symmetric(
                  horizontal: DesignTokens.space2,
                  vertical: 2.h,
                ),
                decoration: BoxDecoration(
                  color: textColor,
                  borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
                ),
                child: Text(
                  count.toString(),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: backgroundColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
