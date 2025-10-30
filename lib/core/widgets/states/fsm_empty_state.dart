import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/core/theme/app_dimensions.dart';

/// FSMEmptyState - Empty/zero state display with illustration, message, and action
///
/// Provides consistent empty state UI with:
/// - Icon or illustration display (large icon size)
/// - Primary message (title)
/// - Secondary message (description)
/// - Optional action button
/// - Different variants: no data, no results, offline, error
/// - Centered layout with proper spacing
///
/// Use cases:
/// - Empty work order list
/// - No search results
/// - Offline state
/// - Empty documents list
/// - Error states
/// - Permission denied states
class FSMEmptyState extends StatelessWidget {
  final IconData? icon;
  final Widget? illustration;
  final String title;
  final String? description;
  final String? actionLabel;
  final VoidCallback? onAction;
  final Color? iconColor;
  final Color? backgroundColor;
  final double? iconSize;
  final EdgeInsetsGeometry? padding;

  const FSMEmptyState({
    super.key,
    this.icon,
    this.illustration,
    required this.title,
    this.description,
    this.actionLabel,
    this.onAction,
    this.iconColor,
    this.backgroundColor,
    this.iconSize,
    this.padding,
  });

  /// No data variant - for empty lists
  const FSMEmptyState.noData({
    super.key,
    this.title = 'No Data Available',
    this.description = 'There are no items to display at this time.',
    this.actionLabel,
    this.onAction,
  })  : icon = Icons.inbox_outlined,
        illustration = null,
        iconColor = AppColors.grey400,
        backgroundColor = null,
        iconSize = null,
        padding = null;

  /// No results variant - for empty search results
  const FSMEmptyState.noResults({
    super.key,
    this.title = 'No Results Found',
    this.description = 'Try adjusting your search or filter criteria.',
    this.actionLabel = 'Clear Filters',
    this.onAction,
  })  : icon = Icons.search_off_outlined,
        illustration = null,
        iconColor = AppColors.grey400,
        backgroundColor = null,
        iconSize = null,
        padding = null;

  /// Offline variant - for offline/no connection state
  const FSMEmptyState.offline({
    super.key,
    this.title = 'No Internet Connection',
    this.description = 'Please check your connection and try again.',
    this.actionLabel = 'Retry',
    this.onAction,
  })  : icon = Icons.wifi_off_outlined,
        illustration = null,
        iconColor = AppColors.offline,
        backgroundColor = null,
        iconSize = null,
        padding = null;

  /// Error variant - for error states
  const FSMEmptyState.error({
    super.key,
    this.title = 'Something Went Wrong',
    this.description = 'An error occurred while loading data. Please try again.',
    this.actionLabel = 'Retry',
    this.onAction,
  })  : icon = Icons.error_outline,
        illustration = null,
        iconColor = AppColors.error,
        backgroundColor = null,
        iconSize = null,
        padding = null;

  /// Permission denied variant
  const FSMEmptyState.permissionDenied({
    super.key,
    this.title = 'Permission Required',
    this.description = 'You need permission to access this feature.',
    this.actionLabel = 'Request Access',
    this.onAction,
  })  : icon = Icons.lock_outline,
        illustration = null,
        iconColor = AppColors.warning,
        backgroundColor = null,
        iconSize = null,
        padding = null;

  /// Coming soon variant
  const FSMEmptyState.comingSoon({
    super.key,
    this.title = 'Coming Soon',
    this.description = 'This feature is currently under development.',
    this.actionLabel,
    this.onAction,
  })  : icon = Icons.construction_outlined,
        illustration = null,
        iconColor = AppColors.info,
        backgroundColor = null,
        iconSize = null,
        padding = null;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveIconSize = iconSize ?? 96.sp;
    final effectiveIconColor = iconColor ?? AppColors.grey400;
    final effectivePadding = padding ?? AppDimensions.paddingAllLarge;

    return Container(
      color: backgroundColor,
      padding: effectivePadding,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Illustration or Icon
              if (illustration != null)
                illustration!
              else if (icon != null)
                Icon(
                  icon,
                  size: effectiveIconSize,
                  color: effectiveIconColor,
                ),

              SizedBox(height: AppDimensions.spaceLarge),

              // Title
              Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),

              // Description
              if (description != null) ...[
                SizedBox(height: AppDimensions.spaceSmall),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingLarge),
                  child: Text(
                    description!,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],

              // Action Button
              if (actionLabel != null && onAction != null) ...[
                SizedBox(height: AppDimensions.spaceLarge),
                ElevatedButton(
                  onPressed: onAction,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.onPrimary,
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.paddingLarge,
                      vertical: AppDimensions.paddingMedium,
                    ),
                    minimumSize: Size(AppDimensions.buttonMinWidth, AppDimensions.buttonHeight),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
                    ),
                    elevation: AppDimensions.elevationSmall,
                  ),
                  child: Text(
                    actionLabel!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// FSMEmptyStateCompact - Compact empty state for smaller spaces (like cards)
///
/// Displays a minimal empty state suitable for smaller containers.
class FSMEmptyStateCompact extends StatelessWidget {
  final IconData icon;
  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;
  final Color? iconColor;

  const FSMEmptyStateCompact({
    super.key,
    required this.icon,
    required this.message,
    this.actionLabel,
    this.onAction,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveIconColor = iconColor ?? AppColors.grey400;

    return Padding(
      padding: AppDimensions.paddingAllMedium,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon
          Icon(
            icon,
            size: 48.sp,
            color: effectiveIconColor,
          ),

          SizedBox(height: AppDimensions.spaceSmall),

          // Message
          Text(
            message,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 13.sp,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),

          // Action Button (compact)
          if (actionLabel != null && onAction != null) ...[
            SizedBox(height: AppDimensions.spaceSmall),
            TextButton(
              onPressed: onAction,
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primary,
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingMedium,
                  vertical: AppDimensions.paddingSmall,
                ),
              ),
              child: Text(
                actionLabel!,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// FSMEmptyStateList - Empty state specifically designed for list views
///
/// Takes into account list padding and provides appropriate spacing.
class FSMEmptyStateList extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? description;
  final String? actionLabel;
  final VoidCallback? onAction;
  final Color? iconColor;

  const FSMEmptyStateList({
    super.key,
    required this.icon,
    required this.title,
    this.description,
    this.actionLabel,
    this.onAction,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: FSMEmptyState(
        icon: icon,
        title: title,
        description: description,
        actionLabel: actionLabel,
        onAction: onAction,
        iconColor: iconColor,
      ),
    );
  }
}
