import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';
import 'package:fsm/features/work_orders/domain/entities/location_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';

/// StatusAdaptiveActionsWidget
///
/// Displays context-appropriate action buttons based on work order status.
/// Note: Does NOT use BlocBuilder as it's placed outside the BLoC provider scope.
/// Instead, receives isActionInProgress as a parameter.
///
/// Status mapping:
/// - Unassigned → "Assign to Me"
/// - Assigned → "Start" + "Reject" (side-by-side)
/// - Paused → "Resume"
/// - InProgress → "Pause" + "Complete" (side-by-side)
/// - Completed → (hidden)
class StatusAdaptiveActionsWidget extends StatelessWidget {
  final WorkOrderEntity workOrder;
  final LocationEntity? currentLocation;
  final bool isLocationLoading;
  final bool isActionInProgress;
  final VoidCallback? onStart;
  final VoidCallback? onPause;
  final VoidCallback? onResume;
  final VoidCallback? onComplete;
  final VoidCallback? onReject;
  final VoidCallback? onAssignToMe;

  const StatusAdaptiveActionsWidget({
    super.key,
    required this.workOrder,
    required this.currentLocation,
    required this.isLocationLoading,
    required this.isActionInProgress,
    this.onStart,
    this.onPause,
    this.onResume,
    this.onComplete,
    this.onReject,
    this.onAssignToMe,
  });

  @override
  Widget build(BuildContext context) {
    // Hidden for completed work orders
    if (workOrder.isCompleted) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: REdgeInsets.symmetric(
          horizontal: DesignTokens.space4, vertical: DesignTokens.space4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant,
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: context.fsmTheme.shadowCard,
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: _buildActionButtons(context, isActionInProgress),
      ),
    );
  }

  /// Build appropriate buttons based on work order status
  Widget _buildActionButtons(BuildContext context, bool isLoading) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;

    switch (workOrder.status) {
      case WorkOrderStatus.created:
        // Unassigned → "Assign to Me"
        return _buildSingleButton(
          context,
          label: 'Assign to Me',
          icon: Icons.person_add,
          color: theme.colorScheme.primary,
          onPressed: !isLoading ? onAssignToMe : null,
          isLoading: isLoading,
        );

      case WorkOrderStatus.assigned:
        // Assigned → "Start" + "Reject" (side-by-side)
        return _buildDualButtons(
          context,
          primaryLabel: 'Start Job',
          primaryIcon: Icons.play_arrow,
          // primaryColor: fsmTheme.statusCompleted,
          primaryColor: theme.colorScheme.primary,
          primaryOnPressed: !isLoading ? onStart : null,
          secondaryLabel: 'Reject',
          secondaryIcon: Icons.close,
          secondaryColor: theme.colorScheme.error,
          secondaryOnPressed: !isLoading ? onReject : null,
          isLoading: isLoading,
        );

      case WorkOrderStatus.inProgress:
        // InProgress → "Pause" + "Complete" (side-by-side)
        final locationAvailable = currentLocation != null;
        return _buildDualButtons(
          context,
          primaryLabel: 'Pause Job',
          primaryIcon: Icons.pause,
          primaryColor: fsmTheme.statusPending,
          primaryOnPressed: !isLoading && locationAvailable ? onPause : null,
          secondaryLabel: 'Complete Job',
          secondaryIcon: Icons.check_circle,
          secondaryColor: theme.colorScheme.primary,
          secondaryOnPressed:
              !isLoading && locationAvailable ? onComplete : null,
          isLoading: isLoading,
          showLocationWarning: !locationAvailable && !isLocationLoading,
        );

      case WorkOrderStatus.paused:
        // Paused → "Resume"
        final locationAvailable = currentLocation != null;
        return _buildSingleButton(
          context,
          label: 'Resume Job',
          icon: Icons.play_arrow,
          color: fsmTheme.statusCompleted,
          onPressed: !isLoading && locationAvailable ? onResume : null,
          isLoading: isLoading,
          showLocationWarning: !locationAvailable && !isLocationLoading,
        );

      case WorkOrderStatus.completed:
      case WorkOrderStatus.rejected:
      case WorkOrderStatus.reAssigned:
        // No actions available
        return const SizedBox.shrink();
    }
  }

  /// Single action button
  Widget _buildSingleButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback? onPressed,
    required bool isLoading,
    bool showLocationWarning = false,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showLocationWarning) ...[
          Container(
            width: double.infinity,
            padding: REdgeInsets.all(DesignTokens.space3),
            decoration: BoxDecoration(
              color: context.fsmTheme.warning.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
              border: Border.all(
                color: context.fsmTheme.warning.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.location_off,
                  color: context.fsmTheme.warning,
                  size: DesignTokens.iconSm.sp,
                ),
                DesignTokens.horizontalSpaceSmall,
                Expanded(
                  child: Text(
                    'Waiting for location...',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: context.fsmTheme.warning,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ],
            ),
          ),
          DesignTokens.verticalSpace(DesignTokens.space3),
        ],
        RSizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: isLoading ? null : onPressed,
            icon: isLoading
                ? RSizedBox(
                    width: 20.w,
                    height: 20.w,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        color.withValues(alpha: 0.7),
                      ),
                    ),
                  )
                : Icon(icon),
            label: Text(
              label,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              disabledBackgroundColor: color.withValues(alpha: 0.5),
              disabledForegroundColor: Theme.of(context)
                  .colorScheme
                  .onPrimary
                  .withValues(alpha: 0.5),
              padding: REdgeInsets.symmetric(vertical: DesignTokens.space3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Dual action buttons (side-by-side)
  Widget _buildDualButtons(
    BuildContext context, {
    required String primaryLabel,
    required IconData primaryIcon,
    required Color primaryColor,
    required VoidCallback? primaryOnPressed,
    required String secondaryLabel,
    required IconData secondaryIcon,
    required Color secondaryColor,
    required VoidCallback? secondaryOnPressed,
    required bool isLoading,
    bool showLocationWarning = false,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showLocationWarning) ...[
          Container(
            width: double.infinity,
            padding: REdgeInsets.all(DesignTokens.space3),
            decoration: BoxDecoration(
              color: context.fsmTheme.warning.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
              border: Border.all(
                color: context.fsmTheme.warning.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.location_off,
                  color: context.fsmTheme.warning,
                  size: DesignTokens.iconSm.sp,
                ),
                DesignTokens.horizontalSpaceSmall,
                Expanded(
                  child: Text(
                    'Waiting for location...',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: context.fsmTheme.warning,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ],
            ),
          ),
          DesignTokens.verticalSpace(DesignTokens.space3),
        ],
        Row(
          children: [
            // Primary button (left, 50% width)
            Expanded(
              child: ElevatedButton.icon(
                onPressed: isLoading ? null : primaryOnPressed,
                // onPressed: isLoading ? primaryOnPressed : primaryOnPressed,
                icon: isLoading
                    ? RSizedBox(
                        width: 18.w,
                        height: 18.w,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            primaryColor.withValues(alpha: 0.7),
                          ),
                        ),
                      )
                    : Icon(primaryIcon, size: 18.sp),
                label: Text(
                  primaryLabel,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  disabledBackgroundColor: primaryColor.withValues(alpha: 0.5),
                  disabledForegroundColor: Theme.of(context)
                      .colorScheme
                      .onPrimary
                      .withValues(alpha: 0.5),
                  padding: REdgeInsets.symmetric(vertical: DesignTokens.space3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
            ),

            DesignTokens.horizontalSpace(DesignTokens.space3),

            // Secondary button (right, 50% width)
            Expanded(
              child: ElevatedButton.icon(
                onPressed: isLoading ? null : secondaryOnPressed,
                icon: Icon(secondaryIcon, size: 18.sp),
                label: Text(
                  secondaryLabel,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: secondaryColor,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  disabledBackgroundColor:
                      secondaryColor.withValues(alpha: 0.5),
                  disabledForegroundColor: Theme.of(context)
                      .colorScheme
                      .onPrimary
                      .withValues(alpha: 0.5),
                  padding: REdgeInsets.symmetric(vertical: DesignTokens.space3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
