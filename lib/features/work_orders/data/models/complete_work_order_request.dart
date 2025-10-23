import 'package:freezed_annotation/freezed_annotation.dart';

part 'complete_work_order_request.freezed.dart';
part 'complete_work_order_request.g.dart';

@freezed
abstract class CompleteWorkOrderRequest with _$CompleteWorkOrderRequest {
  const factory CompleteWorkOrderRequest({
    required String workLog,
     required List<PartUsedRequestDto> partsUsed,
    required List<String> images,
     required String gpsCoordinates,
   String? completionNotes,
  }) = _CompleteWorkOrderRequest;

  factory CompleteWorkOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$CompleteWorkOrderRequestFromJson(json);
}

@freezed
abstract class PartUsedRequestDto with _$PartUsedRequestDto {
  const factory PartUsedRequestDto({
     required String partNumber,
     required int quantityUsed,
  }) = _PartUsedRequestDto;

  factory PartUsedRequestDto.fromJson(Map<String, dynamic> json) =>
      _$PartUsedRequestDtoFromJson(json);
}