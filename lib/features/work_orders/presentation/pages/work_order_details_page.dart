// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fsm/core/di/injection.dart';
// import 'package:fsm/core/theme/design_tokens.dart';
// import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';
// import 'package:fsm/core/theme/spacing_theme.dart';
// import 'package:fsm/core/widgets/fsm_app_bar.dart';
// import 'package:fsm/core/widgets/layout/fsm_section_header.dart';
// import 'package:fsm/core/widgets/offline_banner.dart';
// import 'package:fsm/core/widgets/status_badge.dart';
// import 'package:fsm/features/work_orders/domain/entities/location_entity.dart';
// import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
// import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_bloc.dart';
// import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_event.dart';
// import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_state.dart';
// import 'package:fsm/features/work_orders/presentation/widgets/work_order_complete_wizard.dart';
// // Import widget components that may be needed for action in progress and error
// import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/action_in_progress_widget.dart';
// // Dialog components
// import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/dialogs/location_error_dialog.dart';
// import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/error_widget.dart';
// // Import section components
// import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/sections/basic_information_section.dart';
// import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/sections/customer_section.dart';
// import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/sections/description_section.dart';
// import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/sections/location_section.dart';
// import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/sections/machine_details_section.dart';
// import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/sections/parts_used_section.dart';
// import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/sections/work_timeline_section.dart';
// import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/status_adaptive_actions_widget.dart';
// import 'package:fsm/features/work_orders/presentation/widgets/work_order_form_sheet.dart';
// import 'package:fsm/features/work_orders/presentation/widgets/work_order_image_gallery_section.dart';
// import 'package:intl/intl.dart';
//
// @RoutePage()
// class WorkOrderDetailsPage extends StatelessWidget {
//   final int workOrderId;
//
//   const WorkOrderDetailsPage({
//     super.key,
//     @PathParam('workOrderId') required this.workOrderId,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => getIt<WorkOrderActionBloc>(),
//       child: WorkOrderDetailsView(workOrderId: workOrderId),
//     );
//   }
// }
//
// class WorkOrderDetailsView extends StatefulWidget {
//   final int workOrderId;
//
//   const WorkOrderDetailsView({
//     super.key,
//     required this.workOrderId,
//   });
//
//   @override
//   State<WorkOrderDetailsView> createState() => _WorkOrderDetailsViewState();
// }
//
// class _WorkOrderDetailsViewState extends State<WorkOrderDetailsView> {
//   WorkOrderActionBloc? _workOrderActionBloc;
//
//   @override
//   void initState() {
//     super.initState();
//     context.read<WorkOrderActionBloc>().add(
//           WorkOrderActionEvent.loadWorkOrder(widget.workOrderId),
//         );
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _workOrderActionBloc = context.read<WorkOrderActionBloc>();
//   }
//
//   /// Helper method to safely execute operations when widget is still mounted
//   bool _executeIfMounted(VoidCallback callback) {
//     if (!mounted) return false;
//     callback();
//     return true;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // PopScope workaround removed - Auto Route with includePrefixMatches handles deep link stacks automatically
//     return Scaffold(
//       body: BlocConsumer<WorkOrderActionBloc, WorkOrderActionState>(
//         listener: (context, state) {
//           state.maybeWhen(
//             actionSuccess: (workOrder, actionType, message, _) {
//               final fsmTheme = context.fsmTheme;
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text(message),
//                   backgroundColor: fsmTheme.success,
//                 ),
//               );
//             },
//             error: (failure, workOrder, isOffline) {
//               final theme = Theme.of(context);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text(failure.message),
//                   backgroundColor: theme.colorScheme.error,
//                 ),
//               );
//             },
//             locationError: (workOrder, message) {
//               final fsmTheme = context.fsmTheme;
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text(message),
//                   backgroundColor: fsmTheme.warning,
//                 ),
//               );
//             },
//             orElse: () {},
//           );
//         },
//         builder: (context, state) {
//           return state.when(
//             initial: () => const Center(child: CircularProgressIndicator()),
//             loading: () => const Center(child: CircularProgressIndicator()),
//             loaded: (workOrder, currentLocation, isLocationLoading, isOffline,
//                     _, __) =>
//                 _buildWorkOrderDetails(
//               workOrder,
//               currentLocation,
//               isLocationLoading,
//               isOffline,
//               isActionInProgress: false,
//             ),
//             actionInProgress: (workOrder, actionType, currentLocation) =>
//                 ActionInProgressWidget(actionType: actionType),
//             actionSuccess: (workOrder, actionType, message, _) =>
//                 _buildWorkOrderDetails(
//               workOrder,
//               null,
//               false,
//               false,
//               isActionInProgress: false,
//             ),
//             error: (failure, workOrder, isOffline) => WorkOrderErrorWidget(
//               message: failure.message,
//               isOffline: isOffline,
//               onRetry: () {
//                 context.read<WorkOrderActionBloc>().add(
//                       WorkOrderActionEvent.loadWorkOrder(widget.workOrderId),
//                     );
//               },
//             ),
//             locationError: (workOrder, message) => _buildWorkOrderDetails(
//               workOrder,
//               null,
//               false,
//               false,
//               isActionInProgress: false,
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildWorkOrderDetails(
//     WorkOrderEntity workOrder,
//     LocationEntity? currentLocation,
//     bool isLocationLoading,
//     bool isOffline, {
//     bool isActionInProgress = false,
//   }) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           // App Bar with gradient background using FSMSliverAppBar
//           // Uses standardized 120.0 height for consistency across all screens
//           FSMSliverAppBar.gradient(
//             pinned: true,
//             flexibleSpace: FlexibleSpaceBar(
//               background: SafeArea(
//                 child: Container(
//                   padding: REdgeInsets.symmetric(
//                     horizontal: DesignTokens.space5,
//                     vertical: DesignTokens.space3,
//                   ),
//                   margin: REdgeInsets.only(top: DesignTokens.space10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       // Work Order Number and Status
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                   workOrder.woNumber,
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .headlineSmall
//                                       ?.copyWith(
//                                         color: Theme.of(context)
//                                             .colorScheme
//                                             .onPrimary,
//                                         fontWeight: DesignTokens.fontWeightBold,
//                                         letterSpacing: -0.5,
//                                         height: 1.1,
//                                       ),
//                                 ),
//                               ),
//                               // Status Badge using shared component
//                               StatusBadge.status(
//                                 status: workOrder.status.name,
//                                 variant: StatusBadgeVariant.outlined,
//                               ),
//                             ],
//                           ),
//                           DesignTokens.verticalSpaceSmall,
//                           Text(
//                             workOrder.summary,
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .bodyMedium
//                                 ?.copyWith(
//                                   color: Theme.of(context)
//                                       .colorScheme
//                                       .onPrimary
//                                       .withValues(alpha: 0.9),
//                                   fontWeight: DesignTokens.fontWeightMedium,
//                                   letterSpacing: 0.2,
//                                 ),
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           DesignTokens.verticalSpaceSmall,
//                           // Priority Badge using shared component
//                           StatusBadge.priority(
//                             priority: workOrder.priority.name,
//                             variant: StatusBadgeVariant.outlined,
//                           ),
//                         ],
//                       ),
//                       RSizedBox(height: DesignTokens.space4),
//                       // Visit Date and Duration - Keep custom chips for gradient background
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           children: [
//                             _buildHeaderInfoChip(
//                               icon: Icons.calendar_today,
//                               label: 'Visit Date',
//                               value: DateFormat('MMM dd, yyyy')
//                                   .format(workOrder.visitDate),
//                             ),
//                             RSizedBox(width: DesignTokens.space3),
//                             _buildHeaderInfoChip(
//                               icon: Icons.schedule,
//                               label: 'Estimation Time',
//                               value: workOrder.durationDays > 0
//                                   ? '${workOrder.durationDays} day${workOrder.durationDays != 1 ? 's' : ''}'
//                                   : '0 days',
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             actions: [
//               FSMAppBarAction.refresh(
//                 onPressed: _handleRefresh,
//               ),
//               RSizedBox(width: DesignTokens.space4),
//             ],
//           ),
//
//           // Content with expandable sections using FSMCollapsibleSection
//           SliverPadding(
//             padding: REdgeInsets.all(DesignTokens.space4),
//             sliver: SliverList(
//               delegate: SliverChildListDelegate([
//                 // Offline Indicator using shared OfflineBanner (only shows if offline)
//                 if (isOffline) ...[
//                   const OfflineBanner(dismissible: false),
//                   DesignTokens.verticalSpaceMedium,
//                 ],
//
//                 // Basic Information using FSMCollapsibleSection
//                 FSMCollapsibleSection(
//                   title: 'Work Order Information',
//                   initiallyExpanded: true,
//                   child: BasicInformationSection(workOrder: workOrder),
//                 ),
//                 DesignTokens.verticalSpace(DesignTokens.space3),
//
//                 // Description
//                 FSMCollapsibleSection(
//                   title: 'Description',
//                   child: DescriptionSection(workOrder: workOrder),
//                 ),
//                 DesignTokens.verticalSpace(DesignTokens.space3),
//
//                 // Customer Information
//                 if (workOrder.customer != null)
//                   FSMCollapsibleSection(
//                     title: 'Customer Contact Details',
//                     child: CustomerSection(customer: workOrder.customer!),
//                   ),
//                 if (workOrder.customer != null)
//                   DesignTokens.verticalSpace(DesignTokens.space3),
//
//                 // Machine Details
//                 if (workOrder.serviceRequest != null)
//                   FSMCollapsibleSection(
//                     title: 'Machine Details',
//                     child: MachineDetailsSection(
//                         serviceRequest: workOrder.serviceRequest!),
//                   ),
//                 if (workOrder.serviceRequest != null)
//                   DesignTokens.verticalSpace(DesignTokens.space3),
//
//                 // Location Information
//                 FSMCollapsibleSection(
//                   title: 'Location & GPS',
//                   child: LocationSection(
//                     workOrder: workOrder,
//                     currentLocation: currentLocation,
//                     isLocationLoading: isLocationLoading,
//                   ),
//                 ),
//                 DesignTokens.verticalSpace(DesignTokens.space3),
//
//                 // Parts Used
//                 if (workOrder.partsUsed.isNotEmpty)
//                   FSMCollapsibleSection(
//                     title: 'Parts Used',
//                     child: PartsUsedSection(partsUsed: workOrder.partsUsed),
//                   ),
//                 if (workOrder.partsUsed.isNotEmpty)
//                   DesignTokens.verticalSpace(DesignTokens.space3),
//
//                 // Work Logs & Timeline
//                 if (workOrder.workLogs.isNotEmpty)
//                   FSMCollapsibleSection(
//                     title: 'Work Timeline',
//                     child: WorkTimelineSection(workLogs: workOrder.workLogs),
//                   ),
//                 if (workOrder.workLogs.isNotEmpty)
//                   DesignTokens.verticalSpace(DesignTokens.space3),
//
//                 // Images & Documentation
//                 _buildImagesSection(),
//
//                 // Add bottom padding before footer
//                 DesignTokens.verticalSpaceLarge,
//               ]),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: StatusAdaptiveActionsWidget(
//         workOrder: workOrder,
//         currentLocation: currentLocation,
//         isLocationLoading: isLocationLoading,
//         isActionInProgress: isActionInProgress,
//         onStart: () => _startWorkOrder(context, workOrder),
//         onPause: () => _pauseWorkOrder(context, workOrder),
//         onResume: () => _resumeWorkOrder(context, workOrder),
//         onComplete: () => _completeWorkOrder(context, workOrder),
//         onReject: () => _rejectWorkOrder(context, workOrder),
//         onAssignToMe: () => _assignToMe(context, workOrder),
//       ),
//     );
//   }
//
//   /// Custom header info chip for gradient background (keeps visual consistency)
//   Widget _buildHeaderInfoChip({
//     required IconData icon,
//     required String label,
//     required String value,
//   }) {
//     final theme = Theme.of(context);
//     final spacing = context.spacing;
//
//     return Container(
//       padding: REdgeInsets.symmetric(
//         horizontal: DesignTokens.space3,
//         vertical: DesignTokens.space2,
//       ),
//       decoration: BoxDecoration(
//         color: theme.colorScheme.onPrimary.withValues(alpha: 0.15),
//         borderRadius: BorderRadius.circular(spacing.radiusMd.r),
//         border: Border.all(
//           color: theme.colorScheme.onPrimary.withValues(alpha: 0.2),
//           width: DesignTokens.borderWidthThin,
//         ),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(
//             icon,
//             color: theme.colorScheme.onPrimary,
//             size: DesignTokens.iconXs.sp,
//           ),
//           RSizedBox(width: DesignTokens.space2),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 label,
//                 style: theme.textTheme.labelSmall?.copyWith(
//                   color: theme.colorScheme.onPrimary.withValues(alpha: 0.8),
//                   fontWeight: DesignTokens.fontWeightMedium,
//                 ),
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 1,
//               ),
//               Text(
//                 value,
//                 style: theme.textTheme.labelMedium?.copyWith(
//                   color: theme.colorScheme.onPrimary,
//                   fontWeight: DesignTokens.fontWeightSemiBold,
//                 ),
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 1,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildImagesSection() {
//     return BlocBuilder<WorkOrderActionBloc, WorkOrderActionState>(
//       builder: (context, state) {
//         return state.maybeWhen(
//           loaded: (_, __, ___, ____, groupedImages, _____) {
//             if (groupedImages != null) {
//               return WorkOrderImageGallerySection(
//                 groupedImages: groupedImages,
//               );
//             }
//             return const SizedBox.shrink();
//           },
//           actionSuccess: (_, __, ___, groupedImages) {
//             if (groupedImages != null) {
//               return WorkOrderImageGallerySection(
//                 groupedImages: groupedImages,
//               );
//             }
//             return const SizedBox.shrink();
//           },
//           orElse: () => const SizedBox.shrink(),
//         );
//       },
//     );
//   }
//
//   /// Build FAB using FSMActionButton or FSMMultiActionButton based on available actions
//
//   // Action methods (unchanged - preserve all business logic)
//   void _startWorkOrder(BuildContext context, WorkOrderEntity workOrder) {
//     _executeIfMounted(() {
//       final state = _workOrderActionBloc?.state;
//       state?.maybeWhen(
//         loaded: (_, currentLocation, __, ___, ____, _____) {
//           _showStartWorkOrderBottomSheet(context, workOrder, currentLocation);
//         },
//         actionSuccess: (workOrderEntity, actionType, message, _) {
//           _showStartWorkOrderBottomSheet(context, workOrder, null);
//         },
//         orElse: () => _showLocationErrorDialog(context),
//       );
//     });
//   }
//
//   void _pauseWorkOrder(BuildContext context, WorkOrderEntity workOrder) {
//     _executeIfMounted(() {
//       final state = _workOrderActionBloc?.state;
//       state?.maybeWhen(
//         loaded: (_, currentLocation, __, ___, ____, _____) {
//           _showPauseWorkOrderBottomSheet(context, workOrder, currentLocation);
//         },
//         actionSuccess: (workOrderEntity, actionType, message, _) {
//           _showPauseWorkOrderBottomSheet(context, workOrder, null);
//         },
//         orElse: () => _showLocationErrorDialog(context),
//       );
//     });
//   }
//
//   void _resumeWorkOrder(BuildContext context, WorkOrderEntity workOrder) {
//     _executeIfMounted(() {
//       final state = _workOrderActionBloc?.state;
//       state?.maybeWhen(
//         loaded: (_, currentLocation, __, ___, ____, _____) {
//           WorkOrderFormSheet.show(
//             context: context,
//             action: WorkOrderAction.resume,
//             workOrder: workOrder,
//             location: currentLocation,
//           );
//         },
//         actionSuccess: (workOrderEntity, actionType, message, _) {
//           WorkOrderFormSheet.show(
//             context: context,
//             action: WorkOrderAction.resume,
//             workOrder: workOrder,
//             location: null,
//           );
//         },
//         orElse: () => _showLocationErrorDialog(context),
//       );
//     });
//   }
//
//   void _completeWorkOrder(BuildContext context, WorkOrderEntity workOrder) {
//     _executeIfMounted(() {
//       final state = _workOrderActionBloc?.state;
//       state?.maybeWhen(
//         loaded: (_, currentLocation, __, ___, ____, _____) {
//           WorkOrderCompleteWizard.show(
//             context: context,
//             workOrder: workOrder,
//             location: currentLocation,
//           );
//         },
//         actionSuccess: (workOrderEntity, actionType, message, _) {
//           WorkOrderCompleteWizard.show(
//             context: context,
//             workOrder: workOrder,
//             location: null,
//           );
//         },
//         orElse: () => _showLocationErrorDialog(context),
//       );
//     });
//   }
//
//   void _rejectWorkOrder(BuildContext context, WorkOrderEntity workOrder) {
//     _executeIfMounted(() {
//       final state = _workOrderActionBloc?.state;
//       state?.maybeWhen(
//         loaded: (_, currentLocation, __, ___, ____, _____) {
//           WorkOrderFormSheet.show(
//             context: context,
//             action: WorkOrderAction.reject,
//             workOrder: workOrder,
//             location: currentLocation,
//           );
//         },
//         actionSuccess: (workOrderEntity, actionType, message, _) {
//           WorkOrderFormSheet.show(
//             context: context,
//             action: WorkOrderAction.reject,
//             workOrder: workOrder,
//             location: null,
//           );
//         },
//         orElse: () => _showLocationErrorDialog(context),
//       );
//     });
//   }
//
//   void _showStartWorkOrderBottomSheet(
//     BuildContext context,
//     WorkOrderEntity workOrder,
//     LocationEntity? currentLocation,
//   ) {
//     WorkOrderFormSheet.show(
//       context: context,
//       action: WorkOrderAction.start,
//       workOrder: workOrder,
//       location: currentLocation,
//     );
//   }
//
//   void _showPauseWorkOrderBottomSheet(
//     BuildContext context,
//     WorkOrderEntity workOrder,
//     LocationEntity? currentLocation,
//   ) {
//     WorkOrderFormSheet.show(
//       context: context,
//       action: WorkOrderAction.pause,
//       workOrder: workOrder,
//       location: currentLocation,
//     );
//   }
//
//   void _showLocationErrorDialog(BuildContext context) {
//     LocationErrorDialog.show(
//       context,
//       () {
//         _executeIfMounted(() {
//           _workOrderActionBloc?.add(
//             WorkOrderActionEvent.loadWorkOrder(widget.workOrderId),
//           );
//         });
//       },
//     );
//   }
//
//   void _assignToMe(BuildContext context, WorkOrderEntity workOrder) {
//     _executeIfMounted(() {
//       // Show a confirmation dialog before assigning to self
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: const Text('Assign to Me'),
//           content: Text(
//             'Are you sure you want to assign "${workOrder.woNumber}" to yourself?',
//           ),
//           actions: [
//             TextButton(
//               onPressed: _handleAssignCancel,
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: _handleAssignToMe,
//               child: const Text('Assign'),
//             ),
//           ],
//         ),
//       );
//     });
//   }
//
//   void _handleAssignCancel() {
//     Navigator.pop(context);
//   }
//
//   void _handleAssignToMe() {
//     Navigator.pop(context);
//     // TODO: Implement assignToMe event in BLoC
//     // _workOrderActionBloc?.add(
//     //   WorkOrderActionEvent.assignToMe(workOrder.id),
//     // );
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: const Text('Work order assigned to you'),
//         backgroundColor: context.fsmTheme.success,
//       ),
//     );
//   }
//
//   void _handleRefresh() {
//     context.read<WorkOrderActionBloc>().add(
//           WorkOrderActionEvent.loadWorkOrder(widget.workOrderId),
//         );
//   }
// }
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/di/injection.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';
import 'package:fsm/core/theme/spacing_theme.dart';
import 'package:fsm/core/widgets/fsm_app_bar.dart';
import 'package:fsm/core/widgets/layout/fsm_section_header.dart';
import 'package:fsm/core/widgets/offline_banner.dart';
import 'package:fsm/core/widgets/status_badge.dart';
import 'package:fsm/features/work_orders/domain/entities/location_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_bloc.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_event.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_state.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_complete_wizard.dart';
// Import widget components that may be needed for action in progress and error
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/action_in_progress_widget.dart';
// Dialog components
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/dialogs/location_error_dialog.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/error_widget.dart';
// Import section components
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/sections/basic_information_section.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/sections/customer_section.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/sections/description_section.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/sections/location_section.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/sections/machine_details_section.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/sections/parts_used_section.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/sections/work_timeline_section.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/status_adaptive_actions_widget.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_form_sheet.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_image_gallery_section.dart';
import 'package:intl/intl.dart';

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
              final fsmTheme = context.fsmTheme;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: fsmTheme.success,
                ),
              );
            },
            error: (failure, workOrder, isOffline) {
              final theme = Theme.of(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(failure.message),
                  backgroundColor: theme.colorScheme.error,
                ),
              );
            },
            locationError: (workOrder, message) {
              final fsmTheme = context.fsmTheme;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: fsmTheme.warning,
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
          // Uses standardized 120.0 height for consistency across all screens
          FSMSliverAppBar.gradient(
            pinned: true,
            expandedHeight: 240.0,
            flexibleSpace: FlexibleSpaceBar(
              background: SafeArea(
                child: Container(
                  padding: REdgeInsets.symmetric(
                    horizontal: DesignTokens.space5,
                    vertical: DesignTokens.space3,
                  ),
                  margin: REdgeInsets.only(top: DesignTokens.space10),
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
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,

                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        fontWeight: DesignTokens.fontWeightBold,
                                        letterSpacing: -0.5,
                                        height: 1.1,
                                      ),
                                  // **FIX 1: Added maxLines and overflow to prevent title wrapping/vertical overflow**
                                  // maxLines: 1,
                                  // overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              // Status Badge using shared component
                              StatusBadge.status(
                                status: workOrder.status.name,
                                variant: StatusBadgeVariant.outlined,
                              ),
                            ],
                          ),
                          DesignTokens.verticalSpaceSmall,
                          Text(
                            workOrder.summary,
                            // maxLines: 2,
                            // overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimary
                                      .withValues(alpha: 0.9),
                                  fontWeight: DesignTokens.fontWeightMedium,
                                  letterSpacing: 0.2,
                                ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          DesignTokens.verticalSpaceSmall,
                          //  Priority Badge using shared component
                          StatusBadge.priority(
                            priority: workOrder.priority.name,
                            variant: StatusBadgeVariant.outlined,
                          ),
                        ],
                      ),
                      RSizedBox(height: DesignTokens.space4),
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
                            RSizedBox(width: DesignTokens.space3),
                            _buildHeaderInfoChip(
                              icon: Icons.schedule,
                              label: 'Estimation Time',
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
                onPressed: _handleRefresh,
              ),
              RSizedBox(width: DesignTokens.space4),
            ],
          ),

          // Content with expandable sections using FSMCollapsibleSection
          SliverPadding(
            padding: REdgeInsets.all(DesignTokens.space4),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Offline Indicator using shared OfflineBanner (only shows if offline)
                if (isOffline) ...[
                  const OfflineBanner(dismissible: false),
                  DesignTokens.verticalSpaceMedium,
                ],

                // Basic Information using FSMCollapsibleSection
                FSMCollapsibleSection(
                  title: 'Work Order Information',
                  initiallyExpanded: true,
                  child: BasicInformationSection(workOrder: workOrder),
                ),
                DesignTokens.verticalSpace(DesignTokens.space3),

                // Description
                FSMCollapsibleSection(
                  title: 'Description',
                  child: DescriptionSection(workOrder: workOrder),
                ),
                DesignTokens.verticalSpace(DesignTokens.space3),

                // Customer Information
                if (workOrder.customer != null)
                  FSMCollapsibleSection(
                    title: 'Customer Contact Details',
                    child: CustomerSection(customer: workOrder.customer!),
                  ),
                if (workOrder.customer != null)
                  DesignTokens.verticalSpace(DesignTokens.space3),

                // Machine Details
                if (workOrder.serviceRequest != null)
                  FSMCollapsibleSection(
                    title: 'Machine Details',
                    child: MachineDetailsSection(
                        serviceRequest: workOrder.serviceRequest!),
                  ),
                if (workOrder.serviceRequest != null)
                  DesignTokens.verticalSpace(DesignTokens.space3),

                // Location Information
                FSMCollapsibleSection(
                  title: 'Location & GPS',
                  child: LocationSection(
                    workOrder: workOrder,
                    currentLocation: currentLocation,
                    isLocationLoading: isLocationLoading,
                  ),
                ),
                DesignTokens.verticalSpace(DesignTokens.space3),

                // Parts Used
                if (workOrder.partsUsed.isNotEmpty)
                  FSMCollapsibleSection(
                    title: 'Parts Used',
                    child: PartsUsedSection(partsUsed: workOrder.partsUsed),
                  ),
                if (workOrder.partsUsed.isNotEmpty)
                  DesignTokens.verticalSpace(DesignTokens.space3),

                // Work Logs & Timeline
                if (workOrder.workLogs.isNotEmpty)
                  FSMCollapsibleSection(
                    title: 'Work Timeline',
                    child: WorkTimelineSection(workLogs: workOrder.workLogs),
                  ),
                if (workOrder.workLogs.isNotEmpty)
                  DesignTokens.verticalSpace(DesignTokens.space3),

                // Images & Documentation
                _buildImagesSection(),

                // Add bottom padding before footer
                DesignTokens.verticalSpaceLarge,
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
    final theme = Theme.of(context);
    final spacing = context.spacing;

    return Container(
      padding: REdgeInsets.symmetric(
        horizontal: DesignTokens.space3,
        vertical: DesignTokens.space2,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(spacing.radiusMd.r),
        border: Border.all(
          color: theme.colorScheme.onPrimary.withValues(alpha: 0.2),
          width: DesignTokens.borderWidthThin,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: theme.colorScheme.onPrimary,
            size: DesignTokens.iconXs.sp,
          ),
          RSizedBox(width: DesignTokens.space2),
          // **FIX 2: Wrapped Column in Flexible to prevent horizontal overflow in the Row**
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onPrimary.withValues(alpha: 0.8),
                    fontWeight: DesignTokens.fontWeightMedium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  value,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: DesignTokens.fontWeightSemiBold,
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
              onPressed: _handleAssignCancel,
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: _handleAssignToMe,
              child: const Text('Assign'),
            ),
          ],
        ),
      );
    });
  }

  void _handleAssignCancel() {
    Navigator.pop(context);
  }

  void _handleAssignToMe() {
    Navigator.pop(context);
    // TODO: Implement assignToMe event in BLoC
    // _workOrderActionBloc?.add(
    //   WorkOrderActionEvent.assignToMe(workOrder.id),
    // );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Work order assigned to you'),
        backgroundColor: context.fsmTheme.success,
      ),
    );
  }

  void _handleRefresh() {
    context.read<WorkOrderActionBloc>().add(
          WorkOrderActionEvent.loadWorkOrder(widget.workOrderId),
        );
  }
}
