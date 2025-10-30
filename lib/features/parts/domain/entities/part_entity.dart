import 'package:freezed_annotation/freezed_annotation.dart';

part 'part_entity.freezed.dart';

@freezed
abstract class PartEntity with _$PartEntity {
  const PartEntity._();

  const factory PartEntity({
    required String partNumber,
    required String partName,
    required String category,
    required int quantityAvailable,
    required double unitPrice,
    required PartStatus status,
  }) = _PartEntity;

  // Business logic methods
  bool get isOutOfStock => quantityAvailable == 0;
  bool get isLowStock => quantityAvailable <= 10; // Simple threshold
  bool get isInStock => quantityAvailable > 10;

  double get totalValue => unitPrice * quantityAvailable;

  String get stockStatusText {
    if (isOutOfStock) return 'Out of Stock';
    if (isLowStock) return 'Low Stock';
    return 'In Stock';
  }
}

enum PartStatus { active, inactive, discontinued, backordered }
