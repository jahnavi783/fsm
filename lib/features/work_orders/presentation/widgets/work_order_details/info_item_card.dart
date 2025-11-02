import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/design_tokens.dart';

class InfoItemCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const InfoItemCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: REdgeInsets.all(DesignTokens.space3),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: DesignTokens.iconSm.sp,
            color: theme.colorScheme.primary,
          ),
          DesignTokens.horizontalSpaceSmall,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                RSizedBox(height: 2.h),
                Text(
                  value,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
