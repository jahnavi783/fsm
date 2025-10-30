import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm/features/work_orders/data/models/work_order_dto.dart';

part 'work_orders_response.freezed.dart';
part 'work_orders_response.g.dart';

@freezed
abstract class WorkOrdersResponse with _$WorkOrdersResponse {
  const factory WorkOrdersResponse({
    required int total,
    required int page,
    required int pages,
    @JsonKey(name: 'work_orders') required List<WorkOrderDto> workOrders,
    @JsonKey(name: 'unassigned_work_orders') @Default([]) List<WorkOrderDto> unassignedWorkOrders,
    @JsonKey(name: 'unassigned_count') @Default(0) int unassignedCount,
  }) = _WorkOrdersResponse;

  factory WorkOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$WorkOrdersResponseFromJson(json);
}