import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/features/calendar/domain/entities/calendar_event_entity.dart';
import 'package:fsm/core/widgets/fsm_card.dart';
import 'package:intl/intl.dart';

class RouteOptimizationDisplay extends StatelessWidget {
  final List<CalendarEventEntity> optimizedRoute;
  final VoidCallback? onOptimizeRoute;
  final Function(CalendarEventEntity)? onEventTap;
  final bool isLoading;

  const RouteOptimizationDisplay({
    super.key,
    required this.optimizedRoute,
    this.onOptimizeRoute,
    this.onEventTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FSMCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                topRight: Radius.circular(8.r),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.route,
                  color: theme.colorScheme.primary,
                  size: 20.sp,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    'Optimized Route',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.primary,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                if (onOptimizeRoute != null) ...[
                  TextButton.icon(
                    onPressed: isLoading ? null : onOptimizeRoute,
                    icon: isLoading
                        ? SizedBox(
                            width: 16.w,
                            height: 16.h,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                theme.colorScheme.primary,
                              ),
                            ),
                          )
                        : Icon(
                            Icons.refresh,
                            size: 16.sp,
                          ),
                    label: Text(
                      'Optimize',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    style: TextButton.styleFrom(
                      foregroundColor: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ],
            ),
          ),

          // Route content
          if (optimizedRoute.isEmpty && !isLoading) ...[
            Padding(
              padding: EdgeInsets.all(24.w),
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.location_off,
                      size: 48.sp,
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'No work orders found for route optimization',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color:
                            theme.colorScheme.onSurface.withValues(alpha: 0.6),
                        fontSize: 14.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (onOptimizeRoute != null) ...[
                      SizedBox(height: 16.h),
                      ElevatedButton.icon(
                        onPressed: onOptimizeRoute,
                        icon: Icon(Icons.route, size: 16.sp),
                        label: Text(
                          'Optimize Route',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ] else if (isLoading) ...[
            Padding(
              padding: EdgeInsets.all(24.w),
              child: Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        theme.colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Optimizing route...',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color:
                            theme.colorScheme.onSurface.withValues(alpha: 0.6),
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ] else ...[
            // Route summary
            Container(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  Expanded(
                    child: _buildRouteSummary(theme),
                  ),
                ],
              ),
            ),

            Divider(
              height: 1,
              color: theme.colorScheme.outline.withValues(alpha: 0.2),
            ),

            // Route steps
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(16.w),
              itemCount: optimizedRoute.length,
              separatorBuilder: (context, index) => _buildRouteConnector(theme),
              itemBuilder: (context, index) {
                final event = optimizedRoute[index];
                return _buildRouteStep(context, event, index + 1);
              },
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildRouteSummary(ThemeData theme) {
    final totalDuration = _calculateTotalDuration();
    final workOrderCount = optimizedRoute
        .where((e) => e.type == CalendarEventType.workOrder)
        .length;

    return Row(
      children: [
        Expanded(
          child: _buildSummaryItem(
            theme,
            Icons.work_outline,
            'Work Orders',
            workOrderCount.toString(),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: _buildSummaryItem(
            theme,
            Icons.access_time,
            'Total Time',
            _formatDuration(totalDuration),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: _buildSummaryItem(
            theme,
            Icons.schedule,
            'Time Range',
            _getTimeRange(),
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryItem(
    ThemeData theme,
    IconData icon,
    String label,
    String value,
  ) {
    return Column(
      children: [
        Icon(
          icon,
          size: 20.sp,
          color: theme.colorScheme.primary,
        ),
        SizedBox(height: 4.h),
        Text(
          value,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
        ),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildRouteStep(
      BuildContext context, CalendarEventEntity event, int stepNumber) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Step number
        Container(
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              stepNumber.toString(),
              style: TextStyle(
                color: theme.colorScheme.onPrimary,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
          ),
        ),

        SizedBox(width: 12.w),

        // Event details
        Expanded(
          child: GestureDetector(
            onTap: () => onEventTap?.call(event),
            child: Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: theme.colorScheme.outline.withValues(alpha: 0.2),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          event.title,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          color: Color(int.parse(
                                  event.type.color.replaceFirst('#', '0xFF')))
                              .withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Text(
                          event.typeDisplayName,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: Color(int.parse(
                                event.type.color.replaceFirst('#', '0xFF'))),
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 14.sp,
                        color:
                            theme.colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        DateFormat('HH:mm').format(event.startTime),
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 12.sp,
                          color: theme.colorScheme.onSurface
                              .withValues(alpha: 0.6),
                        ),
                      ),
                      if (event.location != null &&
                          event.location!.isNotEmpty) ...[
                        SizedBox(width: 12.w),
                        Icon(
                          Icons.location_on_outlined,
                          size: 14.sp,
                          color: theme.colorScheme.onSurface
                              .withValues(alpha: 0.6),
                        ),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Text(
                            event.location!,
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontSize: 12.sp,
                              color: theme.colorScheme.onSurface
                                  .withValues(alpha: 0.6),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRouteConnector(ThemeData theme) {
    return Container(
      margin: EdgeInsets.only(left: 16.w, top: 8.h, bottom: 8.h),
      child: Row(
        children: [
          Container(
            width: 2.w,
            height: 20.h,
            color: theme.colorScheme.primary.withValues(alpha: 0.3),
          ),
          SizedBox(width: 8.w),
          Icon(
            Icons.arrow_downward,
            size: 16.sp,
            color: theme.colorScheme.primary.withValues(alpha: 0.6),
          ),
        ],
      ),
    );
  }

  Duration _calculateTotalDuration() {
    if (optimizedRoute.isEmpty) return Duration.zero;

    final firstEvent = optimizedRoute.first;
    final lastEvent = optimizedRoute.last;

    return lastEvent.endTime.difference(firstEvent.startTime);
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }

  String _getTimeRange() {
    if (optimizedRoute.isEmpty) return '-';

    final firstEvent = optimizedRoute.first;
    final lastEvent = optimizedRoute.last;

    final startTime = DateFormat('HH:mm').format(firstEvent.startTime);
    final endTime = DateFormat('HH:mm').format(lastEvent.endTime);

    return '$startTime - $endTime';
  }
}
