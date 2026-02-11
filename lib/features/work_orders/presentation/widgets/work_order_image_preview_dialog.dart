import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart' show DesignTokens;
import 'package:fsm/core/theme/extensions/fsm_theme_extension.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_image_capture_entity.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

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
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handleClose() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fsmTheme = context.fsmTheme;

    return Dialog(
      backgroundColor: theme.colorScheme.surface,
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
                          color: theme.colorScheme.onSurface
                              .withValues(alpha: 0.54),
                          size: 64.sp,
                        ),
                        DesignTokens.verticalSpaceMedium,
                        Text(
                          'Failed to load image',
                          style: TextStyle(
                            color: theme.colorScheme.onSurface
                                .withValues(alpha: 0.70),
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
                color: theme.colorScheme.primary,
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
                    fsmTheme.backgroundOverlay.withValues(alpha: 0.6),
                    Colors.transparent,
                  ],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: REdgeInsets.all(DesignTokens.space4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Image counter
                      Container(
                        padding: REdgeInsets.symmetric(
                          horizontal: DesignTokens.space3,
                          vertical: DesignTokens.space1 + 2,
                        ),
                        decoration: BoxDecoration(
                          color:
                              fsmTheme.backgroundOverlay.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Text(
                          '${_currentIndex + 1} / ${_allImages.length}',
                          style: TextStyle(
                            color: theme.colorScheme.onSurface,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      // Close button
                      IconButton(
                        onPressed: _handleClose,
                        icon: Container(
                          padding: REdgeInsets.all(DesignTokens.space2),
                          decoration: BoxDecoration(
                            color: fsmTheme.backgroundOverlay
                                .withValues(alpha: 0.5),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.close,
                            color: theme.colorScheme.onSurface,
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
                    fsmTheme.backgroundOverlay.withValues(alpha: 0.8),
                    Colors.transparent,
                  ],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: REdgeInsets.all(DesignTokens.space4),
                  child: _buildImageMetadata(context, _currentIndex),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageMetadata(BuildContext context, int index) {
    final theme = Theme.of(context);
    final fsmTheme = theme.extension<FSMThemeExtension>()!;

    final capture = _imageIndexToCapture[index];
    if (capture == null) return const SizedBox.shrink();

    // Determine display date
    String? displayDate;
    if (capture.capturedAt != null) {
      displayDate =
          DateFormat('MMM dd, yyyy HH:mm').format(capture.capturedAt!);
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
          padding: REdgeInsets.symmetric(
              horizontal: DesignTokens.space3,
              vertical: DesignTokens.space1 + 2),
          decoration: BoxDecoration(
            color: _getActionColor(widget.actionType, fsmTheme)
                .withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
            ),
          ),
          child: Text(
            widget.actionType.toUpperCase(),
            style: TextStyle(
              color: theme.colorScheme.onSurface,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        DesignTokens.verticalSpace(DesignTokens.space3),

        // Metadata rows
        if (capture.latitude != null && capture.longitude != null) ...[
          _buildMetadataRow(
            Icons.location_on,
            'GPS',
            '${capture.longitude!.toStringAsFixed(6)} , ${capture.latitude!.toStringAsFixed(6)}',
          ),
          DesignTokens.verticalSpaceSmall,
        ],
        if (displayDate != null) ...[
          _buildMetadataRow(
            Icons.access_time,
            'Captured',
            displayDate,
          ),
          DesignTokens.verticalSpaceSmall,
        ],
        if (capture.capturedBy != null) ...[
          _buildMetadataRow(
            Icons.person,
            'By',
            '${capture.capturedBy!.firstName} ${capture.capturedBy!.lastName}',
          ),
          DesignTokens.verticalSpaceSmall,
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
    final theme = Theme.of(context);

    return Row(
      children: [
        Icon(icon,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.70),
            size: 16.sp),
        DesignTokens.horizontalSpaceSmall,
        Text(
          '$label: ',
          style: TextStyle(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.70),
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              color: theme.colorScheme.onSurface,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Color _getActionColor(String actionType, FSMThemeExtension fsmTheme) {
    switch (actionType.toLowerCase()) {
      case 'start':
      case 'resume':
        return fsmTheme.actionStart;
      case 'pause':
        return fsmTheme.actionPause;
      case 'complete':
        return fsmTheme.actionComplete;
      case 'signature':
        return fsmTheme.info;
      default:
        return fsmTheme.statusUnassigned;
    }
  }
}
