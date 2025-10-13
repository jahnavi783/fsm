import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm/features/work_orders/domain/entities/part_entity.dart';

part 'part_dto.freezed.dart';
part 'part_dto.g.dart';

@freezed
class PartDto with _$PartDto {
  const factory PartDto({
    required int id,
    @JsonKey(name: 'part_number') required String partNumber,
    required String name,
    required String description,
    required String category,
    required double price,
    @JsonKey(name: 'stock_quantity') required int stockQuantity,
    required String unit,
    @JsonKey(name: 'compatible_models') @Default([]) List<String> compatibleModels,
    @JsonKey(name: 'image_url') String? imageUrl,
    String? specifications,
  }) = _PartDto;

  factory PartDto.fromJson(Map<String, dynamic> json) =>
      _$PartDtoFromJson(json);
}

extension PartDtoX on PartDto {
  PartEntity toEntity() {
    return PartEntity(
      id: id,
      partNumber: partNumber,
      name: name,
      description: description,
      category: category,
      price: price,
      stockQuantity: stockQuantity,
      unit: unit,
      compatibleModels: compatibleModels,
      imageUrl: imageUrl,
      specifications: specifications,
    );
  }
}