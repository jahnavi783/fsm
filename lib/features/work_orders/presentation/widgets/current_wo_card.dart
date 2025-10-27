// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../core/theme/app_colors.dart';
// import '../../../../core/theme/app_dimensions.dart';
// import '../../../../core/theme/app_text_styles.dart';
// import '../../../../core/widgets/metadata_row.dart';
// import '../../../../core/widgets/priority_indicator.dart';
// import '../../../../core/widgets/quick_action_button.dart';
// import '../../../../core/widgets/status_badge.dart';
// import '../../domain/entities/work_order_entity.dart';
//
// /// CurrentWOCard - Displays the currently active work order on dashboard
// ///
// /// Features (Redesign 2025):
// /// - Full-width layout with margins
// /// - Elevated shadow (elevation: 4)
// /// - Left border accent (4dp, orange/amber for in-progress WO)
// /// - Status badge + WO number + priority indicator
// /// - Issue description (max 2 lines)
// /// - Metadata row (location + time)
// /// - Quick action buttons (Pause, Parts, Docs, Complete)
// /// - Rounded corners (12dp)
// /// - Tap to view full details
// ///
// /// Usage:
// /// ```dart
// /// CurrentWOCard(
// ///   workOrder: currentWorkOrder,
// ///   onTap: () => context.router.push(WorkOrderDetailsRoute(id: wo.id)),
// ///   onPause: () => bloc.add(PauseWorkOrder(wo.id)),
// ///   onViewParts: () => context.router.push(PartsRoute(woId: wo.id)),
// ///   onViewDocs: () => context.router.push(DocumentsRoute(woId: wo.id)),
// ///   onComplete: () => bloc.add(CompleteWorkOrder(wo.id)),
// /// )
// /// ```
// class CurrentWOCard extends StatelessWidget {
//   /// The currently active work order
//   final WorkOrderEntity workOrder;
//
//   /// Callback when card is tapped (to view full details)
//   final VoidCallback onTap;
//
//   /// Callback for Pause action
//   final VoidCallback? onPause;
//
//   /// Callback for View Parts action
//   final VoidCallback? onViewParts;
//
//   /// Callback for View Documents action
//   final VoidCallback? onViewDocs;
//
//   /// Callback for Complete action
//   final VoidCallback? onComplete;
//
//   /// Whether actions are loading
//   final bool isLoading;
//
//   const CurrentWOCard({
//     super.key,
//     required this.workOrder,
//     required this.onTap,
//     this.onPause,
//     this.onViewParts,
//     this.onViewDocs,
//     this.onComplete,
//     this.isLoading = false,
//   });
//
//   Color get _accentColor {
//     // Left border color based on status
//     switch (workOrder.status.toLowerCase()) {
//       case 'in_progress':
//       case 'inprogress':
//         return AppColors.warning; // Orange/Amber for in progress
//       case 'paused':
//         return AppColors.statusPaused;
//       default:
//         return AppColors.primary;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(
//         horizontal: AppDimensions.paddingMedium,
//         vertical: AppDimensions.paddingSmall,
//       ),
//       child: Material(
//         color: AppColors.surface,
//         elevation: AppDimensions.elevationMedium,
//         borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
//         child: InkWell(
//           onTap: onTap,
//           borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
//           child: Container(
//             decoration: BoxDecoration(
//               border: Border(
//                 left: BorderSide(
//                   color: _accentColor,
//                   width: 4.w,
//                 ),
//               ),
//               borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
//             ),
//             child: Padding(
//               padding: EdgeInsets.all(AppDimensions.paddingMedium),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Header Row: Status Badge + WO Number + Priority
//                   Row(
//                     children: [
//                       // Status Badge
//                       StatusBadge.subtle(
//                         label: workOrder.priority.displayName,
//                         type: StatusBadgeType.priority,
//                         showIcon: true,
//                         fontSize: 11.sp,
//                       ),
//
//                       SizedBox(width: AppDimensions.paddingSmall),
//
//                       // WO Number
//                       Expanded(
//                         child: Text(
//                           'WO #${workOrder.id}',
//                           style: AppTextStyles.titleSmall.copyWith(
//                             fontWeight: FontWeight.w700,
//                             color: AppColors.textPrimary,
//                           ),
//                         ),
//                       ),
//
//                       // Priority Indicator
//                       PriorityIndicator(
//                         priority: workOrder.priority.toString(),
//                         type: PriorityIndicatorType.badge,
//                       ),
//                     ],
//                   ),
//
//                   SizedBox(height: AppDimensions.paddingSmall),
//
//                   // Issue Description (max 2 lines)
//                   Text(
//                     workOrder.issue,
//                     style: AppTextStyles.bodyMedium.copyWith(
//                       color: AppColors.textPrimary,
//                       height: 1.4,
//                     ),
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//
//                   SizedBox(height: AppDimensions.paddingSmall),
//
//                   // Metadata Row: Location + Time
//                   MetadataRowVariants.workOrder(
//                     location: workOrder.location,
//                     time: _formatTime(workOrder.createdAt),
//                   ),
//
//                   SizedBox(height: AppDimensions.paddingMedium),
//
//                   // Quick Action Buttons
//                   Wrap(
//                     spacing: AppDimensions.paddingSmall,
//                     runSpacing: AppDimensions.paddingSmall,
//                     children: [
//                       // Pause Button (only if in progress)
//                       if (_canPause)
//                         QuickActionButtonVariants.warning(
//                           icon: Icons.pause,
//                           label: 'Pause',
//                           onPressed: isLoading ? null : onPause,
//                           isCompact: true,
//                         ),
//
//                       // Parts Button
//                       QuickActionButtonVariants.secondary(
//                         icon: Icons.inventory_2_outlined,
//                         label: 'Parts',
//                         onPressed: isLoading ? null : onViewParts,
//                         isCompact: true,
//                       ),
//
//                       // Documents Button
//                       QuickActionButtonVariants.secondary(
//                         icon: Icons.folder_outlined,
//                         label: 'Docs',
//                         onPressed: isLoading ? null : onViewDocs,
//                         isCompact: true,
//                       ),
//
//                       // Complete Button (only if in progress)
//                       if (_canComplete)
//                         QuickActionButtonVariants.success(
//                           icon: Icons.check_circle_outline,
//                           label: 'Complete',
//                           onPressed: isLoading ? null : onComplete,
//                           isCompact: true,
//                         ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   bool get _canPause {
//     final status = workOrder.status.toLowerCase();
//     return status == 'in_progress' || status == 'inprogress';
//   }
//
//   bool get _canComplete {
//     final status = workOrder.status.toLowerCase();
//     return status == 'in_progress' || status == 'inprogress';
//   }
//
//   String _formatTime(DateTime dateTime) {
//     final now = DateTime.now();
//     final difference = now.difference(dateTime);
//
//     if (difference.inMinutes < 60) {
//       return '${difference.inMinutes}m ago';
//     } else if (difference.inHours < 24) {
//       return '${difference.inHours}h ago';
//     } else if (difference.inDays < 7) {
//       return '${difference.inDays}d ago';
//     } else {
//       // Format as date
//       return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
//     }
//   }
// }
//
// /// Empty state when no current work order
// class NoCurrentWOCard extends StatelessWidget {
//   final VoidCallback? onBrowseWorkOrders;
//
//   const NoCurrentWOCard({
//     super.key,
//     this.onBrowseWorkOrders,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(
//         horizontal: AppDimensions.paddingMedium,
//         vertical: AppDimensions.paddingSmall,
//       ),
//       child: Material(
//         color: AppColors.surface,
//         elevation: AppDimensions.elevationSmall,
//         borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
//         child: Container(
//           padding: EdgeInsets.all(AppDimensions.paddingLarge),
//           child: Column(
//             children: [
//               Icon(
//                 Icons.assignment_outlined,
//                 size: 64.sp,
//                 color: AppColors.textSecondary.withValues(alpha: 0.5),
//               ),
//               SizedBox(height: AppDimensions.paddingMedium),
//               Text(
//                 'No Active Work Order',
//                 style: AppTextStyles.titleMedium.copyWith(
//                   color: AppColors.textPrimary,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               SizedBox(height: AppDimensions.paddingSmall),
//               Text(
//                 'Start a new work order or resume a paused one',
//                 style: AppTextStyles.bodySmall.copyWith(
//                   color: AppColors.textSecondary,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               if (onBrowseWorkOrders != null) ...[
//                 SizedBox(height: AppDimensions.paddingMedium),
//                 QuickActionButtonVariants.primary(
//                   icon: Icons.search,
//                   label: 'Browse Work Orders',
//                   onPressed: onBrowseWorkOrders,
//                 ),
//               ],
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
