import 'package:flutter/material.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';

class WorkOrderStatusHelper {
  static Map<String, dynamic> getEmptyStateInfo(WorkOrderStatus status) {
    switch (status) {
      case WorkOrderStatus.assigned:
        return {
          'icon': Icons.assignment_outlined,
          'color': const Color(0xFF2196F3),
          'title': 'No Assigned Work Orders',
          'subtitle':
              'New work orders will appear here when they\'re assigned to you.',
        };
      case WorkOrderStatus.inProgress:
        return {
          'icon': Icons.autorenew,
          'color': const Color(0xFFFF9800),
          'title': 'No Active Work Orders',
          'subtitle': 'Start working on assigned orders to see them here.',
        };
      case WorkOrderStatus.paused:
        return {
          'icon': Icons.pause_circle_outlined,
          'color': const Color(0xFF9C27B0),
          'title': 'No Paused Work Orders',
          'subtitle': 'Work orders you pause will be listed here.',
        };
      case WorkOrderStatus.completed:
        return {
          'icon': Icons.check_circle_outline,
          'color': const Color(0xFF4CAF50),
          'title': 'No Completed Work Orders',
          'subtitle': 'Your completed work orders will be shown here.',
        };
      default:
        return {
          'icon': Icons.work_outline,
          'color': Colors.grey,
          'title': 'No Work Orders',
          'subtitle': 'No work orders found for this status.',
        };
    }
  }

  static Color getStatusColor(WorkOrderStatus status) {
    switch (status) {
      case WorkOrderStatus.assigned:
        return const Color(0xFF2196F3);
      case WorkOrderStatus.inProgress:
        return const Color(0xFFFF9800);
      case WorkOrderStatus.paused:
        return const Color(0xFF9C27B0);
      case WorkOrderStatus.completed:
        return const Color(0xFF4CAF50);
      default:
        return Colors.grey;
    }
  }

  static IconData getStatusIcon(WorkOrderStatus status) {
    switch (status) {
      case WorkOrderStatus.assigned:
        return Icons.assignment_outlined;
      case WorkOrderStatus.inProgress:
        return Icons.autorenew;
      case WorkOrderStatus.paused:
        return Icons.pause_circle_outlined;
      case WorkOrderStatus.completed:
        return Icons.check_circle_outline;
      default:
        return Icons.work_outline;
    }
  }
}
