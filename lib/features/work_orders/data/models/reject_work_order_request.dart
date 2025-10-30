import 'package:freezed_annotation/freezed_annotation.dart';

part 'reject_work_order_request.freezed.dart';
part 'reject_work_order_request.g.dart';

@freezed
abstract class RejectWorkOrderRequest with _$RejectWorkOrderRequest {
  const factory RejectWorkOrderRequest({
    required String reason,
    @JsonKey(name: 'gps_coordinates') required String gpsCoordinates,
  }) = _RejectWorkOrderRequest;

  factory RejectWorkOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$RejectWorkOrderRequestFromJson(json);
}