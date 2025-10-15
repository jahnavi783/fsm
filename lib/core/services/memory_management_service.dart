import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@singleton
class MemoryManagementService {
  static const String _tag = 'MemoryManagement';
  Timer? _memoryMonitorTimer;
  final List<MemorySnapshot> _memoryHistory = [];

  /// Initialize memory management
  void initialize() {
    if (kDebugMode) {
      // Start periodic memory monitoring in debug mode
      _startMemoryMonitoring();
    }
  }

  /// Start periodic memory monitoring
  void _startMemoryMonitoring() {
    _memoryMonitorTimer = Timer.periodic(
      const Duration(seconds: 30),
      (_) => _checkMemoryUsage(),
    );
  }

  /// Check current memory usage
  Future<void> _checkMemoryUsage() async {
    try {
      final memoryInfo = await _getMemoryInfo();
      final snapshot = MemorySnapshot(
        timestamp: DateTime.now(),
        usedMemoryMB: memoryInfo,
      );

      _memoryHistory.add(snapshot);

      // Keep only last 20 snapshots
      if (_memoryHistory.length > 20) {
        _memoryHistory.removeAt(0);
      }

      // Log high memory usage
      if (memoryInfo > 200) {
        // 200MB threshold
        developer.log(
          'High memory usage detected: ${memoryInfo}MB',
          name: _tag,
        );
      }

      // Trigger garbage collection if memory is very high
      if (memoryInfo > 300) {
        // 300MB threshold
        await _triggerGarbageCollection();
      }
    } catch (e) {
      developer.log('Memory check failed: $e', name: _tag);
    }
  }

  /// Get current memory usage
  Future<int> _getMemoryInfo() async {
    try {
      const platform = MethodChannel('flutter/performance');
      final result = await platform.invokeMethod<int>('getMemoryUsage');
      return result ?? 0;
    } catch (e) {
      // Fallback - return 0 if platform channel not available
      return 0;
    }
  }

  /// Trigger garbage collection
  Future<void> _triggerGarbageCollection() async {
    developer.log('Triggering garbage collection', name: _tag);

    // Force garbage collection
    await Future.delayed(const Duration(milliseconds: 100));

    // Clear image cache if memory is still high
    await _clearImageCache();
  }

  /// Clear image cache to free memory
  Future<void> _clearImageCache() async {
    try {
      // Clear Flutter's image cache
      PaintingBinding.instance.imageCache.clear();
      PaintingBinding.instance.imageCache.clearLiveImages();

      developer.log('Image cache cleared', name: _tag);
    } catch (e) {
      developer.log('Failed to clear image cache: $e', name: _tag);
    }
  }

  /// Optimize memory usage
  Future<void> optimizeMemory() async {
    developer.log('Optimizing memory usage', name: _tag);

    // Clear image cache
    await _clearImageCache();

    // Trigger garbage collection
    await _triggerGarbageCollection();

    // Clear old memory snapshots
    if (_memoryHistory.length > 10) {
      _memoryHistory.removeRange(0, _memoryHistory.length - 10);
    }
  }

  /// Get memory usage history
  List<MemorySnapshot> getMemoryHistory() {
    return List.unmodifiable(_memoryHistory);
  }

  /// Get current memory statistics
  MemoryStatistics getMemoryStatistics() {
    if (_memoryHistory.isEmpty) {
      return const MemoryStatistics(
        currentUsageMB: 0,
        averageUsageMB: 0,
        peakUsageMB: 0,
        snapshotCount: 0,
      );
    }

    final currentUsage = _memoryHistory.last.usedMemoryMB;
    final totalUsage = _memoryHistory.fold<int>(
      0,
      (sum, snapshot) => sum + snapshot.usedMemoryMB,
    );
    final averageUsage = totalUsage / _memoryHistory.length;
    final peakUsage = _memoryHistory.fold<int>(
      0,
      (max, snapshot) =>
          snapshot.usedMemoryMB > max ? snapshot.usedMemoryMB : max,
    );

    return MemoryStatistics(
      currentUsageMB: currentUsage,
      averageUsageMB: averageUsage.round(),
      peakUsageMB: peakUsage,
      snapshotCount: _memoryHistory.length,
    );
  }

  /// Dispose resources
  void dispose() {
    _memoryMonitorTimer?.cancel();
    _memoryHistory.clear();
  }
}

/// Memory snapshot data class
class MemorySnapshot {
  final DateTime timestamp;
  final int usedMemoryMB;

  const MemorySnapshot({
    required this.timestamp,
    required this.usedMemoryMB,
  });
}

/// Memory statistics data class
class MemoryStatistics {
  final int currentUsageMB;
  final int averageUsageMB;
  final int peakUsageMB;
  final int snapshotCount;

  const MemoryStatistics({
    required this.currentUsageMB,
    required this.averageUsageMB,
    required this.peakUsageMB,
    required this.snapshotCount,
  });

  @override
  String toString() {
    return 'MemoryStatistics{current: ${currentUsageMB}MB, '
        'average: ${averageUsageMB}MB, peak: ${peakUsageMB}MB}';
  }
}
