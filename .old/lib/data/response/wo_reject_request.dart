import 'package:json_annotation/json_annotation.dart';

part 'wo_reject_request.g.dart';

@JsonSerializable()
class WoRejectRequest {
  @JsonKey(name: 'reason')
  final String reason;

  WoRejectRequest(
    this.reason,
  );

  factory WoRejectRequest.fromJson(Map<String, dynamic> json) =>
      _$WoRejectRequestFromJson(json);

  Map<String, dynamic> toJson() => _$WoRejectRequestToJson(this);
}
