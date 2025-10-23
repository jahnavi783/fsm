import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/info_item_card.dart';

class BasicInformationSection extends StatelessWidget {
  final WorkOrderEntity workOrder;

  const BasicInformationSection({
    super.key,
    required this.workOrder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: InfoItemCard(
                label: 'Job ID',
                value: workOrder.woNumber,
                icon: Icons.tag,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: InfoItemCard(
                label: 'Ticket ID',
                value: 'SR-${workOrder.srId.toString().padLeft(12, '0')}',
                icon: Icons.request_page,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: InfoItemCard(
                label: 'Service Type',
                value: workOrder.serviceRequest?.srType ?? 'repair',
                icon: Icons.build_circle_outlined,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: InfoItemCard(
                label: 'Priority',
                value: workOrder.priorityDisplayName,
                icon: Icons.priority_high,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        InfoItemCard(
          label: 'Status',
          value: workOrder.statusDisplayName,
          icon: Icons.info_outline,
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: InfoItemCard(
                label: 'Created',
                value: DateFormat('MMM dd, yyyy HH:mm').format(workOrder.createdAt),
                icon: Icons.schedule,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: InfoItemCard(
                label: 'Duration',
                value: '${workOrder.durationDays} day${workOrder.durationDays != 1 ? 's' : ''}',
                icon: Icons.timelapse,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
