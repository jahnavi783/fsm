import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/widgets/navigation/fsm_bottom_sheet.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import '../../../../core/theme/extensions/fsm_theme_extension.dart';
import '../../../../core/theme/design_tokens.dart';

class WorkOrderActionSheet extends StatelessWidget {
  final WorkOrderEntity workOrder;
  final VoidCallback? onStart;
  final VoidCallback? onPause;
  final VoidCallback? onResume;
  final VoidCallback? onComplete;
  final VoidCallback? onReject;
  final VoidCallback? onViewDetails;

  const WorkOrderActionSheet({
    super.key,
    required this.workOrder,
    this.onStart,
    this.onPause,
    this.onResume,
    this.onComplete,
    this.onReject,
    this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: theme.colorScheme.onSurface.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),

          DesignTokens.verticalSpace(DesignTokens.space5),

          // Work Order Info
          Text(
            workOrder.woNumber,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),

          RSizedBox(height: 4.h),

          Text(
            workOrder.summary,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.7),
              fontSize: 14.sp,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          DesignTokens.verticalSpaceLarge,

          // Action Buttons
          Text(
            'Available Actions',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          ),

          DesignTokens.verticalSpaceMedium,

          // Start Work Order
          if (workOrder.canBeStarted && onStart != null)
            _ActionButton(
              icon: Icons.play_arrow,
              label: 'Start Work Order',
              color: context.fsmTheme.actionStart,
              onTap: () => _handleStart(context, onStart!),
            ),

          // Pause Work Order
          if (workOrder.canBePaused && onPause != null)
            _ActionButton(
              icon: Icons.pause,
              label: 'Pause Work Order',
              color: context.fsmTheme.actionPause,
              onTap: () => _handlePause(context, onPause!),
            ),

          // Resume Work Order
          if (workOrder.canBeResumed && onResume != null)
            _ActionButton(
              icon: Icons.play_arrow,
              label: 'Resume Work Order',
              color: context.fsmTheme.actionResume,
              onTap: () => _handleResume(context, onResume!),
            ),

          // Complete Work Order
          if (workOrder.canBeCompleted && onComplete != null)
            _ActionButton(
              icon: Icons.check_circle,
              label: 'Complete Work Order',
              color: context.fsmTheme.actionComplete,
              onTap: () => _handleComplete(context, onComplete!),
            ),

          // Reject Work Order
          if (workOrder.canBeRejected && onReject != null)
            _ActionButton(
              icon: Icons.cancel,
              label: 'Reject Work Order',
              color: context.fsmTheme.actionReject,
              onTap: () => _handleReject(context, onReject!),
            ),

          // View Details (always available)
          if (onViewDetails != null)
            _ActionButton(
              icon: Icons.info_outline,
              label: 'View Details',
              color: theme.primaryColor,
              onTap: () => _handleViewDetails(context, onViewDetails!),
            ),

          DesignTokens.verticalSpaceMedium,

          // Cancel Button
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () => _handleCancel(context),
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          // Bottom padding for safe area
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }

  void _handleCancel(BuildContext context) {
    Navigator.pop(context);
  }

  void _handleStart(BuildContext context, VoidCallback onStart) {
    Navigator.pop(context);
    onStart();
  }

  void _handlePause(BuildContext context, VoidCallback onPause) {
    Navigator.pop(context);
    onPause();
  }

  void _handleResume(BuildContext context, VoidCallback onResume) {
    Navigator.pop(context);
    onResume();
  }

  void _handleComplete(BuildContext context, VoidCallback onComplete) {
    Navigator.pop(context);
    onComplete();
  }

  void _handleReject(BuildContext context, VoidCallback onReject) {
    Navigator.pop(context);
    onReject();
  }

  void _handleViewDetails(BuildContext context, VoidCallback onViewDetails) {
    Navigator.pop(context);
    onViewDetails();
  }

  static Future<void> show(
    BuildContext context, {
    required WorkOrderEntity workOrder,
    VoidCallback? onStart,
    VoidCallback? onPause,
    VoidCallback? onResume,
    VoidCallback? onComplete,
    VoidCallback? onReject,
    VoidCallback? onViewDetails,
  }) {
    return FSMBottomSheet.show<void>(
      context: context,
      title: 'Work Order Actions',
      content: WorkOrderActionSheet(
        workOrder: workOrder,
        onStart: onStart,
        onPause: onPause,
        onResume: onResume,
        onComplete: onComplete,
        onReject: onReject,
        onViewDetails: onViewDetails,
      ),
      showCloseButton: true,
      isDismissible: true,
      isScrollControlled: false,
      enableDrag: true,
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: color.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  icon,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 20.sp,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  label,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: color,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: color,
                size: 16.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
