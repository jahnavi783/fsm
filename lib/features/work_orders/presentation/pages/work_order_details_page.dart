import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';
import 'package:intl/intl.dart';
import 'package:fsm/core/di/injection.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_bloc.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_event.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_state.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_start_bottom_sheet.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_pause_bottom_sheet.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_image_gallery_section.dart';

import 'package:fsm/features/work_orders/domain/entities/location_entity.dart';

// Import extracted components
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/header_action_button.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/header_info_chip.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/expandable_section.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/offline_indicator.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/work_order_action_fab.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/work_order_actions_bottom_sheet.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/action_in_progress_widget.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/error_widget.dart';

// Section components
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/sections/basic_information_section.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/sections/description_section.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/sections/customer_section.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/sections/machine_details_section.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/sections/location_section.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/sections/parts_used_section.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/sections/work_timeline_section.dart';

// Dialog components
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/dialogs/location_confirmation_dialog.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/dialogs/reason_dialog.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/dialogs/complete_work_order_dialog.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/dialogs/location_error_dialog.dart';

@RoutePage()
class WorkOrderDetailsPage extends StatelessWidget {
  final int workOrderId;

  const WorkOrderDetailsPage({
    super.key,
    @PathParam('workOrderId') required this.workOrderId,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WorkOrderActionBloc>(
      future: getIt.getAsync<WorkOrderActionBloc>(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            !snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Work Order Details'),
            ),
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Work Order Details'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64.sp,
                    color: Colors.red,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Failed to initialize work order actions',
                    style: TextStyle(fontSize: 16.sp, color: Colors.red),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    snapshot.error.toString(),
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }

        final workOrderActionBloc = snapshot.data!;

        return BlocProvider.value(
          value: workOrderActionBloc,
          child: WorkOrderDetailsView(workOrderId: workOrderId),
        );
      },
    );
  }
}

class WorkOrderDetailsView extends StatefulWidget {
  final int workOrderId;

  const WorkOrderDetailsView({
    super.key,
    required this.workOrderId,
  });

  @override
  State<WorkOrderDetailsView> createState() => _WorkOrderDetailsViewState();
}

class _WorkOrderDetailsViewState extends State<WorkOrderDetailsView> {
  WorkOrderActionBloc? _workOrderActionBloc;

  @override
  void initState() {
    super.initState();
    context.read<WorkOrderActionBloc>().add(
          WorkOrderActionEvent.loadWorkOrder(widget.workOrderId),
        );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _workOrderActionBloc = context.read<WorkOrderActionBloc>();
  }

  /// Helper method to safely execute operations when widget is still mounted
  bool _executeIfMounted(VoidCallback callback) {
    if (!mounted) return false;
    callback();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<WorkOrderActionBloc, WorkOrderActionState>(
        listener: (context, state) {
          state.maybeWhen(
            actionSuccess: (workOrder, actionType, message, _) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: AppColors.success,
                ),
              );
            },
            error: (failure, workOrder, isOffline) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(failure.message),
                  backgroundColor: AppColors.error,
                ),
              );
            },
            locationError: (workOrder, message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: AppColors.warning,
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
                    isOffline, _, __) =>
                _buildWorkOrderDetails(
                    workOrder, currentLocation, isLocationLoading, isOffline),
            actionInProgress: (workOrder, actionType, currentLocation) =>
                ActionInProgressWidget(actionType: actionType),
            actionSuccess: (workOrder, actionType, message, _) =>
                _buildWorkOrderDetails(workOrder, null, false, false),
            error: (failure, workOrder, isOffline) =>
                WorkOrderErrorWidget(
                  message: failure.message,
                  isOffline: isOffline,
                  onRetry: () {
                    context.read<WorkOrderActionBloc>().add(
                          WorkOrderActionEvent.loadWorkOrder(widget.workOrderId),
                        );
                  },
                ),
            locationError: (workOrder, message) =>
                _buildWorkOrderDetails(workOrder, null, false, false),
          );
        },
      ),
      floatingActionButton:
          BlocBuilder<WorkOrderActionBloc, WorkOrderActionState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (workOrder, _, __, ___, ____, _____) =>
                _buildWorkOrderActionFab(workOrder),
            actionSuccess: (workOrder, _, __, ___) =>
                _buildWorkOrderActionFab(workOrder),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildWorkOrderDetails(
    WorkOrderEntity workOrder,
    LocationEntity? currentLocation,
    bool isLocationLoading,
    bool isOffline,
  ) {
    return CustomScrollView(
      slivers: [
        // App Bar with gradient background
        SliverAppBar(
          expandedHeight: 260.h,
          floating: false,
          pinned: true,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 16.sp,
              ),
            ),
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF0F5F7A),
                    Color(0xFF116587),
                    Color(0xFF00B458),
                    Color(0xFF00A74F),
                  ],
                  stops: [0.0, 0.3, 0.7, 1.0],
                ),
              ),
              child: SafeArea(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                  margin: EdgeInsets.only(top: 40.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Work Order Number and Status
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  workOrder.woNumber,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: -0.5,
                                    height: 1.1,
                                  ),
                                ),
                              ),
                              // Status Chip
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 8.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.getStatusColor(
                                          workOrder.status.name)
                                      .withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(20.r),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.3),
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  workOrder.statusDisplayName,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            workOrder.summary,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.2,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 8.h),
                          // Priority Chip
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 8.h,
                            ),
                            decoration: BoxDecoration(
                              color: _getPriorityColor(workOrder.priority)
                                  .withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            child: Text(
                              workOrder.priorityDisplayName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      // Visit Date and Duration
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            HeaderInfoChip(
                              icon: Icons.calendar_today,
                              label: 'Visit Date',
                              value: DateFormat('MMM dd, yyyy')
                                  .format(workOrder.visitDate),
                            ),
                            SizedBox(width: 12.w),
                            HeaderInfoChip(
                              icon: Icons.schedule,
                              label: 'Duration',
                              value: workOrder.durationDays > 0
                                  ? '${workOrder.durationDays} day${workOrder.durationDays != 1 ? 's' : ''}'
                                  : '0 days',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          actions: [
            HeaderActionButton(
              icon: Icons.refresh,
              onTap: () {
                context.read<WorkOrderActionBloc>().add(
                      WorkOrderActionEvent.loadWorkOrder(widget.workOrderId),
                    );
              },
            ),
            SizedBox(width: 16.w),
          ],
        ),

        // Content with expandable sections
        SliverPadding(
          padding: EdgeInsets.all(16.w),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              // Offline Indicator
              if (isOffline) ...[
                const OfflineIndicator(),
                SizedBox(height: 16.h),
              ],

              // Basic Information
              ExpandableSection(
                title: 'Work Order Information',
                icon: Icons.info_outline,
                initiallyExpanded: true,
                content: BasicInformationSection(workOrder: workOrder),
              ),

              // Description
              ExpandableSection(
                title: 'Description',
                icon: Icons.description_outlined,
                content: DescriptionSection(workOrder: workOrder),
              ),

              // Customer Information
              if (workOrder.customer != null)
                ExpandableSection(
                  title: 'Customer Contact Details',
                  icon: Icons.person_outline,
                  content: CustomerSection(customer: workOrder.customer!),
                ),

              // Machine Details
              if (workOrder.serviceRequest != null)
                ExpandableSection(
                  title: 'Machine Details',
                  icon: Icons.precision_manufacturing_outlined,
                  content:
                      MachineDetailsSection(serviceRequest: workOrder.serviceRequest!),
                ),

              // Location Information
              ExpandableSection(
                title: 'Location & GPS',
                icon: Icons.location_on_outlined,
                content: LocationSection(
                  workOrder: workOrder,
                  currentLocation: currentLocation,
                  isLocationLoading: isLocationLoading,
                ),
              ),

              // Parts Used
              if (workOrder.partsUsed.isNotEmpty)
                ExpandableSection(
                  title: 'Parts Used',
                  icon: Icons.build_outlined,
                  content: PartsUsedSection(partsUsed: workOrder.partsUsed),
                ),

              // Work Logs & Timeline
              if (workOrder.workLogs.isNotEmpty)
                ExpandableSection(
                  title: 'Work Timeline',
                  icon: Icons.timeline_outlined,
                  content: WorkTimelineSection(workLogs: workOrder.workLogs),
                ),

              // Images & Documentation
              _buildImagesSection(),

              // Add bottom padding for floating action button
              SizedBox(height: 120.h),
            ]),
          ),
        ),
      ],
    );
  }

  Color _getPriorityColor(WorkOrderPriority priority) {
    return AppColors.getPriorityColor(priority.name);
  }

  Widget _buildImagesSection() {
    return BlocBuilder<WorkOrderActionBloc, WorkOrderActionState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (_, __, ___, ____, groupedImages, _____) {
            if (groupedImages != null) {
              return WorkOrderImageGallerySection(
                groupedImages: groupedImages,
              );
            }
            return const SizedBox.shrink();
          },
          actionSuccess: (_, __, ___, groupedImages) {
            if (groupedImages != null) {
              return WorkOrderImageGallerySection(
                groupedImages: groupedImages,
              );
            }
            return const SizedBox.shrink();
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildWorkOrderActionFab(WorkOrderEntity workOrder) {
    return WorkOrderActionFab(
      workOrder: workOrder,
      onStart: () => _startWorkOrder(context, workOrder),
      onPause: () => _pauseWorkOrder(context, workOrder),
      onResume: () => _resumeWorkOrder(context, workOrder),
      onComplete: () => _completeWorkOrder(context, workOrder),
      onShowActions: () => _showWorkOrderActionsBottomSheet(workOrder),
    );
  }

  // Action methods
  void _startWorkOrder(BuildContext context, WorkOrderEntity workOrder) {
    _executeIfMounted(() {
      final state = _workOrderActionBloc?.state;
      state?.maybeWhen(
        loaded: (_, currentLocation, __, ___, ____, _____) {
          _showStartWorkOrderBottomSheet(context, workOrder, currentLocation);
        },
        actionSuccess: (workOrderEntity, actionType, message, _) {
          _showStartWorkOrderBottomSheet(context, workOrder, null);
        },
        orElse: () => _showLocationErrorDialog(context),
      );
    });
  }

  void _pauseWorkOrder(BuildContext context, WorkOrderEntity workOrder) {
    _executeIfMounted(() {
      final state = _workOrderActionBloc?.state;
      state?.maybeWhen(
        loaded: (_, currentLocation, __, ___, ____, _____) {
          _showPauseWorkOrderBottomSheet(context, workOrder, currentLocation);
        },
        actionSuccess: (workOrderEntity, actionType, message, _) {
          _showPauseWorkOrderBottomSheet(context, workOrder, null);
        },
        orElse: () => _showLocationErrorDialog(context),
      );
    });
  }

  void _resumeWorkOrder(BuildContext context, WorkOrderEntity workOrder) {
    LocationConfirmationDialog.show(
      context,
      'Resume Work Order',
      'Are you sure you want to resume this work order? Your current location will be captured.',
      () {
        _executeIfMounted(() {
          final state = _workOrderActionBloc?.state;
          state?.maybeWhen(
            loaded: (_, currentLocation, __, ___, ____, _____) {
              if (currentLocation != null) {
                _workOrderActionBloc?.add(
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
        });
      },
    );
  }

  void _completeWorkOrder(BuildContext context, WorkOrderEntity workOrder) {
    CompleteWorkOrderDialog.show(
      context,
      (workLog, completionNotes) {
        _executeIfMounted(() {
          final state = _workOrderActionBloc?.state;
          state?.maybeWhen(
            loaded: (_, currentLocation, __, ___, ____, _____) {
              if (currentLocation != null) {
                _workOrderActionBloc?.add(
                  WorkOrderActionEvent.completeWorkOrder(
                    workOrderId: workOrder.id,
                    workLog: workLog,
                    partsUsed: const [],
                    files: const [],
                    latitude: currentLocation.latitude,
                    longitude: currentLocation.longitude,
                    completionNotes: completionNotes,
                  ),
                );
              } else {
                _showLocationErrorDialog(context);
              }
            },
            orElse: () {
              _showLocationErrorDialog(context);
            },
          );
        });
      },
    );
  }

  void _rejectWorkOrder(BuildContext context, WorkOrderEntity workOrder) {
    ReasonDialog.show(
      context,
      'Reject Work Order',
      'Please provide a reason for rejecting this work order:',
      (reason) {
        _executeIfMounted(() {
          final state = _workOrderActionBloc?.state;
          state?.maybeWhen(
            loaded: (_, currentLocation, __, ___, ____, _____) {
              if (currentLocation != null) {
                _workOrderActionBloc?.add(
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
        });
      },
    );
  }

  void _showStartWorkOrderBottomSheet(
    BuildContext context,
    WorkOrderEntity workOrder,
    LocationEntity? currentLocation,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BlocProvider.value(
        value: _workOrderActionBloc!,
        child: WorkOrderStartBottomSheet(
          workOrder: workOrder,
          currentLocation: currentLocation,
        ),
      ),
    ).then((result) {
      // Handle result if needed
      if (result == true) {
        // Work order was started successfully
      }
    });
  }

  void _showPauseWorkOrderBottomSheet(
    BuildContext context,
    WorkOrderEntity workOrder,
    LocationEntity? currentLocation,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BlocProvider.value(
        value: _workOrderActionBloc!,
        child: WorkOrderPauseBottomSheet(
          workOrder: workOrder,
          currentLocation: currentLocation,
        ),
      ),
    ).then((result) {
      // Handle result if needed
      if (result == true) {
        // Work order was paused successfully
      }
    });
  }

  void _showWorkOrderActionsBottomSheet(WorkOrderEntity workOrder) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => WorkOrderActionsBottomSheet(
        workOrder: workOrder,
        onStart: () => _startWorkOrder(context, workOrder),
        onPause: () => _pauseWorkOrder(context, workOrder),
        onResume: () => _resumeWorkOrder(context, workOrder),
        onComplete: () => _completeWorkOrder(context, workOrder),
        onReject: () => _rejectWorkOrder(context, workOrder),
      ),
    );
  }

  void _showLocationErrorDialog(BuildContext context) {
    LocationErrorDialog.show(
      context,
      () {
        _executeIfMounted(() {
          _workOrderActionBloc?.add(
            WorkOrderActionEvent.loadWorkOrder(widget.workOrderId),
          );
        });
      },
    );
  }
}
