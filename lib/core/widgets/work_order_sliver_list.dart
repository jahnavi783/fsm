import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';

class WorkOrderSliverList extends StatelessWidget {
  final List<WorkOrderEntity> workOrders;
  final bool isLoadingMore;
  final VoidCallback? onWorkOrderTap;
  final VoidCallback? onWorkOrderActionTap;
  final Widget Function(WorkOrderEntity) itemBuilder;

  const WorkOrderSliverList({
    super.key,
    required this.workOrders,
    required this.itemBuilder,
    this.isLoadingMore = false,
    this.onWorkOrderTap,
    this.onWorkOrderActionTap,
  });

  @override
  Widget build(BuildContext context) {
    final itemCount = workOrders.length + (isLoadingMore ? 1 : 0);

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index >= workOrders.length) {
            return Padding(
              padding: EdgeInsets.all(16.w),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF116587),
                ),
              ),
            );
          }

          final workOrder = workOrders[index];
          return itemBuilder(workOrder);
        },
        childCount: itemCount,
      ),
    );
  }
}
