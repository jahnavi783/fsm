import 'package:freezed_annotation/freezed_annotation.dart';

part 'part_entity.freezed.dart';

@freezed
class PartEntity with _$PartEntity {
  const PartEntity._();
  
  const factory PartEntity({
    required int id,
    required String partNumber,
    required String partName,
    required String description,
    required String category,
    required double unitPrice,
    required int quantityAvailable,
    required int minQuantity,
    required int maxQuantity,
    required String unit,
    required PartStatus status,
    required List<String> compatibleModels,
    String? imageUrl,
    String? specifications,
    DateTime? lastUpdated,
  }) = _PartEntity;

  // Business logic methods
  bool get isLowStock => quantityAvailable <= minQuantity;
  bool get isOutOfStock => quantityAvailable == 0;
  bool get isInStock => quantityAvailable > minQuantity;
  bool get needsReorder => quantityAvailable <= (minQuantity * 1.2); // 20% buffer
  
  double get totalValue => unitPrice * quantityAvailable;
  
  String get stockStatusText {
    if (isOutOfStock) return 'Out of Stock';
    if (isLowStock) return 'Low Stock';
    return 'In Stock';
  }
}

enum PartStatus {
  active,
  inactive,
  discontinued,
  backordered
}