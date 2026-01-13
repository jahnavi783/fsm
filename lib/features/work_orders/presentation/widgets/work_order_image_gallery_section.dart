// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:fsm/core/theme/design_tokens.dart';
// // import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';
// // import 'package:fsm/features/work_orders/domain/entities/work_order_grouped_images_entity.dart';
// // import 'package:fsm/features/work_orders/domain/entities/work_order_image_capture_entity.dart';
// // import 'package:fsm/features/work_orders/presentation/widgets/work_order_image_preview_dialog.dart';
// // import 'package:fsm/features/work_orders/presentation/widgets/work_order_image_thumbnail.dart';
// // import 'package:intl/intl.dart';
// // import 'package:timelines_plus/timelines_plus.dart';
// //
// // const String _rejectedActionType = 'rejected';
// //
// // /// Timeline entry model to hold capture data with action type context
// // class _TimelineEntry {
// //   final WorkOrderImageCaptureEntity capture;
// //   final String actionType;
// //   const _TimelineEntry({
// //     required this.capture,
// //     required this.actionType,
// //   });
// //
// //   /// Get color for this action type using FSM theme extension
// //   Color getColor(BuildContext context) {
// //     final fsmTheme = context.fsmTheme;
// //     switch (actionType.toLowerCase()) {
// //       case 'start':
// //         return fsmTheme.actionStart;
// //       case 'pause':
// //         return fsmTheme.actionPause;
// //       case 'resume':
// //         return fsmTheme.actionResume;
// //       case 'complete':
// //         return fsmTheme.actionComplete;
// //       case 'rejected':
// //         return fsmTheme.actionReject;
// //       case 'signature':
// //         return Theme.of(context).colorScheme.tertiary;
// //       default:
// //         return Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6);
// //     }
// //   }
// //
// //   /// Get icon for this action type
// //   IconData get icon {
// //     switch (actionType.toLowerCase()) {
// //       case 'start':
// //         return Icons.play_arrow;
// //       case 'pause':
// //         return Icons.pause;
// //       case 'resume':
// //         return Icons.play_arrow;
// //       case 'complete':
// //         return Icons.check_circle;
// //       case 'signature':
// //         return Icons.edit;
// //       case 'rejected':
// //         return Icons.cancel;
// //       default:
// //         return Icons.circle;
// //     }
// //   }
// //
// //   /// Get display name for this action type
// //   String get displayName {
// //     return actionType.toUpperCase();
// //   }
// // }
// //
// // class WorkOrderImageGallerySection extends StatelessWidget {
// //   final WorkOrderGroupedImagesEntity groupedImages;
// //
// //   const WorkOrderImageGallerySection({
// //     super.key,
// //     required this.groupedImages,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final timelineEntries = groupedImages.getAllTimelineEntries();
// //
// //     if (timelineEntries.isEmpty) {
// //       return _buildEmptyState(context);
// //     }
// //     final entries = timelineEntries
// //         .map((entry) => _TimelineEntry(
// //               capture: entry['capture'] as WorkOrderImageCaptureEntity,
// //               actionType: entry['actionType'] as String,
// //             ))
// //         .toList();
// //     final rejectedRaw =
// //         groupedImages.groupedImages[_rejectedActionType] as List<dynamic>?;
// //
// //     if (rejectedRaw != null && rejectedRaw.isNotEmpty) {
// //       final lastRejection = rejectedRaw.last as WorkOrderImageCaptureEntity;
// //
// //       entries.add(
// //         _TimelineEntry(
// //           actionType: _rejectedActionType,
// //           capture: lastRejection,
// //         ),
// //       );
// //     }
// //     entries.sort((a, b) {
// //       DateTime getTime(_TimelineEntry e) {
// //         if (e.capture.capturedAt != null) {
// //           return e.capture.capturedAt!;
// //         }
// //         return DateTime.tryParse(e.capture.timestamp ?? '') ?? DateTime(1970);
// //       }
// //
// //       return getTime(a).compareTo(getTime(b));
// //     });
// //
// //     if (entries.isEmpty) {
// //       return _buildEmptyState(context);
// //     }
// //
// //     return Padding(
// //       padding: REdgeInsets.only(top: DesignTokens.space4),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           // Section header
// //           _buildHeader(context, entries.length),
// //           DesignTokens.verticalSpaceMedium,
// //
// //           // Timeline using timelines_plus
// //           Padding(
// //             padding: REdgeInsets.symmetric(horizontal: DesignTokens.space4),
// //             child: FixedTimeline.tileBuilder(
// //               theme: TimelineThemeData(
// //                 nodePosition: 0,
// //                 connectorTheme: ConnectorThemeData(
// //                   thickness: 2.w,
// //                   color: Theme.of(context)
// //                       .colorScheme
// //                       .onSurface
// //                       .withValues(alpha: 0.12),
// //                 ),
// //               ),
// //               builder: TimelineTileBuilder.connected(
// //                 connectionDirection: ConnectionDirection.before,
// //                 itemCount: entries.length,
// //                 contentsBuilder: (context, index) => Padding(
// //                   padding: REdgeInsets.only(
// //                     left: DesignTokens.space4,
// //                     bottom: DesignTokens.space6,
// //                   ),
// //                   child: _buildTimelineContent(context, entries[index]),
// //                 ),
// //                 indicatorBuilder: (context, index) => _buildTimelineIndicator(
// //                   context,
// //                   entries[index],
// //                 ),
// //                 connectorBuilder: (context, index, type) {
// //                   return SolidLineConnector(
// //                     color: Theme.of(context)
// //                         .colorScheme
// //                         .onSurface
// //                         .withValues(alpha: 0.12),
// //                   );
// //                 },
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   // Widget _buildImages(BuildContext context, _TimelineEntry entry) {
// //   //   return SizedBox(
// //   //     height: 80.h,
// //   //     child: ListView.separated(
// //   //       scrollDirection: Axis.horizontal,
// //   //       itemCount: entry.capture.imageUrls.length,
// //   //       separatorBuilder: (_, __) => DesignTokens.horizontalSpaceSmall,
// //   //       itemBuilder: (context, index) {
// //   //         final imageUrl = entry.capture.imageUrls[index];
// //   //         return WorkOrderImageThumbnail(
// //   //           imageUrl: imageUrl,
// //   //           width: 80.w,
// //   //           height: 80.h,
// //   //           onTap: () {
// //   //             showDialog(
// //   //               context: context,
// //   //               barrierColor: context.fsmTheme.backgroundOverlay,
// //   //               builder: (_) => WorkOrderImagePreviewDialog(
// //   //                 captures: [entry.capture],
// //   //                 initialIndex: index,
// //   //                 actionType: entry.actionType,
// //   //               ),
// //   //             );
// //   //           },
// //   //         );
// //   //       },
// //   //     ),
// //   //   );
// //   // }
// //
// //   /// Build section header with title and count
// //   Widget _buildHeader(BuildContext context, int entryCount) {
// //     return Padding(
// //       padding: REdgeInsets.symmetric(horizontal: DesignTokens.space4),
// //       child: Row(
// //         children: [
// //           Icon(
// //             Icons.timeline,
// //             color: Theme.of(context).colorScheme.primary,
// //             size: 24.sp,
// //           ),
// //           DesignTokens.horizontalSpace(DesignTokens.space3),
// //           Expanded(
// //             child: Text(
// //               'Work Timeline',
// //               style: TextStyle(
// //                 fontSize: 18.sp,
// //                 fontWeight: FontWeight.w600,
// //                 color: Theme.of(context).colorScheme.onSurface,
// //               ),
// //             ),
// //           ),
// //           DesignTokens.horizontalSpaceSmall,
// //           Container(
// //             padding: REdgeInsets.symmetric(
// //                 horizontal: DesignTokens.space3, vertical: DesignTokens.space1),
// //             decoration: BoxDecoration(
// //               color:
// //                   Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
// //               borderRadius: BorderRadius.circular(16.r),
// //             ),
// //             child: Text(
// //               '$entryCount ${entryCount == 1 ? 'event' : 'events'}',
// //               style: TextStyle(
// //                 fontSize: 12.sp,
// //                 fontWeight: FontWeight.w600,
// //                 color: Theme.of(context).colorScheme.primary,
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   /// Build empty state when no timeline entries exist
// //   Widget _buildEmptyState(BuildContext context) {
// //     return Padding(
// //       padding: REdgeInsets.symmetric(
// //           vertical: DesignTokens.space12, horizontal: DesignTokens.space8),
// //       child: Center(
// //         child: Column(
// //           children: [
// //             Icon(
// //               Icons.photo_library_outlined,
// //               size: 48.sp,
// //               color: Theme.of(context)
// //                   .colorScheme
// //                   .onSurface
// //                   .withValues(alpha: 0.3),
// //             ),
// //             DesignTokens.verticalSpaceMedium,
// //             Text(
// //               'No documentation yet',
// //               style: TextStyle(
// //                 fontSize: 16.sp,
// //                 fontWeight: FontWeight.w500,
// //                 color: Theme.of(context)
// //                     .colorScheme
// //                     .onSurface
// //                     .withValues(alpha: 0.6),
// //               ),
// //             ),
// //             DesignTokens.verticalSpaceSmall,
// //             Text(
// //               'Images and documentation will appear here',
// //               style: TextStyle(
// //                 fontSize: 14.sp,
// //                 color: Theme.of(context)
// //                     .colorScheme
// //                     .onSurface
// //                     .withValues(alpha: 0.4),
// //               ),
// //               textAlign: TextAlign.center,
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   /// Build timeline indicator using DotIndicator from timelines_plus
// //   Widget _buildTimelineIndicator(BuildContext context, _TimelineEntry entry) {
// //     // final color = entry.getColor(context);
// //     final color = entry.actionType.toLowerCase() == _rejectedActionType
// //         ? Colors.red
// //         : entry.getColor(context);
// //     return DotIndicator(
// //       size: 40.w,
// //       color: color.withValues(alpha: 0.15),
// //       border: Border.all(
// //         color: color,
// //         width: 2.w,
// //       ),
// //       child: Icon(
// //         // entry.icon,
// //         entry.actionType.toLowerCase() == _rejectedActionType
// //             ? Icons.cancel
// //             : entry.icon,
// //         color: color,
// //         size: 20.sp,
// //       ),
// //     );
// //   }
// //
// //   Widget _buildTimelineContent(BuildContext context, _TimelineEntry entry) {
// //     // 🔴 TERMINAL STATE: REJECTED
// //     if (entry.actionType.toLowerCase() == _rejectedActionType) {
// //       return Container(
// //         padding: REdgeInsets.all(DesignTokens.space4),
// //         decoration: BoxDecoration(
// //           color: Colors.red.withOpacity(0.08),
// //           borderRadius: BorderRadius.circular(12.r),
// //           border: Border.all(color: Colors.red, width: 1.5),
// //         ),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Row(
// //               children: [
// //                 Icon(
// //                   Icons.error_outline,
// //                   color: Colors.red,
// //                   size: 20.sp,
// //                 ),
// //                 DesignTokens.horizontalSpaceSmall,
// //                 Text(
// //                   'Work Order Rejected',
// //                   style: TextStyle(
// //                     fontSize: 16.sp,
// //                     fontWeight: FontWeight.w700,
// //                     color: Colors.red,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             DesignTokens.verticalSpaceSmall,
// //             Text(
// //               entry.capture.comments ??
// //                   'Work order rejected due to maximum pause attempts.',
// //               style: TextStyle(
// //                 fontSize: 13.sp,
// //                 color: Colors.red.shade700,
// //               ),
// //             ),
// //           ],
// //         ),
// //       );
// //     }
// //
// //     final color = entry.getColor(context);
// //
// //     final isStartOrResume = entry.actionType.toLowerCase() == 'start' ||
// //         entry.actionType.toLowerCase() == 'resume';
// //
// //     final hasComments = entry.capture.comments != null &&
// //         entry.capture.comments!.trim().isNotEmpty;
// //
// //     final hasImages = entry.capture.imageUrls.isNotEmpty;
// //
// //     // Determine display date
// //     String? displayDate;
// //     if (entry.capture.capturedAt != null) {
// //       displayDate =
// //           DateFormat('MMM dd, yyyy HH:mm').format(entry.capture.capturedAt!);
// //     } else if (entry.capture.timestamp != null) {
// //       try {
// //         final parsedTimestamp = DateTime.parse(entry.capture.timestamp!);
// //         displayDate = DateFormat('MMM dd, yyyy HH:mm').format(parsedTimestamp);
// //       } catch (e) {
// //         displayDate = entry.capture.timestamp;
// //       }
// //     }
// //
// //     return Container(
// //       padding: REdgeInsets.all(DesignTokens.space4),
// //       decoration: BoxDecoration(
// //         color: Theme.of(context).colorScheme.surface,
// //         borderRadius: BorderRadius.circular(12.r),
// //         border: Border.all(
// //           color: color.withOpacity(0.2),
// //           width: 1.5,
// //         ),
// //         boxShadow: [
// //           BoxShadow(
// //             color: context.fsmTheme.shadowCard,
// //             blurRadius: 8,
// //             offset: const Offset(0, 2),
// //           ),
// //         ],
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           // Header
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               Container(
// //                 padding: REdgeInsets.symmetric(
// //                   horizontal: DesignTokens.space3,
// //                   vertical: DesignTokens.space1,
// //                 ),
// //                 decoration: BoxDecoration(
// //                   color: color.withOpacity(0.15),
// //                   borderRadius: BorderRadius.circular(20.r),
// //                   border: Border.all(color: color.withOpacity(0.3)),
// //                 ),
// //                 child: Row(
// //                   children: [
// //                     Icon(entry.icon, size: 14.sp, color: color),
// //                     DesignTokens.horizontalSpace(DesignTokens.space1 + 2),
// //                     Text(
// //                       entry.displayName,
// //                       style: TextStyle(
// //                         fontSize: 12.sp,
// //                         fontWeight: FontWeight.w700,
// //                         color: color,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               if (displayDate != null)
// //                 Row(
// //                   children: [
// //                     Icon(Icons.access_time,
// //                         size: 14.sp,
// //                         color: Theme.of(context)
// //                             .colorScheme
// //                             .onSurface
// //                             .withOpacity(0.5)),
// //                     DesignTokens.horizontalSpaceXs,
// //                     Text(
// //                       displayDate,
// //                       style: TextStyle(
// //                         fontSize: 9.sp,
// //                         color: Theme.of(context)
// //                             .colorScheme
// //                             .onSurface
// //                             .withOpacity(0.6),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //             ],
// //           ),
// //
// //           DesignTokens.verticalSpaceMd,
// //
// //           // Metadata
// //           Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               if (entry.capture.capturedBy != null)
// //                 _buildMetadataRow(
// //                   context,
// //                   Icons.person_outline,
// //                   '${entry.capture.capturedBy!.firstName} ${entry.capture.capturedBy!.lastName}',
// //                 ),
// //
// //               if (entry.capture.latitude != null &&
// //                   entry.capture.longitude != null) ...[
// //                 DesignTokens.verticalSpaceXs,
// //                 _buildMetadataRow(
// //                   context,
// //                   Icons.location_on_outlined,
// //                   '${entry.capture.latitude!.toStringAsFixed(6)}, ${entry.capture.longitude!.toStringAsFixed(6)}',
// //                 ),
// //               ],
// //
// //               // PAUSE reason (unchanged)
// //               if (entry.capture.reason != null &&
// //                   entry.capture.reason!.isNotEmpty) ...[
// //                 DesignTokens.verticalSpaceXs,
// //                 _buildMetadataRow(
// //                   context,
// //                   Icons.info_outline,
// //                   'Reason: ${entry.capture.reason}',
// //                   isHighlighted: true,
// //                 ),
// //               ],
// //
// //               // START / RESUME: Show comments if available, otherwise show "No comments"
// //               if (isStartOrResume) ...[
// //                 DesignTokens.verticalSpaceXs,
// //                 _buildMetadataRow(
// //                   context,
// //                   Icons.info_outline,
// //                   hasComments
// //                       ? 'Notes: ${entry.capture.comments}'
// //                       : 'No comments added',
// //                   isHighlighted: true,
// //                 ),
// //               ],
// //             ],
// //           ),
// //
// //           // Images section
// //           if (hasImages) ...[
// //             DesignTokens.verticalSpaceMedium,
// //             _buildHorizontalImageScroll(context, entry),
// //           ] else if (isStartOrResume && !hasComments) ...[
// //             // Only show "No images" if it's start/resume AND no comments AND no images
// //             DesignTokens.verticalSpaceMedium,
// //             _buildMetadataRow(
// //               context,
// //               Icons.photo_library_outlined,
// //               'No images added',
// //             ),
// //           ],
// //         ],
// //       ),
// //     );
// //   }
// //
// //   /// Build metadata row with icon and text
// //   Widget _buildMetadataRow(
// //     BuildContext context,
// //     IconData icon,
// //     String text, {
// //     bool isHighlighted = false,
// //   }) {
// //     return Row(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Icon(
// //           icon,
// //           size: 16.sp,
// //           color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
// //         ),
// //         DesignTokens.horizontalSpaceSmall,
// //         Expanded(
// //           child: Text(
// //             text,
// //             style: TextStyle(
// //               fontSize: 13.sp,
// //               color: Theme.of(context)
// //                   .colorScheme
// //                   .onSurface
// //                   .withOpacity(isHighlighted ? 0.8 : 0.6),
// //               fontWeight: isHighlighted ? FontWeight.w600 : FontWeight.w500,
// //               fontStyle: isHighlighted ? FontStyle.italic : FontStyle.normal,
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// //
// //   /// Build horizontal scrollable image gallery
// //   Widget _buildHorizontalImageScroll(
// //     BuildContext context,
// //     _TimelineEntry entry,
// //   ) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         // Images label
// //         Row(
// //           children: [
// //             Icon(
// //               Icons.photo_library_outlined,
// //               size: 16.sp,
// //               color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
// //             ),
// //             DesignTokens.horizontalSpace(DesignTokens.space1 + 2),
// //             Text(
// //               '${entry.capture.imageUrls.length} ${entry.capture.imageUrls.length == 1 ? 'image' : 'images'}',
// //               style: TextStyle(
// //                 fontSize: 12.sp,
// //                 fontWeight: FontWeight.w600,
// //                 color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
// //               ),
// //             ),
// //           ],
// //         ),
// //         DesignTokens.verticalSpaceSmall,
// //
// //         // Horizontal scrollable image list
// //         RSizedBox(
// //           height: 80.h,
// //           child: ListView.separated(
// //             scrollDirection: Axis.horizontal,
// //             itemCount: entry.capture.imageUrls.length,
// //             separatorBuilder: (_, __) => DesignTokens.horizontalSpaceSmall,
// //             itemBuilder: (context, index) {
// //               final imageUrl = entry.capture.imageUrls[index];
// //               return WorkOrderImageThumbnail(
// //                 imageUrl: imageUrl,
// //                 width: 80.w,
// //                 height: 80.h,
// //                 onTap: () {
// //                   showDialog(
// //                     context: context,
// //                     barrierColor: context.fsmTheme.backgroundOverlay,
// //                     builder: (context) => WorkOrderImagePreviewDialog(
// //                       captures: [entry.capture],
// //                       initialIndex: index,
// //                       actionType: entry.actionType,
// //                     ),
// //                   );
// //                 },
// //               );
// //             },
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fsm/core/theme/design_tokens.dart';
// import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';
// import 'package:fsm/features/work_orders/domain/entities/work_order_grouped_images_entity.dart';
// import 'package:fsm/features/work_orders/domain/entities/work_order_image_capture_entity.dart';
// import 'package:fsm/features/work_orders/presentation/widgets/work_order_image_preview_dialog.dart';
// import 'package:fsm/features/work_orders/presentation/widgets/work_order_image_thumbnail.dart';
// import 'package:intl/intl.dart';
// import 'package:timelines_plus/timelines_plus.dart';
//
// // const String _rejectedActionType = 'rejected';
//
// /// Timeline entry model to hold capture data with action type context
// class _TimelineEntry {
//   final WorkOrderImageCaptureEntity capture;
//   final String actionType;
//   final DateTime occurredAt;
//   _TimelineEntry({
//     required this.capture,
//     required this.actionType,
//   }) : occurredAt = _parseTimestamp(capture);
//
//   /// Parse DateTime from timestamp field only
//   static DateTime _parseTimestamp(WorkOrderImageCaptureEntity capture) {
//     if (capture.timestamp == null || capture.timestamp!.isEmpty) {
//       return DateTime.now();
//     }
//
//     // Handle both formats:
//     // "2026-01-06 12:17:21" (space) and "2026-01-06T06:47:53.303Z" (ISO)
//     final normalizedTimestamp = capture.timestamp!.replaceFirst(' ', 'T');
//     final parsed = DateTime.tryParse(normalizedTimestamp);
//
//     return parsed ?? DateTime.now();
//   }
//
//   /// Get color for this action type using FSM theme extension
//   Color getColor(BuildContext context) {
//     final fsmTheme = context.fsmTheme;
//     switch (actionType.toLowerCase()) {
//       case 'start':
//         return fsmTheme.actionStart;
//       case 'pause':
//         return fsmTheme.actionPause;
//       case 'resume':
//         return fsmTheme.actionResume;
//       case 'complete':
//         return fsmTheme.actionComplete;
//       case 'rejected':
//         return fsmTheme.actionReject;
//       case 'signature':
//         return Theme.of(context).colorScheme.tertiary;
//       default:
//         return Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6);
//     }
//   }
//
//   /// Get icon for this action type
//   IconData get icon {
//     switch (actionType.toLowerCase()) {
//       case 'start':
//         return Icons.play_arrow;
//       case 'pause':
//         return Icons.pause;
//       case 'resume':
//         return Icons.play_arrow;
//       case 'complete':
//         return Icons.check_circle;
//       case 'signature':
//         return Icons.edit;
//       case 'rejected':
//         return Icons.cancel;
//       default:
//         return Icons.circle;
//     }
//   }
//
//   /// Get display name for this action type
//   String get displayName {
//     return actionType.toUpperCase();
//   }
// }
//
// class WorkOrderImageGallerySection extends StatelessWidget {
//   final WorkOrderGroupedImagesEntity groupedImages;
//
//   const WorkOrderImageGallerySection({
//     super.key,
//     required this.groupedImages,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final timelineEntries = groupedImages.getAllTimelineEntries();
//
//     if (timelineEntries.isEmpty) {
//       return _buildEmptyState(context);
//     }
//     final entries = timelineEntries
//         .map((entry) => _TimelineEntry(
//               capture: entry['capture'] as WorkOrderImageCaptureEntity,
//               actionType: entry['actionType'] as String,
//             ))
//         .toList();
//     // final rejectedRaw =
//     //     groupedImages.groupedImages[_rejectedActionType] as List<dynamic>?;
//     //
//     // if (rejectedRaw != null && rejectedRaw.isNotEmpty) {
//     //   final lastRejection = rejectedRaw.last as WorkOrderImageCaptureEntity;
//     //
//     //   entries.add(
//     //     _TimelineEntry(
//     //       actionType: _rejectedActionType,
//     //       capture: lastRejection,
//     //     ),
//     //   );
//     // }
//     //
//     // if (entries.isEmpty) {
//     //   return _buildEmptyState(context);
//     // }
//     entries.sort((a, b) => a.occurredAt.compareTo(b.occurredAt));
//
//     return Padding(
//       padding: REdgeInsets.only(top: DesignTokens.space4),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Section header
//           _buildHeader(context, entries.length),
//           DesignTokens.verticalSpaceMedium,
//
//           // Timeline using timelines_plus
//           Padding(
//             padding: REdgeInsets.symmetric(horizontal: DesignTokens.space4),
//             child: FixedTimeline.tileBuilder(
//               theme: TimelineThemeData(
//                 nodePosition: 0,
//                 connectorTheme: ConnectorThemeData(
//                   thickness: 2.w,
//                   color: Theme.of(context)
//                       .colorScheme
//                       .onSurface
//                       .withValues(alpha: 0.12),
//                 ),
//               ),
//               builder: TimelineTileBuilder.connected(
//                 connectionDirection: ConnectionDirection.before,
//                 itemCount: entries.length,
//                 contentsBuilder: (context, index) => Padding(
//                   padding: REdgeInsets.only(
//                     left: DesignTokens.space4,
//                     bottom: DesignTokens.space6,
//                   ),
//                   child: _buildTimelineContent(context, entries[index]),
//                 ),
//                 indicatorBuilder: (context, index) => _buildTimelineIndicator(
//                   context,
//                   entries[index],
//                 ),
//                 connectorBuilder: (context, index, type) {
//                   return SolidLineConnector(
//                     color: Theme.of(context)
//                         .colorScheme
//                         .onSurface
//                         .withValues(alpha: 0.12),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// Build section header with title and count
//   Widget _buildHeader(BuildContext context, int entryCount) {
//     return Padding(
//       padding: REdgeInsets.symmetric(horizontal: DesignTokens.space4),
//       child: Row(
//         children: [
//           Icon(
//             Icons.timeline,
//             color: Theme.of(context).colorScheme.primary,
//             size: 24.sp,
//           ),
//           DesignTokens.horizontalSpace(DesignTokens.space3),
//           Expanded(
//             child: Text(
//               'Work Timeline',
//               style: TextStyle(
//                 fontSize: 18.sp,
//                 fontWeight: FontWeight.w600,
//                 color: Theme.of(context).colorScheme.onSurface,
//               ),
//             ),
//           ),
//           DesignTokens.horizontalSpaceSmall,
//           Container(
//             padding: REdgeInsets.symmetric(
//                 horizontal: DesignTokens.space3, vertical: DesignTokens.space1),
//             decoration: BoxDecoration(
//               color:
//                   Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
//               borderRadius: BorderRadius.circular(16.r),
//             ),
//             child: Text(
//               '$entryCount ${entryCount == 1 ? 'event' : 'events'}',
//               style: TextStyle(
//                 fontSize: 12.sp,
//                 fontWeight: FontWeight.w600,
//                 color: Theme.of(context).colorScheme.primary,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// Build empty state when no timeline entries exist
//   Widget _buildEmptyState(BuildContext context) {
//     return Padding(
//       padding: REdgeInsets.symmetric(
//           vertical: DesignTokens.space12, horizontal: DesignTokens.space8),
//       child: Center(
//         child: Column(
//           children: [
//             Icon(
//               Icons.photo_library_outlined,
//               size: 48.sp,
//               color: Theme.of(context)
//                   .colorScheme
//                   .onSurface
//                   .withValues(alpha: 0.3),
//             ),
//             DesignTokens.verticalSpaceMedium,
//             Text(
//               'No documentation yet',
//               style: TextStyle(
//                 fontSize: 16.sp,
//                 fontWeight: FontWeight.w500,
//                 color: Theme.of(context)
//                     .colorScheme
//                     .onSurface
//                     .withValues(alpha: 0.6),
//               ),
//             ),
//             DesignTokens.verticalSpaceSmall,
//             Text(
//               'Images and documentation will appear here',
//               style: TextStyle(
//                 fontSize: 14.sp,
//                 color: Theme.of(context)
//                     .colorScheme
//                     .onSurface
//                     .withValues(alpha: 0.4),
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// Build timeline indicator using DotIndicator from timelines_plus
//   Widget _buildTimelineIndicator(BuildContext context, _TimelineEntry entry) {
//     final color = entry.getColor(context);
//     // final color = entry.actionType.toLowerCase() == _rejectedActionType
//     // ? Colors.red
//     // ? entry.getColor(context)
//     // : entry.getColor(context);
//     // final color = entry.actionType.toLowerCase() == _rejectedActionType
//     //     ? context.fsmTheme.actionReject
//     //     : entry.getColor(context);
//
//     return DotIndicator(
//       size: 40.w,
//       color: color.withValues(alpha: 0.15),
//       border: Border.all(
//         color: color,
//         width: 2.w,
//       ),
//       child: Icon(
//         entry.icon,
//         // entry.actionType.toLowerCase() == _rejectedActionType
//         //     ? Icons.cancel
//         //     : entry.icon,
//         color: color,
//         size: 20.sp,
//       ),
//     );
//   }
//
//   Widget _buildTimelineContent(BuildContext context, _TimelineEntry entry) {
//     final color = entry.getColor(context);
//     final isStartOrResume = entry.actionType.toLowerCase() == 'start' ||
//         entry.actionType.toLowerCase() == 'resume';
//
//     final hasComments = entry.capture.comments != null &&
//         entry.capture.comments!.trim().isNotEmpty;
//
//     final hasImages = entry.capture.imageUrls.isNotEmpty;
//     final String displayDate =
//         DateFormat('MMM dd, yyyy HH:mm').format(entry.occurredAt);
//
//     return Container(
//       padding: REdgeInsets.all(DesignTokens.space4),
//       decoration: BoxDecoration(
//         color: Theme.of(context).colorScheme.surface,
//         borderRadius: BorderRadius.circular(12.r),
//         border: Border.all(
//           color: color.withOpacity(0.2),
//           width: 1.5,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: context.fsmTheme.shadowCard,
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Header
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 padding: REdgeInsets.symmetric(
//                   horizontal: DesignTokens.space3,
//                   vertical: DesignTokens.space1,
//                 ),
//                 decoration: BoxDecoration(
//                   color: color.withOpacity(0.15),
//                   borderRadius: BorderRadius.circular(20.r),
//                   border: Border.all(color: color.withOpacity(0.3)),
//                 ),
//                 child: Row(
//                   children: [
//                     Icon(entry.icon, size: 14.sp, color: color),
//                     DesignTokens.horizontalSpace(DesignTokens.space1 + 2),
//                     Text(
//                       entry.displayName,
//                       style: TextStyle(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w700,
//                         color: color,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Row(
//                 children: [
//                   Icon(Icons.access_time,
//                       size: 14.sp,
//                       color: Theme.of(context)
//                           .colorScheme
//                           .onSurface
//                           .withOpacity(0.5)),
//                   DesignTokens.horizontalSpaceXs,
//                   Text(
//                     displayDate,
//                     style: TextStyle(
//                       fontSize: 9.sp,
//                       color: Theme.of(context)
//                           .colorScheme
//                           .onSurface
//                           .withOpacity(0.6),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//
//           DesignTokens.verticalSpaceMd,
//
//           // Metadata
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               if (entry.capture.capturedBy != null)
//                 _buildMetadataRow(
//                   context,
//                   Icons.person_outline,
//                   '${entry.capture.capturedBy!.firstName} ${entry.capture.capturedBy!.lastName}',
//                 ),
//
//               if (entry.capture.latitude != null &&
//                   entry.capture.longitude != null) ...[
//                 DesignTokens.verticalSpaceXs,
//                 _buildMetadataRow(
//                   context,
//                   Icons.location_on_outlined,
//                   '${entry.capture.latitude!.toStringAsFixed(6)}, ${entry.capture.longitude!.toStringAsFixed(6)}',
//                 ),
//               ],
//
//               // PAUSE reason (unchanged)
//               if (entry.capture.reason != null &&
//                   entry.capture.reason!.isNotEmpty) ...[
//                 DesignTokens.verticalSpaceXs,
//                 _buildMetadataRow(
//                   context,
//                   Icons.info_outline,
//                   'Reason: ${entry.capture.reason}',
//                   isHighlighted: true,
//                 ),
//               ],
//
//               // START / RESUME: Show comments if available, otherwise show "No comments"
//               if (isStartOrResume) ...[
//                 DesignTokens.verticalSpaceXs,
//                 _buildMetadataRow(
//                   context,
//                   Icons.info_outline,
//                   hasComments
//                       ? 'Notes: ${entry.capture.comments}'
//                       : 'No comments added',
//                   isHighlighted: true,
//                 ),
//               ],
//             ],
//           ),
//
//           // Images section
//           if (hasImages) ...[
//             DesignTokens.verticalSpaceMedium,
//             _buildHorizontalImageScroll(context, entry),
//           ] else if (isStartOrResume && !hasComments) ...[
//             // Only show "No images" if it's start/resume AND no comments AND no images
//             DesignTokens.verticalSpaceMedium,
//             _buildMetadataRow(
//               context,
//               Icons.photo_library_outlined,
//               'No images added',
//             ),
//           ],
//         ],
//       ),
//     );
//   }
//
//   /// Build metadata row with icon and text
//   Widget _buildMetadataRow(
//     BuildContext context,
//     IconData icon,
//     String text, {
//     bool isHighlighted = false,
//   }) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Icon(
//           icon,
//           size: 16.sp,
//           color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
//         ),
//         DesignTokens.horizontalSpaceSmall,
//         Expanded(
//           child: Text(
//             text,
//             style: TextStyle(
//               fontSize: 13.sp,
//               color: Theme.of(context)
//                   .colorScheme
//                   .onSurface
//                   .withOpacity(isHighlighted ? 0.8 : 0.6),
//               fontWeight: isHighlighted ? FontWeight.w600 : FontWeight.w500,
//               fontStyle: isHighlighted ? FontStyle.italic : FontStyle.normal,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   /// Build horizontal scrollable image gallery
//   Widget _buildHorizontalImageScroll(
//     BuildContext context,
//     _TimelineEntry entry,
//   ) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Images label
//         Row(
//           children: [
//             Icon(
//               Icons.photo_library_outlined,
//               size: 16.sp,
//               color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
//             ),
//             DesignTokens.horizontalSpace(DesignTokens.space1 + 2),
//             Text(
//               '${entry.capture.imageUrls.length} ${entry.capture.imageUrls.length == 1 ? 'image' : 'images'}',
//               style: TextStyle(
//                 fontSize: 12.sp,
//                 fontWeight: FontWeight.w600,
//                 color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
//               ),
//             ),
//           ],
//         ),
//         DesignTokens.verticalSpaceSmall,
//
//         // Horizontal scrollable image list
//         RSizedBox(
//           height: 80.h,
//           child: ListView.separated(
//             scrollDirection: Axis.horizontal,
//             itemCount: entry.capture.imageUrls.length,
//             separatorBuilder: (_, __) => DesignTokens.horizontalSpaceSmall,
//             itemBuilder: (context, index) {
//               final imageUrl = entry.capture.imageUrls[index];
//               return WorkOrderImageThumbnail(
//                 imageUrl: imageUrl,
//                 width: 80.w,
//                 height: 80.h,
//                 onTap: () {
//                   showDialog(
//                     context: context,
//                     barrierColor: context.fsmTheme.backgroundOverlay,
//                     builder: (context) => WorkOrderImagePreviewDialog(
//                       captures: [entry.capture],
//                       initialIndex: index,
//                       actionType: entry.actionType,
//                     ),
//                   );
//                 },
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fsm/core/theme/design_tokens.dart';
// import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';
// import 'package:fsm/features/work_orders/domain/entities/work_order_grouped_images_entity.dart';
// import 'package:fsm/features/work_orders/domain/entities/work_order_image_capture_entity.dart';
// import 'package:fsm/features/work_orders/presentation/widgets/work_order_image_preview_dialog.dart';
// import 'package:fsm/features/work_orders/presentation/widgets/work_order_image_thumbnail.dart';
// import 'package:intl/intl.dart';
// import 'package:timelines_plus/timelines_plus.dart';
//
// // const String _rejectedActionType = 'rejected';
//
// /// Timeline entry model to hold capture data with action type context
// class _TimelineEntry {
//   final WorkOrderImageCaptureEntity capture;
//   final String actionType;
//   final DateTime occurredAt;
//   _TimelineEntry({
//     required this.capture,
//     required this.actionType,
//   }) : occurredAt = _parseTimestamp(capture);
//   static DateTime _parseTimestamp(WorkOrderImageCaptureEntity capture) {
//     // If image exists, use capturedAt
//     final parsed = DateTime.tryParse(capture.timestamp ?? '');
//     return parsed?.toUtc() ?? DateTime.fromMillisecondsSinceEpoch(0);
//
//     // //  Otherwise use timestamp
//     // if (capture.timestamp != null && capture.timestamp!.isNotEmpty) {
//     //   final parsed = DateTime.tryParse(capture.timestamp!);
//     //   if (parsed != null) {
//     //     return parsed.toUtc();
//     //   }
//     // }
//     //
//     // return DateTime.fromMillisecondsSinceEpoch(0);
//   }
//
//   /// Get color for this action type using FSM theme extension
//   Color getColor(BuildContext context) {
//     final fsmTheme = context.fsmTheme;
//     switch (actionType.toLowerCase()) {
//       case 'start':
//         return fsmTheme.actionStart;
//       case 'pause':
//         return fsmTheme.actionPause;
//       case 'resume':
//         return fsmTheme.actionResume;
//       case 'complete':
//         return fsmTheme.actionComplete;
//       case 'rejected':
//         return fsmTheme.actionReject;
//       case 'signature':
//         return Theme.of(context).colorScheme.tertiary;
//       default:
//         return Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6);
//     }
//   }
//
//   /// Get icon for this action type
//   IconData get icon {
//     switch (actionType.toLowerCase()) {
//       case 'start':
//         return Icons.play_arrow;
//       case 'pause':
//         return Icons.pause;
//       case 'resume':
//         return Icons.play_arrow;
//       case 'complete':
//         return Icons.check_circle;
//       case 'signature':
//         return Icons.edit;
//       case 'rejected':
//         return Icons.cancel;
//       default:
//         return Icons.circle;
//     }
//   }
//
//   /// Get display name for this action type
//   String get displayName {
//     return actionType.toUpperCase();
//   }
// }
//
// class WorkOrderImageGallerySection extends StatelessWidget {
//   final WorkOrderGroupedImagesEntity groupedImages;
//
//   const WorkOrderImageGallerySection({
//     super.key,
//     required this.groupedImages,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final timelineEntries = groupedImages.getAllTimelineEntries();
//
//     if (timelineEntries.isEmpty) {
//       return _buildEmptyState(context);
//     }
//     final entries = timelineEntries
//         .map((entry) => _TimelineEntry(
//               capture: entry['capture'] as WorkOrderImageCaptureEntity,
//               actionType: entry['actionType'] as String,
//             ))
//         .toList();
//     entries.sort((a, b) => a.occurredAt.compareTo(b.occurredAt));
//     // entries.sort((a, b) {
//     //   final timeCompare = a.occurredAt.compareTo(b.occurredAt);
//     //   if (timeCompare != 0) return timeCompare;
//     //
//     //   // If time is same, use timestamp string
//     //   return (a.capture.timestamp ?? '').compareTo(b.capture.timestamp ?? '');
//     // });
//
//     return Padding(
//       padding: REdgeInsets.only(top: DesignTokens.space4),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Section header
//           _buildHeader(context, entries.length),
//           DesignTokens.verticalSpaceMedium,
//
//           // Timeline using timelines_plus
//           Padding(
//             padding: REdgeInsets.symmetric(horizontal: DesignTokens.space4),
//             child: FixedTimeline.tileBuilder(
//               theme: TimelineThemeData(
//                 nodePosition: 0,
//                 connectorTheme: ConnectorThemeData(
//                   thickness: 2.w,
//                   color: Theme.of(context)
//                       .colorScheme
//                       .onSurface
//                       .withValues(alpha: 0.12),
//                 ),
//               ),
//               builder: TimelineTileBuilder.connected(
//                 connectionDirection: ConnectionDirection.before,
//                 itemCount: entries.length,
//                 contentsBuilder: (context, index) => Padding(
//                   padding: REdgeInsets.only(
//                     left: DesignTokens.space4,
//                     bottom: DesignTokens.space6,
//                   ),
//                   child: _buildTimelineContent(context, entries[index]),
//                 ),
//                 indicatorBuilder: (context, index) => _buildTimelineIndicator(
//                   context,
//                   entries[index],
//                 ),
//                 connectorBuilder: (context, index, type) {
//                   return SolidLineConnector(
//                     color: Theme.of(context)
//                         .colorScheme
//                         .onSurface
//                         .withValues(alpha: 0.12),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// Build section header with title and count
//   Widget _buildHeader(BuildContext context, int entryCount) {
//     return Padding(
//       padding: REdgeInsets.symmetric(horizontal: DesignTokens.space4),
//       child: Row(
//         children: [
//           Icon(
//             Icons.timeline,
//             color: Theme.of(context).colorScheme.primary,
//             size: 24.sp,
//           ),
//           DesignTokens.horizontalSpace(DesignTokens.space3),
//           Expanded(
//             child: Text(
//               'Work Timeline',
//               style: TextStyle(
//                 fontSize: 18.sp,
//                 fontWeight: FontWeight.w600,
//                 color: Theme.of(context).colorScheme.onSurface,
//               ),
//             ),
//           ),
//           DesignTokens.horizontalSpaceSmall,
//           Container(
//             padding: REdgeInsets.symmetric(
//                 horizontal: DesignTokens.space3, vertical: DesignTokens.space1),
//             decoration: BoxDecoration(
//               color:
//                   Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
//               borderRadius: BorderRadius.circular(16.r),
//             ),
//             child: Text(
//               '$entryCount ${entryCount == 1 ? 'event' : 'events'}',
//               style: TextStyle(
//                 fontSize: 12.sp,
//                 fontWeight: FontWeight.w600,
//                 color: Theme.of(context).colorScheme.primary,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// Build empty state when no timeline entries exist
//   Widget _buildEmptyState(BuildContext context) {
//     return Padding(
//       padding: REdgeInsets.symmetric(
//           vertical: DesignTokens.space12, horizontal: DesignTokens.space8),
//       child: Center(
//         child: Column(
//           children: [
//             Icon(
//               Icons.photo_library_outlined,
//               size: 48.sp,
//               color: Theme.of(context)
//                   .colorScheme
//                   .onSurface
//                   .withValues(alpha: 0.3),
//             ),
//             DesignTokens.verticalSpaceMedium,
//             Text(
//               'No documentation yet',
//               style: TextStyle(
//                 fontSize: 16.sp,
//                 fontWeight: FontWeight.w500,
//                 color: Theme.of(context)
//                     .colorScheme
//                     .onSurface
//                     .withValues(alpha: 0.6),
//               ),
//             ),
//             DesignTokens.verticalSpaceSmall,
//             Text(
//               'Images and documentation will appear here',
//               style: TextStyle(
//                 fontSize: 14.sp,
//                 color: Theme.of(context)
//                     .colorScheme
//                     .onSurface
//                     .withValues(alpha: 0.4),
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// Build timeline indicator using DotIndicator from timelines_plus
//   Widget _buildTimelineIndicator(BuildContext context, _TimelineEntry entry) {
//     final color = entry.getColor(context);
//     // final color = entry.actionType.toLowerCase() == _rejectedActionType
//     // ? Colors.red
//     // ? entry.getColor(context)
//     // : entry.getColor(context);
//     // final color = entry.actionType.toLowerCase() == _rejectedActionType
//     //     ? context.fsmTheme.actionReject
//     //     : entry.getColor(context);
//
//     return DotIndicator(
//       size: 40.w,
//       color: color.withValues(alpha: 0.15),
//       border: Border.all(
//         color: color,
//         width: 2.w,
//       ),
//       child: Icon(
//         entry.icon,
//         // entry.actionType.toLowerCase() == _rejectedActionType
//         //     ? Icons.cancel
//         //     : entry.icon,
//         color: color,
//         size: 20.sp,
//       ),
//     );
//   }
//
//   Widget _buildTimelineContent(BuildContext context, _TimelineEntry entry) {
//     final color = entry.getColor(context);
//     final isStartOrResume = entry.actionType.toLowerCase() == 'start' ||
//         entry.actionType.toLowerCase() == 'resume';
//
//     final hasComments = entry.capture.comments != null &&
//         entry.capture.comments!.trim().isNotEmpty;
//
//     final hasImages = entry.capture.imageUrls.isNotEmpty;
//     final String displayDate =
//         DateFormat('MMM dd, yyyy HH:mm').format(entry.occurredAt.toLocal());
//
//     return Container(
//       padding: REdgeInsets.all(DesignTokens.space4),
//       decoration: BoxDecoration(
//         color: Theme.of(context).colorScheme.surface,
//         borderRadius: BorderRadius.circular(12.r),
//         border: Border.all(
//           color: color.withOpacity(0.2),
//           width: 1.5,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: context.fsmTheme.shadowCard,
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Header
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 padding: REdgeInsets.symmetric(
//                   horizontal: DesignTokens.space3,
//                   vertical: DesignTokens.space1,
//                 ),
//                 decoration: BoxDecoration(
//                   color: color.withOpacity(0.15),
//                   borderRadius: BorderRadius.circular(20.r),
//                   border: Border.all(color: color.withOpacity(0.3)),
//                 ),
//                 child: Row(
//                   children: [
//                     Icon(entry.icon, size: 14.sp, color: color),
//                     DesignTokens.horizontalSpace(DesignTokens.space1 + 2),
//                     Text(
//                       entry.displayName,
//                       style: TextStyle(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w700,
//                         color: color,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Row(
//                 children: [
//                   Icon(Icons.access_time,
//                       size: 14.sp,
//                       color: Theme.of(context)
//                           .colorScheme
//                           .onSurface
//                           .withOpacity(0.5)),
//                   DesignTokens.horizontalSpaceXs,
//                   Text(
//                     displayDate,
//                     style: TextStyle(
//                       fontSize: 9.sp,
//                       color: Theme.of(context)
//                           .colorScheme
//                           .onSurface
//                           .withOpacity(0.6),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//
//           DesignTokens.verticalSpaceMd,
//
//           // Metadata
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               if (entry.capture.capturedBy != null)
//                 _buildMetadataRow(
//                   context,
//                   Icons.person_outline,
//                   '${entry.capture.capturedBy!.firstName} ${entry.capture.capturedBy!.lastName}',
//                 ),
//
//               if (entry.capture.latitude != null &&
//                   entry.capture.longitude != null) ...[
//                 DesignTokens.verticalSpaceXs,
//                 _buildMetadataRow(
//                   context,
//                   Icons.location_on_outlined,
//                   '${entry.capture.latitude!.toStringAsFixed(6)}, ${entry.capture.longitude!.toStringAsFixed(6)}',
//                 ),
//               ],
//
//               // PAUSE reason (unchanged)
//               if (entry.capture.reason != null &&
//                   entry.capture.reason!.isNotEmpty) ...[
//                 DesignTokens.verticalSpaceXs,
//                 _buildMetadataRow(
//                   context,
//                   Icons.info_outline,
//                   'Reason: ${entry.capture.reason}',
//                   isHighlighted: true,
//                 ),
//               ],
//
//               // START / RESUME: Show comments if available, otherwise show "No comments"
//               if (isStartOrResume) ...[
//                 DesignTokens.verticalSpaceXs,
//                 _buildMetadataRow(
//                   context,
//                   Icons.info_outline,
//                   hasComments
//                       ? 'Notes: ${entry.capture.comments}'
//                       : 'No comments added',
//                   isHighlighted: true,
//                 ),
//               ],
//             ],
//           ),
//
//           // Images section
//           if (hasImages) ...[
//             DesignTokens.verticalSpaceMedium,
//             _buildHorizontalImageScroll(context, entry),
//           ] else if (isStartOrResume && !hasComments) ...[
//             // Only show "No images" if it's start/resume AND no comments AND no images
//             DesignTokens.verticalSpaceMedium,
//             _buildMetadataRow(
//               context,
//               Icons.photo_library_outlined,
//               'No images added',
//             ),
//           ],
//         ],
//       ),
//     );
//   }
//
//   /// Build metadata row with icon and text
//   Widget _buildMetadataRow(
//     BuildContext context,
//     IconData icon,
//     String text, {
//     bool isHighlighted = false,
//   }) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Icon(
//           icon,
//           size: 16.sp,
//           color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
//         ),
//         DesignTokens.horizontalSpaceSmall,
//         Expanded(
//           child: Text(
//             text,
//             style: TextStyle(
//               fontSize: 13.sp,
//               color: Theme.of(context)
//                   .colorScheme
//                   .onSurface
//                   .withOpacity(isHighlighted ? 0.8 : 0.6),
//               fontWeight: isHighlighted ? FontWeight.w600 : FontWeight.w500,
//               fontStyle: isHighlighted ? FontStyle.italic : FontStyle.normal,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   /// Build horizontal scrollable image gallery
//   Widget _buildHorizontalImageScroll(
//     BuildContext context,
//     _TimelineEntry entry,
//   ) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Images label
//         Row(
//           children: [
//             Icon(
//               Icons.photo_library_outlined,
//               size: 16.sp,
//               color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
//             ),
//             DesignTokens.horizontalSpace(DesignTokens.space1 + 2),
//             Text(
//               '${entry.capture.imageUrls.length} ${entry.capture.imageUrls.length == 1 ? 'image' : 'images'}',
//               style: TextStyle(
//                 fontSize: 12.sp,
//                 fontWeight: FontWeight.w600,
//                 color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
//               ),
//             ),
//           ],
//         ),
//         DesignTokens.verticalSpaceSmall,
//
//         // Horizontal scrollable image list
//         RSizedBox(
//           height: 80.h,
//           child: ListView.separated(
//             scrollDirection: Axis.horizontal,
//             itemCount: entry.capture.imageUrls.length,
//             separatorBuilder: (_, __) => DesignTokens.horizontalSpaceSmall,
//             itemBuilder: (context, index) {
//               final imageUrl = entry.capture.imageUrls[index];
//               return WorkOrderImageThumbnail(
//                 imageUrl: imageUrl,
//                 width: 80.w,
//                 height: 80.h,
//                 onTap: () {
//                   showDialog(
//                     context: context,
//                     barrierColor: context.fsmTheme.backgroundOverlay,
//                     builder: (context) => WorkOrderImagePreviewDialog(
//                       captures: [entry.capture],
//                       initialIndex: index,
//                       actionType: entry.actionType,
//                     ),
//                   );
//                 },
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_grouped_images_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_image_capture_entity.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_image_preview_dialog.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_image_thumbnail.dart';
import 'package:intl/intl.dart';
import 'package:timelines_plus/timelines_plus.dart';

/// Timeline entry model to hold capture data with action type context
class _TimelineEntry {
  final WorkOrderImageCaptureEntity capture;
  final String actionType;
  final DateTime occurredAt;
  _TimelineEntry({
    required this.capture,
    required this.actionType,
  }) : occurredAt = _parseTimestamp(capture);

  static DateTime _parseTimestamp(WorkOrderImageCaptureEntity capture) {
    // final parsed = DateTime.tryParse(capture.timestamp ?? '');
    // return parsed?.toUtc() ?? DateTime.fromMillisecondsSinceEpoch(0);
    final parsed = DateTime.tryParse(capture.timestamp ?? '');
    if (parsed != null) {
      return parsed.toUtc();
    }
    if (capture.capturedAt != null) {
      return capture.capturedAt!.toUtc();
    }

    return DateTime.fromMillisecondsSinceEpoch(0);
  }

  /// Get color for this action type using FSM theme extension
  Color getColor(BuildContext context) {
    final fsmTheme = context.fsmTheme;
    switch (actionType.toLowerCase()) {
      case 'start':
        return fsmTheme.actionStart;
      case 'pause':
        return fsmTheme.actionPause;
      case 'resume':
        return fsmTheme.actionResume;
      case 'complete':
        return fsmTheme.actionComplete;
      case 'rejected':
        return fsmTheme.actionReject;
      case 'signature':
        return Theme.of(context).colorScheme.tertiary;
      default:
        return Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6);
    }
  }

  /// Get icon for this action type
  IconData get icon {
    switch (actionType.toLowerCase()) {
      case 'start':
        return Icons.play_arrow;
      case 'pause':
        return Icons.pause;
      case 'resume':
        return Icons.play_arrow;
      case 'complete':
        return Icons.check_circle;
      case 'signature':
        return Icons.edit;
      case 'rejected':
        return Icons.cancel;
      default:
        return Icons.circle;
    }
  }

  /// Get display name for this action type
  String get displayName {
    return actionType.toUpperCase();
  }
}

class WorkOrderImageGallerySection extends StatelessWidget {
  final WorkOrderGroupedImagesEntity groupedImages;

  const WorkOrderImageGallerySection({
    super.key,
    required this.groupedImages,
  });

  @override
  Widget build(BuildContext context) {
    final timelineEntries = groupedImages.getAllTimelineEntries();

    if (timelineEntries.isEmpty) {
      return _buildEmptyState(context);
    }
    final entries = timelineEntries
        .map((entry) => _TimelineEntry(
              capture: entry['capture'] as WorkOrderImageCaptureEntity,
              actionType: entry['actionType'] as String,
            ))
        .toList();
    entries.sort((a, b) => a.occurredAt.compareTo(b.occurredAt));

    return Padding(
      padding: REdgeInsets.only(top: DesignTokens.space4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          _buildHeader(context, entries.length),
          DesignTokens.verticalSpaceMedium,

          // Timeline using timelines_plus
          Padding(
            padding: REdgeInsets.symmetric(horizontal: DesignTokens.space4),
            child: FixedTimeline.tileBuilder(
              theme: TimelineThemeData(
                nodePosition: 0,
                connectorTheme: ConnectorThemeData(
                  thickness: 2.w,
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.12),
                ),
              ),
              builder: TimelineTileBuilder.connected(
                connectionDirection: ConnectionDirection.before,
                itemCount: entries.length,
                contentsBuilder: (context, index) => Padding(
                  padding: REdgeInsets.only(
                    left: DesignTokens.space4,
                    bottom: DesignTokens.space6,
                  ),
                  child: _buildTimelineContent(context, entries[index]),
                ),
                indicatorBuilder: (context, index) => _buildTimelineIndicator(
                  context,
                  entries[index],
                ),
                connectorBuilder: (context, index, type) {
                  return SolidLineConnector(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.12),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Build section header with title and count
  Widget _buildHeader(BuildContext context, int entryCount) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: DesignTokens.space4),
      child: Row(
        children: [
          Icon(
            Icons.timeline,
            color: Theme.of(context).colorScheme.primary,
            size: 24.sp,
          ),
          DesignTokens.horizontalSpace(DesignTokens.space3),
          Expanded(
            child: Text(
              'Work Timeline',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          DesignTokens.horizontalSpaceSmall,
          Container(
            padding: REdgeInsets.symmetric(
                horizontal: DesignTokens.space3, vertical: DesignTokens.space1),
            decoration: BoxDecoration(
              color:
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Text(
              '$entryCount ${entryCount == 1 ? 'event' : 'events'}',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Build empty state when no timeline entries exist
  Widget _buildEmptyState(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(
          vertical: DesignTokens.space12, horizontal: DesignTokens.space8),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.photo_library_outlined,
              size: 48.sp,
              color: Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withValues(alpha: 0.3),
            ),
            DesignTokens.verticalSpaceMedium,
            Text(
              'No documentation yet',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 0.6),
              ),
            ),
            DesignTokens.verticalSpaceSmall,
            Text(
              'Images and documentation will appear here',
              style: TextStyle(
                fontSize: 14.sp,
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 0.4),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  /// Build timeline indicator using DotIndicator from timelines_plus
  Widget _buildTimelineIndicator(BuildContext context, _TimelineEntry entry) {
    final color = entry.getColor(context);

    return DotIndicator(
      size: 40.w,
      color: color.withValues(alpha: 0.15),
      border: Border.all(
        color: color,
        width: 2.w,
      ),
      child: Icon(
        entry.icon,
        color: color,
        size: 20.sp,
      ),
    );
  }

  Widget _buildTimelineContent(BuildContext context, _TimelineEntry entry) {
    final color = entry.getColor(context);
    final isStartOrResume = entry.actionType.toLowerCase() == 'start' ||
        entry.actionType.toLowerCase() == 'resume';

    final hasComments = entry.capture.comments != null &&
        entry.capture.comments!.trim().isNotEmpty;

    // final hasImages = entry.capture.imageUrls.isNotEmpty;
    final hasImages = entry.capture.imageUrls.isNotEmpty ?? false;
    // Display timestamp (when action was performed)
    final String displayDate =
        DateFormat('MMM dd, yyyy HH:mm').format(entry.occurredAt.toLocal());

    return Container(
      padding: REdgeInsets.all(DesignTokens.space4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: color.withOpacity(0.2),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: context.fsmTheme.shadowCard,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: REdgeInsets.symmetric(
                  horizontal: DesignTokens.space3,
                  vertical: DesignTokens.space1,
                ),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: color.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    Icon(entry.icon, size: 14.sp, color: color),
                    DesignTokens.horizontalSpace(DesignTokens.space1 + 2),
                    Text(
                      entry.displayName,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: color,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(Icons.access_time,
                      size: 14.sp,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.5)),
                  DesignTokens.horizontalSpaceXs,
                  Text(
                    displayDate,
                    style: TextStyle(
                      fontSize: 9.sp,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ],
          ),

          DesignTokens.verticalSpaceMd,

          // Metadata
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (entry.capture.capturedBy != null)
                _buildMetadataRow(
                  context,
                  Icons.person_outline,
                  '${entry.capture.capturedBy!.firstName} ${entry.capture.capturedBy!.lastName}',
                ),

              if (entry.capture.latitude != null &&
                  entry.capture.longitude != null) ...[
                DesignTokens.verticalSpaceXs,
                _buildMetadataRow(
                  context,
                  Icons.location_on_outlined,
                  '${entry.capture.latitude!.toStringAsFixed(6)}, ${entry.capture.longitude!.toStringAsFixed(6)}',
                ),
              ],

              // PAUSE reason
              if (entry.capture.reason != null &&
                  entry.capture.reason!.isNotEmpty) ...[
                DesignTokens.verticalSpaceXs,
                _buildMetadataRow(
                  context,
                  Icons.info_outline,
                  'Reason: ${entry.capture.reason}',
                  isHighlighted: true,
                ),
              ],

              // START / RESUME: Show comments if available, otherwise show "No comments"
              if (isStartOrResume) ...[
                DesignTokens.verticalSpaceXs,
                _buildMetadataRow(
                  context,
                  Icons.info_outline,
                  hasComments
                      ? 'Notes: ${entry.capture.comments}'
                      : 'No comments added',
                  isHighlighted: true,
                ),
              ],
            ],
          ),

          // Images section - these are ALREADY in the correct capture object
          // Backend groups images with their parent action, so we just display them
          if (hasImages) ...[
            DesignTokens.verticalSpaceMedium,
            _buildHorizontalImageScroll(context, entry),
          ] else if (isStartOrResume && !hasComments) ...[
            // Only show "No images" if it's start/resume AND no comments AND no images
            DesignTokens.verticalSpaceMedium,
            _buildMetadataRow(
              context,
              Icons.photo_library_outlined,
              'No images added',
            ),
          ],
        ],
      ),
    );
  }

  /// Build metadata row with icon and text
  Widget _buildMetadataRow(
    BuildContext context,
    IconData icon,
    String text, {
    bool isHighlighted = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 16.sp,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
        ),
        DesignTokens.horizontalSpaceSmall,
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13.sp,
              color: Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withOpacity(isHighlighted ? 0.8 : 0.6),
              fontWeight: isHighlighted ? FontWeight.w600 : FontWeight.w500,
              fontStyle: isHighlighted ? FontStyle.italic : FontStyle.normal,
            ),
          ),
        ),
      ],
    );
  }

  /// Build horizontal scrollable image gallery
  Widget _buildHorizontalImageScroll(
    BuildContext context,
    _TimelineEntry entry,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Images label with captured_at time if available
        Row(
          children: [
            Icon(
              Icons.photo_library_outlined,
              size: 16.sp,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
            DesignTokens.horizontalSpace(DesignTokens.space1 + 2),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${entry.capture.imageUrls.length} ${entry.capture.imageUrls.length == 1 ? 'image' : 'images'}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.6),
                    ),
                  ),
                  // Show captured_at time if available (when image was actually taken)
                  if (entry.capture.capturedAt != null) ...[
                    DesignTokens.verticalSpace(2),
                    Text(
                      'Captured: ${DateFormat('MMM dd, yyyy HH:mm').format(entry.capture.capturedAt!.toLocal())}',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.4),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
        DesignTokens.verticalSpaceSmall,

        // Horizontal scrollable image list
        RSizedBox(
          height: 80.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: entry.capture.imageUrls.length,
            separatorBuilder: (_, __) => DesignTokens.horizontalSpaceSmall,
            itemBuilder: (context, index) {
              final imageUrl = entry.capture.imageUrls[index];
              return WorkOrderImageThumbnail(
                imageUrl: imageUrl,
                width: 80.w,
                height: 80.h,
                onTap: () {
                  showDialog(
                    context: context,
                    barrierColor: context.fsmTheme.backgroundOverlay,
                    builder: (context) => WorkOrderImagePreviewDialog(
                      captures: [entry.capture],
                      initialIndex: index,
                      actionType: entry.actionType,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
