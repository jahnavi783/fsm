import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/core/theme/app_dimensions.dart';

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
        EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingMedium,
          vertical: AppDimensions.paddingSmall,
        );
    final effectivePadding = padding ?? AppDimensions.paddingAllMedium;

    return Card(
      margin: effectiveMargin,
      elevation: elevation ?? AppDimensions.elevationSmall,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        side: BorderSide(
          color: borderColor ?? AppColors.grey200,
          width: 1,
        ),
      ),
      color: backgroundColor ?? AppColors.surface,
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
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
                    SizedBox(width: AppDimensions.spaceMedium),
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
                            fontSize: 16.sp,
                            color: AppColors.textPrimary,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),

                        // Subtitle
                        if (subtitle != null) ...[
                          SizedBox(height: 4.h),
                          Text(
                            subtitle!,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontSize: 13.sp,
                              color: AppColors.textSecondary,
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
                    SizedBox(width: AppDimensions.spaceSmall),
                    statusBadge!,
                  ],

                  // Trailing widget
                  if (trailing != null) ...[
                    SizedBox(width: AppDimensions.spaceSmall),
                    trailing!,
                  ],
                ],
              ),

              // Description
              if (description != null) ...[
                SizedBox(height: AppDimensions.spaceSmall),
                Text(
                  description!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 13.sp,
                    color: AppColors.textTertiary,
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],

              // Metadata rows
              if (metadataRows != null && metadataRows!.isNotEmpty) ...[
                SizedBox(height: AppDimensions.spaceMedium),
                ...metadataRows!.map((row) => Padding(
                      padding: EdgeInsets.only(bottom: AppDimensions.spaceSmall),
                      child: row,
                    )),
              ],

              // Action buttons
              if (actionButtons != null && actionButtons!.isNotEmpty) ...[
                SizedBox(height: AppDimensions.spaceMedium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: actionButtons!
                      .expand((button) => [
                            button,
                            if (button != actionButtons!.last)
                              SizedBox(width: AppDimensions.spaceSmall),
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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: iconSize ?? 16.sp,
          color: iconColor ?? AppColors.grey600,
        ),
        SizedBox(width: AppDimensions.spaceSmall),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize ?? 12.sp,
              color: textColor ?? AppColors.textSecondary,
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
    Color? iconColor,
    Color? backgroundColor,
    double? size,
  }) {
    final effectiveSize = size ?? 48.w;
    return Container(
      width: effectiveSize,
      height: effectiveSize,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.primaryLight,
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
      ),
      child: Icon(
        icon,
        color: iconColor ?? AppColors.primary,
        size: effectiveSize * 0.5,
      ),
    );
  }

  /// Avatar (circular)
  static Widget avatar({
    String? imageUrl,
    String? name,
    double? size,
    Color? backgroundColor,
  }) {
    final effectiveSize = size ?? 48.w;
    return CircleAvatar(
      radius: effectiveSize / 2,
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl) : null,
      backgroundColor: backgroundColor ?? AppColors.primary,
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

  /// Image (square with rounded corners)
  static Widget image({
    required String imageUrl,
    double? size,
    BoxFit fit = BoxFit.cover,
  }) {
    final effectiveSize = size ?? 56.w;
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
            decoration: BoxDecoration(
              color: AppColors.grey100,
              borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
            ),
            child: Icon(
              Icons.broken_image_outlined,
              color: AppColors.grey400,
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
    final effectiveSize = size ?? 40.w;
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
  static Widget chevron({Color? color}) {
    return Icon(
      Icons.chevron_right,
      color: color ?? AppColors.grey400,
      size: 20.sp,
    );
  }

  /// Icon button
  static Widget iconButton({
    required IconData icon,
    required VoidCallback onTap,
    Color? color,
  }) {
    return IconButton(
      icon: Icon(icon),
      color: color ?? AppColors.grey600,
      onPressed: onTap,
      constraints: BoxConstraints(
        minWidth: AppDimensions.touchTargetMin,
        minHeight: AppDimensions.touchTargetMin,
      ),
      padding: EdgeInsets.zero,
      iconSize: 20.sp,
    );
  }

  /// More options button (three dots)
  static Widget moreOptions({
    required VoidCallback onTap,
    Color? color,
  }) {
    return iconButton(
      icon: Icons.more_vert,
      onTap: onTap,
      color: color,
    );
  }
}
