import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/theme/design_tokens.dart';

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
      padding: REdgeInsets.symmetric(vertical: DesignTokens.space2),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Container(
          margin: REdgeInsets.symmetric(
            horizontal: DesignTokens.space4,
            vertical: DesignTokens.space2,
          ),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.shadow.withValues(alpha: 0.05),
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
              borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
              side: BorderSide(
                color: theme.colorScheme.outline.withValues(alpha: 0.1),
                width: 1.w,
              ),
            ),
            child: Padding(
              padding: REdgeInsets.all(DesignTokens.space4),
              child: Shimmer.fromColors(
                baseColor: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
                highlightColor: theme.colorScheme.surface.withValues(alpha: 0.8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Document type icon placeholder
                        Container(
                          width: DesignTokens.iconLg.w,
                          height: DesignTokens.iconLg.w,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surfaceContainerHighest
                                .withValues(alpha: 0.6),
                            borderRadius: BorderRadius.circular(
                                DesignTokens.radiusSm.r),
                            border: Border.all(
                              color: theme.colorScheme.outline.withValues(alpha: 0.2),
                              width: 1.w,
                            ),
                          ),
                        ),
                        RSizedBox(width: DesignTokens.space4),

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
                                  color: theme.colorScheme.surfaceContainerHighest
                                      .withValues(alpha: 0.8),
                                  borderRadius: BorderRadius.circular(
                                      DesignTokens.radiusSm.r),
                                ),
                              ),
                              RSizedBox(height: DesignTokens.space2),

                              // Description placeholder
                              Container(
                                width: double.infinity * 0.9,
                                height: 14.h,
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.surfaceContainerHighest
                                      .withValues(alpha: 0.6),
                                  borderRadius: BorderRadius.circular(
                                      DesignTokens.radiusSm.r),
                                ),
                              ),
                              RSizedBox(height: DesignTokens.space1),
                              Container(
                                width: double.infinity * 0.7,
                                height: 14.h,
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.surfaceContainerHighest
                                      .withValues(alpha: 0.6),
                                  borderRadius: BorderRadius.circular(
                                      DesignTokens.radiusSm.r),
                                ),
                              ),
                              RSizedBox(height: DesignTokens.space4),

                              // Metadata placeholder
                              Row(
                                children: [
                                  Container(
                                    width: 70.w,
                                    height: 24.h,
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.primary
                                          .withValues(alpha: 0.1),
                                      borderRadius: BorderRadius.circular(
                                          DesignTokens.radiusSm.r),
                                      border: Border.all(
                                        color: theme.colorScheme.primary
                                            .withValues(alpha: 0.1),
                                        width: 0.5.w,
                                      ),
                                    ),
                                  ),
                                  RSizedBox(width: DesignTokens.space2),
                                  Container(
                                    width: 50.w,
                                    height: 18.h,
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.surfaceContainerHighest
                                          .withValues(alpha: 0.5),
                                      borderRadius: BorderRadius.circular(
                                          DesignTokens.radiusSm.r),
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
                            color: theme.colorScheme.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(
                                DesignTokens.radiusSm.r),
                            border: Border.all(
                              color: theme.colorScheme.primary.withValues(alpha: 0.2),
                              width: 1.w,
                            ),
                          ),
                        ),
                      ],
                    ),

                    RSizedBox(height: DesignTokens.space4),

                    // Categories placeholder
                    Row(
                      children: [
                        Container(
                          width: 60.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surfaceContainerHighest
                                .withValues(alpha: 0.4),
                            borderRadius: BorderRadius.circular(
                                DesignTokens.radiusSm.r),
                            border: Border.all(
                              color: theme.colorScheme.outline.withValues(alpha: 0.1),
                              width: 0.5.w,
                            ),
                          ),
                        ),
                        RSizedBox(width: DesignTokens.space1),
                        Container(
                          width: 45.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surfaceContainerHighest
                                .withValues(alpha: 0.4),
                            borderRadius: BorderRadius.circular(
                                DesignTokens.radiusSm.r),
                            border: Border.all(
                              color: theme.colorScheme.outline.withValues(alpha: 0.1),
                              width: 0.5.w,
                            ),
                          ),
                        ),
                        RSizedBox(width: DesignTokens.space1),
                        Container(
                          width: 40.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surfaceContainerHighest
                                .withValues(alpha: 0.4),
                            borderRadius: BorderRadius.circular(
                                DesignTokens.radiusSm.r),
                            border: Border.all(
                              color: theme.colorScheme.outline.withValues(alpha: 0.1),
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
