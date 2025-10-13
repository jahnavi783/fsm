import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm/features/work_orders/data/models/work_order_dto.dart';

part 'work_orders_response.freezed.dart';
part 'work_orders_response.g.dart';

@freezed
class WorkOrdersResponse with _$WorkOrdersResponse {
  const factory WorkOrdersResponse({
    required int total,
    required int page,
    required int pages,
    @JsonKey(name: 'work_orders') required List<WorkOrderDto> workOrders,
  }) = _WorkOrdersResponse;

  factory WorkOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$WorkOrdersResponseFromJson(json);
}