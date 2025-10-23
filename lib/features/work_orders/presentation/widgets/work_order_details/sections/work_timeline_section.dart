import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelines_plus/timelines_plus.dart';
import 'package:fsm/features/work_orders/domain/entities/work_log_entity.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/timeline_content.dart';

class WorkTimelineSection extends StatelessWidget {
  final List<WorkLogEntity> workLogs;

  const WorkTimelineSection({
    super.key,
    required this.workLogs,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FixedTimeline.tileBuilder(
      theme: TimelineThemeData(
        nodePosition: 0.0,
        color: theme.primaryColor.withOpacity(0.3),
        indicatorTheme: IndicatorThemeData(
          color: theme.primaryColor,
          size: 16.w,
        ),
        connectorTheme: ConnectorThemeData(
          color: theme.primaryColor.withOpacity(0.3),
          thickness: 2.w,
        ),
      ),
      builder: TimelineTileBuilder.connectedFromStyle(
        itemCount: workLogs.length,
        contentsAlign: ContentsAlign.basic,
        contentsBuilder: (context, index) => TimelineContent(log: workLogs[index]),
        connectorStyleBuilder: (context, index) => ConnectorStyle.solidLine,
        indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
        indicatorPositionBuilder: (context, index) => 0.0,
      ),
    );
  }
}
