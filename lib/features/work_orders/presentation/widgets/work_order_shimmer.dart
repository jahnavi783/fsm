import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theme/design_tokens.dart';

class WorkOrderShimmer extends StatelessWidget {
  const WorkOrderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Use theme-based shimmer colors
    final baseColor = colorScheme.surfaceContainerHighest;
    final highlightColor = colorScheme.surface;
    final placeholderColor = colorScheme.surface;

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Card(
        margin: REdgeInsets.symmetric(
          horizontal: DesignTokens.space4,
          vertical: DesignTokens.space2,
        ),
        elevation: DesignTokens.elevationSm,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
        ),
        child: Padding(
          padding: REdgeInsets.all(DesignTokens.space4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with WO number and status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 120.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      color: placeholderColor,
                      borderRadius: BorderRadius.circular(DesignTokens.radiusXs.r),
                    ),
                  ),
                  Container(
                    width: 80.w,
                    height: 24.h,
                    decoration: BoxDecoration(
                      color: placeholderColor,
                      borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
                    ),
                  ),
                ],
              ),

              DesignTokens.verticalSpaceSmall,

              // Summary lines
              Container(
                width: double.infinity,
                height: 16.h,
                decoration: BoxDecoration(
                  color: placeholderColor,
                  borderRadius: BorderRadius.circular(DesignTokens.radiusXs.r),
                ),
              ),

              DesignTokens.verticalSpace(DesignTokens.space1),

              Container(
                width: 200.w,
                height: 16.h,
                decoration: BoxDecoration(
                  color: placeholderColor,
                  borderRadius: BorderRadius.circular(DesignTokens.radiusXs.r),
                ),
              ),

              DesignTokens.verticalSpaceMd,

              // Priority and Date row
              Row(
                children: [
                  Container(
                    width: 60.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      color: placeholderColor,
                      borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
                    ),
                  ),

                  DesignTokens.horizontalSpaceMd,

                  Container(
                    width: 100.w,
                    height: 16.h,
                    decoration: BoxDecoration(
                      color: placeholderColor,
                      borderRadius: BorderRadius.circular(DesignTokens.radiusXs.r),
                    ),
                  ),
                ],
              ),

              DesignTokens.verticalSpaceMd,

              // Customer and Location
              Container(
                width: 150.w,
                height: 14.h,
                decoration: BoxDecoration(
                  color: placeholderColor,
                  borderRadius: BorderRadius.circular(DesignTokens.radiusXs.r),
                ),
              ),

              DesignTokens.verticalSpace(DesignTokens.space1),

              Container(
                width: 180.w,
                height: 14.h,
                decoration: BoxDecoration(
                  color: placeholderColor,
                  borderRadius: BorderRadius.circular(DesignTokens.radiusXs.r),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WorkOrderListShimmer extends StatelessWidget {
  final int itemCount;

  const WorkOrderListShimmer({
    super.key,
    this.itemCount = 5,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) => const WorkOrderShimmer(),
    );
  }
}