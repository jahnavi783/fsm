import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';

part 'part_used_dto.freezed.dart';
part 'part_used_dto.g.dart';

@freezed
abstract class PartUsedDto with _$PartUsedDto {
  const factory PartUsedDto({
    required String partNumber,
    @JsonKey(name: 'quantity_used') required int quantityUsed,
    String? partName,
    String? description,
  }) = _PartUsedDto;

  factory PartUsedDto.fromJson(Map<String, dynamic> json) =>
      _$PartUsedDtoFromJson(json);
}

extension PartUsedDtoX on PartUsedDto {
  PartUsedEntity toEntity() {
    return PartUsedEntity(
      partNumber: partNumber,
      quantityUsed: quantityUsed,
      partName: partName,
      description: description,
    );
  }
}
