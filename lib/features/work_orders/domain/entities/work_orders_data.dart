import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';

part 'work_orders_data.freezed.dart';

@freezed
abstract class WorkOrdersData with _$WorkOrdersData {
  const factory WorkOrdersData({
    required List<WorkOrderEntity> workOrders,
    required List<WorkOrderEntity> unassignedWorkOrders,
    required int total,
    required int page,
    required int pages,
    required int unassignedCount,
  }) = _WorkOrdersData;
}
