import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../core/theme/extensions/fsm_theme_extension.dart';
import '../../../../core/widgets/lists/fsm_list_item.dart';

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

    return FSMListItem.threeLine(
      title: document.title,
      subtitle: document.description,
      tertiaryText: _buildMetadataText(),
      leading: _buildLeadingIcon(),
      trailing: _buildTrailingActions(context),
      metadata: _buildCategoryTags(theme),
      onTap: onTap,
    );
  }

  Widget _buildLeadingIcon() {
    return Container(
      width: DesignTokens.iconLg.w,
      height: DesignTokens.iconLg.w,
      decoration: BoxDecoration(
        color: _getTypeColor(document.type).withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
        border: Border.all(
          color: _getTypeColor(document.type).withValues(alpha: 0.2),
          width: 1.w,
        ),
        boxShadow: [
          BoxShadow(
            color: _getTypeColor(document.type).withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(
        _getTypeIcon(document.type),
        color: _getTypeColor(document.type),
        size: DesignTokens.iconMd.sp,
      ),
    );
  }

  Widget _buildTrailingActions(BuildContext context) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (document.isAvailableOffline)
          Container(
            padding: REdgeInsets.all(DesignTokens.space1),
            decoration: BoxDecoration(
              color: fsmTheme.success.withValues(alpha: 0.15),
              shape: BoxShape.circle,
              border: Border.all(
                color: fsmTheme.success.withValues(alpha: 0.3),
                width: 1.w,
              ),
              boxShadow: [
                BoxShadow(
                  color: fsmTheme.success.withValues(alpha: 0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Icon(
              Icons.download_done_rounded,
              color: fsmTheme.success,
              size: DesignTokens.iconSm.sp,
            ),
          )
        else if (isDownloading)
          Container(
            width: 32.w,
            height: 32.h,
            padding: REdgeInsets.all(DesignTokens.space1),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: CircularProgressIndicator(
              strokeWidth: 2.w,
              valueColor: AlwaysStoppedAnimation<Color>(
                theme.colorScheme.primary,
              ),
            ),
          )
        else
          Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
              border: Border.all(
                color: theme.colorScheme.primary.withValues(alpha: 0.2),
                width: 1.w,
              ),
            ),
            child: IconButton(
              onPressed: onDownload,
              icon: Icon(
                Icons.download_rounded,
                color: theme.colorScheme.primary,
                size: DesignTokens.iconSm.sp,
              ),
              padding: REdgeInsets.all(DesignTokens.space1),
              constraints: BoxConstraints(
                minWidth: 32.w,
                minHeight: 32.h,
              ),
            ),
          ),
        if (document.isAvailableOffline && onDelete != null) ...[
          RSizedBox(height: DesignTokens.space1),
          Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.error.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
              border: Border.all(
                color: theme.colorScheme.error.withValues(alpha: 0.2),
                width: 1.w,
              ),
            ),
            child: IconButton(
              onPressed: onDelete,
              icon: Icon(
                Icons.delete_outline_rounded,
                color: theme.colorScheme.error,
                size: DesignTokens.iconSm.sp,
              ),
              padding: REdgeInsets.all(DesignTokens.space1),
              constraints: BoxConstraints(
                minWidth: 32.w,
                minHeight: 32.h,
              ),
            ),
          ),
        ],
      ],
    );
  }

  String _buildMetadataText() {
    return '${document.type.displayName} • ${document.fileSizeFormatted}';
  }

  List<Widget>? _buildCategoryTags(ThemeData theme) {
    if (document.categories.isEmpty) return null;

    return document.categories.take(3).map((category) {
      return Container(
        padding: REdgeInsets.symmetric(
          horizontal: DesignTokens.space1,
          vertical: 2.h,
        ),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
          border: Border.all(
            color: theme.colorScheme.outline.withValues(alpha: 0.2),
            width: 0.5.w,
          ),
        ),
        child: Text(
          category,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }).toList();
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
    // Keep these as const colors for semantic document type identification
    switch (type) {
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
}
