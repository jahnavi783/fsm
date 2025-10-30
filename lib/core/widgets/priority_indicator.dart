import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';
import '../theme/app_text_styles.dart';

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

  Color get _priorityColor => AppColors.getPriorityColor(priority);

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
        return _buildBar();
      case PriorityIndicatorType.dot:
        return _buildDot();
    }
  }

  Widget _buildBadge(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingSmall,
        vertical: AppDimensions.paddingXSmall,
      ),
      decoration: BoxDecoration(
        color: _priorityColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
        border: Border.all(
          color: _priorityColor,
          width: 1.w,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6.w,
            height: 6.w,
            decoration: BoxDecoration(
              color: _priorityColor,
              shape: BoxShape.circle,
            ),
          ),
          if (showLabel) ...[
            SizedBox(width: 4.w),
            Text(
              _label,
              style: AppTextStyles.labelSmall.copyWith(
                color: _priorityColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBar() {
    final barSize = size ?? 3.w;
    return Container(
      width: barSize,
      decoration: BoxDecoration(
        color: _priorityColor,
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(AppDimensions.radiusXSmall),
        ),
      ),
    );
  }

  Widget _buildDot() {
    final dotSize = size ?? 8.w;
    return Container(
      width: dotSize,
      height: dotSize,
      decoration: BoxDecoration(
        color: _priorityColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: _priorityColor.withValues(alpha: 0.3),
          width: 2.w,
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
