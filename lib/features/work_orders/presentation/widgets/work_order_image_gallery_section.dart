import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_grouped_images_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_image_capture_entity.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_image_thumbnail.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_image_preview_dialog.dart';

/// Timeline entry model to hold capture data with action type context
class _TimelineEntry {
  final WorkOrderImageCaptureEntity capture;
  final String actionType;

  const _TimelineEntry({
    required this.capture,
    required this.actionType,
  });

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
      case 'signature':
        return Theme.of(context).colorScheme.tertiary;
      default:
        return Theme.of(context).colorScheme.onSurface.withOpacity(0.6);
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

    // Convert to timeline entry objects
    final entries = timelineEntries
        .map((entry) => _TimelineEntry(
              capture: entry['capture'] as WorkOrderImageCaptureEntity,
              actionType: entry['actionType'] as String,
            ))
        .toList();

    return Padding(
      padding: REdgeInsets.only(top: DesignTokens.space4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          _buildHeader(context, entries.length),
          DesignTokens.verticalSpaceMedium,

          // Timeline entries
          ...entries.asMap().entries.map((entry) {
            final index = entry.key;
            final timelineEntry = entry.value;
            final isLast = index == entries.length - 1;

            return _buildTimelineEntry(
              context,
              timelineEntry,
              isLast,
            );
          }),
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
            padding: REdgeInsets.symmetric(horizontal: DesignTokens.space3, vertical: DesignTokens.space1),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
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
      padding: REdgeInsets.symmetric(vertical: DesignTokens.space12, horizontal: DesignTokens.space8),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.photo_library_outlined,
              size: 48.sp,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
            ),
            DesignTokens.verticalSpaceMedium,
            Text(
              'No documentation yet',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
            DesignTokens.verticalSpaceSmall,
            Text(
              'Images and documentation will appear here',
              style: TextStyle(
                fontSize: 14.sp,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  /// Build a single timeline entry
  Widget _buildTimelineEntry(
    BuildContext context,
    _TimelineEntry entry,
    bool isLast,
  ) {
    return Padding(
      padding: REdgeInsets.only(left: DesignTokens.space4, right: DesignTokens.space4, bottom: DesignTokens.space6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline marker and line
          Column(
            children: [
              // Marker circle with icon
              _buildTimelineMarker(context, entry),

              // Connecting line (if not last entry)
              if (!isLast)
                Container(
                  width: 2.w,
                  height: 40.h,
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withOpacity(0.12),
                ),
            ],
          ),

          DesignTokens.horizontalSpaceMedium,

          // Timeline content
          Expanded(
            child: _buildTimelineContent(context, entry),
          ),
        ],
      ),
    );
  }

  /// Build timeline marker (colored circle with icon)
  Widget _buildTimelineMarker(BuildContext context, _TimelineEntry entry) {
    final color = entry.getColor(context);
    return Container(
      width: 40.w,
      height: 40.w,
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        shape: BoxShape.circle,
        border: Border.all(
          color: color,
          width: 2.w,
        ),
      ),
      child: Icon(
        entry.icon,
        color: color,
        size: 20.sp,
      ),
    );
  }

  /// Build timeline entry content card
  Widget _buildTimelineContent(BuildContext context, _TimelineEntry entry) {
    final color = entry.getColor(context);
    
    // Determine display date
    String? displayDate;
    if (entry.capture.capturedAt != null) {
      displayDate =
          DateFormat('MMM dd, yyyy HH:mm').format(entry.capture.capturedAt!);
    } else if (entry.capture.timestamp != null) {
      try {
        final parsedTimestamp = DateTime.parse(entry.capture.timestamp!);
        displayDate = DateFormat('MMM dd, yyyy HH:mm').format(parsedTimestamp);
      } catch (e) {
        displayDate = entry.capture.timestamp;
      }
    }

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
          // Header row with action badge and timestamp
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Action badge
              Container(
                padding: REdgeInsets.symmetric(horizontal: DesignTokens.space3, vertical: DesignTokens.space1),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: color.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      entry.icon,
                      size: 14.sp,
                      color: color,
                    ),
                    DesignTokens.horizontalSpace(DesignTokens.space1 + 2),
                    Text(
                      entry.displayName,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: color,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),

              // Timestamp
              if (displayDate != null)
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 14.sp,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.5),
                    ),
                    DesignTokens.horizontalSpaceXs,
                    Text(
                      displayDate,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.6),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
            ],
          ),

          DesignTokens.verticalSpaceMd,

          // Metadata section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User info
              if (entry.capture.capturedBy != null)
                _buildMetadataRow(
                  context,
                  Icons.person_outline,
                  '${entry.capture.capturedBy!.firstName} ${entry.capture.capturedBy!.lastName}',
                ),

              // GPS coordinates
              if (entry.capture.latitude != null &&
                  entry.capture.longitude != null) ...[
                if (entry.capture.capturedBy != null) DesignTokens.verticalSpaceXs,
                _buildMetadataRow(
                  context,
                  Icons.location_on_outlined,
                  '${entry.capture.latitude!.toStringAsFixed(6)}, ${entry.capture.longitude!.toStringAsFixed(6)}',
                ),
              ],

              // Reason (for pause actions)
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

              // Remarks
              if (entry.capture.remarks != null &&
                  entry.capture.remarks!.isNotEmpty) ...[
                DesignTokens.verticalSpaceXs,
                _buildMetadataRow(
                  context,
                  Icons.note_outlined,
                  entry.capture.remarks!,
                  isHighlighted: true,
                ),
              ],
            ],
          ),

          // Images section (if images exist)
          if (entry.capture.imageUrls.isNotEmpty) ...[
            DesignTokens.verticalSpaceMedium,
            _buildHorizontalImageScroll(context, entry),
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
        // Images label
        Row(
          children: [
            Icon(
              Icons.photo_library_outlined,
              size: 16.sp,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
            DesignTokens.horizontalSpace(DesignTokens.space1 + 2),
            Text(
              '${entry.capture.imageUrls.length} ${entry.capture.imageUrls.length == 1 ? 'image' : 'images'}',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
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
