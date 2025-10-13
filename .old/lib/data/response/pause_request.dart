import 'package:json_annotation/json_annotation.dart';

part 'pause_request.g.dart';

@JsonSerializable()
class PauseRequest {
  final String reason;

  PauseRequest(this.reason);

  factory PauseRequest.fromJson(Map<String, dynamic> json) =>
      _$PauseRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PauseRequestToJson(this);
}
