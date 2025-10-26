import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/part_entity.dart';

part 'part_dto.freezed.dart';
part 'part_dto.g.dart';

// Helper function to parse unit_price from string to double
double _priceFromJson(dynamic price) {
  if (price is String) {
    return double.tryParse(price) ?? 0.0;
  }
  if (price is num) {
    return price.toDouble();
  }
  return 0.0;
}

String _priceToJson(double price) => price.toString();

@freezed
abstract class PartDto with _$PartDto {
  const factory PartDto({
    @JsonKey(name: 'part_number') required String partNumber,
    @JsonKey(name: 'part_name') required String partName,
    required String category,
    @JsonKey(name: 'quantity_available') required int quantityAvailable,
    @JsonKey(name: 'unit_price', fromJson: _priceFromJson, toJson: _priceToJson)
    required double unitPrice,
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
