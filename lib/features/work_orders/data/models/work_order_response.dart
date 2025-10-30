import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm/features/work_orders/data/models/work_order_dto.dart';

part 'work_order_response.freezed.dart';
part 'work_order_response.g.dart';

@freezed
abstract class WorkOrderResponse with _$WorkOrderResponse {
  const factory WorkOrderResponse({
    @JsonKey(name: 'work_order') required WorkOrderDto workOrder,
  }) = _WorkOrderResponse;

  factory WorkOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderResponseFromJson(json);
}