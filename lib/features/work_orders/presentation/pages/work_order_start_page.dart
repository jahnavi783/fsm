import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/di/injection.dart';
import 'package:fsm/core/router/app_router.gr.dart';
import 'package:fsm/core/widgets/fsm_app_bar.dart';
import 'package:fsm/features/work_orders/domain/entities/location_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_bloc.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_event.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_state.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_form_sheet.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_status_chip.dart';
import '../../../../core/theme/extensions/fsm_theme_extension.dart';

@RoutePage()
class WorkOrderStartPage extends StatelessWidget {
  final int workOrderId;

  const WorkOrderStartPage({
    super.key,
    @PathParam('workOrderId') required this.workOrderId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WorkOrderActionBloc>(),
      child: WorkOrderStartView(workOrderId: workOrderId),
    );
  }
}

class WorkOrderStartView extends StatefulWidget {
  final int workOrderId;

  const WorkOrderStartView({
    super.key,
    required this.workOrderId,
  });

  @override
  State<WorkOrderStartView> createState() => _WorkOrderStartViewState();
}

class _WorkOrderStartViewState extends State<WorkOrderStartView> {
  bool _showStartBottomSheet = false;

  @override
  void initState() {
    super.initState();
    context.read<WorkOrderActionBloc>().add(
          WorkOrderActionEvent.loadWorkOrder(widget.workOrderId),
        );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // PopScope allows hardware back button to work with Auto Router
    // Auto Router with includePrefixMatches handles navigation stack automatically
    return PopScope(
      canPop: true,
      child: Scaffold(
        appBar: FSMAppBar.gradient(
          title: 'Start Work Order',
          actions: [
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: _handleViewDetails,
            ),
          ],
        ),
        body: BlocConsumer<WorkOrderActionBloc, WorkOrderActionState>(
          listener: (context, state) {
            state.maybeWhen(
              actionSuccess: (workOrder, actionType, message, _) {
                if (actionType == 'start') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: context.fsmTheme.success,
                    ),
                  );
                  // Navigate back to work order details after successful start
                  context.router.pushAndPopUntil(
                    WorkOrderDetailsRoute(workOrderId: widget.workOrderId),
                    predicate: (route) => route.isFirst,
                  );
                }
              },
              error: (failure, workOrder, isOffline) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(failure.message),
                    backgroundColor: context.fsmTheme.error,
                  ),
                );
              },
              locationError: (workOrder, message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor: context.fsmTheme.warning,
                    action: SnackBarAction(
                      label: 'Retry',
                      onPressed: _handleRetryLocation,
                    ),
                  ),
                );
              },
              loaded: (workOrder, currentLocation, isLocationLoading, isOffline,
                  _, __) {
                // Auto-show start bottom sheet when work order is loaded
                if (!_showStartBottomSheet && workOrder.canBeStarted) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _showStartWorkOrderBottomSheet(workOrder, currentLocation);
                  });
                  _showStartBottomSheet = true;
                }
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (workOrder, currentLocation, isLocationLoading, isOffline,
                      _, __) =>
                  _buildStartInterface(
                      workOrder, currentLocation, isLocationLoading, isOffline),
              actionInProgress: (workOrder, actionType, currentLocation) =>
                  _buildActionInProgress(workOrder, actionType),
              actionSuccess: (workOrder, actionType, message, _) =>
                  _buildStartInterface(workOrder, null, false, false),
              error: (failure, workOrder, isOffline) =>
                  _buildError(failure.message, isOffline),
              locationError: (workOrder, message) =>
                  _buildStartInterface(workOrder, null, false, false),
            );
          },
        ),
      ),
    );
  }

  Widget _buildStartInterface(
    WorkOrderEntity workOrder,
    LocationEntity? currentLocation,
    bool isLocationLoading,
    bool isOffline,
  ) {
    final theme = Theme.of(context);

    if (!workOrder.canBeStarted) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.info_outline,
              size: 64.sp,
              color: context.fsmTheme.warning,
            ),
            SizedBox(height: 16.h),
            Text(
              'Work Order Cannot Be Started',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Current Status: ${workOrder.status.displayName}',
              style: TextStyle(
                fontSize: 14.sp,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: _handleViewDetails,
              child: const Text('View Work Order Details'),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Work Order Header
          Card(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          workOrder.woNumber,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      WorkOrderStatusChip(status: workOrder.status),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    workOrder.summary,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 24.h),

          // Location Status
          Card(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        isLocationLoading
                            ? Icons.gps_not_fixed
                            : Icons.gps_fixed,
                        color: isLocationLoading
                            ? context.fsmTheme.syncSyncing
                            : currentLocation != null
                                ? context.fsmTheme.syncSynced
                                : context.fsmTheme.syncFailed,
                        size: 20.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Location Status',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (isLocationLoading) ...[
                        SizedBox(width: 8.w),
                        SizedBox(
                          width: 16.w,
                          height: 16.h,
                          child:
                              const CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ],
                    ],
                  ),
                  SizedBox(height: 12.h),
                  if (currentLocation != null) ...[
                    Text(
                      'GPS Coordinates: ${currentLocation.latitude.toStringAsFixed(6)}, ${currentLocation.longitude.toStringAsFixed(6)}',
                      style: theme.textTheme.bodyMedium,
                    ),
                    if (currentLocation.accuracy != null) ...[
                      SizedBox(height: 4.h),
                      Text(
                        'Accuracy: ${currentLocation.accuracy!.toStringAsFixed(1)}m',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ] else if (isLocationLoading) ...[
                    Text(
                      'Capturing GPS location...',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: context.fsmTheme.syncSyncing,
                      ),
                    ),
                  ] else ...[
                    Text(
                      'Location not available',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: context.fsmTheme.syncFailed,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    TextButton.icon(
                      onPressed: _handleRetryLocation,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Retry Location'),
                    ),
                  ],
                ],
              ),
            ),
          ),

          SizedBox(height: 24.h),

          // Ready to Start Indicator
          if (currentLocation != null) ...[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: context.fsmTheme.success.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: context.fsmTheme.success),
              ),
              child: Row(
                children: [
                  Icon(Icons.check_circle, color: context.fsmTheme.success, size: 20.sp),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      'Ready to start work order',
                      style: TextStyle(
                        color: context.fsmTheme.success,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
          ],

          // Start Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: currentLocation != null
                  ? () =>
                      _showStartWorkOrderBottomSheet(workOrder, currentLocation)
                  : null,
              icon: const Icon(Icons.play_arrow),
              label: Text(
                'Start Work Order',
                style: TextStyle(fontSize: 16.sp),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                disabledBackgroundColor: Colors.grey.withValues(alpha: 0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          ),

          // Offline Indicator
          if (isOffline) ...[
            SizedBox(height: 16.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.orange.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: Colors.orange),
              ),
              child: Row(
                children: [
                  Icon(Icons.wifi_off, color: Colors.orange, size: 20.sp),
                  SizedBox(width: 8.w),
                  Text(
                    'You are currently offline',
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildActionInProgress(WorkOrderEntity workOrder, String actionType) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          SizedBox(height: 16.h),
          Text(
            'Starting work order...',
            style: TextStyle(fontSize: 16.sp),
          ),
          SizedBox(height: 8.h),
          Text(
            'Please wait while we process your request',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildError(String message, bool isOffline) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isOffline ? Icons.wifi_off : Icons.error_outline,
            size: 64.sp,
            color: Colors.red,
          ),
          SizedBox(height: 16.h),
          Text(
            isOffline ? 'You are offline' : 'Error loading work order',
            style: TextStyle(fontSize: 16.sp, color: Colors.red),
          ),
          SizedBox(height: 8.h),
          Text(
            message,
            style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: _handleRetryLoad,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  void _showStartWorkOrderBottomSheet(
    WorkOrderEntity workOrder,
    LocationEntity? currentLocation,
  ) {
    WorkOrderFormSheet.show(
      context: context,
      action: WorkOrderAction.start,
      workOrder: workOrder,
      location: currentLocation,
    );
  }

  void _handleViewDetails() {
    context.router.push(
        WorkOrderDetailsRoute(workOrderId: widget.workOrderId));
  }

  void _handleRetryLocation() {
    context.read<WorkOrderActionBloc>().add(
          const WorkOrderActionEvent.captureLocation(),
        );
  }

  void _handleRetryLoad() {
    context.read<WorkOrderActionBloc>().add(
          WorkOrderActionEvent.loadWorkOrder(widget.workOrderId),
        );
  }
}
