import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';
import 'dart:io';
import 'package:fsm/core/di/injection.dart';
import 'package:fsm/core/router/app_router.gr.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_bloc.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_event.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_state.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_status_chip.dart';
import 'package:fsm/features/work_orders/domain/entities/location_entity.dart';

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
  final TextEditingController _notesController = TextEditingController();
  final List<File> _selectedFiles = [];
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
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop && !context.router.canPop()) {
          // If can't pop anymore, navigate to work order details
          context.router.replaceAll([
            MainNavigationRoute(),
            WorkOrderDetailsRoute(workOrderId: widget.workOrderId),
          ]);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Start Work Order'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  theme.primaryColor,
                  theme.primaryColor.withOpacity(0.8),
                ],
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () {
                context.router.push(
                    WorkOrderDetailsRoute(workOrderId: widget.workOrderId));
              },
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
                      backgroundColor: Colors.green,
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
                    backgroundColor: Colors.red,
                  ),
                );
              },
              locationError: (workOrder, message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor: Colors.orange,
                    action: SnackBarAction(
                      label: 'Retry',
                      onPressed: () {
                        context.read<WorkOrderActionBloc>().add(
                              const WorkOrderActionEvent.captureLocation(),
                            );
                      },
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
              color: Colors.orange,
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
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () {
                context.router
                    .push(WorkOrderDetailsRoute(workOrderId: workOrder.id));
              },
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
                      color: theme.colorScheme.onSurface.withOpacity(0.8),
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
                            ? Colors.orange
                            : currentLocation != null
                                ? Colors.green
                                : Colors.red,
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
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ] else if (isLocationLoading) ...[
                    Text(
                      'Capturing GPS location...',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.orange,
                      ),
                    ),
                  ] else ...[
                    Text(
                      'Location not available',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    TextButton.icon(
                      onPressed: () {
                        context.read<WorkOrderActionBloc>().add(
                              const WorkOrderActionEvent.captureLocation(),
                            );
                      },
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
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: Colors.green),
              ),
              child: Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 20.sp),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      'Ready to start work order',
                      style: TextStyle(
                        color: Colors.green,
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
                disabledBackgroundColor: Colors.grey.withOpacity(0.3),
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
                color: Colors.orange.withOpacity(0.1),
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
            onPressed: () {
              context.read<WorkOrderActionBloc>().add(
                    WorkOrderActionEvent.loadWorkOrder(widget.workOrderId),
                  );
            },
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
    // Capture the bloc instance from the page context BEFORE showing the bottom sheet
    final bloc = context.read<WorkOrderActionBloc>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (bottomSheetContext) => BlocProvider.value(
        value: bloc, // Pass the existing bloc instance to the bottom sheet
        child: _StartWorkOrderBottomSheet(
          workOrder: workOrder,
          currentLocation: currentLocation,
          notesController: _notesController,
          selectedFiles: _selectedFiles,
          onStart: (notes, files) {
            if (currentLocation != null) {
              bloc.add(
                    WorkOrderActionEvent.startWorkOrder(
                      workOrderId: workOrder.id,
                      latitude: currentLocation.latitude,
                      longitude: currentLocation.longitude,
                      files: files,
                      notes: notes,
                    ),
                  );
              Navigator.of(bottomSheetContext).pop(); // Close the bottom sheet
            }
          },
        ),
      ),
    );
  }
}

class _StartWorkOrderBottomSheet extends StatefulWidget {
  final WorkOrderEntity workOrder;
  final LocationEntity? currentLocation;
  final TextEditingController notesController;
  final List<File> selectedFiles;
  final Function(String?, List<File>) onStart;

  const _StartWorkOrderBottomSheet({
    required this.workOrder,
    required this.currentLocation,
    required this.notesController,
    required this.selectedFiles,
    required this.onStart,
  });

  @override
  State<_StartWorkOrderBottomSheet> createState() =>
      _StartWorkOrderBottomSheetState();
}

class _StartWorkOrderBottomSheetState
    extends State<_StartWorkOrderBottomSheet> {
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

          SizedBox(height: 20.h),

          // Title
          Text(
            'Start Work Order',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),

          SizedBox(height: 4.h),

          Text(
            widget.workOrder.woNumber,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 16.h),

          // Location confirmation
          if (widget.currentLocation != null) ...[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: Colors.green.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Colors.green, size: 16.sp),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Location Captured',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                          ),
                        ),
                        Text(
                          '${widget.currentLocation!.latitude.toStringAsFixed(6)}, ${widget.currentLocation!.longitude.toStringAsFixed(6)}',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 11.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
          ],

          // Notes field
          TextField(
            controller: widget.notesController,
            decoration: InputDecoration(
              labelText: 'Start Notes (Optional)',
              hintText: 'Add any notes about starting this work order...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            maxLines: 3,
          ),

          SizedBox(height: 24.h),

          // Action buttons
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => Navigator.of(context).pop(),
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
              SizedBox(width: 12.w),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: widget.currentLocation != null
                      ? () {
                          final notes = widget.notesController.text.trim();
                          widget.onStart(
                            notes.isEmpty ? null : notes,
                            widget.selectedFiles,
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text(
                    'Start Work Order',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Bottom padding for safe area
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }
}
