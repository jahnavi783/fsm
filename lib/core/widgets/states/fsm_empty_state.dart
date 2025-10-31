import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/spacing_theme.dart';

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
        iconColor = const Color(0xFF9E9E9E), // Grey 500
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
        iconColor = const Color(0xFF9E9E9E), // Grey 500
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
        iconColor = const Color(0xFFEF6C00), // Orange for offline
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
        iconColor = const Color(0xFFB00020), // Material error color
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
        iconColor = const Color(0xFFFFA726), // Amber for warning
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
        iconColor = const Color(0xFF2196F3), // Blue for info
        backgroundColor = null,
        iconSize = null,
        padding = null;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final spacing = context.spacing;
    final effectiveIconSize = iconSize ?? DesignTokens.iconXxl.sp;
    final effectiveIconColor = iconColor ?? theme.colorScheme.onSurfaceVariant;
    final effectivePadding = padding ?? spacing.paddingLg;

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

              DesignTokens.verticalSpaceLarge,

              // Title
              Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: DesignTokens.fontWeightSemiBold,
                  color: theme.colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),

              // Description
              if (description != null) ...[
                DesignTokens.verticalSpaceSmall,
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: DesignTokens.space6),
                  child: Text(
                    description!,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],

              // Action Button - uses theme button styling
              if (actionLabel != null && onAction != null) ...[
                DesignTokens.verticalSpaceLarge,
                ElevatedButton(
                  onPressed: onAction,
                  child: Text(actionLabel!),
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
    final spacing = context.spacing;
    final effectiveIconColor = iconColor ?? theme.colorScheme.onSurfaceVariant;

    return Padding(
      padding: spacing.paddingMd,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon
          Icon(
            icon,
            size: DesignTokens.iconXxl.sp,
            color: effectiveIconColor,
          ),

          DesignTokens.verticalSpaceSmall,

          // Message
          Text(
            message,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),

          // Action Button (compact) - uses theme button styling
          if (actionLabel != null && onAction != null) ...[
            DesignTokens.verticalSpaceSmall,
            TextButton(
              onPressed: onAction,
              child: Text(actionLabel!),
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
