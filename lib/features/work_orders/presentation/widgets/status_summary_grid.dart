import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
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
      margin: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingMedium,
        vertical: AppDimensions.paddingSmall,
      ),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: AppDimensions.paddingMedium,
        crossAxisSpacing: AppDimensions.paddingMedium,
        childAspectRatio: 1.0, // 1:1 aspect ratio for equal height
        children: [
          _StatusCard(
            icon: Icons.assignment_outlined,
            count: unassignedCount,
            label: 'Unassigned',
            backgroundColor: fsmTheme.statusColors['unassigned']!,
            textColor: fsmTheme.statusTextColors['unassigned']!,
            onTap: () => onStatusTap?.call('unassigned'),
          ),
          _StatusCard(
            icon: Icons.assignment_ind_outlined,
            count: assignedCount,
            label: 'Assigned',
            backgroundColor: fsmTheme.statusColors['assigned']!,
            textColor: fsmTheme.statusTextColors['assigned']!,
            onTap: () => onStatusTap?.call('assigned'),
          ),
          _StatusCard(
            icon: Icons.pause_circle_outline,
            count: pausedCount,
            label: 'Paused',
            backgroundColor: fsmTheme.statusColors['paused']!,
            textColor: fsmTheme.statusTextColors['paused']!,
            onTap: () => onStatusTap?.call('paused'),
          ),
          _StatusCard(
            icon: Icons.check_circle_outline,
            count: completedCount,
            label: 'Completed',
            backgroundColor: fsmTheme.statusColors['completed']!,
            textColor: fsmTheme.statusTextColors['completed']!,
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
    return Material(
      color: backgroundColor,
      elevation: AppDimensions.elevationSmall,
      borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        child: Container(
          padding: EdgeInsets.all(AppDimensions.paddingMedium),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon
              Icon(
                icon,
                size: 40.sp,
                color: textColor,
              ),

              SizedBox(height: AppDimensions.paddingSmall),

              // Count
              Text(
                count.toString(),
                style: AppTextStyles.headlineMedium.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: AppDimensions.paddingXSmall),

              // Label
              Text(
                label,
                style: AppTextStyles.labelMedium.copyWith(
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
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingMedium,
        vertical: AppDimensions.paddingSmall,
      ),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: AppDimensions.paddingMedium,
        crossAxisSpacing: AppDimensions.paddingMedium,
        childAspectRatio: 1.0,
        children: List.generate(
          4,
          (index) => Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
            ),
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2.w,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.primary.withValues(alpha: 0.5),
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
      margin: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingMedium,
        vertical: AppDimensions.paddingSmall,
      ),
      child: Wrap(
        spacing: AppDimensions.paddingSmall,
        runSpacing: AppDimensions.paddingSmall,
        children: [
          _StatusChip(
            label: 'Unassigned',
            count: unassignedCount,
            backgroundColor: fsmTheme.statusColors['unassigned']!,
            textColor: fsmTheme.statusTextColors['unassigned']!,
            onTap: () => onStatusTap?.call('unassigned'),
          ),
          _StatusChip(
            label: 'Assigned',
            count: assignedCount,
            backgroundColor: fsmTheme.statusColors['assigned']!,
            textColor: fsmTheme.statusTextColors['assigned']!,
            onTap: () => onStatusTap?.call('assigned'),
          ),
          _StatusChip(
            label: 'Paused',
            count: pausedCount,
            backgroundColor: fsmTheme.statusColors['paused']!,
            textColor: fsmTheme.statusTextColors['paused']!,
            onTap: () => onStatusTap?.call('paused'),
          ),
          _StatusChip(
            label: 'Completed',
            count: completedCount,
            backgroundColor: fsmTheme.statusColors['completed']!,
            textColor: fsmTheme.statusTextColors['completed']!,
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
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingMedium,
            vertical: AppDimensions.paddingSmall,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: AppTextStyles.labelMedium.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: AppDimensions.paddingXSmall),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 2.h,
                ),
                decoration: BoxDecoration(
                  color: textColor,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusXSmall),
                ),
                child: Text(
                  count.toString(),
                  style: AppTextStyles.labelSmall.copyWith(
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
