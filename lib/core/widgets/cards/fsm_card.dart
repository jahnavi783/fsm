import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/spacing_theme.dart';

/// FSMCard - Unified card component for the FSM app
///
/// Provides consistent card styling with multiple variants:
/// - [FSMCard.elevated] - Standard elevated card with shadow
/// - [FSMCard.outlined] - Card with border, no shadow
/// - [FSMCard.flat] - Flat card with no elevation or border
///
/// Supports:
/// - Leading widget (icon, image, avatar)
/// - Trailing widget (action button, icon, badge)
/// - Badge overlay (for notifications, counts)
/// - Customizable padding, margin, elevation
/// - Tap handling with ink splash effect
class FSMCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? elevation;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Widget? leading;
  final Widget? trailing;
  final Widget? badge;
  final Clip clipBehavior;
  final bool showShadow;

  const FSMCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.elevation,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.onTap,
    this.onLongPress,
    this.leading,
    this.trailing,
    this.badge,
    this.clipBehavior = Clip.none,
    this.showShadow = true,
  });

  /// Standard elevated card with shadow
  const FSMCard.elevated({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius,
    this.backgroundColor,
    this.onTap,
    this.onLongPress,
    this.leading,
    this.trailing,
    this.badge,
    this.clipBehavior = Clip.antiAlias,
  })  : elevation = null, // Will use default
        borderColor = null,
        borderWidth = null,
        showShadow = true;

  /// Card with border, no shadow
  const FSMCard.outlined({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.onTap,
    this.onLongPress,
    this.leading,
    this.trailing,
    this.badge,
    this.clipBehavior = Clip.antiAlias,
  })  : elevation = 0,
        borderWidth = null, // Will use default
        showShadow = false;

  /// Flat card with no elevation or border
  const FSMCard.flat({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius,
    this.backgroundColor,
    this.onTap,
    this.onLongPress,
    this.leading,
    this.trailing,
    this.badge,
    this.clipBehavior = Clip.antiAlias,
  })  : elevation = 0,
        borderColor = null,
        borderWidth = null,
        showShadow = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final spacing = context.spacing;

    final effectiveElevation = elevation ?? spacing.elevationSm;
    final effectiveBorderRadius = borderRadius ?? spacing.cardRadius;
    final effectiveBackgroundColor = backgroundColor ?? theme.cardColor;
    final effectivePadding = padding ?? spacing.cardPaddingAll;
    final effectiveMargin = margin ??
        REdgeInsets.symmetric(
          horizontal: spacing.space4,
          vertical: spacing.space2,
        );

    Widget cardContent = child;

    // Wrap with leading/trailing if provided
    if (leading != null || trailing != null) {
      cardContent = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (leading != null) ...[
            leading!,
            spacing.horizontalSpaceMedium,
          ],
          Expanded(child: cardContent),
          if (trailing != null) ...[
            spacing.horizontalSpaceMedium,
            trailing!,
          ],
        ],
      );
    }

    Widget card = Card(
      elevation: effectiveElevation,
      color: effectiveBackgroundColor,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(effectiveBorderRadius.r),
        side: borderColor != null
            ? BorderSide(
                color: borderColor!,
                width: borderWidth ?? 1.0,
              )
            : BorderSide.none,
      ),
      clipBehavior: clipBehavior,
      shadowColor: showShadow ? theme.shadowColor : Colors.transparent,
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        borderRadius: BorderRadius.circular(effectiveBorderRadius),
        child: Padding(
          padding: effectivePadding,
          child: cardContent,
        ),
      ),
    );

    // Add badge overlay if provided
    if (badge != null) {
      card = Stack(
        clipBehavior: Clip.none,
        children: [
          card,
          Positioned(
            top: -4.h,
            right: -4.w,
            child: badge!,
          ),
        ],
      );
    }

    return Container(
      margin: effectiveMargin,
      width: double.infinity,
      child: card,
    );
  }
}

/// FSMCardHeader - Optional header component for cards
class FSMCardHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final EdgeInsetsGeometry? padding;

  const FSMCardHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final spacing = context.spacing;

    return Padding(
      padding: padding ?? REdgeInsets.only(bottom: spacing.space2),
      child: Row(
        children: [
          if (leading != null) ...[
            leading!,
            spacing.horizontalSpaceSmall,
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (subtitle != null) ...[
                  RSizedBox(height: spacing.space1),
                  Text(
                    subtitle!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (trailing != null) ...[
            spacing.horizontalSpaceSmall,
            trailing!,
          ],
        ],
      ),
    );
  }
}

/// FSMCardFooter - Optional footer component for cards
class FSMCardFooter extends StatelessWidget {
  final List<Widget> actions;
  final EdgeInsetsGeometry? padding;
  final MainAxisAlignment? alignment;

  const FSMCardFooter({
    super.key,
    required this.actions,
    this.padding,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return Padding(
      padding: padding ?? REdgeInsets.only(top: spacing.space4),
      child: Row(
        mainAxisAlignment: alignment ?? MainAxisAlignment.end,
        children: actions
            .map((action) => Padding(
                  padding: REdgeInsets.only(left: spacing.space2),
                  child: action,
                ))
            .toList(),
      ),
    );
  }
}
