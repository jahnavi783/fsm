import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/theme/extensions/fsm_theme_extension.dart';
import '../../../../../../core/theme/design_tokens.dart';

class LocationErrorDialog extends StatelessWidget {
  final VoidCallback onRetry;

  const LocationErrorDialog({
    super.key,
    required this.onRetry,
  });

  static void show(
    BuildContext context,
    VoidCallback onRetry,
  ) {
    showDialog(
      context: context,
      builder: (context) => LocationErrorDialog(onRetry: onRetry),
    );
  }

  void _handleCancel(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _handleRetry(BuildContext context) {
    Navigator.of(context).pop();
    onRetry();
  }

  @override
  Widget build(BuildContext context) {
    final fsmTheme = context.fsmTheme;
    final colorScheme = Theme.of(context).colorScheme;
    
    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.location_off, color: fsmTheme.error, size: 24.sp),
          DesignTokens.horizontalSpaceSmall,
          const Text('Location Required'),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Location access is required to perform work order actions. Please ensure:',
            style: TextStyle(fontSize: 14.sp),
          ),
          DesignTokens.verticalSpaceMd,
          Text(
            '• Location services are enabled',
            style: TextStyle(fontSize: 13.sp, color: colorScheme.onSurface.withOpacity(0.6)),
          ),
          Text(
            '• App has location permissions',
            style: TextStyle(fontSize: 13.sp, color: colorScheme.onSurface.withOpacity(0.6)),
          ),
          Text(
            '• GPS signal is available',
            style: TextStyle(fontSize: 13.sp, color: colorScheme.onSurface.withOpacity(0.6)),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => _handleCancel(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton.icon(
          onPressed: () => _handleRetry(context),
          icon: Icon(Icons.refresh, size: 18.sp),
          label: const Text('Retry'),
        ),
      ],
    );
  }
}
