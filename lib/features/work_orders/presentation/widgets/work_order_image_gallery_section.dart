import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_grouped_images_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_image_capture_entity.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_image_thumbnail.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_image_preview_dialog.dart';

class WorkOrderImageGallerySection extends StatelessWidget {
  final WorkOrderGroupedImagesEntity groupedImages;

  const WorkOrderImageGallerySection({
    super.key,
    required this.groupedImages,
  });

  @override
  Widget build(BuildContext context) {
    if (!groupedImages.hasAnyImages) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Row(
            children: [
              Icon(
                Icons.photo_library,
                color: AppColors.primary,
                size: 24.sp,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  'Images & Documentation',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Text(
                  '${groupedImages.totalImageCount} ${groupedImages.totalImageCount == 1 ? 'image' : 'images'}',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Action type sections
        if (groupedImages.startImages.isNotEmpty)
          _buildActionSection(
            context,
            'Start',
            groupedImages.startImages,
            Colors.green,
            Icons.play_arrow,
          ),

        if (groupedImages.pauseImages.isNotEmpty)
          _buildActionSection(
            context,
            'Pause',
            groupedImages.pauseImages,
            Colors.orange,
            Icons.pause,
          ),

        if (groupedImages.resumeImages.isNotEmpty)
          _buildActionSection(
            context,
            'Resume',
            groupedImages.resumeImages,
            Colors.green,
            Icons.play_arrow,
          ),

        if (groupedImages.completeImages.isNotEmpty)
          _buildActionSection(
            context,
            'Complete',
            groupedImages.completeImages,
            Colors.blue,
            Icons.check_circle,
          ),

        if (groupedImages.signatureImages.isNotEmpty)
          _buildActionSection(
            context,
            'Signature',
            groupedImages.signatureImages,
            Colors.purple,
            Icons.edit,
          ),
      ],
    );
  }

  Widget _buildActionSection(
    BuildContext context,
    String actionType,
    List<WorkOrderImageCaptureEntity> captures,
    Color color,
    IconData icon,
  ) {
    // Count total images
    int totalImages =
        captures.fold(0, (sum, capture) => sum + capture.imageUrls.length);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        childrenPadding: EdgeInsets.all(16.w),
        leading: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(
            icon,
            color: color,
            size: 20.sp,
          ),
        ),
        title: Text(
          actionType,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        subtitle: Text(
          '$totalImages image${totalImages != 1 ? 's' : ''} • ${captures.length} capture${captures.length != 1 ? 's' : ''}',
          style: TextStyle(
            fontSize: 12.sp,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          ),
        ),
        children: [
          ...captures.map((capture) =>
              _buildCaptureItem(context, capture, actionType, color)),
        ],
      ),
    );
  }

  Widget _buildCaptureItem(
    BuildContext context,
    WorkOrderImageCaptureEntity capture,
    String actionType,
    Color color,
  ) {
    // Determine display date - use capturedAt if available, otherwise timestamp
    String? displayDate;
    if (capture.capturedAt != null) {
      displayDate = DateFormat('MMM dd, yyyy HH:mm').format(capture.capturedAt!);
    } else if (capture.timestamp != null) {
      try {
        final parsedTimestamp = DateTime.parse(capture.timestamp!);
        displayDate = DateFormat('MMM dd, yyyy HH:mm').format(parsedTimestamp);
      } catch (e) {
        displayDate = capture.timestamp;
      }
    }

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: color.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Metadata row
          if (displayDate != null)
            Row(
              children: [
                Icon(
                  Icons.access_time,
                  size: 14.sp,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
                SizedBox(width: 4.w),
                Text(
                  displayDate,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.7),
                  ),
                ),
                if (capture.capturedBy != null) ...[
                  SizedBox(width: 12.w),
                  Icon(
                    Icons.person,
                    size: 14.sp,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.6),
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Text(
                      '${capture.capturedBy!.firstName} ${capture.capturedBy!.lastName}',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.7),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ],
            ),

          // Reason field (for pause entries)
          if (capture.reason != null && capture.reason!.isNotEmpty) ...[
            SizedBox(height: 6.h),
            Row(
              children: [
                Icon(
                  Icons.info_outline,
                  size: 14.sp,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: Text(
                    'Reason: ${capture.reason}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.7),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ],

          if (capture.latitude != null && capture.longitude != null) ...[
            SizedBox(height: 6.h),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 14.sp,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: Text(
                    '${capture.latitude!.toStringAsFixed(6)}, ${capture.longitude!.toStringAsFixed(6)}',
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.6),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],

          // Image thumbnails grid (only show if there are images)
          if (capture.imageUrls.isNotEmpty) ...[
            SizedBox(height: 12.h),
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: capture.imageUrls.asMap().entries.map((entry) {
                final index = entry.key;
                final imageUrl = entry.value;

                return WorkOrderImageThumbnail(
                  imageUrl: imageUrl,
                  width: 80.w,
                  height: 80.h,
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierColor: Colors.black87,
                      builder: (context) => WorkOrderImagePreviewDialog(
                        captures: [capture],
                        initialIndex: index,
                        actionType: actionType,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ],
      ),
    );
  }
}
