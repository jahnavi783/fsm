import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsm/core/widgets/fsm_bottom_sheet.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/location_entity.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_bloc.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_start_bottom_sheet.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_pause_bottom_sheet.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_complete_bottom_sheet_new.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_action_sheet.dart';

/// Work Order Bottom Sheet Manager
/// 
/// Provides centralized methods for showing work order related bottom sheets
/// using the shared FSMBottomSheet component for consistent UI.
class WorkOrderBottomSheetManager {
  
  /// Show start work order bottom sheet
  /// Requires WorkOrderActionBloc from parent context
  static Future<bool?> showStartWorkOrder({
    required BuildContext context,
    required WorkOrderEntity workOrder,
    LocationEntity? currentLocation,
  }) {
    // Capture the bloc instance from parent context before showing bottom sheet
    final bloc = context.read<WorkOrderActionBloc>();

    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      builder: (bottomSheetContext) => BlocProvider.value(
        value: bloc,
        child: WorkOrderStartBottomSheet(
          workOrder: workOrder,
          currentLocation: currentLocation,
        ),
      ),
    );
  }

  /// Show pause work order bottom sheet
  /// Requires WorkOrderActionBloc from parent context
  static Future<bool?> showPauseWorkOrder({
    required BuildContext context,
    required WorkOrderEntity workOrder,
    LocationEntity? currentLocation,
  }) {
    // Capture the bloc instance from parent context before showing bottom sheet
    final bloc = context.read<WorkOrderActionBloc>();

    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      builder: (bottomSheetContext) => BlocProvider.value(
        value: bloc,
        child: WorkOrderPauseBottomSheet(
          workOrder: workOrder,
          currentLocation: currentLocation,
        ),
      ),
    );
  }

  /// Show complete work order bottom sheet
  /// Requires WorkOrderActionBloc from parent context
  static Future<bool?> showCompleteWorkOrder({
    required BuildContext context,
    required WorkOrderEntity workOrder,
    LocationEntity? currentLocation,
  }) {
    // Capture the bloc instance from parent context before showing bottom sheet
    final bloc = context.read<WorkOrderActionBloc>();

    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (bottomSheetContext) => BlocProvider.value(
        value: bloc,
        child: WorkOrderCompleteBottomSheetNew(
          workOrder: workOrder,
          currentLocation: currentLocation,
        ),
      ),
    );
  }

  /// Show work order action sheet
  static Future<void> showActionSheet({
    required BuildContext context,
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