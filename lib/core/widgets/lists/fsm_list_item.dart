import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';

/// FSMListItem - Standardized list item component for the FSM app
///
/// Provides consistent list item styling with multiple density variants:
/// - [FSMListItem] - Standard two-line list item
/// - [FSMListItem.singleLine] - Compact single-line item
/// - [FSMListItem.threeLine] - Expanded three-line item
///
/// Supports:
/// - Leading widget (icon, image, avatar, checkbox)
/// - Trailing widget (action button, icon, badge, metadata)
/// - Title, subtitle, and tertiary text
/// - Metadata badges (status, priority, etc.)
/// - Tap and long-press handling
/// - Divider option
class FSMListItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? tertiaryText;
  final Widget? leading;
  final Widget? trailing;
  final List<Widget>? metadata;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool showDivider;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final double? minHeight;
  final CrossAxisAlignment? crossAxisAlignment;
  final bool dense;

  const FSMListItem({
    super.key,
    required this.title,
    this.subtitle,
    this.tertiaryText,
    this.leading,
    this.trailing,
    this.metadata,
    this.onTap,
    this.onLongPress,
    this.showDivider = false,
    this.padding,
    this.contentPadding,
    this.minHeight,
    this.crossAxisAlignment,
    this.dense = false,
  });

  /// Compact single-line list item
  const FSMListItem.singleLine({
    super.key,
    required this.title,
    this.leading,
    this.trailing,
    this.metadata,
    this.onTap,
    this.onLongPress,
    this.showDivider = false,
    this.padding,
    this.contentPadding,
  })  : subtitle = null,
        tertiaryText = null,
        minHeight = null, // Will use compact height
        crossAxisAlignment = CrossAxisAlignment.center,
        dense = true;

  /// Standard two-line list item
  const FSMListItem.twoLine({
    super.key,
    required this.title,
    required this.subtitle,
    this.leading,
    this.trailing,
    this.metadata,
    this.onTap,
    this.onLongPress,
    this.showDivider = false,
    this.padding,
    this.contentPadding,
  })  : tertiaryText = null,
        minHeight = null, // Will use standard height
        crossAxisAlignment = CrossAxisAlignment.start,
        dense = false;

  /// Expanded three-line list item
  const FSMListItem.threeLine({
    super.key,
    required this.title,
    required this.subtitle,
    this.tertiaryText,
    this.leading,
    this.trailing,
    this.metadata,
    this.onTap,
    this.onLongPress,
    this.showDivider = false,
    this.padding,
    this.contentPadding,
  })  : minHeight = null, // Will use comfortable height
        crossAxisAlignment = CrossAxisAlignment.start,
        dense = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final effectiveMinHeight = minHeight ??
        (dense
            ? DesignTokens.buttonHeightMd.h
            : tertiaryText != null
                ? (DesignTokens.space12 + DesignTokens.space4).h
                : (DesignTokens.space12 + DesignTokens.space2).h);

    final effectivePadding = padding ??
        REdgeInsets.symmetric(
          horizontal: DesignTokens.space4,
          vertical: dense ? DesignTokens.space2 : 0,
        );

    final effectiveContentPadding = contentPadding ??
        REdgeInsets.symmetric(
          horizontal: 0,
          vertical: dense
              ? DesignTokens.space2
              : DesignTokens.space4,
        );

    Widget listItem = InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        constraints: BoxConstraints(minHeight: effectiveMinHeight),
        padding: effectiveContentPadding,
        child: Row(
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
          children: [
            // Leading widget
            if (leading != null) ...[
              leading!,
              RSizedBox(width: DesignTokens.space4),
            ],

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onSurface,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  // Subtitle
                  if (subtitle != null) ...[
                    RSizedBox(height: DesignTokens.space1),
                    Text(
                      subtitle!,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      maxLines: tertiaryText != null ? 1 : 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],

                  // Tertiary text
                  if (tertiaryText != null) ...[
                    RSizedBox(height: DesignTokens.space1),
                    Text(
                      tertiaryText!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],

                  // Metadata badges
                  if (metadata != null && metadata!.isNotEmpty) ...[
                    RSizedBox(height: DesignTokens.space2),
                    Wrap(
                      spacing: DesignTokens.space2.w,
                      runSpacing: DesignTokens.space1.h,
                      children: metadata!,
                    ),
                  ],
                ],
              ),
            ),

            // Trailing widget
            if (trailing != null) ...[
              RSizedBox(width: DesignTokens.space4),
              trailing!,
            ],
          ],
        ),
      ),
    );

    // Add divider if requested
    if (showDivider) {
      listItem = Column(
        children: [
          listItem,
          Divider(
            height: 1.h,
            thickness: 1,
            indent: leading != null ? (DesignTokens.space12 + DesignTokens.space6).w : DesignTokens.space4.w,
            endIndent: DesignTokens.space4.w,
            color: theme.colorScheme.outlineVariant,
          ),
        ],
      );
    }

    return Padding(
      padding: effectivePadding,
      child: listItem,
    );
  }
}

/// FSMListItemLeading - Common leading widgets for list items
class FSMListItemLeading {
  FSMListItemLeading._();

  /// Icon leading widget
  static Widget icon({
    required BuildContext context,
    required IconData icon,
    Color? color,
    Color? backgroundColor,
    double? size,
  }) {
    final theme = Theme.of(context);
    final effectiveSize = size ?? DesignTokens.buttonHeightMd.w;

    return Container(
      width: effectiveSize,
      height: effectiveSize,
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
      ),
      child: Icon(
        icon,
        color: color ?? theme.colorScheme.primary,
        size: effectiveSize * 0.5,
      ),
    );
  }

  /// Avatar leading widget
  static Widget avatar({
    required BuildContext context,
    String? imageUrl,
    String? name,
    double? size,
  }) {
    final theme = Theme.of(context);
    final effectiveSize = size ?? DesignTokens.buttonHeightMd.w;

    return CircleAvatar(
      radius: effectiveSize / 2,
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl) : null,
      backgroundColor: theme.colorScheme.primary,
      child: imageUrl == null && name != null
          ? Text(
              name.substring(0, 1).toUpperCase(),
              style: TextStyle(
                color: theme.colorScheme.onPrimary,
                fontSize: (effectiveSize * 0.4).sp,
                fontWeight: FontWeight.w600,
              ),
            )
          : null,
    );
  }

  /// Checkbox leading widget
  static Widget checkbox({
    required bool value,
    required ValueChanged<bool?> onChanged,
    bool tristate = false,
  }) {
    return Checkbox(
      value: value,
      onChanged: onChanged,
      tristate: tristate,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  /// Image leading widget
  static Widget image({
    required BuildContext context,
    required String imageUrl,
    double? size,
    BoxFit fit = BoxFit.cover,
  }) {
    final theme = Theme.of(context);
    final effectiveSize = size ?? DesignTokens.buttonHeightMd.w;
    return ClipRRect(
      borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
      child: Image.network(
        imageUrl,
        width: effectiveSize,
        height: effectiveSize,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: effectiveSize,
            height: effectiveSize,
            color: theme.colorScheme.surfaceContainerHighest,
            child: Icon(
              Icons.image_not_supported,
              color: theme.colorScheme.onSurfaceVariant,
              size: effectiveSize * 0.5,
            ),
          );
        },
      ),
    );
  }
}

/// FSMListItemTrailing - Common trailing widgets for list items
class FSMListItemTrailing {
  FSMListItemTrailing._();

  /// Icon trailing widget
  static Widget icon({
    required BuildContext context,
    required IconData icon,
    Color? color,
    VoidCallback? onTap,
  }) {
    final theme = Theme.of(context);
    final iconWidget = Icon(
      icon,
      color: color ?? theme.colorScheme.onSurfaceVariant,
      size: DesignTokens.iconSm.sp,
    );

    if (onTap != null) {
      return IconButton(
        icon: iconWidget,
        onPressed: onTap,
        constraints: BoxConstraints(
          minWidth: DesignTokens.buttonHeightMd,
          minHeight: DesignTokens.buttonHeightMd,
        ),
        padding: EdgeInsets.zero,
      );
    }

    return iconWidget;
  }

  /// Text trailing widget (for metadata like dates, counts)
  static Widget text({
    required BuildContext context,
    required String text,
    Color? color,
    TextStyle? style,
  }) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: style ??
          theme.textTheme.bodySmall?.copyWith(
            color: color ?? theme.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w500,
          ),
    );
  }

  /// Arrow icon (commonly used for navigation)
  static Widget arrow({
    required BuildContext context,
    Color? color,
  }) {
    final theme = Theme.of(context);
    return Icon(
      Icons.chevron_right,
      color: color ?? theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
      size: DesignTokens.iconSm.sp,
    );
  }

  /// Badge trailing widget
  static Widget badge({
    required BuildContext context,
    required String text,
    Color? backgroundColor,
    Color? textColor,
  }) {
    final theme = Theme.of(context);
    return Container(
      padding: REdgeInsets.symmetric(
        horizontal: DesignTokens.space2,
        vertical: DesignTokens.space1,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
      ),
      child: Text(
        text,
        style: theme.textTheme.labelSmall?.copyWith(
          color: textColor ?? theme.colorScheme.onPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
