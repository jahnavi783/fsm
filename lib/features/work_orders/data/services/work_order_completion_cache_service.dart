import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:fsm/core/constants/hive_boxes.dart';
import 'package:fsm/core/storage/hive_service.dart';
import '../models/work_order_completion_cache_model.dart';

/// Service for managing work order completion form cache
/// Allows persistence of form data across app sessions
@singleton
class WorkOrderCompletionCacheService {
  final HiveService _hiveService;
  Box<WorkOrderCompletionCacheModel>? _cacheBox;

  WorkOrderCompletionCacheService(this._hiveService);

  /// Initialize the cache box
  Future<void> init() async {
    _cacheBox = await _hiveService.getTypedBox<WorkOrderCompletionCacheModel>(
      HiveBoxes.workOrderCompletionCache,
    );
  }

  /// Save or update cache for a work order
  Future<void> saveCache(WorkOrderCompletionCacheModel cache) async {
    await _ensureInitialized();
    await _cacheBox!.put(cache.workOrderId, cache);
  }

  /// Load cache for a specific work order
  Future<WorkOrderCompletionCacheModel?> loadCache(int workOrderId) async {
    await _ensureInitialized();
    return _cacheBox!.get(workOrderId);
  }

  /// Check if cache exists for a work order
  Future<bool> hasCache(int workOrderId) async {
    await _ensureInitialized();
    return _cacheBox!.containsKey(workOrderId);
  }

  /// Clear cache for a specific work order
  Future<void> clearCache(int workOrderId) async {
    await _ensureInitialized();
    await _cacheBox!.delete(workOrderId);
  }

  /// Clear all caches
  Future<void> clearAllCaches() async {
    await _ensureInitialized();
    await _cacheBox!.clear();
  }

  /// Remove stale caches (older than specified days)
  Future<void> removeStaleEntries({int daysThreshold = 7}) async {
    await _ensureInitialized();
    final now = DateTime.now();
    final keysToDelete = <int>[];

    for (final key in _cacheBox!.keys) {
      final cache = _cacheBox!.get(key);
      if (cache != null) {
        final daysDiff = now.difference(cache.lastUpdated).inDays;
        if (daysDiff > daysThreshold) {
          keysToDelete.add(key as int);
        }
      }
    }

    for (final key in keysToDelete) {
      await _cacheBox!.delete(key);
    }
  }

  /// Get all cached work order IDs
  Future<List<int>> getCachedWorkOrderIds() async {
    await _ensureInitialized();
    return _cacheBox!.keys.cast<int>().toList();
  }

  /// Ensure the cache box is initialized
  Future<void> _ensureInitialized() async {
    _cacheBox ??=
        await _hiveService.getTypedBox<WorkOrderCompletionCacheModel>(
      HiveBoxes.workOrderCompletionCache,
    );
  }
}
