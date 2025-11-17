import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../core/theme/extensions/fsm_theme_extension.dart';
import '../../../../core/widgets/cards/fsm_card.dart';
import '../../domain/entities/document_entity.dart';

/// DocumentCardTile - List card tile matching WorkOrderListCard template
///
/// **HORIZONTAL LAYOUT** (following standard list card pattern):
/// - Left: Document type icon (40x40 container)
/// - Right: Title, file size, category badge, offline indicator
/// - Uses DesignTokens for all dimensions
/// - Follows card padding standard (space4 horizontal, space2 vertical)
///
/// Displays document with:
/// - Type icon with colored background
/// - Document title (max 2 lines)
/// - File size
/// - Category badge
/// - Offline availability indicator
/// - Download progress indicator
/// - Tap handler to open document
class DocumentCardTile extends StatelessWidget {
  final DocumentEntity document;
  final VoidCallback? onTap;
  final VoidCallback? onDownload;
  final VoidCallback? onDelete;
  final bool isDownloading;

  const DocumentCardTile({
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
    final fsmTheme = context.fsmTheme;

    return Material(
        color: theme.colorScheme.surfaceContainer,
        elevation: DesignTokens.elevationXSmall,
        borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
          child: Padding(
            padding: REdgeInsets.all(DesignTokens.space3),
            child: Row(
              children: [
                // Left: Document Type Icon Container (40x40)
                Container(
                  width: DesignTokens.cardIconContainerSize.w,
                  height: DesignTokens.cardIconContainerSize.h,
                  decoration: BoxDecoration(
                    color: _getTypeColor(context,document.type).withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
                    border: Border.all(
                      color: _getTypeColor(context, document.type).withValues(alpha: 0.3),
                      width: DesignTokens.borderWidthThin,
                    ),
                  ),
                  child: Icon(
                    _getTypeIcon(document.type),
                    color: _getTypeColor(context,document.type),
                    size: DesignTokens.iconMd.sp,
                  ),
                ),

                DesignTokens.horizontalSpace(DesignTokens.space3),

                // Right: Content Column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Header Row: Title + Offline indicator
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              document.title,
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: DesignTokens.fontWeightSemiBold,
                                color: theme.colorScheme.onSurface,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          // Offline indicator badge
                          if (document.isAvailableOffline) ...[
                            DesignTokens.horizontalSpace(DesignTokens.space2),
                            Container(
                              padding: REdgeInsets.all(DesignTokens.space1),
                              decoration: BoxDecoration(
                                color: fsmTheme.success.withValues(alpha: 0.15),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.offline_pin,
                                color: fsmTheme.success,
                                size: DesignTokens.iconSm.sp,
                              ),
                            ),
                          ],
                        ],
                      ),

                      DesignTokens.verticalSpace(DesignTokens.space1),

                      // File Size
                      Text(
                        _formatFileSize(document.fileSize),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),

                      DesignTokens.verticalSpace(DesignTokens.space1),

                      // Category Badge + Download Progress Row
                      Row(
                        children: [
                          // Category Badge
                          Container(
                            padding: REdgeInsets.symmetric(
                              horizontal: DesignTokens.space2,
                              vertical: DesignTokens.space1,
                            ),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(DesignTokens.radiusXs.r),
                            ),
                            child: Text(
                              document.categories.isNotEmpty
                                  ? document.categories.first
                                  : document.type.displayName,
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: theme.colorScheme.onPrimaryContainer,
                                fontWeight: DesignTokens.fontWeightMedium,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                          // Download indicator (if downloading)
                          if (isDownloading) ...[
                            DesignTokens.horizontalSpace(DesignTokens.space2),
                            SizedBox(
                              width: DesignTokens.iconSm.w,
                              height: DesignTokens.iconSm.h,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.w,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }

  String _formatFileSize(int bytes) {
    if (bytes < 1024) {
      return '$bytes B';
    } else if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    } else if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    } else {
      return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
    }
  }

  IconData _getTypeIcon(DocumentType type) {
    switch (type) {
      case DocumentType.manual:
        return Icons.menu_book;
      case DocumentType.procedure:
        return Icons.list_alt;
      case DocumentType.schematic:
        return Icons.engineering;
      case DocumentType.specification:
        return Icons.description;
      case DocumentType.safety:
        return Icons.shield;
      case DocumentType.training:
        return Icons.school;
      case DocumentType.report:
        return Icons.assignment;
      case DocumentType.certificate:
        return Icons.verified;
      case DocumentType.warranty:
        return Icons.security;
      case DocumentType.other:
        return Icons.insert_drive_file;
    }
  }

  Color _getTypeColor(BuildContext context, DocumentType type) {
    // Get colors from FSMThemeExtension for theme consistency
    final fsmTheme = context.fsmTheme;

    switch (type) {
      case DocumentType.manual:
        return fsmTheme.documentManual;
      case DocumentType.procedure:
        return fsmTheme.documentProcedure;
      case DocumentType.schematic:
        return fsmTheme.documentSchematic;
      case DocumentType.specification:
        return fsmTheme.documentSpecification;
      case DocumentType.safety:
        return fsmTheme.documentSafety;
      case DocumentType.training:
        return fsmTheme.documentTraining;
      case DocumentType.report:
        return fsmTheme.documentReport;
      case DocumentType.certificate:
        return fsmTheme.documentCertificate;
      case DocumentType.warranty:
        return fsmTheme.documentWarranty;
      case DocumentType.other:
        return fsmTheme.documentOther;
    }
  }
}
