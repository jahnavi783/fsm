import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/part_entity.dart';

part 'part_dto.freezed.dart';
part 'part_dto.g.dart';

@freezed
abstract class PartDto with _$PartDto {
  const factory PartDto({
    @JsonKey(name: 'part_number') required String partNumber,
    @JsonKey(name: 'part_name') required String partName,
    required String category,
    @JsonKey(name: 'quantity_available') required int quantityAvailable,
    @JsonKey(name: 'unit_price') required double unitPrice,
    required String status,
  }) = _PartDto;

  factory PartDto.fromJson(Map<String, dynamic> json) =>
      _$PartDtoFromJson(json);
}

@freezed
abstract class PartsResponse with _$PartsResponse {
  const factory PartsResponse({
    required List<PartDto> parts,
  }) = _PartsResponse;

  factory PartsResponse.fromJson(Map<String, dynamic> json) =>
      _$PartsResponseFromJson(json);
}

extension PartDtoX on PartDto {
  bool get isLowStock => quantityAvailable <= 10; // Simple threshold
  bool get isOutOfStock => quantityAvailable == 0;

  PartEntity toEntity() {
    return PartEntity(
      partNumber: partNumber,
      partName: partName,
      category: category,
      quantityAvailable: quantityAvailable,
      unitPrice: unitPrice,
      status: PartStatus.values.firstWhere(
        (e) => e.name.toLowerCase() == status.toLowerCase(),
        orElse: () => PartStatus.active,
      ),
    );
  }
}

extension PartEntityX on PartEntity {
  PartDto toDto() {
    return PartDto(
      partNumber: partNumber,
      partName: partName,
      category: category,
      quantityAvailable: quantityAvailable,
      unitPrice: unitPrice,
      status: status.name,
    );
  }
}
