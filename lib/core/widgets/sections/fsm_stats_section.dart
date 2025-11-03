import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fsm/core/theme/design_tokens.dart';
import '../cards/fsm_stats_card.dart';

/// FSMStatsSection - Unified stats display component for all pages
///
/// Provides configurable statistics display with:
/// - Grid layout for stats cards
/// - Support for different grid configurations (2x2, 3x1, etc.)
/// - Consistent spacing and responsive design
/// - Loading and error states
/// - Optional header with title and action
///
/// Use cases:
/// - Dashboard work order statistics
/// - Document counts and categories
/// - Parts inventory metrics
/// - Any page-level metrics display
class FSMStatsSection extends StatelessWidget {
  final List<StatsCardData> statsData;
  final String? title;
  final Widget? titleAction;
  final int crossAxisCount;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback? onRetry;

  const FSMStatsSection({
    super.key,
    required this.statsData,
    this.title,
    this.titleAction,
    this.crossAxisCount = 2,
    this.height,
    this.padding,
    this.margin,
    this.isLoading = false,
    this.errorMessage,
    this.onRetry,
  });

  /// Dashboard stats variant - 2x2 grid for work orders
  const FSMStatsSection.dashboard({
    super.key,
    required this.statsData,
    this.titleAction,
    this.height,
    this.isLoading = false,
    this.errorMessage,
    this.onRetry,
  })  : title = 'Work Orders',
        crossAxisCount = 2,
        padding = null,
        margin = null;

  /// Documents stats variant - horizontal layout for counts
  const FSMStatsSection.documents({
    super.key,
    required this.statsData,
    this.titleAction,
    this.height,
    this.isLoading = false,
    this.errorMessage,
    this.onRetry,
  })  : title = 'Documents',
        crossAxisCount = 3,
        padding = null,
        margin = null;

  /// Parts stats variant - horizontal layout for inventory
  const FSMStatsSection.parts({
    super.key,
    required this.statsData,
    this.titleAction,
    this.height,
    this.isLoading = false,
    this.errorMessage,
    this.onRetry,
  })  : title = 'Inventory',
        crossAxisCount = 3,
        padding = null,
        margin = null;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectivePadding = padding ??
        REdgeInsets.fromLTRB(
          DesignTokens.space4,
          DesignTokens.space2,
          DesignTokens.space4,
          DesignTokens.space2,
        );
    final effectiveMargin = margin ?? REdgeInsets.all(0);

    return Container(
      margin: effectiveMargin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          if (title != null || titleAction != null)
            Padding(
              padding: REdgeInsets.fromLTRB(
                effectivePadding.horizontal / 2,
                effectivePadding.vertical / 2,
                effectivePadding.horizontal / 2,
                DesignTokens.space2.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (title != null)
                    Text(
                      title!,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  if (titleAction != null) titleAction!,
                ],
              ),
            ),

          // Stats content
          Padding(
            padding: effectivePadding,
            child: _buildStatsContent(context),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsContent(BuildContext context) {
    if (isLoading) {
      return _buildLoadingState(context);
    }

    if (errorMessage != null) {
      return _buildErrorState(context);
    }

    if (statsData.isEmpty) {
      return _buildEmptyState(context);
    }

    return _buildStatsGrid(context);
  }

  Widget _buildStatsGrid(BuildContext context) {
    final itemHeight = height ?? (crossAxisCount == 2 ? 80.h : 70.h);

    return SizedBox(
      height: crossAxisCount == 2
          ? (itemHeight * 2) + DesignTokens.space3.h // 2 rows + spacing
          : itemHeight, // 1 row
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: DesignTokens.space3.w,
          mainAxisSpacing: DesignTokens.space3.h,
          childAspectRatio: crossAxisCount == 2 ? 2.2 : 2.8,
        ),
        itemCount: statsData.length,
        itemBuilder: (context, index) {
          final data = statsData[index];
          return StatsCard(
            title: data.title,
            count: data.count,
            icon: data.icon,
            color: data.color,
            onTap: data.onTap,
          );
        },
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    final theme = Theme.of(context);
    final itemHeight = height ?? (crossAxisCount == 2 ? 80.h : 70.h);

    return SizedBox(
      height: crossAxisCount == 2
          ? (itemHeight * 2) + DesignTokens.space3.h
          : itemHeight,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: DesignTokens.space3.w,
          mainAxisSpacing: DesignTokens.space3.h,
          childAspectRatio: crossAxisCount == 2 ? 2.2 : 2.8,
        ),
        itemCount: crossAxisCount == 2 ? 4 : 3,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
            ),
            child: Center(
              child: SizedBox(
                width: 20.w,
                height: 20.h,
                child: CircularProgressIndicator(
                  strokeWidth: 2.w,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    theme.colorScheme.primary,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildErrorState(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 80.h,
      padding: REdgeInsets.all(DesignTokens.space3),
      decoration: BoxDecoration(
        color: theme.colorScheme.errorContainer.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
        border: Border.all(
          color: theme.colorScheme.error.withValues(alpha: 0.2),
          width: 1.w,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: theme.colorScheme.error,
            size: DesignTokens.iconMd.sp,
          ),
          RSizedBox(width: DesignTokens.space3),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Failed to load stats',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.error,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (errorMessage != null) ...[
                  RSizedBox(height: DesignTokens.space1),
                  Text(
                    errorMessage!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onErrorContainer,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          if (onRetry != null) ...[
            RSizedBox(width: DesignTokens.space2),
            IconButton(
              onPressed: onRetry,
              icon: Icon(
                Icons.refresh,
                color: theme.colorScheme.error,
                size: DesignTokens.iconSm.sp,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 80.h,
      padding: REdgeInsets.all(DesignTokens.space3),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.analytics_outlined,
              color: theme.colorScheme.onSurfaceVariant,
              size: DesignTokens.iconMd.sp,
            ),
            RSizedBox(width: DesignTokens.space2),
            Text(
              'No statistics available',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
