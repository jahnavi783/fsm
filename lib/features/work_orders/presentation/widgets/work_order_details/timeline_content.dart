import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/features/work_orders/domain/entities/work_log_entity.dart';
import 'package:intl/intl.dart';

class TimelineContent extends StatelessWidget {
  final WorkLogEntity log;

  const TimelineContent({
    super.key,
    required this.log,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: REdgeInsets.only(
        left: DesignTokens.space4,
        bottom: DesignTokens.space6,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            log.description.isNotEmpty ? log.description : 'Work Log Entry',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface,
            ),
          ),
          if (log.notes?.isNotEmpty == true) ...[
            DesignTokens.verticalSpaceXs,
            Text(
              log.notes!,
              style: TextStyle(
                fontSize: 13.sp,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ],
          DesignTokens.verticalSpaceXs,
          Text(
            DateFormat('MMM dd, yyyy HH:mm').format(log.timestamp),
            style: TextStyle(
              fontSize: 12.sp,
              color: theme.colorScheme.onSurface.withOpacity(0.5),
            ),
          ),
          // Images
          if (log.imageUrls != null && log.imageUrls!.isNotEmpty) ...[
            DesignTokens.verticalSpaceXs,
            Row(
              children: [
                Icon(
                  Icons.image,
                  size: 12.sp,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                ),
                SizedBox(width: 4.w),
                Text(
                  '${log.imageUrls!.length} image${log.imageUrls!.length > 1 ? 's' : ''}',
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                ),
              ],
            ),
            DesignTokens.verticalSpaceXs,
            SizedBox(
              height: 80.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: log.imageUrls!.length,
                separatorBuilder: (_, __) => SizedBox(width: 8.w),
                itemBuilder: (_, i) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.network(
                      log.imageUrls![i],
                      width: 80.w,
                      height: 80.h,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 80.w,
                          height: 80.h,
                          color: Colors.grey.shade300,
                          child: Icon(
                            Icons.broken_image,
                            color: Colors.grey.shade600,
                          ),
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          width: 80.w,
                          height: 80.h,
                          color: Colors.grey.shade200,
                          child: Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],

          // Add location info if available
          if (log.latitude != null && log.longitude != null) ...[
            DesignTokens.verticalSpaceXs,
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 12.sp,
                  color: theme.colorScheme.onSurface.withOpacity(0.5),
                ),
                DesignTokens.horizontalSpaceXs,
                Text(
                  '${log.latitude!.toStringAsFixed(6)}, ${log.longitude!.toStringAsFixed(6)}',
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: theme.colorScheme.onSurface.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
