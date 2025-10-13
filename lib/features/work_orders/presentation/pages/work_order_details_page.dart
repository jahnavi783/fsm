import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';
import 'package:intl/intl.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_bloc.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_event.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_state.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_status_chip.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_action_sheet.dart';
import 'package:fsm/features/work_orders/domain/entities/location_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/work_log_entity.dart';

@RoutePage()
class WorkOrderDetailsPage extends StatefulWidget {
  final int workOrderId;

  const WorkOrderDetailsPage({
    super.key,
    @PathParam('workOrderId') required this.workOrderId,
  });

  @override
  State<WorkOrderDetailsPage> createState() => _WorkOrderDetailsPageState();
}

class _WorkOrderDetailsPageState extends State<WorkOrderDetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<WorkOrderActionBloc>().add(
          WorkOrderActionEvent.loadWorkOrder(widget.workOrderId),
        );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Work Order Details'),
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
          BlocBuilder<WorkOrderActionBloc, WorkOrderActionState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (workOrder, _, __, ___) => IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () => _showWorkOrderActions(workOrder),
                ),
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
        ],
      ),
      body: BlocConsumer<WorkOrderActionBloc, WorkOrderActionState>(
        listener: (context, state) {
          state.maybeWhen(
            actionSuccess: (workOrder, actionType, message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: Colors.green,
                ),
              );
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
                ),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (workOrder, currentLocation, isLocationLoading,
                    isOffline) =>
                _buildWorkOrderDetails(
                    workOrder, currentLocation, isLocationLoading, isOffline),
            actionInProgress: (workOrder, actionType, currentLocation) =>
                _buildActionInProgress(workOrder, actionType),
            actionSuccess: (workOrder, actionType, message) =>
                _buildWorkOrderDetails(workOrder, null, false, false),
            error: (failure, workOrder, isOffline) =>
                _buildError(failure.message, isOffline),
            locationError: (workOrder, message) =>
                _buildWorkOrderDetails(workOrder, null, false, false),
          );
        },
      ),
    );
  }

  Widget _buildWorkOrderDetails(
    WorkOrderEntity workOrder,
    LocationEntity? currentLocation,
    bool isLocationLoading,
    bool isOffline,
  ) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Card
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

                  SizedBox(height: 16.h),

                  // Priority and Visit Date
                  Row(
                    children: [
                      _buildInfoChip(
                        'Priority',
                        workOrder.priorityDisplayName,
                        _getPriorityColor(workOrder.priority),
                      ),
                      SizedBox(width: 12.w),
                      _buildInfoChip(
                        'Visit Date',
                        DateFormat('MMM dd, yyyy').format(workOrder.visitDate),
                        theme.primaryColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 16.h),

          // Description Card
          Card(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    workOrder.problemDescription.isNotEmpty
                        ? workOrder.problemDescription
                        : 'No description available',
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 16.h),

          // Customer Information
          if (workOrder.customer != null) ...[
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Customer Information',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    _buildInfoRow(
                        Icons.person, 'Name', workOrder.customer!.name),
                    _buildInfoRow(
                        Icons.email, 'Email', workOrder.customer!.email),
                    if (workOrder.customer!.phone != null)
                      _buildInfoRow(
                          Icons.phone, 'Phone', workOrder.customer!.phone!),
                    if (workOrder.customer!.address != null)
                      _buildInfoRow(Icons.location_on, 'Address',
                          workOrder.customer!.address!),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
          ],

          // Location Information
          Card(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Location',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (isLocationLoading)
                        SizedBox(
                          width: 16.w,
                          height: 16.h,
                          child:
                              const CircularProgressIndicator(strokeWidth: 2),
                        ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  _buildInfoRow(
                      Icons.location_on, 'Address', workOrder.location),
                  if (currentLocation != null) ...[
                    SizedBox(height: 8.h),
                    _buildInfoRow(
                      Icons.gps_fixed,
                      'Current GPS',
                      '${currentLocation.latitude.toStringAsFixed(6)}, ${currentLocation.longitude.toStringAsFixed(6)}',
                    ),
                    if (currentLocation.accuracy != null)
                      _buildInfoRow(
                        Icons.gps_not_fixed,
                        'Accuracy',
                        '${currentLocation.accuracy!.toStringAsFixed(1)}m',
                      ),
                  ],
                ],
              ),
            ),
          ),

          SizedBox(height: 16.h),

          // Work Log and Timeline
          if (workOrder.workLogs.isNotEmpty) ...[
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Work Timeline',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    ...workOrder.workLogs.map((log) => _buildTimelineItem(log)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
          ],

          // Parts Used
          if (workOrder.partsUsed.isNotEmpty) ...[
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Parts Used',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    ...workOrder.partsUsed.map((part) => _buildPartItem(part)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
          ],

          // Offline Indicator
          if (isOffline) ...[
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
            SizedBox(height: 16.h),
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
            '${actionType.toUpperCase()}ING work order...',
            style: TextStyle(fontSize: 16.sp),
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

  Widget _buildInfoChip(String label, String value, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 10.sp,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 12.sp,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 16.sp,
            color: theme.colorScheme.onSurface.withOpacity(0.6),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: theme.colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(WorkLogEntity log) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 8.w,
            height: 8.h,
            decoration: BoxDecoration(
              color: theme.primaryColor,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  log.description,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  DateFormat('MMM dd, yyyy HH:mm').format(log.timestamp),
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: theme.colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
                if (log.notes != null) ...[
                  SizedBox(height: 4.h),
                  Text(
                    log.notes!,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: theme.colorScheme.onSurface.withOpacity(0.8),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPartItem(PartUsedEntity part) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  part.partName ?? part.partNumber,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  part.partNumber,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: theme.colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Qty: ${part.quantityUsed}',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: theme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  void _showWorkOrderActions(WorkOrderEntity workOrder) {
    WorkOrderActionSheet.show(
      context,
      workOrder: workOrder,
      onStart: workOrder.canBeStarted
          ? () {
              _startWorkOrder(context, workOrder);
            }
          : null,
      onPause: workOrder.canBePaused
          ? () {
              _pauseWorkOrder(context, workOrder);
            }
          : null,
      onResume: workOrder.canBeResumed
          ? () {
              _resumeWorkOrder(context, workOrder);
            }
          : null,
      onComplete: workOrder.canBeCompleted
          ? () {
              _completeWorkOrder(context, workOrder);
            }
          : null,
      onReject: workOrder.canBeRejected
          ? () {
              _rejectWorkOrder(context, workOrder);
            }
          : null,
    );
  }

  Color _getPriorityColor(WorkOrderPriority priority) {
    switch (priority) {
      case WorkOrderPriority.low:
        return Colors.green;
      case WorkOrderPriority.medium:
        return Colors.orange;
      case WorkOrderPriority.high:
        return Colors.red;
      case WorkOrderPriority.urgent:
        return Colors.purple;
    }
  }

  void _startWorkOrder(BuildContext context, WorkOrderEntity workOrder) {
    _showLocationConfirmationDialog(
      context,
      'Start Work Order',
      'Are you sure you want to start this work order? Your current location will be captured.',
      () {
        final state = context.read<WorkOrderActionBloc>().state;
        state.maybeWhen(
          loaded: (_, currentLocation, __, ___) {
            if (currentLocation != null) {
              context.read<WorkOrderActionBloc>().add(
                WorkOrderActionEvent.startWorkOrder(
                  workOrderId: workOrder.id,
                  latitude: currentLocation.latitude,
                  longitude: currentLocation.longitude,
                ),
              );
            } else {
              _showLocationErrorDialog(context);
            }
          },
          orElse: () => _showLocationErrorDialog(context),
        );
      },
    );
  }

  void _pauseWorkOrder(BuildContext context, WorkOrderEntity workOrder) {
    _showReasonDialog(
      context,
      'Pause Work Order',
      'Please provide a reason for pausing this work order:',
      (reason) {
        final state = context.read<WorkOrderActionBloc>().state;
        state.maybeWhen(
          loaded: (_, currentLocation, __, ___) {
            if (currentLocation != null) {
              context.read<WorkOrderActionBloc>().add(
                WorkOrderActionEvent.pauseWorkOrder(
                  workOrderId: workOrder.id,
                  reason: reason,
                  latitude: currentLocation.latitude,
                  longitude: currentLocation.longitude,
                ),
              );
            } else {
              _showLocationErrorDialog(context);
            }
          },
          orElse: () => _showLocationErrorDialog(context),
        );
      },
    );
  }

  void _resumeWorkOrder(BuildContext context, WorkOrderEntity workOrder) {
    _showLocationConfirmationDialog(
      context,
      'Resume Work Order',
      'Are you sure you want to resume this work order? Your current location will be captured.',
      () {
        final state = context.read<WorkOrderActionBloc>().state;
        state.maybeWhen(
          loaded: (_, currentLocation, __, ___) {
            if (currentLocation != null) {
              context.read<WorkOrderActionBloc>().add(
                WorkOrderActionEvent.resumeWorkOrder(
                  workOrderId: workOrder.id,
                  latitude: currentLocation.latitude,
                  longitude: currentLocation.longitude,
                ),
              );
            } else {
              _showLocationErrorDialog(context);
            }
          },
          orElse: () => _showLocationErrorDialog(context),
        );
      },
    );
  }

  void _completeWorkOrder(BuildContext context, WorkOrderEntity workOrder) {
    _showCompleteWorkOrderDialog(context, workOrder);
  }

  void _rejectWorkOrder(BuildContext context, WorkOrderEntity workOrder) {
    _showReasonDialog(
      context,
      'Reject Work Order',
      'Please provide a reason for rejecting this work order:',
      (reason) {
        final state = context.read<WorkOrderActionBloc>().state;
        state.maybeWhen(
          loaded: (_, currentLocation, __, ___) {
            if (currentLocation != null) {
              context.read<WorkOrderActionBloc>().add(
                WorkOrderActionEvent.rejectWorkOrder(
                  workOrderId: workOrder.id,
                  reason: reason,
                  latitude: currentLocation.latitude,
                  longitude: currentLocation.longitude,
                ),
              );
            } else {
              _showLocationErrorDialog(context);
            }
          },
          orElse: () => _showLocationErrorDialog(context),
        );
      },
    );
  }

  void _showLocationConfirmationDialog(
    BuildContext context,
    String title,
    String message,
    VoidCallback onConfirm,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              onConfirm();
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  void _showReasonDialog(
    BuildContext context,
    String title,
    String message,
    Function(String) onSubmit,
  ) {
    final TextEditingController reasonController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message),
            SizedBox(height: 16.h),
            TextField(
              controller: reasonController,
              decoration: const InputDecoration(
                hintText: 'Enter reason...',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              autofocus: true,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final reason = reasonController.text.trim();
              if (reason.isNotEmpty) {
                Navigator.of(context).pop();
                onSubmit(reason);
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  void _showCompleteWorkOrderDialog(BuildContext context, WorkOrderEntity workOrder) {
    final TextEditingController workLogController = TextEditingController();
    final TextEditingController completionNotesController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Complete Work Order'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Please provide work completion details:'),
              SizedBox(height: 16.h),
              TextField(
                controller: workLogController,
                decoration: const InputDecoration(
                  labelText: 'Work Log *',
                  hintText: 'Describe the work performed...',
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
                autofocus: true,
              ),
              SizedBox(height: 16.h),
              TextField(
                controller: completionNotesController,
                decoration: const InputDecoration(
                  labelText: 'Completion Notes',
                  hintText: 'Additional notes (optional)...',
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
              ),
              SizedBox(height: 16.h),
              const Text(
                'Note: Parts used and images can be added in future updates.',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final workLog = workLogController.text.trim();
              if (workLog.isNotEmpty) {
                Navigator.of(context).pop();
                
                final state = context.read<WorkOrderActionBloc>().state;
                state.maybeWhen(
                  loaded: (_, currentLocation, __, ___) {
                    if (currentLocation != null) {
                      context.read<WorkOrderActionBloc>().add(
                        WorkOrderActionEvent.completeWorkOrder(
                          workOrderId: workOrder.id,
                          workLog: workLog,
                          partsUsed: [], // Empty for now
                          files: [], // Empty for now
                          latitude: currentLocation.latitude,
                          longitude: currentLocation.longitude,
                          completionNotes: completionNotesController.text.trim().isEmpty 
                              ? null 
                              : completionNotesController.text.trim(),
                        ),
                      );
                    } else {
                      _showLocationErrorDialog(context);
                    }
                  },
                  orElse: () => _showLocationErrorDialog(context),
                );
              }
            },
            child: const Text('Complete'),
          ),
        ],
      ),
    );
  }

  void _showLocationErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Location Required'),
        content: const Text(
          'Current location is required for this action. Please ensure location services are enabled and try again.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<WorkOrderActionBloc>().add(
                const WorkOrderActionEvent.captureLocation(),
              );
            },
            child: const Text('Retry Location'),
          ),
        ],
      ),
    );
  }
}
