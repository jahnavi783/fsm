import 'package:injectable/injectable.dart';
import '../../../../core/storage/hive_service.dart';
import '../../../../core/constants/hive_boxes.dart';
import '../models/part_hive_model.dart';
import '../../domain/entities/part_entity.dart';

abstract class PartsLocalDataSource {
  Future<void> cacheParts(List<PartHiveModel> parts);
  Future<List<PartHiveModel>> getCachedParts({
    String? category,
    PartStatus? status,
    String? searchQuery,
  });
  Future<PartHiveModel?> getCachedPartById(int id);
  Future<void> cacheInventory(List<InventoryHiveModel> inventory);
  Future<List<InventoryHiveModel>> getCachedInventory({bool? lowStockOnly});
  Future<InventoryHiveModel?> getCachedInventoryByPartId(int partId);
  Future<void> updateCachedInventory(int partId, int newQuantity);
  Future<void> clearPartsCache();
  Future<void> clearInventoryCache();
}

@Injectable(as: PartsLocalDataSource)
class PartsLocalDataSourceImpl implements PartsLocalDataSource {
  final HiveService _hiveService;

  PartsLocalDataSourceImpl(this._hiveService);

  @override
  Future<void> cacheParts(List<PartHiveModel> parts) async {
    final box = await _hiveService.getBox(HiveBoxes.parts);

    // Clear existing parts and add new ones
    await box.clear();
    for (final part in parts) {
      await box.put(part.id, part);
    }
  }

  @override
  Future<List<PartHiveModel>> getCachedParts({
    String? category,
    PartStatus? status,
    String? searchQuery,
  }) async {
    final box = await _hiveService.getBox(HiveBoxes.parts);
    final allParts = box.values.cast<PartHiveModel>().toList();

    // Apply filters
    var filteredParts = allParts.where((part) {
      // Category filter
      if (category != null && category.isNotEmpty) {
        if (!part.category.toLowerCase().contains(category.toLowerCase())) {
          return false;
        }
      }

      // Status filter
      if (status != null) {
        if (PartStatus.values[part.status] != status) {
          return false;
        }
      }

      // Search query filter
      if (searchQuery != null && searchQuery.isNotEmpty) {
        final query = searchQuery.toLowerCase();
        if (!part.partName.toLowerCase().contains(query) &&
            !part.partNumber.toLowerCase().contains(query) &&
            !part.description.toLowerCase().contains(query)) {
          return false;
        }
      }

      return true;
    }).toList();

    // Sort by part number
    filteredParts.sort((a, b) => a.partNumber.compareTo(b.partNumber));

    return filteredParts.cast<PartHiveModel>().toList();
  }

  @override
  Future<PartHiveModel?> getCachedPartById(int id) async {
    final box = await _hiveService.getBox(HiveBoxes.parts);
    return box.get(id);
  }

  @override
  Future<void> cacheInventory(List<InventoryHiveModel> inventory) async {
    final box = await _hiveService.getBox(HiveBoxes.inventory);

    // Clear existing inventory and add new ones
    await box.clear();
    for (final item in inventory) {
      await box.put(item.partId, item);
    }
  }

  @override
  Future<List<InventoryHiveModel>> getCachedInventory(
      {bool? lowStockOnly}) async {
    final box = await _hiveService.getBox(HiveBoxes.inventory);
    var inventory = box.values.cast<InventoryHiveModel>().toList();

    if (lowStockOnly == true) {
      inventory =
          inventory.where((item) => item.quantity <= item.minQuantity).toList();
    }

    // Sort by part number
    inventory.sort((a, b) => a.partNumber.compareTo(b.partNumber));

    return inventory;
  }

  @override
  Future<InventoryHiveModel?> getCachedInventoryByPartId(int partId) async {
    final box = await _hiveService.getBox(HiveBoxes.inventory);
    return box.get(partId);
  }

  @override
  Future<void> updateCachedInventory(int partId, int newQuantity) async {
    final box = await _hiveService.getBox(HiveBoxes.inventory);
    final existingItem = box.get(partId);

    if (existingItem != null) {
      final updatedItem = existingItem.copyWith(
        quantity: newQuantity,
        lastUpdated: DateTime.now(),
        cachedAt: DateTime.now(),
      );
      await box.put(partId, updatedItem);
    }
  }

  @override
  Future<void> clearPartsCache() async {
    final box = await _hiveService.getBox(HiveBoxes.parts);
    await box.clear();
  }

  @override
  Future<void> clearInventoryCache() async {
    final box = await _hiveService.getBox(HiveBoxes.inventory);
    await box.clear();
  }
}
