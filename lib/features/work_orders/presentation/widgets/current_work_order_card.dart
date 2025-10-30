import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/core/widgets/status_badge.dart';
import 'package:fsm/core/widgets/priority_indicator.dart';
import 'package:fsm/core/widgets/metadata_row.dart';
import 'package:fsm/core/widgets/quick_action_button.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:intl/intl.dart';

/// CurrentWorkOrderCard - Prominent card showing FSE's active work order
///
/// Displays the current in-progress work order with:
/// - Left accent border (4dp, orange/amber)
/// - Status badge + WO number + Priority indicator
/// - Issue description (max 2 lines)
/// - Location + Time metadata
/// - Quick action buttons (Pause, Parts, Docs, Complete)
///
/// Full-width with 16dp margins, 12r corners, elevation 4
class CurrentWorkOrderCard extends StatelessWidget {
  final WorkOrderEntity workOrder;
  final VoidCallback? onPause;
  final VoidCallback? onParts;
  final VoidCallback? onDocs;
  final VoidCallback? onComplete;
  final VoidCallback? onTap;

  const CurrentWorkOrderCard({
    super.key,
    required this.workOrder,
    this.onPause,
    this.onParts,
    this.onDocs,
    this.onComplete,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final startTime = workOrder.startedAt;
    final timeText = startTime != null
        ? 'Started: ${DateFormat('h:mm a').format(startTime)}'
        : 'Not started';

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        elevation: 4,
        shadowColor: Colors.black26,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12.r),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border(
                left: BorderSide(
                  color: AppColors.warning,
                  width: 4.w,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header: Status + WO Number + Priority
                  Row(
                    children: [
                      StatusBadge.status(
                        status: workOrder.status.toString(),
                        variant: StatusBadgeVariant.filled,
                      ),
                      const Spacer(),
                      PriorityIndicator(
                        priority: workOrder.priority.toString(),
                        type: PriorityIndicatorType.badge,
                        showLabel: true,
                      ),
                    ],
                  ),

                  SizedBox(height: 12.h),

                  // WO Number
                  Text(
                    workOrder.woNumber,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  SizedBox(height: 8.h),

                  // Issue Description (max 2 lines)
                  Text(
                    workOrder.problemDescription,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textSecondary,
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: 12.h),

                  // Metadata: Location + Time
                  MetadataRow(
                    items: [
                      MetadataItem(
                        icon: Icons.location_on_outlined,
                        text: workOrder.location,
                      ),
                      MetadataItem(
                        icon: Icons.access_time,
                        text: timeText,
                      ),
                    ],
                  ),

                  SizedBox(height: 16.h),

                  // Quick Actions Row
                  Wrap(
                    spacing: 8.w,
                    runSpacing: 8.h,
                    children: [
                      if (onPause != null)
                        QuickActionButton(
                          icon: Icons.pause,
                          label: 'Pause',
                          onPressed: onPause!,
                          backgroundColor: AppColors.warning,
                        ),
                      if (onParts != null)
                        QuickActionButton(
                          icon: Icons.inventory_2_outlined,
                          label: 'Parts',
                          onPressed: onParts!,
                          backgroundColor: AppColors.info,
                        ),
                      if (onDocs != null)
                        QuickActionButton(
                          icon: Icons.description_outlined,
                          label: 'Docs',
                          onPressed: onDocs!,
                          backgroundColor: AppColors.secondary,
                        ),
                      if (onComplete != null)
                        QuickActionButton(
                          icon: Icons.check_circle_outline,
                          label: 'Complete',
                          onPressed: onComplete!,
                          backgroundColor: AppColors.success,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
