import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';

/// Type of priority indicator display
enum PriorityIndicatorType {
  /// Badge with text label
  badge,

  /// Vertical bar (typically on left side of cards)
  bar,

  /// Small dot indicator
  dot,
}

/// Visual indicator for work order priority
///
/// Supports three display types: badge, bar, and dot
/// Uses color-coded system from redesign spec:
/// - Low: Blue (#1976D2)
/// - Medium: Orange (#F57C00)
/// - High: Red (#D32F2F)
/// - Urgent: Red (#D32F2F)
class PriorityIndicator extends StatelessWidget {
  const PriorityIndicator({
    super.key,
    required this.priority,
    this.type = PriorityIndicatorType.badge,
    this.showLabel = true,
    this.size,
  });

  /// Priority level: 'low', 'medium', 'high', 'urgent'
  final String priority;

  /// Display type: badge, bar, or dot
  final PriorityIndicatorType type;

  /// Whether to show text label (only for badge type)
  final bool showLabel;

  /// Custom size override (optional)
  final double? size;

  Color _priorityColor(BuildContext context) {
    final fsmTheme = context.fsmTheme;
    return fsmTheme.getPriorityColor(priority);
  }

  String get _label {
    switch (priority.toLowerCase()) {
      case 'low':
        return 'Low';
      case 'medium':
        return 'Medium';
      case 'high':
        return 'High';
      case 'urgent':
        return 'Urgent';
      default:
        return 'Medium';
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case PriorityIndicatorType.badge:
        return _buildBadge(context);
      case PriorityIndicatorType.bar:
        return _buildBar(context);
      case PriorityIndicatorType.dot:
        return _buildDot(context);
    }
  }

  Widget _buildBadge(BuildContext context) {
    final theme = Theme.of(context);
    final priorityColor = _priorityColor(context);

    return Container(
      padding: REdgeInsets.symmetric(
        horizontal: DesignTokens.space2,
        vertical: DesignTokens.space1,
      ),
      decoration: BoxDecoration(
        color: priorityColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
        border: Border.all(
          color: priorityColor,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: DesignTokens.space2.w,
            height: DesignTokens.space2.w,
            decoration: BoxDecoration(
              color: priorityColor,
              shape: BoxShape.circle,
            ),
          ),
          if (showLabel) ...[
            RSizedBox(width: DesignTokens.space1),
            Text(
              _label,
              style: theme.textTheme.labelSmall?.copyWith(
                color: priorityColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    final priorityColor = _priorityColor(context);
    final barSize = size ?? DesignTokens.space1.w;
    return Container(
      width: barSize,
      decoration: BoxDecoration(
        color: priorityColor,
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(DesignTokens.radiusSm.r),
        ),
      ),
    );
  }

  Widget _buildDot(BuildContext context) {
    final priorityColor = _priorityColor(context);
    final dotSize = size ?? DesignTokens.space2.w;
    return Container(
      width: dotSize,
      height: dotSize,
      decoration: BoxDecoration(
        color: priorityColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: priorityColor.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
    );
  }
}

/// Extension for priority indicator variants
extension PriorityIndicatorVariants on PriorityIndicator {
  /// Creates a badge-style priority indicator
  static Widget badge({
    required String priority,
    bool showLabel = true,
  }) {
    return PriorityIndicator(
      priority: priority,
      type: PriorityIndicatorType.badge,
      showLabel: showLabel,
    );
  }

  /// Creates a bar-style priority indicator (for card left border)
  static Widget bar({
    required String priority,
    double? width,
  }) {
    return PriorityIndicator(
      priority: priority,
      type: PriorityIndicatorType.bar,
      size: width,
    );
  }

  /// Creates a dot-style priority indicator
  static Widget dot({
    required String priority,
    double? size,
  }) {
    return PriorityIndicator(
      priority: priority,
      type: PriorityIndicatorType.dot,
      size: size,
    );
  }
}
