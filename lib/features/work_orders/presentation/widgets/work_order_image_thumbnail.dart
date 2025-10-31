import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class WorkOrderImageThumbnail extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onTap;
  final double? width;
  final double? height;

  const WorkOrderImageThumbnail({
    super.key,
    required this.imageUrl,
    required this.onTap,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 100.w,
        height: height ?? 100.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: theme.colorScheme.outline.withValues(alpha: 0.2),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: theme.colorScheme.surfaceContainerHighest,
            highlightColor: theme.colorScheme.surface,
            child: Container(
              color: theme.colorScheme.surfaceContainerHighest,
            ),
          ),
          errorWidget: (context, url, error) => Container(
            color: theme.colorScheme.surfaceContainerHighest,
            child: Center(
              child: Icon(
                Icons.broken_image,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
                size: 32.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
