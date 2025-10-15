import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@singleton
class PerformanceService {
  static const String _tag = 'PerformanceService';
  final Map<String, DateTime> _startTimes = {};
  final Map<String, int> _memorySnapshots = {};

  /// Start timing an operation
  void startTimer(String operationName) {
    _startTimes[operationName] = DateTime.now();
    if (kDebugMode) {
      developer.log('Started: $operationName', name: _tag);
    }
  }

  /// End timing an operation and log the duration
  void endTimer(String operationName) {
    final startTime = _startTimes.remove(operationName);
    if (startTime != null) {
      final duration = DateTime.now().difference(startTime);
      if (kDebugMode) {
        developer.log(
          'Completed: $operationName in ${duration.inMilliseconds}ms',
          name: _tag,
        );
      }

      // Log slow operations (>1 second)
      if (duration.inSeconds > 1) {
        developer.log(
          'SLOW OPERATION: $operationName took ${duration.inSeconds}s',
          name: _tag,
        );
      }
    }
  }

  /// Measure memory usage for an operation
  Future<void> measureMemory(String operationName) async {
    if (kDebugMode) {
      try {
        final memoryInfo = await _getMemoryInfo();
        _memorySnapshots[operationName] = memoryInfo;
        developer.log(
          'Memory snapshot for $operationName: ${memoryInfo}MB',
          name: _tag,
        );
      } catch (e) {
        developer.log('Failed to measure memory: $e', name: _tag);
      }
    }
  }

  /// Get current memory usage (Android/iOS specific)
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

  /// Log app startup metrics
  void logAppStartup(Duration startupTime) {
    if (kDebugMode) {
      developer.log(
        'App startup completed in ${startupTime.inMilliseconds}ms',
        name: _tag,
      );

      if (startupTime.inSeconds > 3) {
        developer.log(
          'WARNING: Slow app startup (${startupTime.inSeconds}s)',
          name: _tag,
        );
      }
    }
  }

  /// Monitor frame rendering performance
  void monitorFramePerformance() {
    if (kDebugMode) {
      WidgetsBinding.instance.addTimingsCallback((timings) {
        for (final timing in timings) {
          final frameDuration = timing.totalSpan;
          if (frameDuration.inMilliseconds > 16) {
            // 60fps = 16.67ms per frame
            developer.log(
              'Slow frame detected: ${frameDuration.inMilliseconds}ms',
              name: _tag,
            );
          }
        }
      });
    }
  }

  /// Clear all performance data
  void clearMetrics() {
    _startTimes.clear();
    _memorySnapshots.clear();
  }
}
