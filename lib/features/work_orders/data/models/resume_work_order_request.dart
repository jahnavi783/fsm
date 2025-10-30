import 'package:freezed_annotation/freezed_annotation.dart';

part 'resume_work_order_request.freezed.dart';
part 'resume_work_order_request.g.dart';

@freezed
abstract class ResumeWorkOrderRequest with _$ResumeWorkOrderRequest {
  const factory ResumeWorkOrderRequest({
    @JsonKey(name: 'gps_coordinates') required String gpsCoordinates,
    String? notes,
  }) = _ResumeWorkOrderRequest;

  factory ResumeWorkOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$ResumeWorkOrderRequestFromJson(json);
}