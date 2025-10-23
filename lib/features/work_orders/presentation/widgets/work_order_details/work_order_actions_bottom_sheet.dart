import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/action_tile.dart';

class WorkOrderActionsBottomSheet extends StatelessWidget {
  final WorkOrderEntity workOrder;
  final VoidCallback? onStart;
  final VoidCallback? onPause;
  final VoidCallback? onResume;
  final VoidCallback? onComplete;
  final VoidCallback? onReject;

  const WorkOrderActionsBottomSheet({
    super.key,
    required this.workOrder,
    this.onStart,
    this.onPause,
    this.onResume,
    this.onComplete,
    this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              margin: EdgeInsets.only(top: 12.h),
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),

            // Header
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: AppColors.primary,
                    size: 24.sp,
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    'Work Order Actions',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            // Actions wrapped in Flexible to prevent overflow
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (workOrder.canBeStarted && onStart != null)
                      ActionTile(
                        icon: Icons.play_arrow,
                        title: 'Start Work Order',
                        subtitle: 'Begin working on this order',
                        color: AppColors.success,
                        onTap: () {
                          Navigator.pop(context);
                          onStart!();
                        },
                      ),
                    if (workOrder.canBePaused && onPause != null)
                      ActionTile(
                        icon: Icons.pause,
                        title: 'Pause Work Order',
                        subtitle: 'Temporarily pause work',
                        color: AppColors.warning,
                        onTap: () {
                          Navigator.pop(context);
                          onPause!();
                        },
                      ),
                    if (workOrder.canBeResumed && onResume != null)
                      ActionTile(
                        icon: Icons.play_arrow,
                        title: 'Resume Work Order',
                        subtitle: 'Continue working',
                        color: AppColors.success,
                        onTap: () {
                          Navigator.pop(context);
                          onResume!();
                        },
                      ),
                    if (workOrder.canBeCompleted && onComplete != null)
                      ActionTile(
                        icon: Icons.check_circle,
                        title: 'Complete Work Order',
                        subtitle: 'Mark as completed',
                        color: AppColors.primary,
                        onTap: () {
                          Navigator.pop(context);
                          onComplete!();
                        },
                      ),
                    if (workOrder.canBeRejected && onReject != null)
                      ActionTile(
                        icon: Icons.close,
                        title: 'Reject Work Order',
                        subtitle: 'Reject this work order',
                        color: AppColors.error,
                        onTap: () {
                          Navigator.pop(context);
                          onReject!();
                        },
                      ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
