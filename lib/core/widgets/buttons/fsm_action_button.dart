import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';

/// FSMActionButton - Contextual floating action button with badge support
///
/// Provides multiple FAB variants:
/// - [FSMActionButton.standard] - Standard FAB (56w)
/// - [FSMActionButton.mini] - Mini FAB (40w)
/// - [FSMActionButton.extended] - Extended FAB with label
/// - [FSMActionButton.multiAction] - Expandable speed dial with multiple actions
///
/// Supports:
/// - Badge overlay for notifications/counts
/// - Custom background colors
/// - Custom icons
/// - Smooth expand/collapse animations for multi-action
/// - Accessibility-friendly touch targets
///
/// Use cases:
/// - Primary actions on dashboard
/// - Quick work order actions (start, pause, complete)
/// - Multi-action menus (speed dial)
/// - Create new items (work orders, parts, documents)
class FSMActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  final Widget? badge;
  final String? label;
  final bool mini;
  final bool extended;
  final ShapeBorder? shape;

  const FSMActionButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.tooltip,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.badge,
    this.label,
    this.mini = false,
    this.extended = false,
    this.shape,
  });

  /// Standard FAB (56w)
  const FSMActionButton.standard({
    super.key,
    required this.icon,
    this.onPressed,
    this.tooltip,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.badge,
  })  : mini = false,
        extended = false,
        label = null,
        shape = null;

  /// Mini FAB (40w)
  const FSMActionButton.mini({
    super.key,
    required this.icon,
    this.onPressed,
    this.tooltip,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.badge,
  })  : mini = true,
        extended = false,
        label = null,
        shape = null;

  /// Extended FAB with label
  const FSMActionButton.extended({
    super.key,
    required this.icon,
    required this.label,
    this.onPressed,
    this.tooltip,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.badge,
  })  : mini = false,
        extended = true,
        shape = null;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;

    final effectiveBackgroundColor = backgroundColor ?? fsmTheme.fabBackground;
    final effectiveForegroundColor = foregroundColor ?? theme.colorScheme.onPrimary;
    final effectiveElevation = elevation ?? DesignTokens.elevationXl;

    Widget fab;

    if (extended && label != null) {
      // Extended FAB with label
      fab = FloatingActionButton.extended(
        onPressed: onPressed,
        tooltip: tooltip,
        backgroundColor: effectiveBackgroundColor,
        foregroundColor: effectiveForegroundColor,
        elevation: effectiveElevation,
        icon: Icon(icon, size: DesignTokens.iconMd.sp),
        label: Text(
          label!,
          style: TextStyle(
            fontSize: DesignTokens.fontSize14.sp,
            fontWeight: DesignTokens.fontWeightSemiBold,
          ),
        ),
      );
    } else if (mini) {
      // Mini FAB
      fab = FloatingActionButton.small(
        onPressed: onPressed,
        tooltip: tooltip,
        backgroundColor: effectiveBackgroundColor,
        foregroundColor: effectiveForegroundColor,
        elevation: effectiveElevation,
        shape: shape,
        child: Icon(icon, size: DesignTokens.iconSm.sp),
      );
    } else {
      // Standard FAB
      fab = FloatingActionButton(
        onPressed: onPressed,
        tooltip: tooltip,
        backgroundColor: effectiveBackgroundColor,
        foregroundColor: effectiveForegroundColor,
        elevation: effectiveElevation,
        shape: shape,
        child: Icon(icon, size: DesignTokens.iconMd.sp),
      );
    }

    // Add badge overlay if provided
    if (badge != null) {
      fab = Stack(
        clipBehavior: Clip.none,
        children: [
          fab,
          Positioned(
            top: -(DesignTokens.space1.h),
            right: -(DesignTokens.space1.w),
            child: badge!,
          ),
        ],
      );
    }

    return fab;
  }
}

/// FSMMultiActionButton - Expandable speed dial FAB with multiple actions
///
/// Displays a primary FAB that expands to show multiple action buttons.
/// Perfect for screens with multiple primary actions.
class FSMMultiActionButton extends StatefulWidget {
  /// List of actions to display when expanded
  final List<SpeedDialAction> actions;

  /// Primary FAB icon (when collapsed)
  final IconData icon;

  /// Icon when expanded (defaults to close icon)
  final IconData? expandedIcon;

  /// Tooltip for the primary FAB
  final String? tooltip;

  /// Background color
  final Color? backgroundColor;

  /// Foreground color
  final Color? foregroundColor;

  /// Whether to start in expanded state
  final bool initiallyExpanded;

  /// Callback when expansion state changes
  final ValueChanged<bool>? onExpandedChanged;

  const FSMMultiActionButton({
    super.key,
    required this.actions,
    required this.icon,
    this.expandedIcon,
    this.tooltip,
    this.backgroundColor,
    this.foregroundColor,
    this.initiallyExpanded = false,
    this.onExpandedChanged,
  });

  @override
  State<FSMMultiActionButton> createState() => _FSMMultiActionButtonState();
}

class _FSMMultiActionButtonState extends State<FSMMultiActionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _expandAnimation;
  late Animation<double> _rotationAnimation;
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;

    _controller = AnimationController(
      duration: DesignTokens.durationNormal,
      vsync: this,
    );

    _expandAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 0.785, // 45 degrees in radians
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    if (_isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
      widget.onExpandedChanged?.call(_isExpanded);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;
    final effectiveBackgroundColor =
        widget.backgroundColor ?? fsmTheme.fabBackground;
    final effectiveForegroundColor =
        widget.foregroundColor ?? theme.colorScheme.onPrimary;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Action buttons (appear above main FAB)
        ...widget.actions
            .asMap()
            .entries
            .map((entry) {
              final index = entry.key;
              final action = entry.value;

              return FadeTransition(
                opacity: _expandAnimation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset.zero,
                    end: Offset(0, -(index + 1) * 1.2),
                  ).animate(_expandAnimation),
                  child: Padding(
                    padding: REdgeInsets.only(bottom: DesignTokens.space3),
                    child: _SpeedDialActionButton(
                      icon: action.icon,
                      label: action.label,
                      backgroundColor:
                          action.backgroundColor ?? effectiveBackgroundColor,
                      foregroundColor:
                          action.foregroundColor ?? effectiveForegroundColor,
                      onPressed: () {
                        action.onPressed?.call();
                        _toggleExpanded();
                      },
                    ),
                  ),
                ),
              );
            })
            .toList()
            .reversed,

        // Main FAB
        FloatingActionButton(
          onPressed: _toggleExpanded,
          tooltip: widget.tooltip,
          backgroundColor: effectiveBackgroundColor,
          foregroundColor: effectiveForegroundColor,
          elevation: DesignTokens.elevationXl,
          child: AnimatedBuilder(
            animation: _rotationAnimation,
            builder: (context, child) {
              return Transform.rotate(
                angle: _rotationAnimation.value,
                child: Icon(
                  _isExpanded
                      ? (widget.expandedIcon ?? Icons.close)
                      : widget.icon,
                  size: DesignTokens.iconMd.sp,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

/// Individual action button in speed dial
class _SpeedDialActionButton extends StatelessWidget {
  final IconData icon;
  final String? label;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback? onPressed;

  const _SpeedDialActionButton({
    required this.icon,
    this.label,
    required this.backgroundColor,
    required this.foregroundColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Label (if provided)
        if (label != null) ...[
          Container(
            padding: REdgeInsets.symmetric(
              horizontal: DesignTokens.space3,
              vertical: DesignTokens.space1 + 2,
            ),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.shadow.withValues(alpha: 0.15),
                  blurRadius: DesignTokens.space2,
                  offset: Offset(0, DesignTokens.borderWidthMedium),
                ),
              ],
            ),
            child: Text(
              label!,
              style: theme.textTheme.labelMedium?.copyWith(
                fontWeight: DesignTokens.fontWeightSemiBold,
                fontSize: DesignTokens.fontSize12.sp + 1,
              ),
            ),
          ),
          DesignTokens.horizontalSpaceMd,
        ],

        // Mini FAB
        FloatingActionButton.small(
          onPressed: onPressed,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: DesignTokens.elevationMd,
          child: Icon(icon, size: DesignTokens.iconSm.sp),
        ),
      ],
    );
  }
}

/// Data class for speed dial actions
class SpeedDialAction {
  /// Icon to display
  final IconData icon;

  /// Optional label displayed next to the button
  final String? label;

  /// Callback when action is pressed
  final VoidCallback? onPressed;

  /// Custom background color (defaults to FAB background)
  final Color? backgroundColor;

  /// Custom foreground color (defaults to onPrimary)
  final Color? foregroundColor;

  const SpeedDialAction({
    required this.icon,
    this.label,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
  });
}

/// FSMActionButtonBadge - Badge component for FSMActionButton
class FSMActionButtonBadge extends StatelessWidget {
  /// Badge content (usually a count or icon)
  final String? text;
  final Widget? child;
  final Color? backgroundColor;
  final Color? textColor;
  final double? size;

  const FSMActionButtonBadge({
    super.key,
    this.text,
    this.child,
    this.backgroundColor,
    this.textColor,
    this.size,
  });

  /// Notification count badge
  FSMActionButtonBadge.count({
    super.key,
    required int count,
    this.backgroundColor,
    this.textColor,
  })  : text = count > 99 ? '99+' : count.toString(),
        child = null,
        size = null;

  /// Dot indicator badge (for presence/status)
  const FSMActionButtonBadge.dot({
    super.key,
    this.backgroundColor,
  })  : text = null,
        child = null,
        textColor = null,
        size = 10;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveBackgroundColor = backgroundColor ?? theme.colorScheme.error;
    final effectiveTextColor = textColor ?? theme.colorScheme.onError;
    final effectiveSize = size ?? DesignTokens.iconSm.w;

    if (child != null) {
      return Container(
        constraints: BoxConstraints(
          minWidth: effectiveSize,
          minHeight: effectiveSize,
        ),
        padding: REdgeInsets.all(DesignTokens.borderWidthMedium),
        decoration: BoxDecoration(
          color: effectiveBackgroundColor,
          shape: BoxShape.circle,
        ),
        child: child,
      );
    }

    if (text != null) {
      return Container(
        constraints: BoxConstraints(
          minWidth: effectiveSize,
          minHeight: effectiveSize,
        ),
        padding: REdgeInsets.symmetric(
          horizontal: DesignTokens.space1,
          vertical: DesignTokens.borderWidthMedium,
        ),
        decoration: BoxDecoration(
          color: effectiveBackgroundColor,
          borderRadius: BorderRadius.circular(effectiveSize / 2),
        ),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
              color: effectiveTextColor,
              fontSize: DesignTokens.fontSize10.sp,
              fontWeight: DesignTokens.fontWeightBold,
            ),
          ),
        ),
      );
    }

    // Dot indicator
    return Container(
      width: effectiveSize,
      height: effectiveSize,
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
