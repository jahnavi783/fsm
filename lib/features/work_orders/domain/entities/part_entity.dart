import 'package:freezed_annotation/freezed_annotation.dart';

part 'part_entity.freezed.dart';

@freezed
class PartEntity with _$PartEntity {
  const factory PartEntity({
    required int id,
    required String partNumber,
    required String name,
    required String description,
    required String category,
    required double price,
    required int stockQuantity,
    required String unit,
    @Default([]) List<String> compatibleModels,
    String? imageUrl,
    String? specifications,
  }) = _PartEntity;
}