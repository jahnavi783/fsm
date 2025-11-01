import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';
import 'package:fsm/features/work_orders/domain/entities/location_entity.dart';

/// Reusable widget to display location capture status
/// Shows GPS coordinates, accuracy, and loading state
class LocationStatusWidget extends StatelessWidget {
  final LocationEntity? location;
  final bool isLoading;
  final VoidCallback? onRetry;
  final bool showRetryButton;

  const LocationStatusWidget({
    super.key,
    this.location,
    this.isLoading = false,
    this.onRetry,
    this.showRetryButton = true,
  });

  @override
  Widget build(BuildContext context) {
    if (location != null) {
      return _buildLocationCaptured(context);
    } else if (isLoading) {
      return _buildLocationLoading(context);
    } else {
      return _buildLocationUnavailable(context);
    }
  }

  Widget _buildLocationCaptured(BuildContext context) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;

    return Container(
      width: double.infinity,
      padding: REdgeInsets.all(DesignTokens.space3),
      decoration: BoxDecoration(
        color: fsmTheme.success.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
        border: Border.all(
          color: fsmTheme.success.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.location_on,
            color: fsmTheme.success,
            size: DesignTokens.iconSm.sp,
          ),
          RSizedBox(width: DesignTokens.space3),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location Captured',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: fsmTheme.success,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                RSizedBox(height: DesignTokens.space1),
                Text(
                  '${location!.latitude.toStringAsFixed(6)}, ${location!.longitude.toStringAsFixed(6)}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: fsmTheme.success,
                  ),
                ),
                if (location!.accuracy != null) ...[
                  RSizedBox(height: DesignTokens.space1),
                  Text(
                    'Accuracy: ${location!.accuracy!.toStringAsFixed(1)}m',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: fsmTheme.success.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ],
            ),
          ),
          Icon(
            Icons.check_circle,
            color: fsmTheme.success,
            size: DesignTokens.iconMd.sp,
          ),
        ],
      ),
    );
  }

  Widget _buildLocationLoading(BuildContext context) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;

    return Container(
      width: double.infinity,
      padding: REdgeInsets.all(DesignTokens.space3),
      decoration: BoxDecoration(
        color: fsmTheme.warning.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
        border: Border.all(
          color: fsmTheme.warning.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: DesignTokens.iconSm.w,
            height: DesignTokens.iconSm.h,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(fsmTheme.warning),
            ),
          ),
          RSizedBox(width: DesignTokens.space3),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Capturing Location...',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: fsmTheme.warning,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                RSizedBox(height: DesignTokens.space1),
                Text(
                  'Please wait while we get your GPS coordinates',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: fsmTheme.warning.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationUnavailable(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: REdgeInsets.all(DesignTokens.space3),
      decoration: BoxDecoration(
        color: theme.colorScheme.error.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
        border: Border.all(
          color: theme.colorScheme.error.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.location_off,
            color: theme.colorScheme.error,
            size: DesignTokens.iconSm.sp,
          ),
          RSizedBox(width: DesignTokens.space3),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location Not Available',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.error,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                RSizedBox(height: DesignTokens.space1),
                Text(
                  'Unable to capture GPS coordinates',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.error.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),
          if (showRetryButton && onRetry != null)
            IconButton(
              onPressed: onRetry,
              icon: Icon(
                Icons.refresh,
                color: theme.colorScheme.error,
                size: DesignTokens.iconSm.sp,
              ),
              tooltip: 'Retry',
            ),
        ],
      ),
    );
  }
}
