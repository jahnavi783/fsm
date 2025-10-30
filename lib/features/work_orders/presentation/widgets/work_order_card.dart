import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/core/widgets/fsm_card.dart';
import 'package:fsm/core/widgets/status_badge.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:intl/intl.dart';

/// WorkOrderCard - Displays work order summary with status, priority, and actions
///
/// Refactored to use shared components:
/// - [FSMCard.elevated] for card structure
/// - [StatusBadge.status] for status display
/// - [StatusBadge.priority] for priority display
///
/// Maintains all existing functionality including:
/// - Tap to view details
/// - Quick action buttons (start/pause/resume)
/// - Overdue indicator
/// - Customer and location display
class WorkOrderCard extends StatelessWidget {
  final WorkOrderEntity workOrder;
  final VoidCallback? onTap;
  final VoidCallback? onActionTap;

  const WorkOrderCard({
    super.key,
    required this.workOrder,
    this.onTap,
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FSMCard.elevated(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with WO number and status
          FSMCardHeader(
            title: workOrder.woNumber,
            trailing: StatusBadge.status(
              status: workOrder.status.toString(),
              variant: StatusBadgeVariant.subtle,
              showIcon: true,
            ),
          ),

          // // Summary
          Text(
            workOrder.summary,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 14.sp,
              color: theme.colorScheme.onSurface.withOpacity(0.8),
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          //
          SizedBox(height: 12.h),
          //
          // // Priority and Visit Date Row
          Row(
            children: [
              // Priority Badge
              StatusBadge.priority(
                priority: workOrder.priority.toString(),
                variant: StatusBadgeVariant.outlined,
                showIcon: false,
              ),

              SizedBox(width: 12.w),

              // Visit Date
              Icon(
                Icons.schedule,
                size: 16.sp,
                color: theme.colorScheme.onSurface.withOpacity(0.6),
              ),
              SizedBox(width: 4.w),
              Text(
                DateFormat('MMM dd, yyyy').format(workOrder.visitDate),
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 12.sp,
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
            ],
          ),
          //
          // SizedBox(height: 12.h),
          //
          // // Customer Info
          // if (workOrder.customer != null) ...[
          //   SizedBox(
          //     width: double.infinity,
          //     child: Row(
          //       children: [
          //         Icon(
          //           Icons.person_outline,
          //           size: 16.sp,
          //           color: theme.colorScheme.onSurface.withOpacity(0.6),
          //         ),
          //         SizedBox(width: 4.w),
          //         Expanded(
          //           child: Text(
          //             workOrder.customer!.name,
          //             style: theme.textTheme.bodySmall?.copyWith(
          //               fontSize: 12.sp,
          //               color: theme.colorScheme.onSurface.withOpacity(0.6),
          //             ),
          //             overflow: TextOverflow.ellipsis,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          //   SizedBox(height: 4.h),
          // ],
          //
            SizedBox(height: 4.h),
          // // Location Info
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 16.sp,
                color: theme.colorScheme.onSurface.withOpacity(0.6),
              ),
              SizedBox(width: 4.w),
              Expanded(
                child: Text(
                  workOrder.location,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 12.sp,
                    color: theme.colorScheme.onSurface.withOpacity(0.6),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          // Action button for actionable work orders
          // if (_shouldShowActionButton()) ...[
          //   SizedBox(height: 16.h),
          //   FSMCardFooter(
          //     alignment: MainAxisAlignment.center,
          //     actions: [
          //       SizedBox(
          //         width: double.infinity,
          //         child: ElevatedButton(
          //           onPressed: onActionTap,
          //           style: ElevatedButton.styleFrom(
          //             backgroundColor: _getActionButtonColor(),
          //             foregroundColor: Colors.white,
          //             padding: EdgeInsets.symmetric(vertical: 12.h),
          //             shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(8.r),
          //             ),
          //           ),
          //           child: Text(
          //             _getActionButtonText(),
          //             style: TextStyle(
          //               fontSize: 14.sp,
          //               fontWeight: FontWeight.w600,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ],

          // Overdue indicator
          if (workOrder.isOverdue) ...[
            SizedBox(height: 8.h),
            StatusBadge(
              label: 'Overdue',
              variant: StatusBadgeVariant.outlined,
              customColor: AppColors.error,
              icon: Icons.warning_outlined,
              showIcon: true,
            ),
          ],
        ],
      ),
    );
  }

  bool _shouldShowActionButton() {
    return workOrder.canBeStarted ||
        workOrder.canBePaused ||
        workOrder.canBeResumed;
  }

  String _getActionButtonText() {
    if (workOrder.canBeStarted) return 'Start Work';
    if (workOrder.canBePaused) return 'Pause Work';
    if (workOrder.canBeResumed) return 'Resume Work';
    return 'View Details';
  }

  Color _getActionButtonColor() {
    if (workOrder.canBeStarted) return AppColors.actionStart;
    if (workOrder.canBePaused) return AppColors.actionPause;
    if (workOrder.canBeResumed) return AppColors.actionResume;
    return AppColors.primary;
  }
}
