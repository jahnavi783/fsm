import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/core/theme/app_dimensions.dart';
import '../../domain/entities/document_entity.dart';

class DocumentListItem extends StatelessWidget {
  final DocumentEntity document;
  final VoidCallback? onTap;
  final VoidCallback? onDownload;
  final VoidCallback? onDelete;
  final bool isDownloading;

  const DocumentListItem({
    super.key,
    required this.document,
    this.onTap,
    this.onDownload,
    this.onDelete,
    this.isDownloading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: AppDimensions.marginHorizontalMedium +
          AppDimensions.marginVerticalSmall,
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradientWithOpacity(0.05),
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        color: theme.colorScheme.surface.withValues(alpha: 0.95),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
          side: BorderSide(
            color: AppColors.outline.withValues(alpha: 0.1),
            width: 1.w,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
          child: Padding(
            padding: AppDimensions.paddingAllMedium,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Document type icon
                    Container(
                      width: AppDimensions.iconXLarge,
                      height: AppDimensions.iconXLarge,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            _getTypeColor(document.type)
                                .withValues(alpha: 0.15),
                            _getTypeColor(document.type)
                                .withValues(alpha: 0.05),
                          ],
                        ),
                        borderRadius:
                            BorderRadius.circular(AppDimensions.radiusSmall),
                        border: Border.all(
                          color: _getTypeColor(document.type)
                              .withValues(alpha: 0.2),
                          width: 1.w,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: _getTypeColor(document.type)
                                .withValues(alpha: 0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        _getTypeIcon(document.type),
                        color: _getTypeColor(document.type),
                        size: AppDimensions.iconMedium,
                      ),
                    ),
                    SizedBox(width: AppDimensions.spaceMedium.w),

                    // Document info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            document.title,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                              color: AppColors.textPrimary,
                              height: 1.3,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: AppDimensions.spaceXSmall),
                          Text(
                            document.description,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: AppColors.textSecondary,
                              fontSize: 14.sp,
                              height: 1.4,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: AppDimensions.spaceSmall),

                          // Document metadata
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppDimensions.paddingSmall,
                                  vertical: AppDimensions.paddingXSmall,
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      AppColors.primary.withValues(alpha: 0.1),
                                      AppColors.primary.withValues(alpha: 0.05),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.radiusXSmall),
                                  border: Border.all(
                                    color: AppColors.primary
                                        .withValues(alpha: 0.2),
                                    width: 0.5.w,
                                  ),
                                ),
                                child: Text(
                                  document.type.displayName,
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: AppColors.primary,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(width: AppDimensions.spaceSmall.w),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppDimensions.paddingXSmall,
                                  vertical: 2.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.surfaceVariant
                                      .withValues(alpha: 0.7),
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.radiusXSmall),
                                ),
                                child: Text(
                                  document.fileSizeFormatted,
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: AppColors.textTertiary,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Download status and actions
                    Column(
                      children: [
                        if (document.isAvailableOffline)
                          Container(
                            padding:
                                EdgeInsets.all(AppDimensions.paddingXSmall),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.success.withValues(alpha: 0.15),
                                  AppColors.success.withValues(alpha: 0.05),
                                ],
                              ),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.success.withValues(alpha: 0.3),
                                width: 1.w,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      AppColors.success.withValues(alpha: 0.2),
                                  blurRadius: 4,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.download_done_rounded,
                              color: AppColors.success,
                              size: AppDimensions.iconSmall,
                            ),
                          )
                        else if (isDownloading)
                          Container(
                            width: 32.w,
                            height: 32.h,
                            padding:
                                EdgeInsets.all(AppDimensions.paddingXSmall),
                            decoration: BoxDecoration(
                              gradient:
                                  AppColors.primaryGradientWithOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5.w,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                AppColors.primary,
                              ),
                            ),
                          )
                        else
                          Container(
                            decoration: BoxDecoration(
                              gradient:
                                  AppColors.primaryGradientWithOpacity(0.1),
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.radiusSmall),
                              border: Border.all(
                                color: AppColors.primary.withValues(alpha: 0.2),
                                width: 1.w,
                              ),
                            ),
                            child: IconButton(
                              onPressed: onDownload,
                              icon: Icon(
                                Icons.download_rounded,
                                color: AppColors.primary,
                                size: AppDimensions.iconSmall,
                              ),
                              padding:
                                  EdgeInsets.all(AppDimensions.paddingXSmall),
                              constraints: BoxConstraints(
                                minWidth: 32.w,
                                minHeight: 32.h,
                              ),
                            ),
                          ),
                        if (document.isAvailableOffline && onDelete != null)
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.error.withValues(alpha: 0.1),
                                  AppColors.error.withValues(alpha: 0.05),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.radiusSmall),
                              border: Border.all(
                                color: AppColors.error.withValues(alpha: 0.2),
                                width: 1.w,
                              ),
                            ),
                            child: IconButton(
                              onPressed: onDelete,
                              icon: Icon(
                                Icons.delete_outline_rounded,
                                color: AppColors.error,
                                size: AppDimensions.iconSmall,
                              ),
                              padding:
                                  EdgeInsets.all(AppDimensions.paddingXSmall),
                              constraints: BoxConstraints(
                                minWidth: 32.w,
                                minHeight: 32.h,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),

                // Categories
                if (document.categories.isNotEmpty) ...[
                  SizedBox(height: AppDimensions.spaceMedium),
                  Wrap(
                    spacing: AppDimensions.spaceXSmall.w,
                    runSpacing: AppDimensions.spaceXSmall.h,
                    children: document.categories.take(3).map((category) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppDimensions.paddingXSmall,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.surfaceVariant.withValues(alpha: 0.8),
                              AppColors.surfaceVariant.withValues(alpha: 0.4),
                            ],
                          ),
                          borderRadius:
                              BorderRadius.circular(AppDimensions.radiusXSmall),
                          border: Border.all(
                            color: AppColors.outline.withValues(alpha: 0.2),
                            width: 0.5.w,
                          ),
                        ),
                        child: Text(
                          category,
                          style: theme.textTheme.labelSmall?.copyWith(
                            fontSize: 10.sp,
                            color: AppColors.textTertiary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _getTypeIcon(DocumentType type) {
    switch (type) {
      case DocumentType.manual:
        return Icons.menu_book;
      case DocumentType.procedure:
        return Icons.list_alt;
      case DocumentType.schematic:
        return Icons.schema;
      case DocumentType.specification:
        return Icons.description;
      case DocumentType.safety:
        return Icons.security;
      case DocumentType.training:
        return Icons.school;
      case DocumentType.report:
        return Icons.assessment;
      case DocumentType.certificate:
        return Icons.verified;
      case DocumentType.warranty:
        return Icons.shield;
      case DocumentType.other:
        return Icons.insert_drive_file;
    }
  }

  Color _getTypeColor(DocumentType type) {
    switch (type) {
      case DocumentType.manual:
        return AppColors.primary;
      case DocumentType.procedure:
        return AppColors.secondary;
      case DocumentType.schematic:
        return AppColors.tertiary;
      case DocumentType.specification:
        return AppColors.warning;
      case DocumentType.safety:
        return AppColors.error;
      case DocumentType.training:
        return AppColors.info;
      case DocumentType.report:
        return const Color(0xFF009688); // Teal
      case DocumentType.certificate:
        return const Color(0xFFFF8F00); // Amber
      case DocumentType.warranty:
        return const Color(0xFF00ACC1); // Cyan
      case DocumentType.other:
        return AppColors.grey;
    }
  }
}
