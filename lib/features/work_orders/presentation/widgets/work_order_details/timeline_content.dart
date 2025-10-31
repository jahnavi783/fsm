import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/features/work_orders/domain/entities/work_log_entity.dart';

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
                color: theme.colorScheme.onSurface.withOpacity(0.7),
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
