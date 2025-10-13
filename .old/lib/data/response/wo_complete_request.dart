import 'package:json_annotation/json_annotation.dart';

part 'wo_complete_request.g.dart';

@JsonSerializable()
class WoCompleteRequest {
  @JsonKey(name: 'work_log')
  final String workLog;
  @JsonKey(name: 'parts_used')
  final List<WoCompletePartsUsedRequest> partsUsed;
  final List<String> images;

  WoCompleteRequest(this.workLog, this.partsUsed, this.images);

  factory WoCompleteRequest.fromJson(Map<String, dynamic> json) =>
      _$WoCompleteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$WoCompleteRequestToJson(this);
}

@JsonSerializable()
class WoCompletePartsUsedRequest {
  @JsonKey(name: 'part_number')
  final String partNumber;
  @JsonKey(name: 'quantity_used')
  final int quantityUsed;

  WoCompletePartsUsedRequest(this.partNumber, this.quantityUsed);

  factory WoCompletePartsUsedRequest.fromJson(Map<String, dynamic> json) =>
      _$WoCompletePartsUsedRequestFromJson(json);

  Map<String, dynamic> toJson() => _$WoCompletePartsUsedRequestToJson(this);
}
