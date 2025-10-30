import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/core/theme/app_dimensions.dart';
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
    final fsmTheme = context.fsmTheme;

    final effectiveBackgroundColor = backgroundColor ?? fsmTheme.fabBackground;
    final effectiveForegroundColor = foregroundColor ?? AppColors.onPrimary;
    final effectiveElevation = elevation ?? AppDimensions.elevationXLarge;

    Widget fab;

    if (extended && label != null) {
      // Extended FAB with label
      fab = FloatingActionButton.extended(
        onPressed: onPressed,
        tooltip: tooltip,
        backgroundColor: effectiveBackgroundColor,
        foregroundColor: effectiveForegroundColor,
        elevation: effectiveElevation,
        icon: Icon(icon, size: AppDimensions.iconMedium),
        label: Text(
          label!,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
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
        child: Icon(icon, size: AppDimensions.iconSmall),
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
        child: Icon(icon, size: AppDimensions.iconMedium),
      );
    }

    // Add badge overlay if provided
    if (badge != null) {
      fab = Stack(
        clipBehavior: Clip.none,
        children: [
          fab,
          Positioned(
            top: -4.h,
            right: -4.w,
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
      duration: AppDimensions.animationMedium,
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
    final fsmTheme = context.fsmTheme;
    final effectiveBackgroundColor =
        widget.backgroundColor ?? fsmTheme.fabBackground;
    final effectiveForegroundColor =
        widget.foregroundColor ?? AppColors.onPrimary;

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
                    padding: EdgeInsets.only(bottom: 12.h),
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
          elevation: AppDimensions.elevationXLarge,
          child: AnimatedBuilder(
            animation: _rotationAnimation,
            builder: (context, child) {
              return Transform.rotate(
                angle: _rotationAnimation.value,
                child: Icon(
                  _isExpanded
                      ? (widget.expandedIcon ?? Icons.close)
                      : widget.icon,
                  size: AppDimensions.iconMedium,
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
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 6.h,
            ),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
              boxShadow: [
                BoxShadow(
                  color: AppColors.cardShadow,
                  blurRadius: AppDimensions.shadowBlurSmall,
                  offset: AppDimensions.shadowOffsetSmall,
                ),
              ],
            ),
            child: Text(
              label!,
              style: theme.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 13.sp,
              ),
            ),
          ),
          SizedBox(width: 12.w),
        ],

        // Mini FAB
        FloatingActionButton.small(
          onPressed: onPressed,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: AppDimensions.elevationMedium,
          child: Icon(icon, size: AppDimensions.iconSmall),
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
    final effectiveBackgroundColor = backgroundColor ?? AppColors.error;
    final effectiveTextColor = textColor ?? AppColors.onError;
    final effectiveSize = size ?? 20.w;

    if (child != null) {
      return Container(
        constraints: BoxConstraints(
          minWidth: effectiveSize,
          minHeight: effectiveSize,
        ),
        padding: EdgeInsets.all(2.w),
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
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
          vertical: 2.h,
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
              fontSize: 10.sp,
              fontWeight: FontWeight.w700,
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
