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
// import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/action_in_progress_widget.dart';
// import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/error_widget.dart';
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
// import '../../../documents/presentation/pages/documents_page.dart';
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
//   bool _executeIfMounted(VoidCallback callback) {
//     if (!mounted) return false;
//     callback();
//     return true;
//   }
//
//   @override
//   Widget build(BuildContext context) {
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
//     // Compute estimation hours
//     String estimationValue = workOrder.durationHours == null
//         ? "0 hours"
//         : "${workOrder.durationHours!.toStringAsFixed(1)} hours";
//
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           FSMSliverAppBar.gradient(
//             pinned: true,
//             expandedHeight: 240.0,
//             flexibleSpace: FlexibleSpaceBar(
//               background: SafeArea(
//                 child: Container(
//                   padding: REdgeInsets.symmetric(
//                       horizontal: DesignTokens.space5,
//                       vertical: DesignTokens.space3),
//                   margin: REdgeInsets.only(top: DesignTokens.space10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // WO number + Status
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
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
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
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           DesignTokens.verticalSpaceSmall,
//                           StatusBadge.priority(
//                             priority: workOrder.priority.name,
//                             variant: StatusBadgeVariant.outlined,
//                           ),
//                         ],
//                       ),
//                       RSizedBox(height: DesignTokens.space4),
//
//                       // Chips Row
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
//                               value: estimationValue,
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
//               FSMAppBarAction.refresh(onPressed: _handleRefresh),
//               RSizedBox(width: DesignTokens.space4),
//             ],
//           ),
//           SliverPadding(
//             padding: REdgeInsets.all(DesignTokens.space4),
//             sliver: SliverList(
//               delegate: SliverChildListDelegate([
//                 if (isOffline) ...[
//                   const OfflineBanner(dismissible: false),
//                   DesignTokens.verticalSpaceMedium,
//                 ],
//
//                 FSMCollapsibleSection(
//                   title: 'Work Order Information',
//                   initiallyExpanded: true,
//                   child: BasicInformationSection(workOrder: workOrder),
//                 ),
//                 DesignTokens.verticalSpace(DesignTokens.space3),
//
//                 FSMCollapsibleSection(
//                   title: 'Description',
//                   child: DescriptionSection(workOrder: workOrder),
//                 ),
//                 DesignTokens.verticalSpace(DesignTokens.space3),
//
//                 if (workOrder.customer != null)
//                   FSMCollapsibleSection(
//                     title: 'Customer Contact Details',
//                     child: CustomerSection(customer: workOrder.customer!),
//                   ),
//                 if (workOrder.customer != null)
//                   DesignTokens.verticalSpace(DesignTokens.space3),
//
//                 if (workOrder.serviceRequest != null)
//                   FSMCollapsibleSection(
//                     title: 'Machine Details',
//                     child: MachineDetailsSection(
//                         serviceRequest: workOrder.serviceRequest!),
//                   ),
//                 if (workOrder.serviceRequest != null)
//                   DesignTokens.verticalSpace(DesignTokens.space3),
//
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
//                 if (workOrder.partsUsed.isNotEmpty)
//                   FSMCollapsibleSection(
//                     title: 'Parts Used',
//                     child: PartsUsedSection(partsUsed: workOrder.partsUsed),
//                   ),
//                 if (workOrder.partsUsed.isNotEmpty)
//                   DesignTokens.verticalSpace(DesignTokens.space3),
//
//                 if (workOrder.workLogs.isNotEmpty)
//                   FSMCollapsibleSection(
//                     title: 'Work Timeline',
//                     child: WorkTimelineSection(
//                       workLogs: workOrder.workLogs,
//                     ),
//                   ),
//                 if (workOrder.workLogs.isNotEmpty)
//                   DesignTokens.verticalSpace(DesignTokens.space3),
//
//                 _buildImagesSection(),
//
//                 // Bottom padding for spacing
//                 DesignTokens.verticalSpaceLarge,
//               ]),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end, // aligns to the right
//                 children: [
//                   SizedBox(
//                     width: 145,
//                     child: ElevatedButton.icon(
//                       onPressed: () async {
//                         // Push and wait for result
//                         await Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (context) => const DocumentsPage(),
//                           ),
//                         );
//                       },
//                       icon: const Icon(Icons.help_outline, size: 18),
//                       label: const Text("Need Help"),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Theme.of(context).colorScheme.primary,
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: StatusAdaptiveActionsWidget(
//         workOrder: workOrder,
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
//           Flexible(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   label,
//                   style: theme.textTheme.labelSmall?.copyWith(
//                     color: theme.colorScheme.onPrimary.withValues(alpha: 0.8),
//                     fontWeight: DesignTokens.fontWeightMedium,
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//                 ),
//                 Text(
//                   value,
//                   style: theme.textTheme.labelMedium?.copyWith(
//                     color: theme.colorScheme.onPrimary,
//                     fontWeight: DesignTokens.fontWeightSemiBold,
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//                 ),
//               ],
//             ),
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
//   void _startWorkOrder(BuildContext context, WorkOrderEntity workOrder) {
//     _executeIfMounted(() {
//       WorkOrderFormSheet.show(
//         context: context,
//         action: WorkOrderAction.start,
//         workOrder: workOrder,
//       );
//     });
//   }
//
//   void _pauseWorkOrder(BuildContext context, WorkOrderEntity workOrder) {
//     _executeIfMounted(() {
//       WorkOrderFormSheet.show(
//         context: context,
//         action: WorkOrderAction.pause,
//         workOrder: workOrder,
//       );
//     });
//   }
//
//   void _resumeWorkOrder(BuildContext context, WorkOrderEntity workOrder) {
//     _executeIfMounted(() {
//       WorkOrderFormSheet.show(
//         context: context,
//         action: WorkOrderAction.resume,
//         workOrder: workOrder,
//       );
//     });
//   }
//
//   void _completeWorkOrder(BuildContext context, WorkOrderEntity workOrder) {
//     _executeIfMounted(() {
//       WorkOrderCompleteWizard.show(
//         context: context,
//         workOrder: workOrder,
//       );
//     });
//   }
//
//   void _rejectWorkOrder(BuildContext context, WorkOrderEntity workOrder) {
//     _executeIfMounted(() {
//       WorkOrderFormSheet.show(
//         context: context,
//         action: WorkOrderAction.reject,
//         workOrder: workOrder,
//       );
//     });
//   }
//
//   void _assignToMe(BuildContext context, WorkOrderEntity workOrder) {
//     _executeIfMounted(() {
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
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/action_in_progress_widget.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/error_widget.dart';
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

import '../../../documents/presentation/pages/documents_page.dart';

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
  bool _isReloadingAfterAction = false; // Flag to prevent double snackbar

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
              // Only show snackbar if we're not in the reloading phase
              if (!_isReloadingAfterAction) {
                final fsmTheme = context.fsmTheme;

                // Show success message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor: fsmTheme.success,
                    // duration: const Duration(seconds: 1),
                    duration: const Duration(milliseconds: 750),
                  ),
                );

                // Set flag to prevent double snackbar during reload
                _isReloadingAfterAction = true;

                // Automatically reload the work order to get updated timeline
                Future.delayed(const Duration(milliseconds: 300), () {
                  if (mounted) {
                    context.read<WorkOrderActionBloc>().add(
                          WorkOrderActionEvent.loadWorkOrder(
                              widget.workOrderId),
                        );
                  }
                });
              }
            },
            loaded: (workOrder, currentLocation, isLocationLoading, isOffline,
                _, __) {
              // Reset the flag when we reach loaded state after reload
              if (_isReloadingAfterAction) {
                _isReloadingAfterAction = false;
              }
            },
            error: (failure, workOrder, isOffline) {
              // Reset flag on error
              _isReloadingAfterAction = false;

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
    // Compute estimation hours
    String estimationValue = workOrder.durationHours == null
        ? "0 hours"
        : "${workOrder.durationHours!.toStringAsFixed(1)} hours";

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          FSMSliverAppBar.gradient(
            pinned: true,
            expandedHeight: 240.0,
            flexibleSpace: FlexibleSpaceBar(
              background: SafeArea(
                child: Container(
                  padding: REdgeInsets.symmetric(
                      horizontal: DesignTokens.space5,
                      vertical: DesignTokens.space3),
                  margin: REdgeInsets.only(top: DesignTokens.space10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // WO number + Status
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
                                ),
                              ),
                              StatusBadge.status(
                                status: workOrder.status.name,
                                variant: StatusBadgeVariant.outlined,
                              ),
                            ],
                          ),
                          DesignTokens.verticalSpaceSmall,
                          Text(
                            workOrder.summary,
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
                          StatusBadge.priority(
                            priority: workOrder.priority.name,
                            variant: StatusBadgeVariant.outlined,
                          ),
                        ],
                      ),
                      RSizedBox(height: DesignTokens.space4),

                      // Chips Row
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
                              value: estimationValue,
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
              FSMAppBarAction.refresh(onPressed: _handleRefresh),
              RSizedBox(width: DesignTokens.space4),
            ],
          ),
          SliverPadding(
            padding: REdgeInsets.all(DesignTokens.space4),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                if (isOffline) ...[
                  const OfflineBanner(dismissible: false),
                  DesignTokens.verticalSpaceMedium,
                ],

                FSMCollapsibleSection(
                  title: 'Work Order Information',
                  initiallyExpanded: true,
                  child: BasicInformationSection(workOrder: workOrder),
                ),
                DesignTokens.verticalSpace(DesignTokens.space3),

                FSMCollapsibleSection(
                  title: 'Description',
                  child: DescriptionSection(workOrder: workOrder),
                ),
                DesignTokens.verticalSpace(DesignTokens.space3),

                if (workOrder.customer != null)
                  FSMCollapsibleSection(
                    title: 'Customer Contact Details',
                    child: CustomerSection(customer: workOrder.customer!),
                  ),
                if (workOrder.customer != null)
                  DesignTokens.verticalSpace(DesignTokens.space3),

                if (workOrder.serviceRequest != null)
                  FSMCollapsibleSection(
                    title: 'Machine Details',
                    child: MachineDetailsSection(
                        serviceRequest: workOrder.serviceRequest!),
                  ),
                if (workOrder.serviceRequest != null)
                  DesignTokens.verticalSpace(DesignTokens.space3),

                FSMCollapsibleSection(
                  title: 'Location & GPS',
                  child: LocationSection(
                    workOrder: workOrder,
                    currentLocation: currentLocation,
                    isLocationLoading: isLocationLoading,
                  ),
                ),
                DesignTokens.verticalSpace(DesignTokens.space3),

                if (workOrder.partsUsed.isNotEmpty)
                  FSMCollapsibleSection(
                    title: 'Parts Used',
                    child: PartsUsedSection(partsUsed: workOrder.partsUsed),
                  ),
                if (workOrder.partsUsed.isNotEmpty)
                  DesignTokens.verticalSpace(DesignTokens.space3),

                if (workOrder.workLogs.isNotEmpty)
                  FSMCollapsibleSection(
                    title: 'Work Timeline',
                    child: WorkTimelineSection(
                      workLogs: workOrder.workLogs,
                    ),
                  ),
                if (workOrder.workLogs.isNotEmpty)
                  DesignTokens.verticalSpace(DesignTokens.space3),

                _buildImagesSection(),

                // Bottom padding for spacing
                DesignTokens.verticalSpaceLarge,
              ]),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end, // aligns to the right
                children: [
                  SizedBox(
                    width: 145,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        // Push and wait for result
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const DocumentsPage(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.help_outline, size: 18),
                      label: const Text("Need Help"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: StatusAdaptiveActionsWidget(
        workOrder: workOrder,
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

  void _startWorkOrder(BuildContext context, WorkOrderEntity workOrder) {
    _executeIfMounted(() {
      WorkOrderFormSheet.show(
        context: context,
        action: WorkOrderAction.start,
        workOrder: workOrder,
      );
    });
  }

  void _pauseWorkOrder(BuildContext context, WorkOrderEntity workOrder) {
    _executeIfMounted(() {
      WorkOrderFormSheet.show(
        context: context,
        action: WorkOrderAction.pause,
        workOrder: workOrder,
      );
    });
  }

  void _resumeWorkOrder(BuildContext context, WorkOrderEntity workOrder) {
    _executeIfMounted(() {
      WorkOrderFormSheet.show(
        context: context,
        action: WorkOrderAction.resume,
        workOrder: workOrder,
      );
    });
  }

  void _completeWorkOrder(BuildContext context, WorkOrderEntity workOrder) {
    _executeIfMounted(() {
      WorkOrderCompleteWizard.show(
        context: context,
        workOrder: workOrder,
      );
    });
  }

  void _rejectWorkOrder(BuildContext context, WorkOrderEntity workOrder) {
    _executeIfMounted(() {
      WorkOrderFormSheet.show(
        context: context,
        action: WorkOrderAction.reject,
        workOrder: workOrder,
      );
    });
  }

  void _assignToMe(BuildContext context, WorkOrderEntity workOrder) {
    _executeIfMounted(() {
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
