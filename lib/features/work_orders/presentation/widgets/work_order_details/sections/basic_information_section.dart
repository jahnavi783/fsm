import 'package:flutter/material.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_details/info_item_card.dart';
import 'package:intl/intl.dart';

class BasicInformationSection extends StatelessWidget {
  final WorkOrderEntity workOrder;

  const BasicInformationSection({
    super.key,
    required this.workOrder,
  });
  String _formatDuration(WorkOrderEntity workOrder) {
    final hours = workOrder.durationHours;

    // If hours not available → fallback to days only
    if (hours == null) {
      final d = workOrder.durationDays;
      return "$d day${d == 1 ? '' : 's'}";
    }

    if (hours == 0) return "0 hours";

    final days = hours ~/ 24; // integer division
    final remainingHours = hours % 24; // modulo operation

    if (days > 0 && remainingHours > 0) {
      return "$days day${days == 1 ? '' : 's'} $remainingHours hour${remainingHours == 1 ? '' : 's'}";
    } else if (days > 0) {
      return "$days day${days == 1 ? '' : 's'}";
    } else {
      return "$remainingHours hour${remainingHours == 1 ? '' : 's'}";
    }
  }

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
            DesignTokens.horizontalSpaceMd,
            Expanded(
              child: InfoItemCard(
                label: 'Ticket ID',
                // value: 'SR-${workOrder.srId.toString().padLeft(12, '0')}',
                // value: workOrder.serviceRequestNumber,
                value: workOrder.displayServiceRequestNumber,
                icon: Icons.request_page,
              ),
            ),
          ],
        ),
        DesignTokens.verticalSpaceMd,
        Row(
          children: [
            Expanded(
              child: InfoItemCard(
                label: 'Service Type',
                value: workOrder.serviceRequest?.srType ?? 'repair',
                icon: Icons.build_circle_outlined,
              ),
            ),
            DesignTokens.horizontalSpaceMd,
            Expanded(
              child: InfoItemCard(
                label: 'Priority',
                value: workOrder.priorityDisplayName,
                icon: Icons.priority_high,
              ),
            ),
          ],
        ),
        DesignTokens.verticalSpaceMd,
        InfoItemCard(
          label: 'Status',
          value: workOrder.statusDisplayName,
          icon: Icons.info_outline,
        ),
        DesignTokens.verticalSpaceMd,
        Row(
          children: [
            Expanded(
              child: InfoItemCard(
                label: 'Created',
                value: DateFormat('MMM dd, yyyy HH:mm')
                    .format(workOrder.createdAt),
                icon: Icons.schedule,
              ),
            ),
            DesignTokens.horizontalSpaceMd,
            // Expanded(
            //   child: InfoItemCard(
            //     label: 'Duration',
            //     // value:
            //     //     '${workOrder.durationDays} day${workOrder.durationDays != 1 ? 's' : ''}',
            //     value: _formatDuration(workOrder),
            //     icon: Icons.timelapse,
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}
