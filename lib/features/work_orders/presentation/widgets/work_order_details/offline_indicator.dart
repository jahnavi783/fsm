import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/design_tokens.dart';
import '../../../../../core/theme/extensions/fsm_theme_extension.dart';

class OfflineIndicator extends StatelessWidget {
  const OfflineIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;

    return Container(
      padding: REdgeInsets.all(DesignTokens.space4),
      decoration: BoxDecoration(
        color: fsmTheme.syncOffline.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: fsmTheme.syncOffline.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.wifi_off,
            color: fsmTheme.syncOffline,
            size: 20.sp,
          ),
          DesignTokens.horizontalSpaceMd,
          Expanded(
            child: Text(
              'You are currently offline. Changes will sync when connection is restored.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: fsmTheme.syncOffline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
