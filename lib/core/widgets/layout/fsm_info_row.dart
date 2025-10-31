import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';

/// FSMInfoRow - Metadata display row (icon + label + value)
///
/// Provides a consistent layout for displaying metadata with:
/// - Optional icon (colored based on context)
/// - Label text (e.g., "Customer", "Location", "Priority")
/// - Value text (can be multiline)
/// - Copy to clipboard action (optional)
/// - Link/tap action (optional, e.g., phone numbers, addresses)
/// - Dense and comfortable variants
///
/// Use cases:
/// - Work order details (customer info, location, dates)
/// - Part details (SKU, quantity, supplier)
/// - Document metadata
/// - Profile information
/// - Any key-value pair display
class FSMInfoRow extends StatelessWidget {
  final IconData? icon;
  final String label;
  final String value;
  final bool dense;
  final bool showCopyButton;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? labelColor;
  final Color? valueColor;
  final int? maxLines;
  final EdgeInsetsGeometry? padding;
  final Widget? trailing;

  const FSMInfoRow({
    super.key,
    this.icon,
    required this.label,
    required this.value,
    this.dense = false,
    this.showCopyButton = false,
    this.onTap,
    this.iconColor,
    this.labelColor,
    this.valueColor,
    this.maxLines,
    this.padding,
    this.trailing,
  });

  /// Dense variant - more compact spacing
  const FSMInfoRow.dense({
    super.key,
    this.icon,
    required this.label,
    required this.value,
    this.showCopyButton = false,
    this.onTap,
    this.iconColor,
    this.labelColor,
    this.valueColor,
    this.maxLines = 1,
    this.padding,
    this.trailing,
  }) : dense = true;

  /// Comfortable variant - more spacing
  const FSMInfoRow.comfortable({
    super.key,
    this.icon,
    required this.label,
    required this.value,
    this.showCopyButton = false,
    this.onTap,
    this.iconColor,
    this.labelColor,
    this.valueColor,
    this.maxLines,
    this.padding,
    this.trailing,
  }) : dense = false;

  /// Phone number variant with call action
  const FSMInfoRow.phone({
    super.key,
    required this.value,
    this.label = 'Phone',
    this.showCopyButton = true,
    this.onTap,
  })  : icon = Icons.phone_outlined,
        iconColor = null,
        dense = false,
        labelColor = null,
        valueColor = null,
        maxLines = 1,
        padding = null,
        trailing = null;

  /// Email variant with email action
  const FSMInfoRow.email({
    super.key,
    required this.value,
    this.label = 'Email',
    this.showCopyButton = true,
    this.onTap,
  })  : icon = Icons.email_outlined,
        iconColor = null,
        dense = false,
        labelColor = null,
        valueColor = null,
        maxLines = 1,
        padding = null,
        trailing = null;

  /// Location variant with map action
  const FSMInfoRow.location({
    super.key,
    required this.value,
    this.label = 'Location',
    this.showCopyButton = false,
    this.onTap,
  })  : icon = Icons.location_on_outlined,
        iconColor = null,
        dense = false,
        labelColor = null,
        valueColor = null,
        maxLines = 2,
        padding = null,
        trailing = null;

  /// Date variant
  const FSMInfoRow.date({
    super.key,
    required this.value,
    this.label = 'Date',
  })  : icon = Icons.calendar_today_outlined,
        iconColor = null,
        dense = false,
        showCopyButton = false,
        onTap = null,
        labelColor = null,
        valueColor = null,
        maxLines = 1,
        padding = null,
        trailing = null;

  /// Time variant
  const FSMInfoRow.time({
    super.key,
    required this.value,
    this.label = 'Time',
  })  : icon = Icons.access_time_outlined,
        iconColor = null,
        dense = false,
        showCopyButton = false,
        onTap = null,
        labelColor = null,
        valueColor = null,
        maxLines = 1,
        padding = null,
        trailing = null;

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: value));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied to clipboard'),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectivePadding = padding ??
        REdgeInsets.symmetric(
          horizontal: DesignTokens.space4,
          vertical: dense ? DesignTokens.space2 : DesignTokens.space4,
        );

    final effectiveLabelColor = labelColor ?? theme.colorScheme.onSurfaceVariant;
    final effectiveValueColor = valueColor ?? theme.colorScheme.onSurface;
    final effectiveIconColor = iconColor ?? theme.colorScheme.primary;

    Widget content = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon
        if (icon != null) ...[
          Icon(
            icon,
            size: dense ? DesignTokens.iconSm.sp : DesignTokens.iconMd.sp,
            color: effectiveIconColor,
          ),
          RSizedBox(width: DesignTokens.space4),
        ],

        // Label and Value
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Label
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: effectiveLabelColor,
                  fontWeight: FontWeight.w500,
                ),
              ),

              RSizedBox(height: dense ? DesignTokens.space1 : DesignTokens.space1),

              // Value
              Text(
                value,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: effectiveValueColor,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: maxLines,
                overflow: maxLines != null ? TextOverflow.ellipsis : null,
              ),
            ],
          ),
        ),

        // Copy button
        if (showCopyButton) ...[
          RSizedBox(width: DesignTokens.space2),
          IconButton(
            icon: const Icon(Icons.copy_outlined),
            iconSize: DesignTokens.iconSm.sp,
            onPressed: () => _copyToClipboard(context),
            tooltip: 'Copy',
            constraints: BoxConstraints(
              minWidth: DesignTokens.buttonHeightMd,
              minHeight: DesignTokens.buttonHeightMd,
            ),
            padding: EdgeInsets.zero,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ],

        // Trailing widget
        if (trailing != null) ...[
          RSizedBox(width: DesignTokens.space2),
          trailing!,
        ],
      ],
    );

    // Wrap with InkWell if tappable
    if (onTap != null) {
      content = InkWell(
        onTap: onTap,
        child: Padding(
          padding: effectivePadding,
          child: content,
        ),
      );
    } else {
      content = Padding(
        padding: effectivePadding,
        child: content,
      );
    }

    return content;
  }
}

/// FSMInfoRowGroup - Groups multiple info rows together
///
/// Provides consistent spacing and optional dividers between rows.
class FSMInfoRowGroup extends StatelessWidget {
  final List<Widget> children;
  final bool showDividers;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final double? borderRadius;

  const FSMInfoRowGroup({
    super.key,
    required this.children,
    this.showDividers = true,
    this.padding,
    this.backgroundColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectivePadding = padding ?? REdgeInsets.all(DesignTokens.space4);
    final effectiveBorderRadius = borderRadius ?? DesignTokens.radiusMd.r;

    List<Widget> items = [];

    for (int i = 0; i < children.length; i++) {
      items.add(children[i]);

      // Add divider between items (but not after the last item)
      if (showDividers && i < children.length - 1) {
        items.add(
          Divider(
            height: 1.h,
            thickness: 1,
            color: theme.colorScheme.outlineVariant,
            indent: DesignTokens.space4.w,
            endIndent: DesignTokens.space4.w,
          ),
        );
      }
    }

    Widget content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items,
    );

    if (backgroundColor != null) {
      content = Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(effectiveBorderRadius),
        ),
        padding: effectivePadding,
        child: content,
      );
    } else {
      content = Padding(
        padding: effectivePadding,
        child: content,
      );
    }

    return content;
  }
}

/// FSMInfoCard - Info rows displayed in a card
///
/// Combines FSMInfoRowGroup with card styling for elevated display.
class FSMInfoCard extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  final bool showDividers;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const FSMInfoCard({
    super.key,
    this.title,
    required this.children,
    this.showDividers = true,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveMargin = margin ??
        REdgeInsets.symmetric(
          horizontal: DesignTokens.space4,
          vertical: DesignTokens.space2,
        );

    return Card(
      margin: effectiveMargin,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          if (title != null) ...[
            Padding(
              padding: REdgeInsets.fromLTRB(
                DesignTokens.space4,
                DesignTokens.space4,
                DesignTokens.space4,
                DesignTokens.space2,
              ),
              child: Text(
                title!,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
            Divider(
              height: 1.h,
              thickness: 1,
              color: theme.colorScheme.outlineVariant,
            ),
          ],

          // Info rows
          FSMInfoRowGroup(
            showDividers: showDividers,
            padding: padding ?? EdgeInsets.zero,
            children: children,
          ),
        ],
      ),
    );
  }
}
