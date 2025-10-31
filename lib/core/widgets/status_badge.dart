import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';
import 'package:fsm/core/theme/spacing_theme.dart';

/// StatusBadge - Consistent status/priority chip component for the FSM app
///
/// Provides visual indicators for work order status, priority, inventory levels, and other categorical data.
///
/// Variants:
/// - [StatusBadge.filled] - Solid background with white text
/// - [StatusBadge.outlined] - Border with colored text
/// - [StatusBadge.subtle] - Light background with colored text (default)
///
/// Common use cases:
/// - Work order status (assigned, in_progress, completed, etc.)
/// - Priority levels (low, medium, high, urgent)
/// - Inventory/stock levels (high, medium, low, out)
/// - Sync status (offline, syncing, synced, failed)
enum StatusBadgeVariant {
  filled,
  outlined,
  subtle,
}

enum StatusBadgeType {
  status,
  priority,
  stock,
  sync,
  custom,
}

class StatusBadge extends StatelessWidget {
  final String label;
  final StatusBadgeType type;
  final StatusBadgeVariant variant;
  final Color? customColor;
  final IconData? icon;
  final bool showIcon;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final VoidCallback? onTap;

  const StatusBadge({
    super.key,
    required this.label,
    this.type = StatusBadgeType.custom,
    this.variant = StatusBadgeVariant.subtle,
    this.customColor,
    this.icon,
    this.showIcon = false,
    this.fontSize,
    this.padding,
    this.borderRadius,
    this.onTap,
  });

  /// Filled variant - Solid background with white text
  const StatusBadge.filled({
    super.key,
    required this.label,
    this.type = StatusBadgeType.custom,
    this.customColor,
    this.icon,
    this.showIcon = false,
    this.fontSize,
    this.padding,
    this.borderRadius,
    this.onTap,
  }) : variant = StatusBadgeVariant.filled;

  /// Outlined variant - Border with colored text
  const StatusBadge.outlined({
    super.key,
    required this.label,
    this.type = StatusBadgeType.custom,
    this.customColor,
    this.icon,
    this.showIcon = false,
    this.fontSize,
    this.padding,
    this.borderRadius,
    this.onTap,
  }) : variant = StatusBadgeVariant.outlined;

  /// Subtle variant - Light background with colored text (default)
  const StatusBadge.subtle({
    super.key,
    required this.label,
    this.type = StatusBadgeType.custom,
    this.customColor,
    this.icon,
    this.showIcon = false,
    this.fontSize,
    this.padding,
    this.borderRadius,
    this.onTap,
  }) : variant = StatusBadgeVariant.subtle;

  /// Work order status badge
  factory StatusBadge.status({
    Key? key,
    required String status,
    StatusBadgeVariant variant = StatusBadgeVariant.subtle,
    bool showIcon = true,
    double? fontSize,
    EdgeInsetsGeometry? padding,
    double? borderRadius,
    VoidCallback? onTap,
  }) {
    return StatusBadge(
      key: key,
      label: _formatLabel(status),
      type: StatusBadgeType.status,
      variant: variant,
      showIcon: showIcon,
      icon: _getStatusIcon(status),
      fontSize: fontSize,
      padding: padding,
      borderRadius: borderRadius,
      onTap: onTap,
    );
  }

  /// Priority badge
  factory StatusBadge.priority({
    Key? key,
    required String priority,
    StatusBadgeVariant variant = StatusBadgeVariant.subtle,
    bool showIcon = true,
    double? fontSize,
    EdgeInsetsGeometry? padding,
    double? borderRadius,
    VoidCallback? onTap,
  }) {
    return StatusBadge(
      key: key,
      label: _formatLabel(priority),
      type: StatusBadgeType.priority,
      variant: variant,
      showIcon: showIcon,
      icon: _getPriorityIcon(priority),
      fontSize: fontSize,
      padding: padding,
      borderRadius: borderRadius,
      onTap: onTap,
    );
  }

  /// Stock/inventory level badge
  factory StatusBadge.stock({
    Key? key,
    required String level,
    StatusBadgeVariant variant = StatusBadgeVariant.subtle,
    bool showIcon = true,
    double? fontSize,
    EdgeInsetsGeometry? padding,
    double? borderRadius,
    VoidCallback? onTap,
  }) {
    return StatusBadge(
      key: key,
      label: _formatLabel(level),
      type: StatusBadgeType.stock,
      variant: variant,
      showIcon: showIcon,
      icon: Icons.inventory_2_outlined,
      fontSize: fontSize,
      padding: padding,
      borderRadius: borderRadius,
      onTap: onTap,
    );
  }

  /// Sync status badge
  factory StatusBadge.sync({
    Key? key,
    required String status,
    StatusBadgeVariant variant = StatusBadgeVariant.subtle,
    bool showIcon = true,
    double? fontSize,
    EdgeInsetsGeometry? padding,
    double? borderRadius,
    VoidCallback? onTap,
  }) {
    return StatusBadge(
      key: key,
      label: _formatLabel(status),
      type: StatusBadgeType.sync,
      variant: variant,
      showIcon: showIcon,
      icon: _getSyncIcon(status),
      fontSize: fontSize,
      padding: padding,
      borderRadius: borderRadius,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;
    final spacing = context.spacing;

    // Get color based on type
    final baseColor = _getColor(theme, fsmTheme);

    // Apply variant styling
    final backgroundColor = _getBackgroundColor(baseColor);
    final textColor = _getTextColor(baseColor);
    final borderColor = _getBorderColor(baseColor);

    final effectiveFontSize = fontSize ?? DesignTokens.fontSize12.sp;
    final effectivePadding = padding ??
        REdgeInsets.symmetric(
          horizontal: DesignTokens.space2,
          vertical: DesignTokens.space1,
        );
    final effectiveBorderRadius = borderRadius ?? spacing.radiusXs;

    Widget badge = Container(
      padding: effectivePadding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(effectiveBorderRadius.r),
        border: borderColor != null
            ? Border.all(color: borderColor, width: DesignTokens.borderWidthThin)
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showIcon && icon != null) ...[
            Icon(
              icon,
              size: effectiveFontSize * 1.2,
              color: textColor,
            ),
            DesignTokens.horizontalSpaceXs,
          ],
          Text(
            label,
            style: TextStyle(
              fontSize: effectiveFontSize,
              fontWeight: DesignTokens.fontWeightSemiBold,
              color: textColor,
              height: 1.0,
            ),
          ),
        ],
      ),
    );

    if (onTap != null) {
      badge = InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(effectiveBorderRadius.r),
        child: badge,
      );
    }

    return badge;
  }

  Color _getColor(ThemeData theme, FSMThemeExtension fsmTheme) {
    if (customColor != null) return customColor!;

    switch (type) {
      case StatusBadgeType.status:
        return fsmTheme.getStatusColor(label.toLowerCase());
      case StatusBadgeType.priority:
        return fsmTheme.getPriorityColor(label.toLowerCase());
      case StatusBadgeType.stock:
        return fsmTheme.getStockColor(label.toLowerCase());
      case StatusBadgeType.sync:
        return fsmTheme.getSyncStatusColor(label.toLowerCase());
      case StatusBadgeType.custom:
        return theme.colorScheme.primary;
    }
  }

  Color _getBackgroundColor(Color baseColor) {
    switch (variant) {
      case StatusBadgeVariant.filled:
        return baseColor;
      case StatusBadgeVariant.outlined:
        return Colors.transparent;
      case StatusBadgeVariant.subtle:
        return baseColor.withValues(alpha: 0.1);
    }
  }

  Color _getTextColor(Color baseColor) {
    switch (variant) {
      case StatusBadgeVariant.filled:
        return const Color(0xFFFFFFFF); // White for filled variant
      case StatusBadgeVariant.outlined:
      case StatusBadgeVariant.subtle:
        return baseColor;
    }
  }

  Color? _getBorderColor(Color baseColor) {
    if (variant == StatusBadgeVariant.outlined) {
      return baseColor;
    }
    return null;
  }

  static String _formatLabel(String text) {
    // Convert snake_case or camelCase to Title Case
    return text
        .replaceAllMapped(
          RegExp(r'[_\-]+'),
          (match) => ' ',
        )
        .replaceAllMapped(
          RegExp(r'([a-z])([A-Z])'),
          (match) => '${match.group(1)} ${match.group(2)}',
        )
        .split(' ')
        .map((word) => word.isEmpty
            ? ''
            : '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}')
        .join(' ');
  }

  static IconData _getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'unassigned':
        return Icons.assignment_outlined; // Outlined assignment icon for unassigned
      case 'assigned':
        return Icons.assignment_ind_outlined; // Assigned to person
      case 'in_progress':
      case 'inprogress':
        return Icons.play_circle_outline;
      case 'paused':
        return Icons.pause_circle_outline;
      case 'completed':
        return Icons.check_circle_outline;
      case 'cancelled':
        return Icons.cancel_outlined;
      case 'rejected':
        return Icons.block;
      default:
        return Icons.label_outline;
    }
  }

  static IconData _getPriorityIcon(String priority) {
    switch (priority.toLowerCase()) {
      case 'low':
        return Icons.arrow_downward;
      case 'medium':
        return Icons.remove;
      case 'high':
        return Icons.arrow_upward;
      case 'urgent':
        return Icons.priority_high;
      default:
        return Icons.label_outline;
    }
  }

  static IconData _getSyncIcon(String status) {
    switch (status.toLowerCase()) {
      case 'offline':
        return Icons.cloud_off;
      case 'syncing':
        return Icons.sync;
      case 'synced':
        return Icons.cloud_done;
      case 'failed':
        return Icons.error_outline;
      case 'pending':
        return Icons.pending;
      default:
        return Icons.cloud_outlined;
    }
  }
}
