import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/design_tokens.dart';
import '../../../../core/theme/extensions/fsm_theme_extension.dart';

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
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;

    if (isLoading) {
      return _LoadingStatsBar();
    }

    return Container(
      margin: REdgeInsets.symmetric(
        horizontal: DesignTokens.space4,
        vertical: DesignTokens.space2,
      ),
      padding: REdgeInsets.symmetric(
        vertical: DesignTokens.space2,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignTokens.radiusLg.r),
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
            // Total Parts
            Expanded(
              child: _StatChip(
                icon: Icons.inventory_2_outlined,
                value: totalParts,
                label: 'Total',
                color: theme.colorScheme.primary,
                onTap: onTotalTap,
              ),
            ),

            // Divider
            VerticalDivider(
              width: 1.w,
              thickness: 1.w,
              color: theme.colorScheme.outline.withValues(alpha: 0.3),
            ),

            // In Stock
            Expanded(
              child: _StatChip(
                icon: Icons.check_circle_outline,
                value: inStock,
                label: 'In Stock',
                color: fsmTheme.success,
                onTap: onInStockTap,
              ),
            ),

            // Divider
            VerticalDivider(
              width: 1.w,
              thickness: 1.w,
              color: theme.colorScheme.outline.withValues(alpha: 0.3),
            ),

            // Low Stock
            Expanded(
              child: _StatChip(
                icon: Icons.warning_amber_outlined,
                value: lowStock,
                label: 'Low Stock',
                color: fsmTheme.warning,
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
    final theme = Theme.of(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(DesignTokens.radiusLg.r),
        child: Padding(
          padding: REdgeInsets.symmetric(
            vertical: DesignTokens.space2,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon
              Icon(
                icon,
                size: DesignTokens.iconLg.sp,
                color: color,
              ),

              RSizedBox(height: DesignTokens.space1 + 2),

              // Value
              Text(
                value.toString(),
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),

              RSizedBox(height: DesignTokens.space1 / 2),

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
        ),
      ),
    );
  }
}

/// Loading state for stats bar
class _LoadingStatsBar extends StatelessWidget {
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
        borderRadius: BorderRadius.circular(DesignTokens.radiusLg.r),
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
                width: DesignTokens.iconLg.w,
                height: DesignTokens.iconLg.w,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                ),
              ),
              RSizedBox(height: DesignTokens.space2),
              Container(
                width: 40.w,
                height: DesignTokens.space4.h + 4,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
                ),
              ),
              RSizedBox(height: DesignTokens.space1),
              Container(
                width: 50.w,
                height: DesignTokens.space3.h,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
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
