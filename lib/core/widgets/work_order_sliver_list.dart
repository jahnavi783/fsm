import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';

/// A sliver list widget for displaying work orders.
///
/// Handles infinite scroll loading with a loading indicator at the bottom.
/// Optimized to avoid infinite box constraint errors when used with SliverPadding.
///
/// Usage:
/// ```dart
/// SliverPadding(
///   padding: EdgeInsets.symmetric(horizontal: 16.w),
///   sliver: WorkOrderSliverList(
///     workOrders: workOrders,
///     itemBuilder: (workOrder) => WorkOrderCard(workOrder: workOrder),
///   ),
/// )
/// ```
class WorkOrderSliverList extends StatelessWidget {
  final List<WorkOrderEntity> workOrders;
  final bool isLoadingMore;
  final VoidCallback? onWorkOrderTap;
  final VoidCallback? onWorkOrderActionTap;
  final Widget Function(WorkOrderEntity) itemBuilder;
  final EdgeInsets? padding;

  const WorkOrderSliverList({
    super.key,
    required this.workOrders,
    required this.itemBuilder,
    this.isLoadingMore = false,
    this.onWorkOrderTap,
    this.onWorkOrderActionTap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final itemCount = workOrders.length + (isLoadingMore ? 1 : 0);

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          // Show loading indicator at the end
          if (index >= workOrders.length) {
            return SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFF116587),
                  ),
                ),
              ),
            );
          }

          final workOrder = workOrders[index];

          // Wrap item with SizedBox to constrain width and prevent infinite width errors
          // SliverList passes unconstrained width, so we need to expand to available space
          return SizedBox(
            width: double.infinity,
            child: itemBuilder(workOrder),
          );
        },
        childCount: itemCount,
        // Optimize performance and avoid infinite constraint errors
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: false,
        addSemanticIndexes: false,
      ),
    );
  }
}
