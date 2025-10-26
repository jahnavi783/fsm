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
  Future<PartHiveModel?> getCachedPartByPartNumber(String partNumber);
  Future<void> clearPartsCache();
}

@Injectable(as: PartsLocalDataSource)
class PartsLocalDataSourceImpl implements PartsLocalDataSource {
  final HiveService _hiveService;

  PartsLocalDataSourceImpl(this._hiveService);

  @override
  Future<void> cacheParts(List<PartHiveModel> parts) async {
    final box = await _hiveService.getTypedBox<PartHiveModel>(HiveBoxes.parts);

    // Clear existing parts and add new ones
    await box.clear();
    for (final part in parts) {
      await box.put(part.partNumber, part);
    }
  }

  @override
  Future<List<PartHiveModel>> getCachedParts({
    String? category,
    PartStatus? status,
    String? searchQuery,
  }) async {
    final box = await _hiveService.getTypedBox<PartHiveModel>(HiveBoxes.parts);
    final allParts = box.values.toList();

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
            !part.partNumber.toLowerCase().contains(query)) {
          return false;
        }
      }

      return true;
    }).toList();

    // Sort by part number
    filteredParts.sort((a, b) => a.partNumber.compareTo(b.partNumber));

    return filteredParts;
  }

  @override
  Future<PartHiveModel?> getCachedPartByPartNumber(String partNumber) async {
    final box = await _hiveService.getTypedBox<PartHiveModel>(HiveBoxes.parts);
    return box.get(partNumber);
  }

  @override
  Future<void> clearPartsCache() async {
    final box = await _hiveService.getTypedBox<PartHiveModel>(HiveBoxes.parts);
    await box.clear();
  }
}
