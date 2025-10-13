import 'package:freezed_annotation/freezed_annotation.dart';

part 'start_work_order_request.freezed.dart';
part 'start_work_order_request.g.dart';

@freezed
class StartWorkOrderRequest with _$StartWorkOrderRequest {
  const factory StartWorkOrderRequest({
    @JsonKey(name: 'gps_coordinates') required String gpsCoordinates,
    String? notes,
  }) = _StartWorkOrderRequest;

  factory StartWorkOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$StartWorkOrderRequestFromJson(json);
}