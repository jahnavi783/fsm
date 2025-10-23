import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/part_entity.dart';
part 'part_dto.freezed.dart';
part 'part_dto.g.dart';

@freezed
abstract class PartDto with _$PartDto {
  const factory PartDto({
    int? quantity,
    String? partName,
    num? unitPrice,
    String? partNumber,
  }) = _PartDto;

  factory PartDto.fromJson(Map<String, Object?> json) =>
      _$PartDtoFromJson(json);
}


extension PartDtoX on PartDto {
  PartEntity toEntity() {
    return PartEntity(
      quantity: quantity,
      partName: partName,
      unitPrice: unitPrice,
      partNumber: partNumber,
    );
  }
}