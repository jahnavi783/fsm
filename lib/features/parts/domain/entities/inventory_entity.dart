import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_entity.freezed.dart';

@freezed
class InventoryEntity with _$InventoryEntity {
  const InventoryEntity._();
  
  const factory InventoryEntity({
    required int partId,
    required String partNumber,
    required int quantity,
    required int minQuantity,
    required int maxQuantity,
    required DateTime lastUpdated,
    required String location,
    String? notes,
  }) = _InventoryEntity;

  // Business logic methods
  bool get isLowStock => quantity <= minQuantity;
  bool get isOutOfStock => quantity == 0;
  bool get isOverstocked => quantity > maxQuantity;
  
  int get reorderQuantity => maxQuantity - quantity;
  double get stockLevel => quantity / maxQuantity;
  
  String get stockStatusText {
    if (isOutOfStock) return 'Out of Stock';
    if (isLowStock) return 'Low Stock';
    if (isOverstocked) return 'Overstocked';
    return 'Normal';
  }
}

@freezed
class InventoryUpdateEntity with _$InventoryUpdateEntity {
  const factory InventoryUpdateEntity({
    required int partId,
    required int quantityChange,
    required InventoryUpdateType type,
    required String reason,
    required DateTime timestamp,
    String? workOrderId,
    String? notes,
  }) = _InventoryUpdateEntity;
}

enum InventoryUpdateType {
  usage,
  restock,
  adjustment,
  returned,
  damaged,
  lost
}