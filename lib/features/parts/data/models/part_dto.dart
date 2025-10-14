import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/part_entity.dart';

part 'part_dto.freezed.dart';
part 'part_dto.g.dart';

@freezed
class PartDto with _$PartDto {
  const factory PartDto({
    required int id,
    @JsonKey(name: 'part_number') required String partNumber,
    @JsonKey(name: 'part_name') required String partName,
    required String description,
    required String category,
    @JsonKey(name: 'unit_price') required double unitPrice,
    @JsonKey(name: 'quantity_available') required int quantityAvailable,
    @JsonKey(name: 'min_quantity') required int minQuantity,
    @JsonKey(name: 'max_quantity') required int maxQuantity,
    required String unit,
    required String status,
    @JsonKey(name: 'compatible_models') @Default([]) List<String> compatibleModels,
    @JsonKey(name: 'image_url') String? imageUrl,
    String? specifications,
    @JsonKey(name: 'last_updated') String? lastUpdated,
  }) = _PartDto;

  factory PartDto.fromJson(Map<String, dynamic> json) =>
      _$PartDtoFromJson(json);
}

extension PartDtoX on PartDto {
  PartEntity toEntity() {
    return PartEntity(
      id: id,
      partNumber: partNumber,
      partName: partName,
      description: description,
      category: category,
      unitPrice: unitPrice,
      quantityAvailable: quantityAvailable,
      minQuantity: minQuantity,
      maxQuantity: maxQuantity,
      unit: unit,
      status: PartStatus.values.firstWhere(
        (e) => e.name.toLowerCase() == status.toLowerCase(),
        orElse: () => PartStatus.active,
      ),
      compatibleModels: compatibleModels,
      imageUrl: imageUrl,
      specifications: specifications,
      lastUpdated: lastUpdated != null ? DateTime.parse(lastUpdated!) : null,
    );
  }
}

extension PartEntityX on PartEntity {
  PartDto toDto() {
    return PartDto(
      id: id,
      partNumber: partNumber,
      partName: partName,
      description: description,
      category: category,
      unitPrice: unitPrice,
      quantityAvailable: quantityAvailable,
      minQuantity: minQuantity,
      maxQuantity: maxQuantity,
      unit: unit,
      status: status.name,
      compatibleModels: compatibleModels,
      imageUrl: imageUrl,
      specifications: specifications,
      lastUpdated: lastUpdated?.toIso8601String(),
    );
  }
}