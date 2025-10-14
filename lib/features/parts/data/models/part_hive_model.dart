import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import '../../domain/entities/part_entity.dart';
import '../../domain/entities/inventory_entity.dart';

part 'part_hive_model.freezed.dart';
part 'part_hive_model.g.dart';

@freezed
@HiveType(typeId: 4)
class PartHiveModel with _$PartHiveModel {
  const factory PartHiveModel({
    @HiveField(0) required int id,
    @HiveField(1) required String partNumber,
    @HiveField(2) required String partName,
    @HiveField(3) required String description,
    @HiveField(4) required String category,
    @HiveField(5) required double unitPrice,
    @HiveField(6) required int quantityAvailable,
    @HiveField(7) required int minQuantity,
    @HiveField(8) required int maxQuantity,
    @HiveField(9) required String unit,
    @HiveField(10) required int status, // Store as int for enum
    @HiveField(11) @Default([]) List<String> compatibleModels,
    @HiveField(12) String? imageUrl,
    @HiveField(13) String? specifications,
    @HiveField(14) DateTime? lastUpdated,
    @HiveField(15) required DateTime cachedAt,
  }) = _PartHiveModel;

  factory PartHiveModel.fromJson(Map<String, dynamic> json) =>
      _$PartHiveModelFromJson(json);
}

@freezed
@HiveType(typeId: 5)
class InventoryHiveModel with _$InventoryHiveModel {
  const factory InventoryHiveModel({
    @HiveField(0) required int partId,
    @HiveField(1) required String partNumber,
    @HiveField(2) required int quantity,
    @HiveField(3) required int minQuantity,
    @HiveField(4) required int maxQuantity,
    @HiveField(5) required DateTime lastUpdated,
    @HiveField(6) required String location,
    @HiveField(7) String? notes,
    @HiveField(8) required DateTime cachedAt,
  }) = _InventoryHiveModel;

  factory InventoryHiveModel.fromJson(Map<String, dynamic> json) =>
      _$InventoryHiveModelFromJson(json);
}

extension PartHiveModelX on PartHiveModel {
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
      status: PartStatus.values[status],
      compatibleModels: compatibleModels,
      imageUrl: imageUrl,
      specifications: specifications,
      lastUpdated: lastUpdated,
    );
  }

  static PartHiveModel fromEntity(PartEntity entity) {
    return PartHiveModel(
      id: entity.id,
      partNumber: entity.partNumber,
      partName: entity.partName,
      description: entity.description,
      category: entity.category,
      unitPrice: entity.unitPrice,
      quantityAvailable: entity.quantityAvailable,
      minQuantity: entity.minQuantity,
      maxQuantity: entity.maxQuantity,
      unit: entity.unit,
      status: entity.status.index,
      compatibleModels: entity.compatibleModels,
      imageUrl: entity.imageUrl,
      specifications: entity.specifications,
      lastUpdated: entity.lastUpdated,
      cachedAt: DateTime.now(),
    );
  }
}

extension InventoryHiveModelX on InventoryHiveModel {
  InventoryEntity toEntity() {
    return InventoryEntity(
      partId: partId,
      partNumber: partNumber,
      quantity: quantity,
      minQuantity: minQuantity,
      maxQuantity: maxQuantity,
      lastUpdated: lastUpdated,
      location: location,
      notes: notes,
    );
  }

  static InventoryHiveModel fromEntity(InventoryEntity entity) {
    return InventoryHiveModel(
      partId: entity.partId,
      partNumber: entity.partNumber,
      quantity: entity.quantity,
      minQuantity: entity.minQuantity,
      maxQuantity: entity.maxQuantity,
      lastUpdated: entity.lastUpdated,
      location: entity.location,
      notes: entity.notes,
      cachedAt: DateTime.now(),
    );
  }
}
