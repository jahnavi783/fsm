import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../core/theme/extensions/fsm_theme_extension.dart';
import '../../../../core/widgets/cards/fsm_card.dart';
import '../../domain/entities/document_entity.dart';

/// DocumentCardTile - Card-based tile for grid display of documents
///
/// Displays document with:
/// - Type icon with colored background
/// - Document title (max 2 lines)
/// - File size
/// - Offline availability indicator
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

    return FSMCard(
      onTap: onTap,
      padding: REdgeInsets.all(DesignTokens.space3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top section: Icon + Offline indicator
          Row(
            children: [
              // Document Type Icon
              Container(
                width: DesignTokens.iconXl.w,
                height: DesignTokens.iconXl.h,
                decoration: BoxDecoration(
                  color: _getTypeColor(document.type).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
                  border: Border.all(
                    color: _getTypeColor(document.type).withValues(alpha: 0.3),
                    width: DesignTokens.borderWidthThin,
                  ),
                ),
                child: Icon(
                  _getTypeIcon(document.type),
                  color: _getTypeColor(document.type),
                  size: DesignTokens.iconMd.sp,
                ),
              ),
              const Spacer(),
              // Offline indicator
              if (document.isAvailableOffline)
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
          ),

          DesignTokens.verticalSpaceMedium,

          // Document Title (max 2 lines)
          Text(
            document.title,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: DesignTokens.fontWeightSemiBold,
              color: theme.colorScheme.onSurface,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          DesignTokens.verticalSpaceSmall,

          // File Size
          Text(
            _formatFileSize(document.fileSize),
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),

          DesignTokens.verticalSpaceSmall,

          // Category Badge (use document type if no categories)
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

          // Loading indicator overlay
          if (isDownloading) ...[
            DesignTokens.verticalSpaceSmall,
            LinearProgressIndicator(
              minHeight: 2.h,
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
              valueColor: AlwaysStoppedAnimation<Color>(
                theme.colorScheme.primary,
              ),
            ),
          ],
        ],
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

  Color _getTypeColor(DocumentType type) {
    switch (type) {
      case DocumentType.manual:
        return const Color(0xFF1E88E5); // Blue
      case DocumentType.procedure:
        return const Color(0xFF5E35B1); // Purple
      case DocumentType.schematic:
        return const Color(0xFF00897B); // Teal
      case DocumentType.specification:
        return const Color(0xFF43A047); // Green
      case DocumentType.safety:
        return const Color(0xFFE53935); // Red
      case DocumentType.training:
        return const Color(0xFFFB8C00); // Orange
      case DocumentType.report:
        return const Color(0xFF3949AB); // Indigo
      case DocumentType.certificate:
        return const Color(0xFF8E24AA); // Purple
      case DocumentType.warranty:
        return const Color(0xFF00ACC1); // Cyan
      case DocumentType.other:
        return const Color(0xFF757575); // Gray
    }
  }
}
