import 'package:freezed_annotation/freezed_annotation.dart';

part 'captured_by_entity.freezed.dart';

@freezed
abstract class CapturedByEntity with _$CapturedByEntity {
  const factory CapturedByEntity({
    required int id,
    required String firstName,
    required String lastName,
    required String email,
    required int roleId,
  }) = _CapturedByEntity;
}
