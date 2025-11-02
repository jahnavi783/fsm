import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../domain/entities/document_entity.dart';
import '../utils/document_file_type_helper.dart';

/// Reusable widget to display document thumbnails
class DocumentThumbnail extends StatelessWidget {
  final DocumentEntity document;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  const DocumentThumbnail({
    super.key,
    required this.document,
    this.width,
    this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveWidth = width ?? DesignTokens.space12.w;
    final effectiveHeight = height ?? DesignTokens.space12.h;
    final effectiveBorderRadius = borderRadius ?? BorderRadius.circular(DesignTokens.radiusMd.r);

    return Container(
      width: effectiveWidth,
      height: effectiveHeight,
      decoration: BoxDecoration(
        color: document.isImage
            ? Colors.transparent
            : theme.colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: effectiveBorderRadius,
      ),
      child: ClipRRect(
        borderRadius: effectiveBorderRadius,
        child: document.isImage
            ? _buildImageThumbnail(context)
            : _buildIconThumbnail(context),
      ),
    );
  }

  Widget _buildImageThumbnail(BuildContext context) {
    final theme = Theme.of(context);

    return Image.network(
      document.fileUrl,
      width: width ?? DesignTokens.space12.w,
      height: height ?? DesignTokens.space12.h,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          width: width ?? DesignTokens.space12.w,
          height: height ?? DesignTokens.space12.h,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: borderRadius ?? BorderRadius.circular(DesignTokens.radiusMd.r),
          ),
          child: Center(
            child: SizedBox(
              width: DesignTokens.iconSm.w,
              height: DesignTokens.iconSm.w,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return _buildIconThumbnail(context);
      },
    );
  }

  Widget _buildIconThumbnail(BuildContext context) {
    final theme = Theme.of(context);
    final extension = document.fileExtension;

    return Container(
      width: width ?? DesignTokens.space12.w,
      height: height ?? DesignTokens.space12.h,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: borderRadius ?? BorderRadius.circular(DesignTokens.radiusMd.r),
      ),
      child: Icon(
        _getFileIcon(extension),
        color: theme.colorScheme.primary,
        size: DesignTokens.iconMd.sp,
      ),
    );
  }

  IconData _getFileIcon(String fileExtension) {
    final ext = fileExtension.toLowerCase();
    
    if (DocumentFileTypeHelper.isPdfByExtension(ext)) {
      return Icons.picture_as_pdf;
    } else if (DocumentFileTypeHelper.isVideoByExtension(ext)) {
      return Icons.video_file;
    } else if (DocumentFileTypeHelper.isImageByExtension(ext)) {
      return Icons.image;
    }

    // Fallback for other file types
    switch (ext) {
      case 'doc':
      case 'docx':
        return Icons.description;
      case 'xls':
      case 'xlsx':
        return Icons.table_chart;
      case 'ppt':
      case 'pptx':
        return Icons.slideshow;
      case 'txt':
        return Icons.text_snippet;
      case 'zip':
      case 'rar':
      case '7z':
        return Icons.folder_zip;
      default:
        return Icons.insert_drive_file;
    }
  }
}
