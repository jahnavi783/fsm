import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fsm/core/theme/design_tokens.dart';

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

    return AnimatedContainer(
      duration: DesignTokens.durationFast,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
          child: Container(
            padding: REdgeInsets.symmetric(
              horizontal: DesignTokens.space3,
              vertical: DesignTokens.space2,
            ),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.08),
                  blurRadius: DesignTokens.elevationMd,
                  offset: const Offset(0, 4),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: theme.colorScheme.shadow.withValues(alpha: 0.03),
                  blurRadius: DesignTokens.elevationSm,
                  offset: const Offset(0, 1),
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
                    borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
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
                RSizedBox(width: DesignTokens.space2),
                // Stats Column
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        count,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: DesignTokens.fontSize18.sp,
                          fontWeight: DesignTokens.fontWeightBold,
                          color: theme.colorScheme.onSurface,
                          height: 1.0,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      RSizedBox(height: DesignTokens.space1),
                      Text(
                        title,
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontSize: DesignTokens.fontSize10.sp,
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
                RSizedBox(width: DesignTokens.space2),
                // Arrow
                Container(
                  padding: REdgeInsets.all(DesignTokens.space1),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(DesignTokens.radiusXs.r),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: DesignTokens.iconXs.sp * 0.6, // Smaller arrow icon
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
    return SliverPadding(
      padding: REdgeInsets.fromLTRB(
        DesignTokens.space4,
        DesignTokens.space1,
        DesignTokens.space4,
        DesignTokens.space2,
      ),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: DesignTokens.space3.w,
          mainAxisSpacing: DesignTokens.space3.h,
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
