import 'package:fsm_flutter/data/entity/work_order_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'work_orders_response.g.dart';

@JsonSerializable()
class WorkOrdersResponse {
  final int total;
  final int page;
  final int pages;
  @JsonKey(name: 'work_orders')
  final List<WorkOrderEntity> workOrders;

  WorkOrdersResponse(
      {required this.total,
      required this.page,
      required this.pages,
      required this.workOrders});

  factory WorkOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$WorkOrdersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WorkOrdersResponseToJson(this);
}
