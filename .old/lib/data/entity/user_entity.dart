import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm_flutter/core/utils.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  const UserEntity._();
  const factory UserEntity({
    required int id,
    @JsonKey(name: 'first_name') required String firstName,
    @Default('') @JsonKey(name: 'last_name') String lastName,
    required String email,
    String? phone,
    Gender? gender,
    String? city,
    @DateTimeConverter() DateTime? dob,
    @JsonKey(name: 'role_id') UserRole? roleId,
    String? role,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}

enum UserRole {
  @JsonValue(0)
  superAdmin,
  @JsonValue(1)
  manager,
  @JsonValue(2)
  helpDesk,
  @JsonValue(3)
  partsManager,
  @JsonValue(4)
  technician,
}

enum Gender {
  @JsonValue('male')
  male,
  @JsonValue('female')
  female
}
