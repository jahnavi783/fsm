import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';
import 'package:fsm/core/theme/spacing_theme.dart';

/// FSMErrorState - Consolidated error state display widget
///
/// Provides consistent error UI across the app with:
/// - Icon with animated container and gradient background
/// - Error title and message
/// - Optional retry button
/// - Different variants: network, server, permission, timeout, unknown
/// - Sliver and standard variants
///
/// Use cases:
/// - Network errors (offline, timeout)
/// - Server errors (500, 503)
/// - Permission errors (403)
/// - Unknown/generic errors
/// - Any error state that needs user feedback
class FSMErrorState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  final String? actionLabel;
  final VoidCallback? onRetry;
  final Color iconColor;
  final bool showAnimation;
  final EdgeInsetsGeometry? padding;

  const FSMErrorState({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.actionLabel = 'Try Again',
    this.onRetry,
    required this.iconColor,
    this.showAnimation = true,
    this.padding,
  });

  /// Network error variant - for connection issues
  const FSMErrorState.network({
    super.key,
    this.title = 'No Internet Connection',
    this.message = 'Please check your connection and try again.',
    this.actionLabel = 'Retry',
    this.onRetry,
  })  : icon = Icons.wifi_off_outlined,
        iconColor = const Color(0xFFEF6C00), // Orange for offline - maps to warning
        showAnimation = true,
        padding = null;

  /// Server error variant - for 500, 503, etc.
  const FSMErrorState.server({
    super.key,
    this.title = 'Server Error',
    this.message = 'The server encountered an error. Please try again later.',
    this.actionLabel = 'Retry',
    this.onRetry,
  })  : icon = Icons.dns_outlined,
        iconColor = const Color(0xFFB00020), // Material error color
        showAnimation = true,
        padding = null;

  /// Permission error variant - for 403, unauthorized access
  const FSMErrorState.permission({
    super.key,
    this.title = 'Access Denied',
    this.message = 'You don\'t have permission to access this resource.',
    this.actionLabel,
    this.onRetry,
  })  : icon = Icons.lock_outline,
        iconColor = const Color(0xFFFFA726), // Amber for warning
        showAnimation = true,
        padding = null;

  /// Timeout error variant
  const FSMErrorState.timeout({
    super.key,
    this.title = 'Request Timeout',
    this.message = 'The request took too long. Please try again.',
    this.actionLabel = 'Retry',
    this.onRetry,
  })  : icon = Icons.timer_off_outlined,
        iconColor = const Color(0xFFFFA726), // Amber for warning
        showAnimation = true,
        padding = null;

  /// Unknown/generic error variant
  const FSMErrorState.unknown({
    super.key,
    this.title = 'Something Went Wrong',
    this.message = 'An unexpected error occurred. Please try again.',
    this.actionLabel = 'Retry',
    this.onRetry,
  })  : icon = Icons.error_outline,
        iconColor = const Color(0xFFB00020), // Material error color
        showAnimation = true,
        padding = null;

  /// Data loading error variant
  const FSMErrorState.loadError({
    super.key,
    this.title = 'Failed to Load Data',
    this.message = 'Could not load the requested data. Please try again.',
    this.actionLabel = 'Retry',
    this.onRetry,
  })  : icon = Icons.cloud_off_outlined,
        iconColor = const Color(0xFFB00020), // Material error color
        showAnimation = true,
        padding = null;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final spacing = context.spacing;
    final effectivePadding = padding ?? spacing.paddingLg;

    final content = Container(
      constraints: BoxConstraints(
        minHeight: 300.h,
        maxHeight: 400.h,
      ),
      padding: effectivePadding,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Animated icon with gradient background
              if (showAnimation)
                TweenAnimationBuilder<double>(
                  duration: DesignTokens.durationSlow,
                  tween: Tween(begin: 0.0, end: 1.0),
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: Opacity(
                        opacity: value,
                        child: _buildIconContainer(),
                      ),
                    );
                  },
                )
              else
                _buildIconContainer(),

              DesignTokens.verticalSpaceLarge,

              // Title
              Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: DesignTokens.fontWeightBold,
                  color: theme.colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              DesignTokens.verticalSpaceSmall,

              // Message
              Container(
                constraints: BoxConstraints(maxWidth: 280.w),
                child: Text(
                  message,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              // Retry Button
              if (onRetry != null && actionLabel != null) ...[
                DesignTokens.verticalSpaceLarge,
                ElevatedButton.icon(
                  onPressed: onRetry,
                  icon: Icon(Icons.refresh_rounded, size: DesignTokens.iconSm.sp),
                  label: Text(actionLabel!),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: iconColor,
                    foregroundColor: theme.colorScheme.onPrimary,
                    elevation: DesignTokens.elevationMd,
                    shadowColor: iconColor.withValues(alpha: 0.3),
                    padding: REdgeInsets.symmetric(
                      horizontal: DesignTokens.space6,
                      vertical: DesignTokens.space3,
                    ),
                    minimumSize: Size(
                      DesignTokens.buttonHeightMd.w * 1.5,
                      DesignTokens.buttonHeightMd.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );

    return content;
  }

  Widget _buildIconContainer() {
    return Container(
      padding: REdgeInsets.all(DesignTokens.space5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            iconColor.withValues(alpha: 0.08),
            iconColor.withValues(alpha: 0.15),
          ],
        ),
        shape: BoxShape.circle,
        border: Border.all(
          color: iconColor.withValues(alpha: 0.2),
          width: DesignTokens.borderWidthMedium,
        ),
        boxShadow: [
          BoxShadow(
            color: iconColor.withValues(alpha: 0.1),
            blurRadius: DesignTokens.space4,
            offset: Offset(0, DesignTokens.space2),
          ),
        ],
      ),
      child: Icon(
        icon,
        size: DesignTokens.iconXl.sp,
        color: iconColor,
      ),
    );
  }
}

/// FSMErrorStateSliver - Sliver variant for use in CustomScrollView
///
/// Wraps FSMErrorState in SliverToBoxAdapter for use in sliver lists.
class FSMErrorStateSliver extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  final String? actionLabel;
  final VoidCallback? onRetry;
  final Color iconColor;
  final bool showAnimation;

  const FSMErrorStateSliver({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.actionLabel = 'Try Again',
    this.onRetry,
    required this.iconColor,
    this.showAnimation = true,
  });

  /// Network error variant
  const FSMErrorStateSliver.network({
    super.key,
    String? title,
    String? message,
    this.actionLabel = 'Retry',
    this.onRetry,
  })  : icon = Icons.wifi_off_outlined,
        title = title ?? 'No Internet Connection',
        message = message ?? 'Please check your connection and try again.',
        iconColor = const Color(0xFFEF6C00), // Orange for offline
        showAnimation = true;

  /// Server error variant
  const FSMErrorStateSliver.server({
    super.key,
    String? title,
    String? message,
    this.actionLabel = 'Retry',
    this.onRetry,
  })  : icon = Icons.dns_outlined,
        title = title ?? 'Server Error',
        message = message ?? 'The server encountered an error. Please try again later.',
        iconColor = const Color(0xFFB00020), // Material error color
        showAnimation = true;

  /// Unknown error variant
  const FSMErrorStateSliver.unknown({
    super.key,
    String? title,
    String? message,
    this.actionLabel = 'Retry',
    this.onRetry,
  })  : icon = Icons.error_outline,
        title = title ?? 'Something Went Wrong',
        message = message ?? 'An unexpected error occurred. Please try again.',
        iconColor = const Color(0xFFB00020), // Material error color
        showAnimation = true;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FSMErrorState(
        icon: icon,
        title: title,
        message: message,
        actionLabel: actionLabel,
        onRetry: onRetry,
        iconColor: iconColor,
        showAnimation: showAnimation,
      ),
    );
  }
}
