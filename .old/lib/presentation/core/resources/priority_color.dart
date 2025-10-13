import 'package:flutter/material.dart';
import 'package:fsm_flutter/data/entity/work_order_entity.dart';

Color getPriorityColor(WorkOrderPriority priority) {
  switch (priority) {
    case WorkOrderPriority.low:
      return Colors.yellow;
    case WorkOrderPriority.medium:
      return Colors.orange;
    case WorkOrderPriority.high:
      return Colors.red;
    default:
      return Colors.black;
  }
}
