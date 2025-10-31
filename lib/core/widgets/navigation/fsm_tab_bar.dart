import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/spacing_theme.dart';

class CustomTabBar extends StatelessWidget {
  final TabController controller;
  final List<String> tabs;

  const CustomTabBar({
    super.key,
    required this.controller,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _CustomTabBarDelegate(
        controller: controller,
        tabs: tabs,
      ),
    );
  }
}

class _CustomTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabController controller;
  final List<String> tabs;

  _CustomTabBarDelegate({
    required this.controller,
    required this.tabs,
  });

  @override
  double get minExtent => 60.h;

  @override
  double get maxExtent => 60.h;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final theme = Theme.of(context);
    final spacing = context.spacing;

    return Container(
      color: theme.scaffoldBackgroundColor,
      padding: REdgeInsets.symmetric(
        horizontal: spacing.space4,
        vertical: spacing.space2,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(spacing.radiusXl.r),
          border: Border.all(
            color: theme.colorScheme.outlineVariant,
            width: DesignTokens.borderWidthThin,
          ),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.shadow.withValues(alpha: 0.03),
              blurRadius: DesignTokens.space2,
              offset: Offset(0, DesignTokens.space1),
            ),
          ],
        ),
        child: TabBar(
          controller: controller,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(spacing.radiusXl.r),
            color: theme.colorScheme.primary,
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.primary.withValues(alpha: 0.3),
                blurRadius: DesignTokens.space2,
                offset: Offset(0, DesignTokens.space1),
              ),
            ],
          ),
          labelColor: theme.colorScheme.onPrimary,
          unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
          labelStyle: theme.textTheme.labelMedium?.copyWith(
            fontWeight: DesignTokens.fontWeightBold,
            letterSpacing: 0.2,
          ),
          unselectedLabelStyle: theme.textTheme.labelMedium?.copyWith(
            fontWeight: DesignTokens.fontWeightSemiBold,
            letterSpacing: 0.1,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          labelPadding: REdgeInsets.symmetric(horizontal: spacing.space1),
          tabs: tabs
              .map((tab) => Tab(
                    child: Container(
                      padding: REdgeInsets.symmetric(vertical: spacing.space2),
                      child: Text(
                        tab,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
