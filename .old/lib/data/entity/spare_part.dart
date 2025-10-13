import 'package:freezed_annotation/freezed_annotation.dart';

part 'spare_part.freezed.dart';
part 'spare_part.g.dart';

@freezed
abstract class SparePartEntity with _$SparePartEntity {
  const SparePartEntity._();
  const factory SparePartEntity({
    @JsonKey(name: 'part_number') required String partNumber,
    @JsonKey(name: 'part_name') required String partName,
    @Default('') @JsonKey(name: 'category') String category,
    @Default(0) @JsonKey(name: 'quantity_available') int quantityAvailable,
    @Default('') @JsonKey(name: 'unit_price') String unitPrice,
    required String status,
  }) = _SparePartEntity;

  factory SparePartEntity.fromJson(Map<String, dynamic> json) =>
      _$SparePartEntityFromJson(json);
}
