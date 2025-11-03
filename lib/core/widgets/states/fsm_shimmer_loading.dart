import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/spacing_theme.dart';

/// FSMShimmerLoading - Shimmer effect wrapper for skeleton screens
///
/// Wraps any widget with a shimmer loading effect, typically used for:
/// - Content placeholders while data is loading
/// - Skeleton screens
/// - Loading states that show the UI structure
///
/// Example usage:
/// ```dart
/// FSMShimmerLoading(
///   isLoading: true,
///   child: Container(
///     width: 200.w,
///     height: 20.h,
///     color: theme.colorScheme.surface,
///   ),
/// )
/// ```
class FSMShimmerLoading extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final Color? baseColor;
  final Color? highlightColor;

  const FSMShimmerLoading({
    super.key,
    required this.child,
    required this.isLoading,
    this.baseColor,
    this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    if (!isLoading) return child;

    final theme = Theme.of(context);
    return Shimmer.fromColors(
      baseColor: baseColor ?? theme.colorScheme.surfaceContainerHighest,
      highlightColor: highlightColor ?? theme.colorScheme.surface,
      child: child,
    );
  }
}

/// Pre-built shimmer components for common use cases

/// Shimmer box - rectangular placeholder
class FSMShimmerBox extends StatelessWidget {
  final double width;
  final double height;
  final double? borderRadius;

  const FSMShimmerBox({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final spacing = context.spacing;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(
          borderRadius ?? spacing.radiusSm.r,
        ),
      ),
    );
  }
}

/// Shimmer circle - circular placeholder (for avatars)
class FSMShimmerCircle extends StatelessWidget {
  final double size;

  const FSMShimmerCircle({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        shape: BoxShape.circle,
      ),
    );
  }
}

/// Shimmer text line - placeholder for text
class FSMShimmerTextLine extends StatelessWidget {
  final double width;
  final double height;

  const FSMShimmerTextLine({
    super.key,
    required this.width,
    this.height = 16,
  });

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return FSMShimmerBox(
      width: width,
      height: height,
      borderRadius: spacing.radiusSm,
    );
  }
}

/// Complete shimmer card for list items
class FSMShimmerListCard extends StatelessWidget {
  final double? height;
  final bool showLeading;
  final bool showTrailing;

  const FSMShimmerListCard({
    super.key,
    this.height,
    this.showLeading = true,
    this.showTrailing = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final spacing = context.spacing;

    return FSMShimmerLoading(
      isLoading: true,
      child: Container(
        height: height ?? DesignTokens.listItemHeight.h,
        padding: spacing.paddingMd,
        margin: REdgeInsets.symmetric(
          horizontal: spacing.space4,
          vertical: spacing.space2,
        ),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainer,
          borderRadius: spacing.radiusMdBr,
        ),
        child: Row(
          children: [
            // Leading icon/avatar
            if (showLeading) ...[
              FSMShimmerCircle(size: DesignTokens.iconXl.sp),
              spacing.horizontalSpaceMedium,
            ],

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FSMShimmerTextLine(
                      width: 150.w, height: DesignTokens.fontSize16.h),
                  spacing.verticalSpaceSmall,
                  FSMShimmerTextLine(
                      width: 100.w, height: DesignTokens.fontSize12.h),
                ],
              ),
            ),

            // Trailing icon
            if (showTrailing) ...[
              spacing.horizontalSpaceMedium,
              FSMShimmerBox(
                width: DesignTokens.iconMd.w,
                height: DesignTokens.iconMd.w,
                borderRadius: spacing.radiusSm,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Shimmer skeleton for work order card
class FSMShimmerWorkOrderCard extends StatelessWidget {
  const FSMShimmerWorkOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final spacing = context.spacing;

    return FSMShimmerLoading(
      isLoading: true,
      child: Container(
        margin: REdgeInsets.symmetric(
          horizontal: spacing.space4,
          vertical: spacing.space2,
        ),
        padding: spacing.paddingMd,
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainer,
          borderRadius: spacing.radiusMdBr,
          border: Border.all(
            color: theme.colorScheme.outlineVariant,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            Row(
              children: [
                FSMShimmerBox(width: 60.w, height: DesignTokens.fontSize14.h),
                const Spacer(),
                FSMShimmerBox(width: 80.w, height: DesignTokens.fontSize16.h),
              ],
            ),
            spacing.verticalSpaceMedium,

            // Title
            FSMShimmerTextLine(
                width: double.infinity, height: DesignTokens.fontSize18.h),
            spacing.verticalSpaceSmall,

            // Description
            FSMShimmerTextLine(width: 200.w, height: DesignTokens.fontSize14.h),
            spacing.verticalSpaceMedium,

            // Metadata rows
            Row(
              children: [
                FSMShimmerBox(
                    width: DesignTokens.iconXs.w,
                    height: DesignTokens.iconXs.w),
                spacing.horizontalSpaceSmall,
                FSMShimmerTextLine(
                    width: 120.w, height: DesignTokens.fontSize12.h),
              ],
            ),
            spacing.verticalSpaceSmall,
            Row(
              children: [
                FSMShimmerBox(
                    width: DesignTokens.iconXs.w,
                    height: DesignTokens.iconXs.w),
                spacing.horizontalSpaceSmall,
                FSMShimmerTextLine(
                    width: 100.w, height: DesignTokens.fontSize12.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// List of shimmer cards
class FSMShimmerList extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext context, int index)? itemBuilder;

  const FSMShimmerList({
    super.key,
    this.itemCount = 5,
    this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder:
          itemBuilder ?? (context, index) => const FSMShimmerListCard(),
    );
  }
}
