import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/extensions/fsm_theme_extension.dart';
import '../../domain/entities/document_entity.dart';

/// Document Grid Card - Redesigned grid item for document display
///
/// Features:
/// - 2-column grid layout with 3:4 aspect ratio
/// - Document type icon with color coding
/// - File size and download status indicators
/// - Modern card design with subtle shadows
/// - Touch feedback and accessibility support
class DocumentGridCard extends StatelessWidget {
  const DocumentGridCard({
    super.key,
    required this.document,
    this.isDownloading = false,
    this.downloadProgress,
    this.isDownloaded = false,
    this.onTap,
    this.onDownload,
    this.onDelete,
  });

  final DocumentEntity document;
  final bool isDownloading;
  final double? downloadProgress;
  final bool isDownloaded;
  final VoidCallback? onTap;
  final VoidCallback? onDownload;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;

    return AspectRatio(
      aspectRatio: 3 / 4, // Card height is 4/3 of width
      child: Card(
        elevation: AppDimensions.elevationXSmall,
        shadowColor: fsmTheme.shadowColors['card'],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
          side: BorderSide(
            color: fsmTheme.workOrderCardBorder.withValues(alpha: 0.2),
            width: 1.w,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
          child: Container(
            padding: AppDimensions.paddingAllMedium,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  fsmTheme.workOrderCardBackground,
                  fsmTheme.workOrderCardBackground.withValues(alpha: 0.8),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with document type icon and status
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Document type icon
                    Container(
                      padding: EdgeInsets.all(AppDimensions.paddingSmall),
                      decoration: BoxDecoration(
                        color: _getDocumentTypeColor().withValues(alpha: 0.15),
                        borderRadius:
                            BorderRadius.circular(AppDimensions.radiusSmall),
                      ),
                      child: Icon(
                        _getDocumentTypeIcon(),
                        color: _getDocumentTypeColor(),
                        size: AppDimensions.iconMedium,
                      ),
                    ),

                    const Spacer(),

                    // Download/Status indicator
                    if (isDownloading)
                      Container(
                        padding: EdgeInsets.all(AppDimensions.paddingXSmall),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.15),
                          borderRadius:
                              BorderRadius.circular(AppDimensions.radiusXSmall),
                        ),
                        child: SizedBox(
                          width: 12.w,
                          height: 12.w,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.w,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.primary),
                            value: downloadProgress,
                          ),
                        ),
                      )
                    else if (isDownloaded)
                      Container(
                        padding: EdgeInsets.all(AppDimensions.paddingXSmall),
                        decoration: BoxDecoration(
                          color: AppColors.success.withValues(alpha: 0.15),
                          borderRadius:
                              BorderRadius.circular(AppDimensions.radiusXSmall),
                        ),
                        child: Icon(
                          Icons.download_done_rounded,
                          color: AppColors.success,
                          size: 12.sp,
                        ),
                      )
                    else
                      // Action menu button
                      PopupMenuButton<String>(
                        icon: Icon(
                          Icons.more_vert,
                          color: theme.colorScheme.onSurface
                              .withValues(alpha: 0.6),
                          size: 16.sp,
                        ),
                        iconSize: 16.sp,
                        padding: EdgeInsets.zero,
                        splashRadius: 16.r,
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 'download',
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.download_rounded,
                                  size: 18.sp,
                                  color: AppColors.primary,
                                ),
                                SizedBox(width: AppDimensions.spaceSmall.w),
                                const Text('Download'),
                              ],
                            ),
                          ),
                          if (isDownloaded)
                            PopupMenuItem(
                              value: 'delete',
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.delete_outline_rounded,
                                    size: 18.sp,
                                    color: AppColors.error,
                                  ),
                                  SizedBox(width: AppDimensions.spaceSmall.w),
                                  const Text('Delete'),
                                ],
                              ),
                            ),
                        ],
                        onSelected: (value) {
                          switch (value) {
                            case 'download':
                              onDownload?.call();
                              break;
                            case 'delete':
                              onDelete?.call();
                              break;
                          }
                        },
                      ),
                  ],
                ),

                SizedBox(height: AppDimensions.spaceMedium.h),

                // Document title
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        document.title,
                        style: AppTextStyles.titleSmall.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      SizedBox(height: AppDimensions.spaceXSmall.h),

                      // Document description (if available)
                      if (document.description.isNotEmpty)
                        Expanded(
                          child: Text(
                            document.description,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                              fontSize: 11.sp,
                              height: 1.4,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                  ),
                ),

                SizedBox(height: AppDimensions.spaceSmall.h),

                // Footer with file size and date
                Row(
                  children: [
                    // File size
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.paddingXSmall,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainerHighest
                            .withValues(alpha: 0.7),
                        borderRadius:
                            BorderRadius.circular(AppDimensions.radiusXSmall),
                      ),
                      child: Text(
                        _formatFileSize(document.fileSize),
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    const Spacer(),

                    // Document type chip
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.paddingXSmall,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: _getDocumentTypeColor().withValues(alpha: 0.15),
                        borderRadius:
                            BorderRadius.circular(AppDimensions.radiusXSmall),
                      ),
                      child: Text(
                        _getDocumentTypeLabel(),
                        style: AppTextStyles.bodySmall.copyWith(
                          color: _getDocumentTypeColor(),
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
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
  }

  IconData _getDocumentTypeIcon() {
    switch (document.type) {
      case DocumentType.manual:
        return Icons.menu_book_rounded;
      case DocumentType.procedure:
        return Icons.list_alt_rounded;
      case DocumentType.schematic:
        return Icons.engineering_rounded;
      case DocumentType.specification:
        return Icons.description_rounded;
      case DocumentType.safety:
        return Icons.security_rounded;
      case DocumentType.training:
        return Icons.school_rounded;
      case DocumentType.report:
        return Icons.assessment_rounded;
      case DocumentType.certificate:
        return Icons.workspace_premium_rounded;
      case DocumentType.warranty:
        return Icons.verified_user_rounded;
      case DocumentType.other:
        return Icons.insert_drive_file_rounded;
    }
  }

  Color _getDocumentTypeColor() {
    switch (document.type) {
      case DocumentType.manual:
        return const Color(0xFF2E7D32); // Green
      case DocumentType.procedure:
        return const Color(0xFF1565C0); // Dark Blue
      case DocumentType.schematic:
        return const Color(0xFF1976D2); // Blue
      case DocumentType.specification:
        return const Color(0xFFED6C02); // Orange
      case DocumentType.safety:
        return const Color(0xFFD32F2F); // Red
      case DocumentType.training:
        return const Color(0xFF7B1FA2); // Purple
      case DocumentType.report:
        return const Color(0xFF9C27B0); // Purple
      case DocumentType.certificate:
        return const Color(0xFFAF9500); // Yellow/Gold
      case DocumentType.warranty:
        return const Color(0xFF388E3C); // Green
      case DocumentType.other:
        return const Color(0xFF616161); // Gray
    }
  }

  String _getDocumentTypeLabel() {
    switch (document.type) {
      case DocumentType.manual:
        return 'Manual';
      case DocumentType.procedure:
        return 'Procedure';
      case DocumentType.schematic:
        return 'Schematic';
      case DocumentType.specification:
        return 'Spec';
      case DocumentType.safety:
        return 'Safety';
      case DocumentType.training:
        return 'Training';
      case DocumentType.report:
        return 'Report';
      case DocumentType.certificate:
        return 'Cert';
      case DocumentType.warranty:
        return 'Warranty';
      case DocumentType.other:
        return 'File';
    }
  }

  String _formatFileSize(int bytes) {
    if (bytes <= 0) return '0 B';
    const suffixes = ['B', 'KB', 'MB', 'GB'];
    int i = 0;
    double size = bytes.toDouble();

    while (size >= 1024 && i < suffixes.length - 1) {
      size /= 1024;
      i++;
    }

    return '${size.toStringAsFixed(size >= 100 ? 0 : 1)} ${suffixes[i]}';
  }
}
