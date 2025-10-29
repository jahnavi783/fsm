import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';

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
    if (isLoading) {
      return _LoadingStatsRow();
    }

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingMedium,
        vertical: AppDimensions.paddingSmall,
      ),
      padding: EdgeInsets.symmetric(
        vertical: AppDimensions.paddingMedium,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
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
                color: AppColors.success,
              ),
            ),

            // Divider
            VerticalDivider(
              width: 1.w,
              thickness: 1.w,
              color: AppColors.divider,
            ),

            // Active
            Expanded(
              child: _StatCard(
                icon: Icons.pending_actions_outlined,
                value: active.toString(),
                label: 'Active',
                color: AppColors.info,
              ),
            ),

            // Divider
            VerticalDivider(
              width: 1.w,
              thickness: 1.w,
              color: AppColors.divider,
            ),

            // On-Time %
            Expanded(
              child: _StatCard(
                icon: Icons.schedule_outlined,
                value: '${onTimePercentage.toStringAsFixed(0)}%',
                label: 'On-Time',
                color: _getOnTimeColor(onTimePercentage),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getOnTimeColor(double percentage) {
    if (percentage >= 90) {
      return AppColors.success;
    } else if (percentage >= 75) {
      return AppColors.warning;
    } else {
      return AppColors.error;
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
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppDimensions.paddingSmall,
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

          SizedBox(height: 6.h),

          // Value
          Text(
            value,
            style: AppTextStyles.headlineSmall.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(height: 2.h),

          // Label
          Text(
            label,
            style: AppTextStyles.labelSmall.copyWith(
              color: AppColors.textSecondary,
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
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingMedium,
        vertical: AppDimensions.paddingSmall,
      ),
      padding: EdgeInsets.all(AppDimensions.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
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
                  color: AppColors.grey200,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                width: 40.w,
                height: 20.h,
                decoration: BoxDecoration(
                  color: AppColors.grey200,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              SizedBox(height: 4.h),
              Container(
                width: 50.w,
                height: 12.h,
                decoration: BoxDecoration(
                  color: AppColors.grey200,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
