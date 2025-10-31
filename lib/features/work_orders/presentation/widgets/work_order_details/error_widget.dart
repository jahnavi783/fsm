import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/widgets/widgets.dart';
import '../../../../../core/theme/extensions/fsm_theme_extension.dart';
import '../../../../../core/theme/design_tokens.dart';

class WorkOrderErrorWidget extends StatelessWidget {
  final String message;
  final bool isOffline;
  final VoidCallback onRetry;

  const WorkOrderErrorWidget({
    super.key,
    required this.message,
    required this.isOffline,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final fsmTheme = context.fsmTheme;
    final colorScheme = Theme.of(context).colorScheme;
    
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isOffline ? Icons.wifi_off : Icons.error_outline,
            size: 64.sp,
            color: isOffline ? fsmTheme.syncOffline : fsmTheme.error,
          ),
          DesignTokens.verticalSpaceMedium,
          Text(
            isOffline ? 'You are offline' : 'Error loading work order',
            style: TextStyle(
              fontSize: 16.sp, 
              color: isOffline ? fsmTheme.syncOffline : fsmTheme.error,
            ),
          ),
          DesignTokens.verticalSpaceSmall,
          Text(
            message,
            style: TextStyle(
              fontSize: 14.sp, 
              color: colorScheme.onSurface.withOpacity(0.6),
            ),
            textAlign: TextAlign.center,
          ),
          DesignTokens.verticalSpaceMedium,
          FsmButton(
            text: 'Retry',
            onPressed: onRetry,
            variant: FsmButtonVariant.filled,
          ),
        ],
      ),
    );
  }
}
