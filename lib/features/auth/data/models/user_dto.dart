import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/services/enums.dart';
import '../../domain/entities/user_entity.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  const UserDto._();

  const factory UserDto({
    required int id,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') @Default('') String lastName,
    required String email,
    String? phone,
    Gender? gender,
    String? city,
    @JsonKey(name: 'date_of_birth') DateTime? dob,
    @JsonKey(name: 'role_id') UserRole? roleId,
    String? role,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}

extension UserDtoX on UserDto {
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      gender: gender,
      city: city,
      dob: dob,
      roleId: roleId,
      role: role,
    );
  }
}

extension UserEntityX on UserEntity {
  UserDto toDto() {
    return UserDto(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      gender: gender,
      city: city,
      dob: dob,
      roleId: roleId,
      role: role,
    );
  }
}
