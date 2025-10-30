import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/core/theme/app_dimensions.dart';

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
///     color: Colors.white,
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

    return Shimmer.fromColors(
      baseColor: baseColor ?? AppColors.grey200,
      highlightColor: highlightColor ?? AppColors.grey50,
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
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.grey200,
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppDimensions.radiusSmall,
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
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.grey200,
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
    return FSMShimmerBox(
      width: width,
      height: height,
      borderRadius: AppDimensions.radiusSmall,
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
    return FSMShimmerLoading(
      isLoading: true,
      child: Container(
        height: height ?? 80.h,
        padding: AppDimensions.paddingAllMedium,
        margin: EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingMedium,
          vertical: AppDimensions.paddingSmall,
        ),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        ),
        child: Row(
          children: [
            // Leading icon/avatar
            if (showLeading) ...[
              FSMShimmerCircle(size: 40.sp),
              SizedBox(width: AppDimensions.spaceMedium),
            ],

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FSMShimmerTextLine(width: 150.w, height: 16.h),
                  SizedBox(height: AppDimensions.spaceSmall),
                  FSMShimmerTextLine(width: 100.w, height: 12.h),
                ],
              ),
            ),

            // Trailing icon
            if (showTrailing) ...[
              SizedBox(width: AppDimensions.spaceMedium),
              FSMShimmerBox(
                width: 24.w,
                height: 24.w,
                borderRadius: AppDimensions.radiusSmall,
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
    return FSMShimmerLoading(
      isLoading: true,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingMedium,
          vertical: AppDimensions.paddingSmall,
        ),
        padding: AppDimensions.paddingAllMedium,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
          border: Border.all(color: AppColors.grey200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            Row(
              children: [
                FSMShimmerBox(width: 60.w, height: 20.h),
                const Spacer(),
                FSMShimmerBox(width: 80.w, height: 24.h),
              ],
            ),
            SizedBox(height: AppDimensions.spaceMedium),

            // Title
            FSMShimmerTextLine(width: double.infinity, height: 18.h),
            SizedBox(height: AppDimensions.spaceSmall),

            // Description
            FSMShimmerTextLine(width: 200.w, height: 14.h),
            SizedBox(height: AppDimensions.spaceMedium),

            // Metadata rows
            Row(
              children: [
                FSMShimmerBox(width: 16.w, height: 16.w),
                SizedBox(width: AppDimensions.spaceSmall),
                FSMShimmerTextLine(width: 120.w, height: 12.h),
              ],
            ),
            SizedBox(height: AppDimensions.spaceSmall),
            Row(
              children: [
                FSMShimmerBox(width: 16.w, height: 16.w),
                SizedBox(width: AppDimensions.spaceSmall),
                FSMShimmerTextLine(width: 100.w, height: 12.h),
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
      itemBuilder: itemBuilder ??
          (context, index) => const FSMShimmerListCard(),
    );
  }
}
