import 'package:freezed_annotation/freezed_annotation.dart';

part 'pause_count_entity.freezed.dart';

@freezed
abstract class PauseCountEntity with _$PauseCountEntity {
  const factory PauseCountEntity({
    required int userId,
    required String firstName,
    required String lastName,
    required String email,
    required int pauseCount,
  }) = _PauseCountEntity;
}
