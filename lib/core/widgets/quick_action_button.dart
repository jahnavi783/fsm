import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';
import 'package:fsm/core/theme/spacing_theme.dart';

/// Standardized action button for cards and quick actions
///
/// Used in work order cards, document cards, and other action-required contexts
/// Features:
/// - Icon + label layout
/// - Consistent sizing and spacing
/// - Custom colors
/// - Disabled state support
/// - Loading state support
///
/// NOTE: This is a legacy file. Prefer using buttons/fsm_quick_action_button.dart
/// which is the canonical implementation with better organization.
class QuickActionButton extends StatelessWidget {
  const QuickActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.color,
    this.backgroundColor,
    this.isLoading = false,
    this.isCompact = false,
  });

  /// Icon to display
  final IconData icon;

  /// Button label text
  final String label;

  /// Callback when button is pressed
  final VoidCallback? onPressed;

  /// Custom icon/text color (defaults to primary)
  final Color? color;

  /// Custom background color (defaults to transparent)
  final Color? backgroundColor;

  /// Show loading indicator
  final bool isLoading;

  /// Use compact layout (smaller padding)
  final bool isCompact;

  bool get _isDisabled => onPressed == null;

  Color _foregroundColor(BuildContext context) {
    final theme = Theme.of(context);
    if (_isDisabled) {
      return theme.colorScheme.onSurface.withValues(alpha: DesignTokens.opacityDisabled);
    }
    return color ?? theme.colorScheme.primary;
  }

  Color _backgroundButtonColor(BuildContext context) {
    final theme = Theme.of(context);
    if (_isDisabled) {
      return theme.colorScheme.surface.withValues(alpha: DesignTokens.opacityDisabled);
    }
    return backgroundColor ?? Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final spacing = context.spacing;

    return Material(
      color: _backgroundButtonColor(context),
      borderRadius: BorderRadius.circular(spacing.radiusSm.r),
      child: InkWell(
        onTap: isLoading ? null : onPressed,
        borderRadius: BorderRadius.circular(spacing.radiusSm.r),
        child: Container(
          padding: REdgeInsets.symmetric(
            horizontal: isCompact ? DesignTokens.space2 : DesignTokens.space4,
            vertical: isCompact ? DesignTokens.space1 : DesignTokens.space2,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isLoading)
                RSizedBox(
                  width: DesignTokens.iconSm.w,
                  height: DesignTokens.iconSm.h,
                  child: CircularProgressIndicator(
                    strokeWidth: DesignTokens.borderWidthMedium.w,
                    valueColor: AlwaysStoppedAnimation<Color>(_foregroundColor(context)),
                  ),
                )
              else
                Icon(
                  icon,
                  size: DesignTokens.iconSm.sp,
                  color: _foregroundColor(context),
                ),
              DesignTokens.horizontalSpaceXs,
              Text(
                label,
                style: (isCompact ? theme.textTheme.labelSmall : theme.textTheme.labelMedium)?.copyWith(
                  color: _foregroundColor(context),
                  fontWeight: DesignTokens.fontWeightSemiBold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Variant constructors for common action button types
extension QuickActionButtonVariants on QuickActionButton {
  /// Primary action button (filled with primary color)
  static Widget primary({
    required IconData icon,
    required String label,
    required VoidCallback? onPressed,
    bool isLoading = false,
    bool isCompact = false,
  }) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        return QuickActionButton(
          icon: icon,
          label: label,
          onPressed: onPressed,
          color: theme.colorScheme.onPrimary,
          backgroundColor: theme.colorScheme.primary,
          isLoading: isLoading,
          isCompact: isCompact,
        );
      },
    );
  }

  /// Secondary action button (outlined)
  static Widget secondary({
    required IconData icon,
    required String label,
    required VoidCallback? onPressed,
    bool isLoading = false,
    bool isCompact = false,
  }) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final spacing = context.spacing;
        final disabledColor = theme.colorScheme.onSurface.withValues(alpha: DesignTokens.opacityDisabled);

        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: onPressed == null ? disabledColor : theme.colorScheme.primary,
              width: DesignTokens.borderWidthThin.w,
            ),
            borderRadius: BorderRadius.circular(spacing.radiusSm.r),
          ),
          child: QuickActionButton(
            icon: icon,
            label: label,
            onPressed: onPressed,
            color: theme.colorScheme.primary,
            backgroundColor: Colors.transparent,
            isLoading: isLoading,
            isCompact: isCompact,
          ),
        );
      },
    );
  }

  /// Success action button (green, for complete/submit actions)
  static Widget success({
    required IconData icon,
    required String label,
    required VoidCallback? onPressed,
    bool isLoading = false,
    bool isCompact = false,
  }) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final fsmTheme = context.fsmTheme;
        return QuickActionButton(
          icon: icon,
          label: label,
          onPressed: onPressed,
          color: theme.colorScheme.onPrimary,
          backgroundColor: fsmTheme.success,
          isLoading: isLoading,
          isCompact: isCompact,
        );
      },
    );
  }

  /// Warning action button (orange, for pause/caution actions)
  static Widget warning({
    required IconData icon,
    required String label,
    required VoidCallback? onPressed,
    bool isLoading = false,
    bool isCompact = false,
  }) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final fsmTheme = context.fsmTheme;
        return QuickActionButton(
          icon: icon,
          label: label,
          onPressed: onPressed,
          color: theme.colorScheme.onPrimary,
          backgroundColor: fsmTheme.warning,
          isLoading: isLoading,
          isCompact: isCompact,
        );
      },
    );
  }

  /// Error/destructive action button (red, for cancel/delete actions)
  static Widget error({
    required IconData icon,
    required String label,
    required VoidCallback? onPressed,
    bool isLoading = false,
    bool isCompact = false,
  }) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        return QuickActionButton(
          icon: icon,
          label: label,
          onPressed: onPressed,
          color: theme.colorScheme.onError,
          backgroundColor: theme.colorScheme.error,
          isLoading: isLoading,
          isCompact: isCompact,
        );
      },
    );
  }

  /// Text-only action button (no background)
  static Widget text({
    required IconData icon,
    required String label,
    required VoidCallback? onPressed,
    Color? color,
    bool isLoading = false,
    bool isCompact = false,
  }) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        return QuickActionButton(
          icon: icon,
          label: label,
          onPressed: onPressed,
          color: color ?? theme.colorScheme.primary,
          backgroundColor: Colors.transparent,
          isLoading: isLoading,
          isCompact: isCompact,
        );
      },
    );
  }
}
