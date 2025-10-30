import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_form_sheet.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_complete_wizard.dart';
import 'package:intl/intl.dart';
import 'package:fsm/core/di/injection.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/core/widgets/fsm_app_bar.dart';
import 'package:fsm/core/widgets/fsm_section_header.dart';
import 'package:fsm/core/widgets/offline_banner.dart';
import 'package:fsm/core/widgets/status_badge.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_bloc.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_event.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_state.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_image_gallery_section.dart';

import 'package:fsm/features/work_orders/domain/entities/location_entity.dart';

// Import section components
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/sections/basic_information_section.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/sections/description_section.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/sections/customer_section.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/sections/machine_details_section.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/sections/location_section.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/sections/parts_used_section.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/sections/work_timeline_section.dart';

// Dialog components
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/dialogs/location_error_dialog.dart';

// Import widget components that may be needed for action in progress and error
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/action_in_progress_widget.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/error_widget.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/status_adaptive_actions_widget.dart';

@RoutePage()
class WorkOrderDetailsPage extends StatelessWidget {
  final int workOrderId;

  const WorkOrderDetailsPage({
    super.key,
    @PathParam('workOrderId') required this.workOrderId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WorkOrderActionBloc>(),
      child: WorkOrderDetailsView(workOrderId: workOrderId),
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
    // PopScope workaround removed - Auto Route with includePrefixMatches handles deep link stacks automatically
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
              loaded: (workOrder, currentLocation, isLocationLoading, isOffline,
                      _, __) =>
                  _buildWorkOrderDetails(
                workOrder,
                currentLocation,
                isLocationLoading,
                isOffline,
                isActionInProgress: false,
              ),
              actionInProgress: (workOrder, actionType, currentLocation) =>
                  ActionInProgressWidget(actionType: actionType),
              actionSuccess: (workOrder, actionType, message, _) =>
                  _buildWorkOrderDetails(
                workOrder,
                null,
                false,
                false,
                isActionInProgress: false,
              ),
              error: (failure, workOrder, isOffline) => WorkOrderErrorWidget(
                message: failure.message,
                isOffline: isOffline,
                onRetry: () {
                  context.read<WorkOrderActionBloc>().add(
                        WorkOrderActionEvent.loadWorkOrder(widget.workOrderId),
                      );
                },
              ),
              locationError: (workOrder, message) => _buildWorkOrderDetails(
                workOrder,
                null,
                false,
                false,
                isActionInProgress: false,
              ),
            );
          },
      ),
    );
  }

  Widget _buildWorkOrderDetails(
    WorkOrderEntity workOrder,
    LocationEntity? currentLocation,
    bool isLocationLoading,
    bool isOffline, {
    bool isActionInProgress = false,
  }) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar with gradient background using FSMSliverAppBar
          FSMSliverAppBar.gradient(
            expandedHeight: 265,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: SafeArea(
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
                              // Status Badge using shared component
                              StatusBadge.status(
                                status: workOrder.status.name,
                                variant: StatusBadgeVariant.outlined,
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            workOrder.summary,
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.9),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.2,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 8.h),
                          // Priority Badge using shared component
                          StatusBadge.priority(
                            priority: workOrder.priority.name,
                            variant: StatusBadgeVariant.outlined,
                          ),
                        ],
                      ),
                      SizedBox(height: 14.h),
                      // Visit Date and Duration - Keep custom chips for gradient background
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildHeaderInfoChip(
                              icon: Icons.calendar_today,
                              label: 'Visit Date',
                              value: DateFormat('MMM dd, yyyy')
                                  .format(workOrder.visitDate),
                            ),
                            SizedBox(width: 12.w),
                            _buildHeaderInfoChip(
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
            actions: [
              FSMAppBarAction.refresh(
                onPressed: () {
                  context.read<WorkOrderActionBloc>().add(
                        WorkOrderActionEvent.loadWorkOrder(widget.workOrderId),
                      );
                },
              ),
              SizedBox(width: 16.w),
            ],
          ),

          // Content with expandable sections using FSMCollapsibleSection
          SliverPadding(
            padding: EdgeInsets.all(16.w),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Offline Indicator using shared OfflineBanner (only shows if offline)
                if (isOffline) ...[
                  const OfflineBanner(dismissible: false),
                  SizedBox(height: 16.h),
                ],

                // Basic Information using FSMCollapsibleSection
                FSMCollapsibleSection(
                  title: 'Work Order Information',
                  initiallyExpanded: true,
                  child: BasicInformationSection(workOrder: workOrder),
                ),
                SizedBox(height: 12.h),

                // Description
                FSMCollapsibleSection(
                  title: 'Description',
                  child: DescriptionSection(workOrder: workOrder),
                ),
                SizedBox(height: 12.h),

                // Customer Information
                if (workOrder.customer != null)
                  FSMCollapsibleSection(
                    title: 'Customer Contact Details',
                    child: CustomerSection(customer: workOrder.customer!),
                  ),
                if (workOrder.customer != null) SizedBox(height: 12.h),

                // Machine Details
                if (workOrder.serviceRequest != null)
                  FSMCollapsibleSection(
                    title: 'Machine Details',
                    child: MachineDetailsSection(
                        serviceRequest: workOrder.serviceRequest!),
                  ),
                if (workOrder.serviceRequest != null) SizedBox(height: 12.h),

                // Location Information
                FSMCollapsibleSection(
                  title: 'Location & GPS',
                  child: LocationSection(
                    workOrder: workOrder,
                    currentLocation: currentLocation,
                    isLocationLoading: isLocationLoading,
                  ),
                ),
                SizedBox(height: 12.h),

                // Parts Used
                if (workOrder.partsUsed.isNotEmpty)
                  FSMCollapsibleSection(
                    title: 'Parts Used',
                    child: PartsUsedSection(partsUsed: workOrder.partsUsed),
                  ),
                if (workOrder.partsUsed.isNotEmpty) SizedBox(height: 12.h),

                // Work Logs & Timeline
                if (workOrder.workLogs.isNotEmpty)
                  FSMCollapsibleSection(
                    title: 'Work Timeline',
                    child: WorkTimelineSection(workLogs: workOrder.workLogs),
                  ),
                if (workOrder.workLogs.isNotEmpty) SizedBox(height: 12.h),

                // Images & Documentation
                _buildImagesSection(),

                // Add bottom padding before footer
                SizedBox(height: 24.h),
              ]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: StatusAdaptiveActionsWidget(
        workOrder: workOrder,
        currentLocation: currentLocation,
        isLocationLoading: isLocationLoading,
        isActionInProgress: isActionInProgress,
        onStart: () => _startWorkOrder(context, workOrder),
        onPause: () => _pauseWorkOrder(context, workOrder),
        onResume: () => _resumeWorkOrder(context, workOrder),
        onComplete: () => _completeWorkOrder(context, workOrder),
        onReject: () => _rejectWorkOrder(context, workOrder),
        onAssignToMe: () => _assignToMe(context, workOrder),
      ),
    );
  }

  /// Custom header info chip for gradient background (keeps visual consistency)
  Widget _buildHeaderInfoChip({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 14.sp,
          ),
          SizedBox(width: 6.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.8),
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                value,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ],
      ),
    );
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

  /// Build FAB using FSMActionButton or FSMMultiActionButton based on available actions

  // Action methods (unchanged - preserve all business logic)
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
    _executeIfMounted(() {
      final state = _workOrderActionBloc?.state;
      state?.maybeWhen(
        loaded: (_, currentLocation, __, ___, ____, _____) {
          WorkOrderFormSheet.show(
            context: context,
            action: WorkOrderAction.resume,
            workOrder: workOrder,
            location: currentLocation,
          );
        },
        actionSuccess: (workOrderEntity, actionType, message, _) {
          WorkOrderFormSheet.show(
            context: context,
            action: WorkOrderAction.resume,
            workOrder: workOrder,
            location: null,
          );
        },
        orElse: () => _showLocationErrorDialog(context),
      );
    });
  }

  void _completeWorkOrder(BuildContext context, WorkOrderEntity workOrder) {
    _executeIfMounted(() {
      final state = _workOrderActionBloc?.state;
      state?.maybeWhen(
        loaded: (_, currentLocation, __, ___, ____, _____) {
          WorkOrderCompleteWizard.show(
            context: context,
            workOrder: workOrder,
            location: currentLocation,
          );
        },
        actionSuccess: (workOrderEntity, actionType, message, _) {
          WorkOrderCompleteWizard.show(
            context: context,
            workOrder: workOrder,
            location: null,
          );
        },
        orElse: () => _showLocationErrorDialog(context),
      );
    });
  }

  void _rejectWorkOrder(BuildContext context, WorkOrderEntity workOrder) {
    _executeIfMounted(() {
      final state = _workOrderActionBloc?.state;
      state?.maybeWhen(
        loaded: (_, currentLocation, __, ___, ____, _____) {
          WorkOrderFormSheet.show(
            context: context,
            action: WorkOrderAction.reject,
            workOrder: workOrder,
            location: currentLocation,
          );
        },
        actionSuccess: (workOrderEntity, actionType, message, _) {
          WorkOrderFormSheet.show(
            context: context,
            action: WorkOrderAction.reject,
            workOrder: workOrder,
            location: null,
          );
        },
        orElse: () => _showLocationErrorDialog(context),
      );
    });
  }

  void _showStartWorkOrderBottomSheet(
    BuildContext context,
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

  void _showPauseWorkOrderBottomSheet(
    BuildContext context,
    WorkOrderEntity workOrder,
    LocationEntity? currentLocation,
  ) {
    WorkOrderFormSheet.show(
      context: context,
      action: WorkOrderAction.pause,
      workOrder: workOrder,
      location: currentLocation,
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

  void _assignToMe(BuildContext context, WorkOrderEntity workOrder) {
    _executeIfMounted(() {
      // Show a confirmation dialog before assigning to self
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Assign to Me'),
          content: Text(
            'Are you sure you want to assign "${workOrder.woNumber}" to yourself?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // TODO: Implement assignToMe event in BLoC
                // _workOrderActionBloc?.add(
                //   WorkOrderActionEvent.assignToMe(workOrder.id),
                // );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Work order assigned to you'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: const Text('Assign'),
            ),
          ],
        ),
      );
    });
  }
}
