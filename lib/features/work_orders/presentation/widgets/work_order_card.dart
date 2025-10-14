import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_status_chip.dart';
import 'package:intl/intl.dart';

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

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with WO number and status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      workOrder.woNumber,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  WorkOrderStatusChip(status: workOrder.status),
                ],
              ),

              SizedBox(height: 8.h),

              // Summary
              Text(
                workOrder.summary,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 14.sp,
                  color: theme.colorScheme.onSurface.withOpacity(0.8),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              SizedBox(height: 12.h),

              // Priority and Visit Date
              Row(
                children: [
                  // Priority
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: _getPriorityColor(workOrder.priority)
                          .withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(
                        color: _getPriorityColor(workOrder.priority),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      workOrder.priorityDisplayName,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: _getPriorityColor(workOrder.priority),
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                      ),
                    ),
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

              SizedBox(height: 12.h),

              // Location and Customer
              if (workOrder.customer != null) ...[
                Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      size: 16.sp,
                      color: theme.colorScheme.onSurface.withOpacity(0.6),
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Text(
                        workOrder.customer!.name,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 12.sp,
                          color: theme.colorScheme.onSurface.withOpacity(0.6),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
              ],

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
              if (_shouldShowActionButton()) ...[
                SizedBox(height: 16.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onActionTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _getActionButtonColor(theme),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      _getActionButtonText(),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],

              // Overdue indicator
              if (workOrder.isOverdue) ...[
                SizedBox(height: 8.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(color: Colors.red, width: 1),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.warning_outlined,
                        size: 14.sp,
                        color: Colors.red,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'Overdue',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Color _getPriorityColor(WorkOrderPriority priority) {
    return AppColors.getPriorityColor(priority.name);
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

  Color _getActionButtonColor(ThemeData theme) {
    if (workOrder.canBeStarted) return Colors.green;
    if (workOrder.canBePaused) return Colors.orange;
    if (workOrder.canBeResumed) return Colors.blue;
    return theme.primaryColor;
  }
}
