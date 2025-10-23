import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';

class WorkOrderActionFab extends StatelessWidget {
  final WorkOrderEntity workOrder;
  final VoidCallback? onStart;
  final VoidCallback? onPause;
  final VoidCallback? onResume;
  final VoidCallback? onComplete;
  final VoidCallback? onShowActions;

  const WorkOrderActionFab({
    super.key,
    required this.workOrder,
    this.onStart,
    this.onPause,
    this.onResume,
    this.onComplete,
    this.onShowActions,
  });

  @override
  Widget build(BuildContext context) {
    // Determine primary action based on work order state
    String label;
    IconData icon;
    Color backgroundColor;
    VoidCallback? onPressed;

    if (workOrder.canBeStarted && onStart != null) {
      label = 'Start Job';
      icon = Icons.play_arrow;
      backgroundColor = AppColors.success;
      onPressed = onStart;
    } else if (workOrder.canBePaused && onPause != null) {
      label = 'Pause Job';
      icon = Icons.pause;
      backgroundColor = AppColors.warning;
      onPressed = onPause;
    } else if (workOrder.canBeResumed && onResume != null) {
      label = 'Resume Job';
      icon = Icons.play_arrow;
      backgroundColor = AppColors.success;
      onPressed = onResume;
    } else if (workOrder.canBeCompleted && onComplete != null) {
      label = 'Complete Job';
      icon = Icons.check_circle;
      backgroundColor = AppColors.primary;
      onPressed = onComplete;
    } else {
      // Show actions menu for other states
      label = 'Actions';
      icon = Icons.more_vert;
      backgroundColor = AppColors.primary;
      onPressed = onShowActions;
    }

    return FloatingActionButton.extended(
      onPressed: onPressed,
      icon: Icon(icon, size: 20.sp),
      label: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
        ),
      ),
      backgroundColor: backgroundColor,
      foregroundColor: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28.r),
      ),
    );
  }
}
