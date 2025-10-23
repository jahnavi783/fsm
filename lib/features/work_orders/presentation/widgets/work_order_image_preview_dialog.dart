import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_image_capture_entity.dart';

class WorkOrderImagePreviewDialog extends StatefulWidget {
  final List<WorkOrderImageCaptureEntity> captures;
  final int initialIndex;
  final String actionType;

  const WorkOrderImagePreviewDialog({
    super.key,
    required this.captures,
    required this.initialIndex,
    required this.actionType,
  });

  @override
  State<WorkOrderImagePreviewDialog> createState() =>
      _WorkOrderImagePreviewDialogState();
}

class _WorkOrderImagePreviewDialogState
    extends State<WorkOrderImagePreviewDialog> {
  late PageController _pageController;
  late int _currentIndex;
  late int _currentImageIndexInCapture;
  late List<String> _allImages;
  late Map<int, WorkOrderImageCaptureEntity> _imageIndexToCapture;

  @override
  void initState() {
    super.initState();
    _buildImageList();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
  }

  void _buildImageList() {
    _allImages = [];
    _imageIndexToCapture = {};
    int imageIndex = 0;

    for (final capture in widget.captures) {
      // Skip captures with no images (e.g., resume entries)
      if (capture.imageUrls.isEmpty) continue;

      for (final imageUrl in capture.imageUrls) {
        _allImages.add(imageUrl);
        _imageIndexToCapture[imageIndex] = capture;
        imageIndex++;
      }
    }
    _currentImageIndexInCapture = 0;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black,
      insetPadding: EdgeInsets.zero,
      child: Stack(
        children: [
          // Image gallery
          PhotoViewGallery.builder(
            scrollPhysics: const BouncingScrollPhysics(),
            builder: (BuildContext context, int index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: CachedNetworkImageProvider(_allImages[index]),
                initialScale: PhotoViewComputedScale.contained,
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 3,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.broken_image,
                          color: Colors.white54,
                          size: 64.sp,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'Failed to load image',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            itemCount: _allImages.length,
            loadingBuilder: (context, event) => Center(
              child: CircularProgressIndicator(
                value: event == null
                    ? 0
                    : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
                color: Colors.white,
              ),
            ),
            pageController: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),

          // Top bar with close button and counter
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                  ],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Image counter
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Text(
                          '${_currentIndex + 1} / ${_allImages.length}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      // Close button
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 24.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Bottom metadata bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.transparent,
                  ],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: _buildImageMetadata(_currentIndex),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageMetadata(int index) {
    final capture = _imageIndexToCapture[index];
    if (capture == null) return const SizedBox.shrink();

    // Determine display date
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Action type badge
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: _getActionColor(widget.actionType).withOpacity(0.3),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
            ),
          ),
          child: Text(
            widget.actionType.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 12.h),

        // Metadata rows
        if (capture.latitude != null && capture.longitude != null) ...[
          _buildMetadataRow(
            Icons.location_on,
            'GPS',
            '${capture.latitude!.toStringAsFixed(6)}, ${capture.longitude!.toStringAsFixed(6)}',
          ),
          SizedBox(height: 8.h),
        ],
        if (displayDate != null) ...[
          _buildMetadataRow(
            Icons.access_time,
            'Captured',
            displayDate,
          ),
          SizedBox(height: 8.h),
        ],
        if (capture.capturedBy != null) ...[
          _buildMetadataRow(
            Icons.person,
            'By',
            '${capture.capturedBy!.firstName} ${capture.capturedBy!.lastName}',
          ),
          SizedBox(height: 8.h),
        ],
        if (capture.reason != null && capture.reason!.isNotEmpty) ...[
          _buildMetadataRow(
            Icons.info_outline,
            'Reason',
            capture.reason!,
          ),
        ],
      ],
    );
  }

  Widget _buildMetadataRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 16.sp),
        SizedBox(width: 8.w),
        Text(
          '$label: ',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Color _getActionColor(String actionType) {
    switch (actionType.toLowerCase()) {
      case 'start':
      case 'resume':
        return Colors.green;
      case 'pause':
        return Colors.orange;
      case 'complete':
        return Colors.blue;
      case 'signature':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }
}
