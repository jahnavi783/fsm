import 'package:flutter/material.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';

class DescriptionSection extends StatelessWidget {
  final WorkOrderEntity workOrder;

  const DescriptionSection({
    super.key,
    required this.workOrder,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          workOrder.problemDescription.isNotEmpty
              ? workOrder.problemDescription
              : 'No description available',
          style: theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
