import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Document type icon
                  Container(
                    width: 48.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: _getTypeColor(document.type).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      _getTypeIcon(document.type),
                      color: _getTypeColor(document.type),
                      size: 24.sp,
                    ),
                  ),
                  SizedBox(width: 12.w),

                  // Document info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          document.title,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          document.description,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurface.withOpacity(0.7),
                            fontSize: 14.sp,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8.h),

                        // Document metadata
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    theme.colorScheme.primary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: Text(
                                document.type.displayName,
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              document.fileSizeFormatted,
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: theme.colorScheme.onSurface
                                    .withOpacity(0.6),
                                fontSize: 12.sp,
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
                          padding: EdgeInsets.all(6.w),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.download_done,
                            color: Colors.green,
                            size: 16.sp,
                          ),
                        )
                      else if (isDownloading)
                        SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              theme.colorScheme.primary,
                            ),
                          ),
                        )
                      else
                        IconButton(
                          onPressed: onDownload,
                          icon: Icon(
                            Icons.download,
                            color: theme.colorScheme.primary,
                            size: 20.sp,
                          ),
                          padding: EdgeInsets.all(4.w),
                          constraints: BoxConstraints(
                            minWidth: 32.w,
                            minHeight: 32.h,
                          ),
                        ),
                      if (document.isAvailableOffline && onDelete != null)
                        IconButton(
                          onPressed: onDelete,
                          icon: Icon(
                            Icons.delete_outline,
                            color: theme.colorScheme.error,
                            size: 20.sp,
                          ),
                          padding: EdgeInsets.all(4.w),
                          constraints: BoxConstraints(
                            minWidth: 32.w,
                            minHeight: 32.h,
                          ),
                        ),
                    ],
                  ),
                ],
              ),

              // Categories
              if (document.categories.isNotEmpty) ...[
                SizedBox(height: 12.h),
                Wrap(
                  spacing: 6.w,
                  runSpacing: 4.h,
                  children: document.categories.take(3).map((category) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceVariant,
                        borderRadius: BorderRadius.circular(3.r),
                      ),
                      child: Text(
                        category,
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontSize: 10.sp,
                          color: theme.colorScheme.onSurfaceVariant,
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
        return Colors.blue;
      case DocumentType.procedure:
        return Colors.green;
      case DocumentType.schematic:
        return Colors.purple;
      case DocumentType.specification:
        return Colors.orange;
      case DocumentType.safety:
        return Colors.red;
      case DocumentType.training:
        return Colors.indigo;
      case DocumentType.report:
        return Colors.teal;
      case DocumentType.certificate:
        return Colors.amber;
      case DocumentType.warranty:
        return Colors.cyan;
      case DocumentType.other:
        return Colors.grey;
    }
  }
}
