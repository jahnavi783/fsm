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

import 'package:fsm/features/work_orders/domain/entities/location_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/work_log_entity.dart';

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
            actionSuccess: (workOrder, actionType, message) {
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
      floatingActionButton:
          BlocBuilder<WorkOrderActionBloc, WorkOrderActionState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (workOrder, _, __, ___) =>
                _buildWorkOrderActionFab(workOrder),
            actionSuccess: (workOrder, _, __) =>
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
                            _buildHeaderInfoChip(
                              Icons.calendar_today,
                              'Visit Date',
                              DateFormat('MMM dd, yyyy')
                                  .format(workOrder.visitDate),
                            ),
                            SizedBox(width: 12.w),
                            _buildHeaderInfoChip(
                              Icons.schedule,
                              'Duration',
                              workOrder.durationDays > 0
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
            _buildHeaderAction(
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
                _buildOfflineIndicator(),
                SizedBox(height: 16.h),
              ],

              // Basic Information
              _buildExpandableSection(
                title: 'Work Order Information',
                icon: Icons.info_outline,
                initiallyExpanded: true,
                content: _buildBasicInformation(workOrder),
              ),

              // Description
              _buildExpandableSection(
                title: 'Description',
                icon: Icons.description_outlined,
                content: _buildDescriptionSection(workOrder),
              ),

              // Customer Information
              if (workOrder.customer != null)
                _buildExpandableSection(
                  title: 'Customer Contact Details',
                  icon: Icons.person_outline,
                  content: _buildCustomerSection(workOrder.customer!),
                ),

              // Machine Details
              if (workOrder.serviceRequest != null)
                _buildExpandableSection(
                  title: 'Machine Details',
                  icon: Icons.precision_manufacturing_outlined,
                  content:
                      _buildMachineDetailsSection(workOrder.serviceRequest!),
                ),

              // Location Information
              _buildExpandableSection(
                title: 'Location & GPS',
                icon: Icons.location_on_outlined,
                content: _buildLocationSection(
                    workOrder, currentLocation, isLocationLoading),
              ),

              // Parts Used
              if (workOrder.partsUsed.isNotEmpty)
                _buildExpandableSection(
                  title: 'Parts Used',
                  icon: Icons.build_outlined,
                  content: _buildPartsUsedSection(workOrder.partsUsed),
                ),

              // Work Logs & Timeline
              if (workOrder.workLogs.isNotEmpty)
                _buildExpandableSection(
                  title: 'Work Timeline',
                  icon: Icons.timeline_outlined,
                  content: _buildWorkTimelineSection(workOrder.workLogs),
                ),

              // Add bottom padding for floating action button
              SizedBox(height: 120.h),
            ]),
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderAction({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 18.sp,
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderInfoChip(IconData icon, String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
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
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
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
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableSection({
    required String title,
    required IconData icon,
    required Widget content,
    bool initiallyExpanded = false,
  }) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.h),
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          initiallyExpanded: initiallyExpanded,
          leading: Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              icon,
              color: AppColors.primary,
              size: 20.sp,
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          children: [
            Padding(
              padding: EdgeInsets.all(16.w),
              child: content,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicInformation(WorkOrderEntity workOrder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: _buildInfoItem(
                'Job ID',
                workOrder.woNumber,
                Icons.tag,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildInfoItem(
                'Ticket ID',
                'SR-${workOrder.srId.toString().padLeft(12, '0')}',
                Icons.request_page,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: _buildInfoItem(
                'Service Type',
                workOrder.serviceRequest?.srType ?? 'repair',
                Icons.build_circle_outlined,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildInfoItem(
                'Priority',
                workOrder.priorityDisplayName,
                Icons.priority_high,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        _buildInfoItem(
          'Status',
          workOrder.statusDisplayName,
          Icons.info_outline,
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: _buildInfoItem(
                'Created',
                DateFormat('MMM dd, yyyy HH:mm').format(workOrder.createdAt),
                Icons.schedule,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildInfoItem(
                'Duration',
                '${workOrder.durationDays} day${workOrder.durationDays != 1 ? 's' : ''}',
                Icons.timelapse,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDescriptionSection(WorkOrderEntity workOrder) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          workOrder.problemDescription.isNotEmpty
              ? workOrder.problemDescription
              : 'No description available',
          style: theme.textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildCustomerSection(dynamic customer) {
    return Column(
      children: [
        _buildInfoItem(
          'Customer Name',
          customer.name ?? 'N/A',
          Icons.person,
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Expanded(
              child: _buildInfoItem(
                'Location',
                customer.city ?? customer.address ?? 'N/A',
                Icons.location_on,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildInfoItem(
                'Postal Code',
                customer.postalCode ?? 'N/A',
                Icons.local_post_office,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMachineDetailsSection(dynamic serviceRequest) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildInfoItem(
                'Machine Serial',
                serviceRequest.machineSerial ?? 'N/A',
                Icons.qr_code,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildInfoItem(
                'Model',
                serviceRequest.model ?? 'Power Adapter',
                Icons.devices,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        _buildInfoItem(
          'Machine on Warranty',
          serviceRequest.underWarranty ?? 'Warranty Exceeded',
          Icons.verified_user_outlined,
        ),
      ],
    );
  }

  Widget _buildLocationSection(
    WorkOrderEntity workOrder,
    LocationEntity? currentLocation,
    bool isLocationLoading,
  ) {
    final theme = Theme.of(context);
    return Column(
      children: [
        _buildInfoItem(
          'Address',
          workOrder.location,
          Icons.location_on,
        ),
        SizedBox(height: 8.h),
        if (currentLocation != null) ...[
          _buildInfoItem(
            'Current GPS',
            '${currentLocation.latitude.toStringAsFixed(6)}, ${currentLocation.longitude.toStringAsFixed(6)}',
            Icons.gps_fixed,
          ),
          SizedBox(height: 8.h),
          _buildInfoItem(
            'Accuracy',
            '${currentLocation.accuracy?.toStringAsFixed(1)}m',
            Icons.my_location,
          ),
        ] else if (isLocationLoading) ...[
          Row(
            children: [
              Icon(
                Icons.gps_fixed,
                size: 16.sp,
                color: theme.colorScheme.onSurface.withOpacity(0.6),
              ),
              SizedBox(width: 8.w),
              Text(
                'Getting current location...',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
              SizedBox(width: 8.w),
              SizedBox(
                width: 16.w,
                height: 16.h,
                child: const CircularProgressIndicator(strokeWidth: 2),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildPartsUsedSection(List<PartUsedEntity> partsUsed) {
    return Column(
      children: partsUsed
          .map((part) => Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: _buildPartItem(part),
              ))
          .toList(),
    );
  }

  Widget _buildWorkTimelineSection(List<WorkLogEntity> workLogs) {
    return Column(
      children: workLogs
          .map((log) => Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: _buildTimelineItem(log),
              ))
          .toList(),
    );
  }

  Widget _buildInfoItem(String label, String value, IconData icon) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: AppColors.outline.withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16.sp,
            color: theme.colorScheme.primary,
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
                    fontWeight: FontWeight.w500,
                    color: theme.colorScheme.onSurface.withOpacity(0.7),
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(height: 2.h),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOfflineIndicator() {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Colors.orange.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.wifi_off,
            color: Colors.orange,
            size: 20.sp,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              'You are currently offline. Changes will sync when connection is restored.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.orange.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkOrderActionFab(WorkOrderEntity workOrder) {
    // Determine primary action based on work order state
    String label;
    IconData icon;
    Color backgroundColor;
    VoidCallback? onPressed;

    if (workOrder.canBeStarted) {
      label = 'Start Job';
      icon = Icons.play_arrow;
      backgroundColor = AppColors.success;
      onPressed = () => _startWorkOrder(context, workOrder);
    } else if (workOrder.canBePaused) {
      label = 'Pause Job';
      icon = Icons.pause;
      backgroundColor = AppColors.warning;
      onPressed = () => _pauseWorkOrder(context, workOrder);
    } else if (workOrder.canBeResumed) {
      label = 'Resume Job';
      icon = Icons.play_arrow;
      backgroundColor = AppColors.success;
      onPressed = () => _resumeWorkOrder(context, workOrder);
    } else if (workOrder.canBeCompleted) {
      label = 'Complete Job';
      icon = Icons.check_circle;
      backgroundColor = AppColors.primary;
      onPressed = () => _completeWorkOrder(context, workOrder);
    } else {
      // Show actions menu for other states
      label = 'Actions';
      icon = Icons.more_vert;
      backgroundColor = AppColors.primary;
      onPressed = () => _showWorkOrderActionsBottomSheet(workOrder);
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

  void _showWorkOrderActionsBottomSheet(WorkOrderEntity workOrder) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
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
                      if (workOrder.canBeStarted)
                        _buildActionTile(
                          icon: Icons.play_arrow,
                          title: 'Start Work Order',
                          subtitle: 'Begin working on this order',
                          color: AppColors.success,
                          onTap: () {
                            Navigator.pop(context);
                            _startWorkOrder(context, workOrder);
                          },
                        ),
                      if (workOrder.canBePaused)
                        _buildActionTile(
                          icon: Icons.pause,
                          title: 'Pause Work Order',
                          subtitle: 'Temporarily pause work',
                          color: AppColors.warning,
                          onTap: () {
                            Navigator.pop(context);
                            _pauseWorkOrder(context, workOrder);
                          },
                        ),
                      if (workOrder.canBeResumed)
                        _buildActionTile(
                          icon: Icons.play_arrow,
                          title: 'Resume Work Order',
                          subtitle: 'Continue working',
                          color: AppColors.success,
                          onTap: () {
                            Navigator.pop(context);
                            _resumeWorkOrder(context, workOrder);
                          },
                        ),
                      if (workOrder.canBeCompleted)
                        _buildActionTile(
                          icon: Icons.check_circle,
                          title: 'Complete Work Order',
                          subtitle: 'Mark as completed',
                          color: AppColors.primary,
                          onTap: () {
                            Navigator.pop(context);
                            _completeWorkOrder(context, workOrder);
                          },
                        ),
                      if (workOrder.canBeRejected)
                        _buildActionTile(
                          icon: Icons.close,
                          title: 'Reject Work Order',
                          subtitle: 'Reject this work order',
                          color: AppColors.error,
                          onTap: () {
                            Navigator.pop(context);
                            _rejectWorkOrder(context, workOrder);
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
      ),
    );
  }

  Widget _buildActionTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        width: 48.w,
        height: 48.w,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Icon(
          icon,
          color: color,
          size: 24.sp,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 14.sp,
          color: Colors.grey[600],
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16.sp,
        color: Colors.grey[400],
      ),
      onTap: onTap,
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
                  log.description.isNotEmpty
                      ? log.description
                      : 'Work Log Entry',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                if (log.notes?.isNotEmpty == true) ...[
                  SizedBox(height: 4.h),
                  Text(
                    log.notes!,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                ],
                SizedBox(height: 4.h),
                Text(
                  DateFormat('MMM dd, yyyy HH:mm').format(log.timestamp),
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: theme.colorScheme.onSurface.withOpacity(0.5),
                  ),
                ),
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
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                if (part.description?.isNotEmpty == true) ...[
                  SizedBox(height: 2.h),
                  Text(
                    part.description!,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                ],
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

  Color _getPriorityColor(WorkOrderPriority priority) {
    return AppColors.getPriorityColor(priority.name);
  }

  // Action methods from original file
  void _startWorkOrder(BuildContext context, WorkOrderEntity workOrder) {
    _executeIfMounted(() {
      final state = _workOrderActionBloc?.state;
      state?.maybeWhen(
        loaded: (_, currentLocation, __, ___) {
          _showStartWorkOrderBottomSheet(context, workOrder, currentLocation);
        },
        actionSuccess: (workOrderEntity, actionType, message) {
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
        loaded: (_, currentLocation, __, ___) {
          _showPauseWorkOrderBottomSheet(context, workOrder, currentLocation);
        },
        actionSuccess: (workOrderEntity, actionType, message) {
          _showPauseWorkOrderBottomSheet(context, workOrder, null);
        },
        orElse: () => _showLocationErrorDialog(context),
      );
    });
  }

  void _resumeWorkOrder(BuildContext context, WorkOrderEntity workOrder) {
    _showLocationConfirmationDialog(
      context,
      'Resume Work Order',
      'Are you sure you want to resume this work order? Your current location will be captured.',
      () {
        _executeIfMounted(() {
          final state = _workOrderActionBloc?.state;
          state?.maybeWhen(
            loaded: (_, currentLocation, __, ___) {
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
    _showCompleteWorkOrderDialog(context, workOrder);
  }

  void _rejectWorkOrder(BuildContext context, WorkOrderEntity workOrder) {
    _showReasonDialog(
      context,
      'Reject Work Order',
      'Please provide a reason for rejecting this work order:',
      (reason) {
        _executeIfMounted(() {
          final state = _workOrderActionBloc?.state;
          state?.maybeWhen(
            loaded: (_, currentLocation, __, ___) {
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

  void _showLocationConfirmationDialog(
    BuildContext context,
    String title,
    String message,
    VoidCallback onConfirm,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          message,
          style: TextStyle(
            fontSize: 14.sp,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: TextButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      side: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .outline
                            .withOpacity(0.5),
                      ),
                    ),
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.8),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    onConfirm();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    elevation: 2,
                  ),
                  child: Text(
                    'Start',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
        actionsPadding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
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
                labelText: 'Reason',
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
              if (reasonController.text.trim().isNotEmpty) {
                Navigator.of(context).pop();
                onSubmit(reasonController.text.trim());
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  void _showCompleteWorkOrderDialog(
      BuildContext context, WorkOrderEntity workOrder) {
    final TextEditingController workLogController = TextEditingController();
    final TextEditingController completionNotesController =
        TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Complete Work Order'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: workLogController,
                decoration: const InputDecoration(
                  labelText: 'Work Log (Optional)',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 16.h),
              TextField(
                controller: completionNotesController,
                decoration: const InputDecoration(
                  labelText: 'Completion Notes (Optional)',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
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
              Navigator.of(context).pop();
              _executeIfMounted(() {
                final state = _workOrderActionBloc?.state;
                state?.maybeWhen(
                  loaded: (_, currentLocation, __, ___) {
                    if (currentLocation != null) {
                      _workOrderActionBloc?.add(
                        WorkOrderActionEvent.completeWorkOrder(
                          workOrderId: workOrder.id,
                          workLog: workLogController.text.trim(),
                          partsUsed: const [],
                          files: const [],
                          latitude: currentLocation.latitude,
                          longitude: currentLocation.longitude,
                          completionNotes:
                              completionNotesController.text.trim(),
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
            child: const Text('Complete'),
          ),
        ],
      ),
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

  void _showLocationErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.location_off, color: Colors.red, size: 24.sp),
            SizedBox(width: 8.w),
            const Text('Location Required'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location access is required to perform work order actions. Please ensure:',
              style: TextStyle(fontSize: 14.sp),
            ),
            SizedBox(height: 12.h),
            Text(
              '• Location services are enabled',
              style: TextStyle(fontSize: 13.sp, color: Colors.grey[600]),
            ),
            Text(
              '• App has location permissions',
              style: TextStyle(fontSize: 13.sp, color: Colors.grey[600]),
            ),
            Text(
              '• GPS signal is available',
              style: TextStyle(fontSize: 13.sp, color: Colors.grey[600]),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).pop();
              _executeIfMounted(() {
                _workOrderActionBloc?.add(
                  WorkOrderActionEvent.loadWorkOrder(widget.workOrderId),
                );
              });
            },
            icon: Icon(Icons.refresh, size: 18.sp),
            label: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
