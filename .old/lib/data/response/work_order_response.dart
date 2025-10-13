import 'package:fsm_flutter/data/entity/work_order_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'work_order_response.g.dart';

@JsonSerializable()
class WorkOrderResponse {
  @JsonKey(name: 'work_order')
  final WorkOrderEntity workOrder;

  WorkOrderResponse(this.workOrder);

  factory WorkOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WorkOrderResponseToJson(this);
}
