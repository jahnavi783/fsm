import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';
import 'package:fsm/features/work_orders/domain/entities/location_entity.dart';

/// Step 4: Location Capture
/// Final step that captures the user's current location for work order completion
class LocationCaptureStep extends StatelessWidget {
  final LocationEntity? currentLocation;

  const LocationCaptureStep({
    super.key,
    required this.currentLocation,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Step header
        Container(
          padding: REdgeInsets.all(DesignTokens.space4),
          decoration: BoxDecoration(
            color: fsmTheme.success.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
          ),
          child: Row(
            children: [
              Container(
                width: DesignTokens.iconLg.w,
                height: DesignTokens.iconLg.w,
                decoration: BoxDecoration(
                  color: fsmTheme.success,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '4',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
              RSizedBox(width: DesignTokens.space3),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Location Capture',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      'Confirm your current location',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        RSizedBox(height: DesignTokens.space6),

        // Location Status Card
        Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 400.w),
            padding: REdgeInsets.all(DesignTokens.space6),
            decoration: BoxDecoration(
              color: currentLocation != null
                  ? fsmTheme.success.withValues(alpha: 0.1)
                  : fsmTheme.warning.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(DesignTokens.radiusLg.r),
              border: Border.all(
                color: currentLocation != null
                    ? fsmTheme.success.withValues(alpha: 0.3)
                    : fsmTheme.warning.withValues(alpha: 0.3),
                width: 2,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Location Icon
                Container(
                  width: 80.w,
                  height: 80.w,
                  decoration: BoxDecoration(
                    color: currentLocation != null
                        ? fsmTheme.success.withValues(alpha: 0.2)
                        : fsmTheme.warning.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    currentLocation != null
                        ? Icons.location_on
                        : Icons.location_searching,
                    size: 40.sp,
                    color: currentLocation != null
                        ? fsmTheme.success
                        : fsmTheme.warning,
                  ),
                ),

                RSizedBox(height: DesignTokens.space4),

                // Status Text
                Text(
                  currentLocation != null
                      ? 'Location Captured'
                      : 'Capturing Location...',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: currentLocation != null
                        ? fsmTheme.success
                        : fsmTheme.warning,
                  ),
                  textAlign: TextAlign.center,
                ),

                RSizedBox(height: DesignTokens.space2),

                // Location Details or Loading Indicator
                if (currentLocation != null) ...[
                  Text(
                    'Your location has been successfully captured',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  RSizedBox(height: DesignTokens.space4),
                  // Coordinates display
                  Container(
                    padding: REdgeInsets.symmetric(
                      horizontal: DesignTokens.space4,
                      vertical: DesignTokens.space3,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
                      border: Border.all(
                        color: theme.colorScheme.outline.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.gps_fixed,
                              size: DesignTokens.iconSm.sp,
                              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                            ),
                            RSizedBox(width: DesignTokens.space2),
                            Text(
                              'Coordinates',
                              style: theme.textTheme.labelSmall?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                              ),
                            ),
                          ],
                        ),
                        RSizedBox(height: DesignTokens.space1),
                        Text(
                          '${currentLocation!.latitude.toStringAsFixed(6)}, ${currentLocation!.longitude.toStringAsFixed(6)}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontFamily: 'monospace',
                            color: theme.colorScheme.onSurface,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ] else ...[
                  Text(
                    'Please wait while we get your current location',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  RSizedBox(height: DesignTokens.space4),
                  SizedBox(
                    width: 40.w,
                    height: 40.h,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        fsmTheme.warning,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),

        RSizedBox(height: DesignTokens.space6),

        // Information Card
        Container(
          padding: REdgeInsets.all(DesignTokens.space4),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
            border: Border.all(
              color: theme.colorScheme.outline.withValues(alpha: 0.2),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.info_outline,
                size: DesignTokens.iconSm.sp,
                color: theme.colorScheme.primary,
              ),
              RSizedBox(width: DesignTokens.space3),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Why do we need your location?',
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    RSizedBox(height: DesignTokens.space1),
                    Text(
                      'Your location is required to verify that the work order was completed at the correct job site. This helps maintain accurate records and ensures service quality.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        if (currentLocation == null) ...[
          RSizedBox(height: DesignTokens.space4),
          Container(
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
                Icon(
                  Icons.warning_amber_rounded,
                  size: DesignTokens.iconSm.sp,
                  color: fsmTheme.warning,
                ),
                RSizedBox(width: DesignTokens.space2),
                Expanded(
                  child: Text(
                    'You must wait for location capture to complete before submitting',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
