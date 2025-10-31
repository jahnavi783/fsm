import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';

/// FSMSectionHeader - Section dividers with title and optional action
///
/// Provides consistent section headers with:
/// - Title text (bold, medium size)
/// - Optional trailing action (icon button or text button)
/// - Collapsible variant (expandable/collapsible sections)
/// - Divider line (above and/or below)
/// - Expansion animation for collapsible variant
///
/// Use cases:
/// - Work order details sections (Basic Info, Customer, Timeline)
/// - Settings groups
/// - List sections
/// - Collapsible content areas
class FSMSectionHeader extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final String? actionLabel;
  final VoidCallback? onActionPressed;
  final bool showTopDivider;
  final bool showBottomDivider;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final TextStyle? titleStyle;

  const FSMSectionHeader({
    super.key,
    required this.title,
    this.trailing,
    this.actionLabel,
    this.onActionPressed,
    this.showTopDivider = false,
    this.showBottomDivider = false,
    this.padding,
    this.backgroundColor,
    this.titleStyle,
  });

  /// Section header with top divider
  const FSMSectionHeader.withTopDivider({
    super.key,
    required this.title,
    this.trailing,
    this.actionLabel,
    this.onActionPressed,
    this.padding,
    this.backgroundColor,
    this.titleStyle,
  })  : showTopDivider = true,
        showBottomDivider = false;

  /// Section header with bottom divider
  const FSMSectionHeader.withBottomDivider({
    super.key,
    required this.title,
    this.trailing,
    this.actionLabel,
    this.onActionPressed,
    this.padding,
    this.backgroundColor,
    this.titleStyle,
  })  : showTopDivider = false,
        showBottomDivider = true;

  /// Section header with both dividers
  const FSMSectionHeader.withDividers({
    super.key,
    required this.title,
    this.trailing,
    this.actionLabel,
    this.onActionPressed,
    this.padding,
    this.backgroundColor,
    this.titleStyle,
  })  : showTopDivider = true,
        showBottomDivider = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectivePadding = padding ??
        REdgeInsets.symmetric(
          horizontal: DesignTokens.space4,
          vertical: DesignTokens.space4,
        );

    final effectiveTitleStyle = titleStyle ??
        theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.onSurface,
        );

    // Build action widget
    Widget? actionWidget;
    if (trailing != null) {
      actionWidget = trailing;
    } else if (actionLabel != null && onActionPressed != null) {
      actionWidget = TextButton(
        onPressed: onActionPressed,
        style: TextButton.styleFrom(
          foregroundColor: theme.colorScheme.primary,
          padding: REdgeInsets.symmetric(
            horizontal: DesignTokens.space2,
            vertical: DesignTokens.space1,
          ),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          actionLabel!,
          style: theme.textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top divider
        if (showTopDivider)
          Divider(
            height: 1.h,
            thickness: 1,
            color: theme.colorScheme.outlineVariant,
          ),

        // Header content
        Container(
          color: backgroundColor,
          padding: effectivePadding,
          child: Row(
            children: [
              // Title
              Expanded(
                child: Text(
                  title,
                  style: effectiveTitleStyle,
                ),
              ),

              // Action
              if (actionWidget != null) ...[
                RSizedBox(width: DesignTokens.space2),
                actionWidget,
              ],
            ],
          ),
        ),

        // Bottom divider
        if (showBottomDivider)
          Divider(
            height: 1.h,
            thickness: 1,
            color: theme.colorScheme.outlineVariant,
          ),
      ],
    );
  }
}

/// FSMCollapsibleSection - Expandable/collapsible section with header and content
///
/// Provides an animated collapsible section with header and content area.
class FSMCollapsibleSection extends StatefulWidget {
  final String title;
  final Widget child;
  final bool initiallyExpanded;
  final ValueChanged<bool>? onExpansionChanged;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final Color? backgroundColor;
  final bool showDivider;
  final IconData? expandIcon;
  final IconData? collapseIcon;

  const FSMCollapsibleSection({
    super.key,
    required this.title,
    required this.child,
    this.initiallyExpanded = true,
    this.onExpansionChanged,
    this.padding,
    this.contentPadding,
    this.backgroundColor,
    this.showDivider = true,
    this.expandIcon,
    this.collapseIcon,
  });

  @override
  State<FSMCollapsibleSection> createState() => _FSMCollapsibleSectionState();
}

class _FSMCollapsibleSectionState extends State<FSMCollapsibleSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _expandAnimation;
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _expandAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

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
      widget.onExpansionChanged?.call(_isExpanded);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectivePadding = widget.padding ??
        REdgeInsets.symmetric(
          horizontal: DesignTokens.space4,
          vertical: DesignTokens.space4,
        );

    final effectiveContentPadding = widget.contentPadding ??
        REdgeInsets.symmetric(
          horizontal: DesignTokens.space4,
          vertical: DesignTokens.space4,
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header (always visible)
        Material(
          color: widget.backgroundColor ?? Colors.transparent,
          child: InkWell(
            onTap: _toggleExpanded,
            child: Container(
              padding: effectivePadding,
              child: Row(
                children: [
                  // Title
                  Expanded(
                    child: Text(
                      widget.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ),

                  // Expand/Collapse Icon
                  AnimatedRotation(
                    turns: _isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      _isExpanded
                          ? (widget.collapseIcon ?? Icons.expand_less)
                          : (widget.expandIcon ?? Icons.expand_more),
                      color: theme.colorScheme.onSurfaceVariant,
                      size: DesignTokens.iconMd.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Divider
        if (widget.showDivider)
          Divider(
            height: 1.h,
            thickness: 1,
            color: theme.colorScheme.outlineVariant,
          ),

        // Collapsible Content
        SizeTransition(
          sizeFactor: _expandAnimation,
          axisAlignment: -1.0,
          child: Padding(
            padding: effectiveContentPadding,
            child: widget.child,
          ),
        ),
      ],
    );
  }
}

/// FSMStickyHeader - Section header that sticks to top when scrolling
///
/// Useful for long scrollable lists with multiple sections.
class FSMStickyHeader extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final Color? backgroundColor;
  final bool showDivider;

  const FSMStickyHeader({
    super.key,
    required this.title,
    this.trailing,
    this.backgroundColor,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveBackgroundColor = backgroundColor ?? theme.scaffoldBackgroundColor;

    return Container(
      color: effectiveBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: REdgeInsets.symmetric(
              horizontal: DesignTokens.space4,
              vertical: DesignTokens.space4,
            ),
            child: Row(
              children: [
                // Title
                Expanded(
                  child: Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),

                // Trailing
                if (trailing != null) ...[
                  RSizedBox(width: DesignTokens.space2),
                  trailing!,
                ],
              ],
            ),
          ),

          // Divider
          if (showDivider)
            Divider(
              height: 1.h,
              thickness: 1,
              color: theme.colorScheme.outlineVariant,
            ),
        ],
      ),
    );
  }
}

/// FSMSectionHeaderGroup - Groups multiple section headers vertically
///
/// Provides consistent spacing between section headers in a list.
class FSMSectionHeaderGroup extends StatelessWidget {
  final List<Widget> children;
  final double spacing;

  const FSMSectionHeaderGroup({
    super.key,
    required this.children,
    this.spacing = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children
          .map((child) => Padding(
                padding: REdgeInsets.only(bottom: spacing),
                child: child,
              ))
          .toList(),
    );
  }
}
