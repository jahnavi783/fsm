import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../core/theme/extensions/fsm_theme_extension.dart';

class DownloadProgressIndicator extends StatelessWidget {
  final String fileName;
  final double? progress; // 0.0 to 1.0, null for indeterminate
  final VoidCallback? onCancel;

  const DownloadProgressIndicator({
    super.key,
    required this.fileName,
    this.progress,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: REdgeInsets.symmetric(
        horizontal: DesignTokens.space4,
        vertical: DesignTokens.space2,
      ),
      padding: REdgeInsets.all(DesignTokens.space4),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
        border: Border.all(
          color: theme.colorScheme.primary.withValues(alpha: 0.3),
          width: 1.5.w,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
          BoxShadow(
            color: theme.colorScheme.shadow.withValues(alpha: 0.05),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                padding: REdgeInsets.all(DesignTokens.space1),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius:
                      BorderRadius.circular(DesignTokens.radiusSm.r),
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.primary.withValues(alpha: 0.3),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.download_rounded,
                  color: theme.colorScheme.onPrimary,
                  size: DesignTokens.iconSm.sp,
                ),
              ),
              RSizedBox(width: DesignTokens.space2),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Downloading',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      fileName,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: theme.colorScheme.onSurface,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              if (onCancel != null)
                Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.errorContainer.withValues(alpha: 0.5),
                    borderRadius:
                        BorderRadius.circular(DesignTokens.radiusSm.r),
                    border: Border.all(
                      color: theme.colorScheme.error.withValues(alpha: 0.2),
                      width: 1.w,
                    ),
                  ),
                  child: IconButton(
                    onPressed: onCancel,
                    icon: Icon(
                      Icons.close_rounded,
                      color: theme.colorScheme.error.withValues(alpha: 0.8),
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
          ),

          RSizedBox(height: DesignTokens.space4),

          // Progress bar
          if (progress != null) ...[
            Container(
              height: 6.h,
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    theme.colorScheme.primary,
                  ),
                ),
              ),
            ),
            RSizedBox(height: DesignTokens.space2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: REdgeInsets.symmetric(
                    horizontal: DesignTokens.space1,
                    vertical: 2.h,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius:
                        BorderRadius.circular(DesignTokens.radiusSm.r),
                  ),
                  child: Text(
                    '${(progress! * 100).toInt()}%',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  progress! < 1.0 ? 'Downloading...' : 'Complete ✓',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: progress! < 1.0
                        ? theme.colorScheme.onSurface.withValues(alpha: 0.5)
                        : context.fsmTheme.success,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ] else ...[
            // Indeterminate progress
            Container(
              height: 6.h,
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    theme.colorScheme.primary,
                  ),
                ),
              ),
            ),
            RSizedBox(height: DesignTokens.space2),
            Row(
              children: [
                Container(
                  width: 8.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                ),
                RSizedBox(width: DesignTokens.space2),
                Text(
                  'Preparing download...',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class DownloadSuccessIndicator extends StatelessWidget {
  final String fileName;
  final VoidCallback? onDismiss;
  final VoidCallback? onOpen;

  const DownloadSuccessIndicator({
    super.key,
    required this.fileName,
    this.onDismiss,
    this.onOpen,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;

    return Container(
      margin: REdgeInsets.symmetric(
        horizontal: DesignTokens.space4,
        vertical: DesignTokens.space2,
      ),
      padding: REdgeInsets.all(DesignTokens.space4),
      decoration: BoxDecoration(
        color: fsmTheme.success.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
        border: Border.all(
          color: fsmTheme.success.withValues(alpha: 0.3),
          width: 1.5.w,
        ),
        boxShadow: [
          BoxShadow(
            color: fsmTheme.success.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: REdgeInsets.all(DesignTokens.space1),
            decoration: BoxDecoration(
              color: fsmTheme.success,
              borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
              boxShadow: [
                BoxShadow(
                  color: fsmTheme.success.withValues(alpha: 0.3),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              Icons.check_circle_rounded,
              color: theme.colorScheme.onPrimary,
              size: DesignTokens.iconSm.sp,
            ),
          ),
          RSizedBox(width: DesignTokens.space4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Download Complete ✓',
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: fsmTheme.success,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                RSizedBox(height: 2.h),
                Text(
                  fileName,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          if (onOpen != null)
            Container(
              decoration: BoxDecoration(
                color: fsmTheme.success.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
                border: Border.all(
                  color: fsmTheme.success.withValues(alpha: 0.3),
                  width: 1.w,
                ),
              ),
              child: TextButton(
                onPressed: onOpen,
                style: TextButton.styleFrom(
                  padding: REdgeInsets.symmetric(
                    horizontal: DesignTokens.space4,
                    vertical: DesignTokens.space2,
                  ),
                ),
                child: Text(
                  'Open',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: fsmTheme.success,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          if (onDismiss != null)
            Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
                border: Border.all(
                  color: theme.colorScheme.outline.withValues(alpha: 0.2),
                  width: 1.w,
                ),
              ),
              child: IconButton(
                onPressed: onDismiss,
                icon: Icon(
                  Icons.close_rounded,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
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
      ),
    );
  }
}
