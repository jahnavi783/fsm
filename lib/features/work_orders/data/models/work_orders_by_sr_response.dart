import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm/features/work_orders/data/models/work_order_dto.dart';
import 'package:fsm/features/work_orders/data/models/service_request_dto.dart';

part 'work_orders_by_sr_response.freezed.dart';
part 'work_orders_by_sr_response.g.dart';

@freezed
class WorkOrdersBySRResponse with _$WorkOrdersBySRResponse {
  const factory WorkOrdersBySRResponse({
    @JsonKey(name: 'service_request') required ServiceRequestDto serviceRequest,
    @JsonKey(name: 'work_orders') required List<WorkOrderDto> workOrders,
  }) = _WorkOrdersBySRResponse;

  factory WorkOrdersBySRResponse.fromJson(Map<String, dynamic> json) =>
      _$WorkOrdersBySRResponseFromJson(json);
}
