import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/design_tokens.dart';
import '../../../../core/theme/extensions/fsm_theme_extension.dart';

/// ProfileStatsRow - Performance statistics row for profile screen (Redesign 2025)
///
/// Displays 3 equal-width stat cards showing work order performance:
/// - Completed: Total completed work orders
/// - Active: Currently active work orders
/// - On-Time: Percentage of work orders completed on time
///
/// Features:
/// - 3 equal-width cards in a row
/// - Icon + value + label layout
/// - Color-coded by stat type
/// - Loading state support
/// - Responsive design
///
/// Usage:
/// ```dart
/// ProfileStatsRow(
///   completed: 124,
///   active: 5,
///   onTimePercentage: 92.5,
/// )
/// ```
class ProfileStatsRow extends StatelessWidget {
  /// Number of completed work orders
  final int completed;

  /// Number of active work orders
  final int active;

  /// Percentage of work orders completed on time
  final double onTimePercentage;

  /// Whether the stats are loading
  final bool isLoading;

  const ProfileStatsRow({
    super.key,
    required this.completed,
    required this.active,
    required this.onTimePercentage,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;

    if (isLoading) {
      return _LoadingStatsRow();
    }

    return Container(
      margin: REdgeInsets.symmetric(
        horizontal: DesignTokens.space4,
        vertical: DesignTokens.space2,
      ),
      padding: REdgeInsets.symmetric(
        vertical: DesignTokens.space4,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // Completed
            Expanded(
              child: _StatCard(
                icon: Icons.check_circle_outline,
                value: completed.toString(),
                label: 'Completed',
                color: fsmTheme.success,
              ),
            ),

            // Divider
            VerticalDivider(
              width: 1.w,
              thickness: 1.w,
              color: theme.colorScheme.outlineVariant,
            ),

            // Active
            Expanded(
              child: _StatCard(
                icon: Icons.pending_actions_outlined,
                value: active.toString(),
                label: 'Active',
                color: theme.colorScheme.primary,
              ),
            ),

            // Divider
            VerticalDivider(
              width: 1.w,
              thickness: 1.w,
              color: theme.colorScheme.outlineVariant,
            ),

            // On-Time %
            Expanded(
              child: _StatCard(
                icon: Icons.schedule_outlined,
                value: '${onTimePercentage.toStringAsFixed(0)}%',
                label: 'On-Time',
                color: _getOnTimeColor(context, onTimePercentage),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getOnTimeColor(BuildContext context, double percentage) {
    final fsmTheme = context.fsmTheme;

    if (percentage >= 90) {
      return fsmTheme.success;
    } else if (percentage >= 75) {
      return fsmTheme.warning;
    } else {
      return Theme.of(context).colorScheme.error;
    }
  }
}

/// Individual stat card
class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: REdgeInsets.symmetric(
        vertical: DesignTokens.space2,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon
          Icon(
            icon,
            size: 28.sp,
            color: color,
          ),

          DesignTokens.verticalSpace(DesignTokens.space1 + 2),

          // Value
          Text(
            value,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: theme.colorScheme.onSurface,
              fontWeight: FontWeight.w700,
            ),
          ),

          DesignTokens.verticalSpace(2),

          // Label
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

/// Loading state for stats row
class _LoadingStatsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: REdgeInsets.symmetric(
        horizontal: DesignTokens.space4,
        vertical: DesignTokens.space2,
      ),
      padding: REdgeInsets.all(DesignTokens.space4),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          3,
          (index) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 28.w,
                height: 28.w,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
                  shape: BoxShape.circle,
                ),
              ),
              DesignTokens.verticalSpaceSmall,
              Container(
                width: 40.w,
                height: 20.h,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
                ),
              ),
              DesignTokens.verticalSpaceXs,
              Container(
                width: 50.w,
                height: 12.h,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
