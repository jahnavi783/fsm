import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  const UserEntity._();
  
  const factory UserEntity({
    required int id,
    required String firstName,
    required String lastName,
    required String email,
    String? phone,
    Gender? gender,
    String? city,
    DateTime? dob,
    UserRole? roleId,
    String? role,
  }) = _UserEntity;

  String get fullName => '$firstName $lastName';
  bool get isTechnician => roleId == UserRole.technician;
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
  female,
}