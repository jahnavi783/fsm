import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/spacing_theme.dart';

class StatsCard extends StatelessWidget {
  final String title;
  final String count;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const StatsCard({
    super.key,
    required this.title,
    required this.count,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final spacing = context.spacing;

    return AnimatedContainer(
      duration: DesignTokens.durationFast,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(spacing.radiusLg.r),
          child: Container(
            padding: REdgeInsets.symmetric(
              horizontal: DesignTokens.space3,
              vertical: DesignTokens.space3,
            ),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(spacing.radiusLg.r),
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.08),
                  blurRadius: DesignTokens.space3,
                  offset: Offset(0, DesignTokens.space1),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: theme.colorScheme.shadow.withValues(alpha: 0.03),
                  blurRadius: DesignTokens.space2,
                  offset: Offset(0, DesignTokens.borderWidthThin),
                ),
              ],
              border: Border.all(
                color: color.withValues(alpha: 0.1),
                width: DesignTokens.borderWidthThin,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon Container
                Container(
                  padding: REdgeInsets.all(DesignTokens.space2),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(spacing.radiusMd.r),
                    border: Border.all(
                      color: color.withValues(alpha: 0.2),
                      width: DesignTokens.borderWidthThin,
                    ),
                  ),
                  child: Icon(
                    icon,
                    color: color,
                    size: DesignTokens.iconXs.sp,
                  ),
                ),
                spacing.horizontalSpaceMedium,
                // Stats Column
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        count,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: DesignTokens.fontWeightBold,
                          color: theme.colorScheme.onSurface,
                          height: 1.0,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      DesignTokens.verticalSpaceXs,
                      Text(
                        title,
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontWeight: DesignTokens.fontWeightSemiBold,
                          color: theme.colorScheme.onSurfaceVariant,
                          height: 1.2,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                spacing.horizontalSpaceSmall,
                // Arrow
                Container(
                  padding: REdgeInsets.all(DesignTokens.space1),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(spacing.radiusSm.r),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: DesignTokens.iconXxs.sp,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StatsGrid extends StatelessWidget {
  final List<StatsCardData> statsData;

  const StatsGrid({
    super.key,
    required this.statsData,
  });

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return SliverPadding(
      padding: REdgeInsets.fromLTRB(
        spacing.space4,
        spacing.space1,
        spacing.space4,
        spacing.space2,
      ),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: spacing.space3.w,
          mainAxisSpacing: spacing.space3.h,
          childAspectRatio: 2.2, // Wider and shorter cards for compact layout
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final data = statsData[index];
            return StatsCard(
              title: data.title,
              count: data.count,
              icon: data.icon,
              color: data.color,
              onTap: data.onTap,
            );
          },
          childCount: statsData.length,
        ),
      ),
    );
  }
}

class StatsCardData {
  final String title;
  final String count;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const StatsCardData({
    required this.title,
    required this.count,
    required this.icon,
    required this.color,
    required this.onTap,
  });
}
