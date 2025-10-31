import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';

/// FSMListCard - Generic card component for list items
///
/// Highly configurable card widget that can be used across different features:
/// - Work order cards
/// - Document cards
/// - Part cards
/// - Any card-based list item
///
/// Features:
/// - Card styling with border and elevation
/// - Leading widget (icon, image, avatar)
/// - Title, subtitle, and description
/// - Metadata rows (location, date, status, etc.)
/// - Trailing widget or badge
/// - Tap handling
/// - Status indicators
/// - Action buttons
class FSMListCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? description;
  final Widget? leading;
  final Widget? trailing;
  final Widget? statusBadge;
  final List<Widget>? metadataRows;
  final List<Widget>? actionButtons;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? elevation;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const FSMListCard({
    super.key,
    required this.title,
    this.subtitle,
    this.description,
    this.leading,
    this.trailing,
    this.statusBadge,
    this.metadataRows,
    this.actionButtons,
    this.onTap,
    this.onLongPress,
    this.borderColor,
    this.backgroundColor,
    this.elevation,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveMargin = margin ??
        REdgeInsets.symmetric(
          horizontal: DesignTokens.space4,
          vertical: DesignTokens.space2,
        );
    final effectivePadding = padding ?? REdgeInsets.all(DesignTokens.space4);

    return Card(
      margin: effectiveMargin,
      elevation: elevation ?? 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
        side: BorderSide(
          color: borderColor ?? theme.colorScheme.outlineVariant,
          width: 1,
        ),
      ),
      color: backgroundColor ?? theme.cardColor,
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
        child: Padding(
          padding: effectivePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header row (leading, title, status badge, trailing)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Leading widget
                  if (leading != null) ...[
                    leading!,
                    RSizedBox(width: DesignTokens.space4),
                  ],

                  // Title and subtitle
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          title,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: DesignTokens.fontSize16.sp,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),

                        // Subtitle
                        if (subtitle != null) ...[
                          RSizedBox(height: DesignTokens.space1),
                          Text(
                            subtitle!,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontSize: DesignTokens.fontSize14.sp,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ],
                    ),
                  ),

                  // Status badge
                  if (statusBadge != null) ...[
                    RSizedBox(width: DesignTokens.space2),
                    statusBadge!,
                  ],

                  // Trailing widget
                  if (trailing != null) ...[
                    RSizedBox(width: DesignTokens.space2),
                    trailing!,
                  ],
                ],
              ),

              // Description
              if (description != null) ...[
                RSizedBox(height: DesignTokens.space2),
                Text(
                  description!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: DesignTokens.fontSize14.sp,
                    color: theme.colorScheme.onSurfaceVariant,
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],

              // Metadata rows
              if (metadataRows != null && metadataRows!.isNotEmpty) ...[
                RSizedBox(height: DesignTokens.space4),
                ...metadataRows!.map((row) => Padding(
                      padding: REdgeInsets.only(bottom: DesignTokens.space2),
                      child: row,
                    )),
              ],

              // Action buttons
              if (actionButtons != null && actionButtons!.isNotEmpty) ...[
                RSizedBox(height: DesignTokens.space4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: actionButtons!
                      .expand((button) => [
                            button,
                            if (button != actionButtons!.last)
                              RSizedBox(width: DesignTokens.space2),
                          ])
                      .toList(),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// FSMListCardMetadataRow - Helper for metadata rows in FSMListCard
class FSMListCardMetadataRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? iconColor;
  final Color? textColor;
  final double? iconSize;
  final double? fontSize;

  const FSMListCardMetadataRow({
    super.key,
    required this.icon,
    required this.text,
    this.iconColor,
    this.textColor,
    this.iconSize,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: iconSize ?? DesignTokens.iconSm.sp,
          color: iconColor ?? theme.colorScheme.onSurfaceVariant,
        ),
        RSizedBox(width: DesignTokens.space2),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize ?? DesignTokens.fontSize12.sp,
              color: textColor ?? theme.colorScheme.onSurfaceVariant,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

/// FSMListCardLeading - Helper for creating common leading widgets
class FSMListCardLeading {
  FSMListCardLeading._();

  /// Icon in colored container
  static Widget icon({
    required IconData icon,
    required BuildContext context,
    Color? iconColor,
    Color? backgroundColor,
    double? size,
  }) {
    final theme = Theme.of(context);
    final effectiveSize = size ?? DesignTokens.space12.w;
    return Container(
      width: effectiveSize,
      height: effectiveSize,
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
      ),
      child: Icon(
        icon,
        color: iconColor ?? theme.colorScheme.primary,
        size: effectiveSize * 0.5,
      ),
    );
  }

  /// Avatar (circular)
  static Widget avatar({
    required BuildContext context,
    String? imageUrl,
    String? name,
    double? size,
    Color? backgroundColor,
  }) {
    final theme = Theme.of(context);
    final effectiveSize = size ?? DesignTokens.space12.w;
    return CircleAvatar(
      radius: effectiveSize / 2,
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl) : null,
      backgroundColor: backgroundColor ?? theme.colorScheme.primary,
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

  /// Image (square with rounded corners)
  static Widget image({
    required String imageUrl,
    double? size,
    BoxFit fit = BoxFit.cover,
  }) {
    final effectiveSize = size ?? (DesignTokens.space12 + DesignTokens.space2).w;
    return ClipRRect(
      borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
      child: Image.network(
        imageUrl,
        width: effectiveSize,
        height: effectiveSize,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          final theme = Theme.of(context);
          return Container(
            width: effectiveSize,
            height: effectiveSize,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
            ),
            child: Icon(
              Icons.broken_image_outlined,
              color: theme.colorScheme.onSurfaceVariant,
              size: effectiveSize * 0.5,
            ),
          );
        },
      ),
    );
  }

  /// Status indicator (colored circle with icon)
  static Widget statusIndicator({
    required IconData icon,
    required Color color,
    double? size,
  }) {
    final effectiveSize = size ?? DesignTokens.space8.w;
    return Container(
      width: effectiveSize,
      height: effectiveSize,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        shape: BoxShape.circle,
        border: Border.all(
          color: color.withValues(alpha: 0.3),
          width: 1.5,
        ),
      ),
      child: Icon(
        icon,
        color: color,
        size: effectiveSize * 0.5,
      ),
    );
  }
}

/// FSMListCardTrailing - Helper for creating common trailing widgets
class FSMListCardTrailing {
  FSMListCardTrailing._();

  /// Chevron icon (for navigation)
  static Widget chevron({
    required BuildContext context,
    Color? color,
  }) {
    final theme = Theme.of(context);
    return Icon(
      Icons.chevron_right,
      color: color ?? theme.colorScheme.onSurfaceVariant,
      size: DesignTokens.iconSm.sp,
    );
  }

  /// Icon button
  static Widget iconButton({
    required IconData icon,
    required VoidCallback onTap,
    required BuildContext context,
    Color? color,
  }) {
    final theme = Theme.of(context);
    return IconButton(
      icon: Icon(icon),
      color: color ?? theme.colorScheme.onSurfaceVariant,
      onPressed: onTap,
      constraints: BoxConstraints(
        minWidth: DesignTokens.buttonHeightMd,
        minHeight: DesignTokens.buttonHeightMd,
      ),
      padding: EdgeInsets.zero,
      iconSize: DesignTokens.iconSm.sp,
    );
  }

  /// More options button (three dots)
  static Widget moreOptions({
    required VoidCallback onTap,
    required BuildContext context,
    Color? color,
  }) {
    return iconButton(
      icon: Icons.more_vert,
      onTap: onTap,
      context: context,
      color: color,
    );
  }
}
