import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm/features/work_orders/domain/entities/captured_by_entity.dart';

part 'captured_by_dto.freezed.dart';
part 'captured_by_dto.g.dart';

/// Helper function to parse int fields which may come as String or int
int _intFromJson(dynamic value) {
  if (value is int) return value;
  if (value is String) return int.parse(value);
  throw FormatException('Invalid int type: ${value.runtimeType}');
}

@freezed
abstract class CapturedByDto with _$CapturedByDto {
  const factory CapturedByDto({
    @JsonKey(fromJson: _intFromJson) required int id,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String email,
    @JsonKey(name: 'role_id', fromJson: _intFromJson) required int roleId,
  }) = _CapturedByDto;

  factory CapturedByDto.fromJson(Map<String, dynamic> json) =>
      _$CapturedByDtoFromJson(json);
}

extension CapturedByDtoX on CapturedByDto {
  CapturedByEntity toEntity() {
    return CapturedByEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      roleId: roleId,
    );
  }
}
