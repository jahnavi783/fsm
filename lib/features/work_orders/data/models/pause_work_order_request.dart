import 'package:freezed_annotation/freezed_annotation.dart';

part 'pause_work_order_request.freezed.dart';
part 'pause_work_order_request.g.dart';

@freezed
abstract class PauseWorkOrderRequest with _$PauseWorkOrderRequest {
  const factory PauseWorkOrderRequest({
    required String reason,
    @JsonKey(name: 'gps_coordinates') required String gpsCoordinates,
  }) = _PauseWorkOrderRequest;

  factory PauseWorkOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$PauseWorkOrderRequestFromJson(json);
}