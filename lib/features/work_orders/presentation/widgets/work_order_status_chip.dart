import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/widgets/status_badge.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';

/// WorkOrderStatusChip - Displays work order status using shared StatusBadge
///
/// Refactored to use [StatusBadge.status] component for consistency.
/// Removes duplicate color logic and delegates to shared component.
///
/// Maintains all existing functionality:
/// - Status display with color coding
/// - Icon display
/// - Customizable font size
class WorkOrderStatusChip extends StatelessWidget {
  final WorkOrderStatus status;
  final double? fontSize;
  final StatusBadgeVariant variant;

  const WorkOrderStatusChip({
    super.key,
    required this.status,
    this.fontSize,
    this.variant = StatusBadgeVariant.subtle,
  });

  @override
  Widget build(BuildContext context) {
    // Delegate to shared StatusBadge component
    return StatusBadge.status(
      status: status.toString(),
      variant: variant,
      showIcon: true,
      fontSize: fontSize ?? 12.sp,
    );
  }
}
