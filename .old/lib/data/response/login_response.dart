import 'package:fsm_flutter/data/entity/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String message;
  final String accessToken;
  final String refreshToken;
  final UserEntity user;

  LoginResponse(this.message, this.accessToken, this.refreshToken, this.user);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
