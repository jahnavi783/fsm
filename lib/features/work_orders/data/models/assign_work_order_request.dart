import 'package:freezed_annotation/freezed_annotation.dart';

part 'assign_work_order_request.freezed.dart';
part 'assign_work_order_request.g.dart';

@freezed
abstract class AssignWorkOrderRequest with _$AssignWorkOrderRequest {
  const factory AssignWorkOrderRequest({
    @JsonKey(name: 'assigned_to') required int assignedTo,
  }) = _AssignWorkOrderRequest;

  factory AssignWorkOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$AssignWorkOrderRequestFromJson(json);
}
