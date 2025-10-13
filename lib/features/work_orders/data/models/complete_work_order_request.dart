import 'package:freezed_annotation/freezed_annotation.dart';

part 'complete_work_order_request.freezed.dart';
part 'complete_work_order_request.g.dart';

@freezed
class CompleteWorkOrderRequest with _$CompleteWorkOrderRequest {
  const factory CompleteWorkOrderRequest({
    @JsonKey(name: 'work_log') required String workLog,
    @JsonKey(name: 'parts_used') required List<PartUsedRequestDto> partsUsed,
    required List<String> images,
    @JsonKey(name: 'gps_coordinates') required String gpsCoordinates,
    @JsonKey(name: 'completion_notes') String? completionNotes,
  }) = _CompleteWorkOrderRequest;

  factory CompleteWorkOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$CompleteWorkOrderRequestFromJson(json);
}

@freezed
class PartUsedRequestDto with _$PartUsedRequestDto {
  const factory PartUsedRequestDto({
    @JsonKey(name: 'part_number') required String partNumber,
    @JsonKey(name: 'quantity_used') required int quantityUsed,
  }) = _PartUsedRequestDto;

  factory PartUsedRequestDto.fromJson(Map<String, dynamic> json) =>
      _$PartUsedRequestDtoFromJson(json);
}