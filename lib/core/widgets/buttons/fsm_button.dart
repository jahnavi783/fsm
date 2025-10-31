import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/spacing_theme.dart';

/// Unified button component following Material 3 design principles.
///
/// Uses composition pattern (wraps Material 3 buttons) instead of inheritance.
/// Supports three variants: filled, outlined, and text buttons.
/// Integrates with theme system for consistent styling across the app.
///
/// Example usage:
/// ```dart
/// FsmButton(
///   text: 'Submit',
///   onPressed: _handleSubmit,
///   variant: FsmButtonVariant.filled,
///   icon: Icons.check,
/// )
/// ```
class FsmButton extends StatelessWidget {
  const FsmButton({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = FsmButtonVariant.filled,
    this.size = FsmButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.isEnabled = true,
    this.width,
  });

  /// Named constructor for primary filled button (most common use case)
  const FsmButton.primary({
    super.key,
    required this.text,
    this.onPressed,
    this.size = FsmButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.width,
  })  : variant = FsmButtonVariant.filled,
        isEnabled = true;

  /// Named constructor for outlined button
  const FsmButton.outlined({
    super.key,
    required this.text,
    this.onPressed,
    this.size = FsmButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.width,
  })  : variant = FsmButtonVariant.outlined,
        isEnabled = true;

  /// Named constructor for text button (least emphasis)
  const FsmButton.text({
    super.key,
    required this.text,
    this.onPressed,
    this.size = FsmButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.width,
  })  : variant = FsmButtonVariant.text,
        isEnabled = true;

  final String text;
  final VoidCallback? onPressed;
  final FsmButtonVariant variant;
  final FsmButtonSize size;
  final IconData? icon;
  final bool isLoading;
  final bool isEnabled;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final spacing = context.spacing; // Theme-aware spacing

    // Determine button height based on size
    final height = switch (size) {
      FsmButtonSize.small => spacing.buttonHeightSm.h,
      FsmButtonSize.medium => spacing.buttonHeightMd.h,
      FsmButtonSize.large => spacing.buttonHeightLg.h,
    };

    // Determine icon size based on button size
    final iconSize = switch (size) {
      FsmButtonSize.small => spacing.iconXs.sp,
      FsmButtonSize.medium => spacing.iconSm.sp,
      FsmButtonSize.large => spacing.iconMd.sp,
    };

    // Build button content (text + optional icon/loading)
    Widget buttonChild = _buildButtonContent(context, theme, iconSize);

    // Wrap in SizedBox for height constraint and optional width
    Widget button = SizedBox(
      height: height,
      width: width,
      child: switch (variant) {
        FsmButtonVariant.filled => FilledButton(
            onPressed: _effectiveCallback,
            child: buttonChild,
          ),
        FsmButtonVariant.outlined => OutlinedButton(
            onPressed: _effectiveCallback,
            child: buttonChild,
          ),
        FsmButtonVariant.text => TextButton(
            onPressed: _effectiveCallback,
            child: buttonChild,
          ),
      },
    );

    // Add RepaintBoundary for performance optimization
    return RepaintBoundary(child: button);
  }

  /// Effective callback considering loading and enabled states
  VoidCallback? get _effectiveCallback {
    if (!isEnabled || isLoading) return null;
    return onPressed;
  }

  /// Builds button content with loading indicator, icon, or just text
  Widget _buildButtonContent(BuildContext context, ThemeData theme, double iconSize) {
    final spacing = context.spacing;

    if (isLoading) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: iconSize,
            height: iconSize,
            child: const CircularProgressIndicator(strokeWidth: 2),
          ),
          spacing.horizontalSpaceSmall,
          Text(text, style: theme.textTheme.labelLarge),
        ],
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: iconSize),
          spacing.horizontalSpaceSmall,
          Text(text, style: theme.textTheme.labelLarge),
        ],
      );
    }

    return Text(text, style: theme.textTheme.labelLarge);
  }
}

/// Button style variants following Material 3 patterns
enum FsmButtonVariant {
  /// Filled button with solid background (highest emphasis)
  filled,

  /// Outlined button with border (medium emphasis)
  outlined,

  /// Text-only button (lowest emphasis)
  text,
}

/// Button size presets based on DesignTokens
enum FsmButtonSize {
  /// Small button: 32px height
  small,

  /// Medium button: 48px height (default)
  medium,

  /// Large button: 56px height
  large,
}

/// Icon-only button component for toolbar actions and compact UIs.
///
/// Provides consistent sizing and theming for icon buttons throughout the app.
/// Supports loading states and tooltips for accessibility.
///
/// Example usage:
/// ```dart
/// FsmIconButton(
///   icon: Icons.edit,
///   onPressed: _handleEdit,
///   tooltip: 'Edit item',
/// )
/// ```
class FsmIconButton extends StatelessWidget {
  const FsmIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.size = FsmIconButtonSize.medium,
    this.isLoading = false,
    this.isEnabled = true,
    this.tooltip,
    this.backgroundColor,
    this.iconColor,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final FsmIconButtonSize size;
  final bool isLoading;
  final bool isEnabled;
  final String? tooltip;
  final Color? backgroundColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final spacing = context.spacing;

    final effectiveBackgroundColor = backgroundColor ?? colorScheme.primary;
    final effectiveIconColor = iconColor ?? colorScheme.onPrimary;

    // Determine button and icon sizes
    final buttonSize = switch (size) {
      FsmIconButtonSize.small => spacing.buttonHeightSm.w,
      FsmIconButtonSize.medium => spacing.buttonHeightMd.w,
      FsmIconButtonSize.large => spacing.buttonHeightLg.w,
    };

    final iconSize = switch (size) {
      FsmIconButtonSize.small => spacing.iconSm.sp,
      FsmIconButtonSize.medium => spacing.iconMd.sp,
      FsmIconButtonSize.large => spacing.iconLg.sp,
    };

    Widget buttonChild = isLoading
        ? SizedBox(
            width: iconSize,
            height: iconSize,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(effectiveIconColor),
            ),
          )
        : Icon(
            icon,
            size: iconSize,
            color: effectiveIconColor,
          );

    Widget button = Material(
      color: effectiveBackgroundColor,
      borderRadius: BorderRadius.circular(buttonSize / 2),
      child: InkWell(
        onTap: (isEnabled && !isLoading) ? onPressed : null,
        borderRadius: BorderRadius.circular(buttonSize / 2),
        child: Container(
          width: buttonSize,
          height: buttonSize,
          alignment: Alignment.center,
          child: buttonChild,
        ),
      ),
    );

    // Add tooltip if provided
    if (tooltip != null) {
      button = Tooltip(
        message: tooltip!,
        child: button,
      );
    }

    // Add RepaintBoundary for performance
    return RepaintBoundary(child: button);
  }
}

/// Icon button size presets
enum FsmIconButtonSize {
  /// Small icon button: 32px
  small,

  /// Medium icon button: 48px (default)
  medium,

  /// Large icon button: 56px
  large,
}
