import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/core/theme/app_dimensions.dart';

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
            ? AppDimensions.listItemHeightCompact
            : tertiaryText != null
                ? AppDimensions.listItemHeightComfortable
                : AppDimensions.listItemHeight);

    final effectivePadding = padding ??
        EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingMedium,
          vertical: dense ? AppDimensions.paddingSmall : 0,
        );

    final effectiveContentPadding = contentPadding ??
        EdgeInsets.symmetric(
          horizontal: 0,
          vertical: dense
              ? AppDimensions.paddingSmall
              : AppDimensions.paddingMedium,
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
              SizedBox(width: AppDimensions.paddingMedium),
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
                      fontSize: dense ? 14.sp : 16.sp,
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  // Subtitle
                  if (subtitle != null) ...[
                    SizedBox(height: 4.h),
                    Text(
                      subtitle!,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: dense ? 12.sp : 14.sp,
                        color: AppColors.textSecondary,
                      ),
                      maxLines: tertiaryText != null ? 1 : 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],

                  // Tertiary text
                  if (tertiaryText != null) ...[
                    SizedBox(height: 4.h),
                    Text(
                      tertiaryText!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 12.sp,
                        color: AppColors.textTertiary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],

                  // Metadata badges
                  if (metadata != null && metadata!.isNotEmpty) ...[
                    SizedBox(height: 8.h),
                    Wrap(
                      spacing: 8.w,
                      runSpacing: 4.h,
                      children: metadata!,
                    ),
                  ],
                ],
              ),
            ),

            // Trailing widget
            if (trailing != null) ...[
              SizedBox(width: AppDimensions.paddingMedium),
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
            thickness: AppDimensions.dividerThickness,
            indent: leading != null ? 72.w : AppDimensions.paddingMedium,
            endIndent: AppDimensions.paddingMedium,
            color: AppColors.divider,
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
    required IconData icon,
    Color? color,
    Color? backgroundColor,
    double? size,
  }) {
    return Container(
      width: size ?? 48.w,
      height: size ?? 48.w,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.grey100,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      ),
      child: Icon(
        icon,
        color: color ?? AppColors.primary,
        size: (size ?? 48.w) * 0.5,
      ),
    );
  }

  /// Avatar leading widget
  static Widget avatar({
    String? imageUrl,
    String? name,
    double? size,
  }) {
    final effectiveSize = size ?? 48.w;
    return CircleAvatar(
      radius: effectiveSize / 2,
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl) : null,
      backgroundColor: AppColors.primary,
      child: imageUrl == null && name != null
          ? Text(
              name.substring(0, 1).toUpperCase(),
              style: TextStyle(
                color: AppColors.onPrimary,
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
    required String imageUrl,
    double? size,
    BoxFit fit = BoxFit.cover,
  }) {
    final effectiveSize = size ?? 48.w;
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
      child: Image.network(
        imageUrl,
        width: effectiveSize,
        height: effectiveSize,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: effectiveSize,
            height: effectiveSize,
            color: AppColors.grey200,
            child: Icon(
              Icons.image_not_supported,
              color: AppColors.grey500,
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
    required IconData icon,
    Color? color,
    VoidCallback? onTap,
  }) {
    final iconWidget = Icon(
      icon,
      color: color ?? AppColors.grey600,
      size: 20.sp,
    );

    if (onTap != null) {
      return IconButton(
        icon: iconWidget,
        onPressed: onTap,
        constraints: BoxConstraints(
          minWidth: AppDimensions.touchTargetMin,
          minHeight: AppDimensions.touchTargetMin,
        ),
        padding: EdgeInsets.zero,
      );
    }

    return iconWidget;
  }

  /// Text trailing widget (for metadata like dates, counts)
  static Widget text({
    required String text,
    Color? color,
    TextStyle? style,
  }) {
    return Text(
      text,
      style: style ??
          TextStyle(
            fontSize: 12.sp,
            color: color ?? AppColors.textTertiary,
            fontWeight: FontWeight.w500,
          ),
    );
  }

  /// Arrow icon (commonly used for navigation)
  static Widget arrow({Color? color}) {
    return Icon(
      Icons.chevron_right,
      color: color ?? AppColors.grey400,
      size: 20.sp,
    );
  }

  /// Badge trailing widget
  static Widget badge({
    required String text,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 4.h,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.primary,
        borderRadius: BorderRadius.circular(AppDimensions.radiusXSmall),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11.sp,
          color: textColor ?? AppColors.onPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
