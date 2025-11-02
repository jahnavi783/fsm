import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/design_tokens.dart';
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
        elevation: 2,
        shadowColor: theme.colorScheme.shadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusLg.r),
          side: BorderSide(
            color: theme.colorScheme.outline.withValues(alpha: 0.2),
            width: 1.w,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(DesignTokens.radiusLg.r),
          child: Container(
            padding: REdgeInsets.all(DesignTokens.space4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(DesignTokens.radiusLg.r),
              color: theme.colorScheme.surface,
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
                      padding: REdgeInsets.all(DesignTokens.space2),
                      decoration: BoxDecoration(
                        color: _getDocumentTypeColor().withValues(alpha: 0.15),
                        borderRadius:
                            BorderRadius.circular(DesignTokens.radiusMd.r),
                      ),
                      child: Icon(
                        _getDocumentTypeIcon(),
                        color: _getDocumentTypeColor(),
                        size: DesignTokens.iconMd.sp,
                      ),
                    ),

                    const Spacer(),

                    // Download/Status indicator
                    if (isDownloading)
                      Container(
                        padding: REdgeInsets.all(DesignTokens.space1),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withValues(alpha: 0.15),
                          borderRadius:
                              BorderRadius.circular(DesignTokens.radiusSm.r),
                        ),
                        child: SizedBox(
                          width: DesignTokens.space3.w,
                          height: DesignTokens.space3.w,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.w,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                theme.colorScheme.primary),
                            value: downloadProgress,
                          ),
                        ),
                      )
                    else if (isDownloaded)
                      Container(
                        padding: REdgeInsets.all(DesignTokens.space1),
                        decoration: BoxDecoration(
                          color: fsmTheme.success.withValues(alpha: 0.15),
                          borderRadius:
                              BorderRadius.circular(DesignTokens.radiusSm.r),
                        ),
                        child: Icon(
                          Icons.download_done_rounded,
                          color: fsmTheme.success,
                          size: DesignTokens.space3.sp,
                        ),
                      )
                    else
                      // Action menu button
                      PopupMenuButton<String>(
                        icon: Icon(
                          Icons.more_vert,
                          color: theme.colorScheme.onSurface
                              .withValues(alpha: 0.6),
                          size: DesignTokens.iconSm.sp,
                        ),
                        iconSize: DesignTokens.iconSm.sp,
                        padding: EdgeInsets.zero,
                        splashRadius: DesignTokens.iconSm.r,
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 'download',
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.download_rounded,
                                  size: DesignTokens.iconSm.sp,
                                  color: theme.colorScheme.primary,
                                ),
                                RSizedBox(width: DesignTokens.space2),
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
                                    size: DesignTokens.iconSm.sp,
                                    color: theme.colorScheme.error,
                                  ),
                                  RSizedBox(width: DesignTokens.space2),
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

                RSizedBox(height: DesignTokens.space4),

                // Document title
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        document.title,
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: theme.colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      RSizedBox(height: DesignTokens.space1),

                      // Document description (if available)
                      if (document.description.isNotEmpty)
                        Expanded(
                          child: Text(
                            document.description,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                              height: 1.4,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                  ),
                ),

                RSizedBox(height: DesignTokens.space2),

                // Footer with file size and date
                Row(
                  children: [
                    // File size
                    Container(
                      padding: REdgeInsets.symmetric(
                        horizontal: DesignTokens.space1,
                        vertical: DesignTokens.space1 / 2,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainerHighest
                            .withValues(alpha: 0.7),
                        borderRadius:
                            BorderRadius.circular(DesignTokens.radiusSm.r),
                      ),
                      child: Text(
                        _formatFileSize(document.fileSize),
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    const Spacer(),

                    // Document type chip
                    Container(
                      padding: REdgeInsets.symmetric(
                        horizontal: DesignTokens.space1,
                        vertical: DesignTokens.space1 / 2,
                      ),
                      decoration: BoxDecoration(
                        color: _getDocumentTypeColor().withValues(alpha: 0.15),
                        borderRadius:
                            BorderRadius.circular(DesignTokens.radiusSm.r),
                      ),
                      child: Text(
                        _getDocumentTypeLabel(),
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: _getDocumentTypeColor(),
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
