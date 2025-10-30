import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/core/theme/app_dimensions.dart';
import 'package:shimmer/shimmer.dart';

class DocumentShimmer extends StatelessWidget {
  final int itemCount;

  const DocumentShimmer({
    super.key,
    this.itemCount = 5,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView.builder(
      padding: AppDimensions.paddingVerticalSmall,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Container(
          margin: AppDimensions.marginHorizontalMedium +
              AppDimensions.marginVerticalSmall,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradientWithOpacity(0.02),
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow.withValues(alpha: 0.05),
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Card(
            margin: EdgeInsets.zero,
            elevation: 0,
            color: theme.colorScheme.surface.withValues(alpha: 0.8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
              side: BorderSide(
                color: AppColors.outline.withValues(alpha: 0.1),
                width: 1.w,
              ),
            ),
            child: Padding(
              padding: AppDimensions.paddingAllMedium,
              child: Shimmer.fromColors(
                baseColor: AppColors.surfaceVariant.withValues(alpha: 0.4),
                highlightColor: AppColors.surface.withValues(alpha: 0.8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Document type icon placeholder
                        Container(
                          width: AppDimensions.iconXLarge,
                          height: AppDimensions.iconXLarge,
                          decoration: BoxDecoration(
                            color:
                                AppColors.surfaceVariant.withValues(alpha: 0.6),
                            borderRadius: BorderRadius.circular(
                                AppDimensions.radiusSmall),
                            border: Border.all(
                              color: AppColors.outline.withValues(alpha: 0.2),
                              width: 1.w,
                            ),
                          ),
                        ),
                        SizedBox(width: AppDimensions.spaceMedium.w),

                        // Document info placeholder
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title placeholder
                              Container(
                                width: double.infinity,
                                height: 18.h,
                                decoration: BoxDecoration(
                                  color: AppColors.surfaceVariant
                                      .withValues(alpha: 0.8),
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.radiusXSmall),
                                ),
                              ),
                              SizedBox(height: AppDimensions.spaceSmall),

                              // Description placeholder
                              Container(
                                width: double.infinity * 0.9,
                                height: 14.h,
                                decoration: BoxDecoration(
                                  color: AppColors.surfaceVariant
                                      .withValues(alpha: 0.6),
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.radiusXSmall),
                                ),
                              ),
                              SizedBox(height: AppDimensions.spaceXSmall),
                              Container(
                                width: double.infinity * 0.7,
                                height: 14.h,
                                decoration: BoxDecoration(
                                  color: AppColors.surfaceVariant
                                      .withValues(alpha: 0.6),
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.radiusXSmall),
                                ),
                              ),
                              SizedBox(height: AppDimensions.spaceMedium),

                              // Metadata placeholder
                              Row(
                                children: [
                                  Container(
                                    width: 70.w,
                                    height: 24.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary
                                          .withValues(alpha: 0.1),
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.radiusXSmall),
                                      border: Border.all(
                                        color: AppColors.primary
                                            .withValues(alpha: 0.1),
                                        width: 0.5.w,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: AppDimensions.spaceSmall.w),
                                  Container(
                                    width: 50.w,
                                    height: 18.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.surfaceVariant
                                          .withValues(alpha: 0.5),
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.radiusXSmall),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Action button placeholder
                        Container(
                          width: 36.w,
                          height: 36.h,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(
                                AppDimensions.radiusSmall),
                            border: Border.all(
                              color: AppColors.primary.withValues(alpha: 0.2),
                              width: 1.w,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: AppDimensions.spaceMedium),

                    // Categories placeholder
                    Row(
                      children: [
                        Container(
                          width: 60.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            color:
                                AppColors.surfaceVariant.withValues(alpha: 0.4),
                            borderRadius: BorderRadius.circular(
                                AppDimensions.radiusXSmall),
                            border: Border.all(
                              color: AppColors.outline.withValues(alpha: 0.1),
                              width: 0.5.w,
                            ),
                          ),
                        ),
                        SizedBox(width: AppDimensions.spaceXSmall.w),
                        Container(
                          width: 45.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            color:
                                AppColors.surfaceVariant.withValues(alpha: 0.4),
                            borderRadius: BorderRadius.circular(
                                AppDimensions.radiusXSmall),
                            border: Border.all(
                              color: AppColors.outline.withValues(alpha: 0.1),
                              width: 0.5.w,
                            ),
                          ),
                        ),
                        SizedBox(width: AppDimensions.spaceXSmall.w),
                        Container(
                          width: 40.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            color:
                                AppColors.surfaceVariant.withValues(alpha: 0.4),
                            borderRadius: BorderRadius.circular(
                                AppDimensions.radiusXSmall),
                            border: Border.all(
                              color: AppColors.outline.withValues(alpha: 0.1),
                              width: 0.5.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
