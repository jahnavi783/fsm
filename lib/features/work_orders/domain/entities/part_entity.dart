import 'package:freezed_annotation/freezed_annotation.dart';
part 'part_entity.freezed.dart';

@freezed
abstract class PartEntity with _$PartEntity {
  const factory PartEntity({
    int? quantity,
    String? partName,
    num? unitPrice,
    String? partNumber,
  }) = _PartEntity;
}
