import 'package:injectable/injectable.dart';

import '../constants/app_constants.dart';
import 'hive_service.dart';

@injectable
class CacheManager {
  final HiveService _hiveService;

  CacheManager(this._hiveService);

  Future<void> cacheData<T>({
    required String boxName,
    required String key,
    required T data,
    Duration? maxAge,
  }) async {
    final box = await _hiveService.getBox(boxName);
    final cacheEntry = {
      'data': data,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'maxAge': (maxAge ?? AppConstants.cacheMaxAge).inMilliseconds,
    };
    await box.put(key, cacheEntry);
  }

  Future<T?> getCachedData<T>(String boxName, String key) async {
    final box = await _hiveService.getBox(boxName);
    final cacheEntry = box.get(key);
    
    if (cacheEntry == null) return null;
    
    final timestamp = cacheEntry['timestamp'] as int;
    final maxAge = cacheEntry['maxAge'] as int;
    final now = DateTime.now().millisecondsSinceEpoch;
    
    // Check if cache is expired
    if (now - timestamp > maxAge) {
      await box.delete(key);
      return null;
    }
    
    return cacheEntry['data'] as T?;
  }

  Future<bool> isCacheValid(String boxName, String key) async {
    final box = await _hiveService.getBox(boxName);
    final cacheEntry = box.get(key);
    
    if (cacheEntry == null) return false;
    
    final timestamp = cacheEntry['timestamp'] as int;
    final maxAge = cacheEntry['maxAge'] as int;
    final now = DateTime.now().millisecondsSinceEpoch;
    
    return now - timestamp <= maxAge;
  }

  Future<void> clearExpiredCache(String boxName) async {
    final box = await _hiveService.getBox(boxName);
    final keysToDelete = <String>[];
    
    for (final key in box.keys) {
      final cacheEntry = box.get(key);
      if (cacheEntry != null) {
        final timestamp = cacheEntry['timestamp'] as int;
        final maxAge = cacheEntry['maxAge'] as int;
        final now = DateTime.now().millisecondsSinceEpoch;
        
        if (now - timestamp > maxAge) {
          keysToDelete.add(key.toString());
        }
      }
    }
    
    for (final key in keysToDelete) {
      await box.delete(key);
    }
  }

  Future<void> clearAllCache(String boxName) async {
    await _hiveService.clearBox(boxName);
  }
}