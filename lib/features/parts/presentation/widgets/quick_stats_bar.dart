import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';

/// QuickStatsBar - Horizontal stat chips for parts overview
///
/// Features (Redesign 2025):
/// - 3 stat chips: Total Parts, In Stock, Low Stock
/// - Icon + number + label layout
/// - Dividers between chips
/// - Tappable for quick filtering
/// - Responsive design with equal width distribution
///
/// Usage:
/// ```dart
/// QuickStatsBar(
///   totalParts: 247,
///   inStock: 189,
///   lowStock: 12,
///   onTotalTap: () => filterParts('all'),
///   onInStockTap: () => filterParts('in_stock'),
///   onLowStockTap: () => filterParts('low_stock'),
/// )
/// ```
class QuickStatsBar extends StatelessWidget {
  /// Total number of parts
  final int totalParts;

  /// Number of parts in stock
  final int inStock;

  /// Number of parts with low stock
  final int lowStock;

  /// Callback when Total chip is tapped
  final VoidCallback? onTotalTap;

  /// Callback when In Stock chip is tapped
  final VoidCallback? onInStockTap;

  /// Callback when Low Stock chip is tapped
  final VoidCallback? onLowStockTap;

  /// Whether the stats are loading
  final bool isLoading;

  const QuickStatsBar({
    super.key,
    required this.totalParts,
    required this.inStock,
    required this.lowStock,
    this.onTotalTap,
    this.onInStockTap,
    this.onLowStockTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return _LoadingStatsBar();
    }

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingMedium,
        vertical: AppDimensions.paddingSmall,
      ),
      padding: EdgeInsets.symmetric(
        vertical: AppDimensions.paddingSmall,
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
            // Total Parts
            Expanded(
              child: _StatChip(
                icon: Icons.inventory_2_outlined,
                value: totalParts,
                label: 'Total',
                color: AppColors.primary,
                onTap: onTotalTap,
              ),
            ),

            // Divider
            VerticalDivider(
              width: 1.w,
              thickness: 1.w,
              color: AppColors.divider,
            ),

            // In Stock
            Expanded(
              child: _StatChip(
                icon: Icons.check_circle_outline,
                value: inStock,
                label: 'In Stock',
                color: AppColors.success,
                onTap: onInStockTap,
              ),
            ),

            // Divider
            VerticalDivider(
              width: 1.w,
              thickness: 1.w,
              color: AppColors.divider,
            ),

            // Low Stock
            Expanded(
              child: _StatChip(
                icon: Icons.warning_amber_outlined,
                value: lowStock,
                label: 'Low Stock',
                color: AppColors.warning,
                onTap: onLowStockTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Individual stat chip
class _StatChip extends StatelessWidget {
  final IconData icon;
  final int value;
  final String label;
  final Color color;
  final VoidCallback? onTap;

  const _StatChip({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        child: Padding(
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
                value.toString(),
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
        ),
      ),
    );
  }
}

/// Loading state for stats bar
class _LoadingStatsBar extends StatelessWidget {
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
