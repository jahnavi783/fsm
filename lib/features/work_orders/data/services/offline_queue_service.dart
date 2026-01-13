// // import 'package:shared_preferences/shared_preferences.dart';
// //
// // import 'offline_request.dart';
// //
// // class OfflineQueueService {
// //   OfflineQueueService._();
// //   static final OfflineQueueService instance = OfflineQueueService._();
// //
// //   static const _key = 'offline_queue_v1';
// //
// //   Future<List<OfflineRequest>> _get() async {
// //     final prefs = await SharedPreferences.getInstance();
// //     final raw = prefs.getString(_key);
// //     if (raw == null || raw.isEmpty) return [];
// //     return OfflineRequest.decodeList(raw);
// //   }
// //
// //   Future<void> _save(List<OfflineRequest> list) async {
// //     final prefs = await SharedPreferences.getInstance();
// //     await prefs.setString(_key, OfflineRequest.encodeList(list));
// //   }
// //
// //   Future<void> enqueue(OfflineRequest request) async {
// //     final list = await _get();
// //     list.add(request);
// //     await _save(list);
// //   }
// //
// //   Future<void> processQueue(
// //       Future<bool> Function(OfflineRequest req) processor) async {
// //     final list = await _get();
// //     final remaining = <OfflineRequest>[];
// //
// //     for (final req in list) {
// //       final ok = await processor(req);
// //       if (!ok) remaining.add(req);
// //     }
// //
// //     await _save(remaining);
// //   }
// // }
// import 'dart:async';
//
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'offline_request.dart';
//
// /// Manages the persistent queue of offline requests
// /// Uses SharedPreferences for atomic, persistent storage
// class OfflineQueueService {
//   OfflineQueueService._();
//   static final OfflineQueueService instance = OfflineQueueService._();
//
//   static const String _queueKey = 'offline_queue_v2';
//   static const String _processingKey = 'offline_queue_processing';
//
//   final _queueController = StreamController<List<OfflineRequest>>.broadcast();
//
//   /// Stream of queue changes - useful for UI updates
//   Stream<List<OfflineRequest>> get queueStream => _queueController.stream;
//
//   /// Lock to prevent concurrent queue modifications
//   final _lock = Completer<void>()..complete();
//
//   /// Get current queue
//   Future<List<OfflineRequest>> getQueue() async {
//     await _lock.future;
//     final prefs = await SharedPreferences.getInstance();
//     final raw = prefs.getString(_queueKey);
//     if (raw == null || raw.isEmpty) return [];
//     try {
//       return OfflineRequest.decodeList(raw);
//     } catch (e) {
//       // Corrupted data - clear it
//       await prefs.remove(_queueKey);
//       return [];
//     }
//   }
//
//   /// Save queue atomically
//   Future<void> _saveQueue(List<OfflineRequest> queue) async {
//     final prefs = await SharedPreferences.getInstance();
//     if (queue.isEmpty) {
//       await prefs.remove(_queueKey);
//     } else {
//       await prefs.setString(_queueKey, OfflineRequest.encodeList(queue));
//     }
//     _queueController.add(queue);
//   }
//
//   /// Enqueue a new request
//   Future<void> enqueue(OfflineRequest request) async {
//     await _lock.future;
//     final newLock = Completer<void>();
//     final oldLock = _lock;
//
//     try {
//       final queue = await getQueue();
//
//       // Check for duplicate based on workOrderId and method
//       if (request.workOrderId != null) {
//         // Remove any existing request for same work order and action
//         queue.removeWhere((r) =>
//             r.workOrderId == request.workOrderId &&
//             r.url.endsWith(request.url.split('/').last));
//       }
//
//       queue.add(request);
//       await _saveQueue(queue);
//
//       debugPrint('✓ Enqueued: ${request.description} (Queue size: ${queue.length})');
//     } finally {
//       newLock.complete();
//     }
//   }
//
//   /// Process queue with a processor function
//   /// Processor returns true if request succeeded (remove from queue)
//   /// Processor returns false if request failed (keep in queue for retry)
//   Future<ProcessResult> processQueue(
//     Future<bool> Function(OfflineRequest request) processor,
//   ) async {
//     // Check if already processing
//     final prefs = await SharedPreferences.getInstance();
//     final isProcessing = prefs.getBool(_processingKey) ?? false;
//
//     if (isProcessing) {
//       return ProcessResult(
//         success: false,
//         processedCount: 0,
//         failedCount: 0,
//         message: 'Queue processing already in progress',
//       );
//     }
//
//     // Set processing flag
//     await prefs.setBool(_processingKey, true);
//
//     try {
//       await _lock.future;
//       final queue = await getQueue();
//
//       if (queue.isEmpty) {
//         return ProcessResult(
//           success: true,
//           processedCount: 0,
//           failedCount: 0,
//           message: 'Queue is empty',
//         );
//       }
//
//       final remaining = <OfflineRequest>[];
//       int processedCount = 0;
//       int failedCount = 0;
//       OfflineRequest? firstFailedRequest;
//
//       // Process requests sequentially in order
//       for (final request in queue) {
//         try {
//           print('⚙️ Processing: ${request.description}');
//           final success = await processor(request);
//
//           if (success) {
//             processedCount++;
//             print('✓ Success: ${request.description}');
//           } else {
//             // Failed - keep in queue but stop processing
//             failedCount++;
//             firstFailedRequest = request;
//             remaining.add(request.copyWith(retryCount: request.retryCount + 1));
//             print(
//                 '✗ Failed: ${request.description} (Retry count: ${request.retryCount + 1})');
//
//             // Add remaining unprocessed requests back to queue
//             final currentIndex = queue.indexOf(request);
//             remaining.addAll(queue.sublist(currentIndex + 1));
//             break;
//           }
//         } catch (e) {
//           // Exception during processing - keep in queue and stop
//           failedCount++;
//           firstFailedRequest = request;
//           remaining.add(request.copyWith(retryCount: request.retryCount + 1));
//           print('✗ Exception: ${request.description} - $e');
//
//           // Add remaining unprocessed requests back to queue
//           final currentIndex = queue.indexOf(request);
//           remaining.addAll(queue.sublist(currentIndex + 1));
//           break;
//         }
//       }
//
//       // Save updated queue
//       await _saveQueue(remaining);
//
//       return ProcessResult(
//         success: failedCount == 0,
//         processedCount: processedCount,
//         failedCount: failedCount,
//         remainingCount: remaining.length,
//         firstFailedRequest: firstFailedRequest,
//         message: failedCount == 0
//             ? 'All $processedCount requests processed successfully'
//             : 'Processed $processedCount, failed $failedCount, ${remaining.length} remaining',
//       );
//     } finally {
//       // Clear processing flag
//       await prefs.setBool(_processingKey, false);
//     }
//   }
//
//   /// Clear all queued requests (use with caution)
//   Future<void> clearQueue() async {
//     await _lock.future;
//     await _saveQueue([]);
//     print('✓ Queue cleared');
//   }
//
//   /// Get queue size
//   Future<int> getQueueSize() async {
//     final queue = await getQueue();
//     return queue.length;
//   }
//
//   /// Check if queue has pending requests
//   Future<bool> hasPendingRequests() async {
//     final size = await getQueueSize();
//     return size > 0;
//   }
//
//   /// Remove specific request by ID
//   Future<void> removeRequest(String requestId) async {
//     await _lock.future;
//     final queue = await getQueue();
//     queue.removeWhere((r) => r.id == requestId);
//     await _saveQueue(queue);
//     print('✓ Removed request: $requestId');
//   }
//
//   /// Dispose resources
//   Future<void> dispose() async {
//     await _queueController.close();
//   }
// }
//
// /// Result of queue processing
// class ProcessResult {
//   final bool success;
//   final int processedCount;
//   final int failedCount;
//   final int remainingCount;
//   final OfflineRequest? firstFailedRequest;
//   final String message;
//
//   ProcessResult({
//     required this.success,
//     required this.processedCount,
//     required this.failedCount,
//     this.remainingCount = 0,
//     this.firstFailedRequest,
//     required this.message,
//   });
//
//   @override
//   String toString() {
//     return 'ProcessResult{success: $success, processed: $processedCount, failed: $failedCount, remaining: $remainingCount, message: $message}';
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'local_user_store.dart';
import 'offline_request.dart';

/// Manages the persistent queue of offline requests
class OfflineQueueService {
  OfflineQueueService._();
  static final OfflineQueueService instance = OfflineQueueService._();
  late final LocalUserStore _userStore;
  static const String _key = 'offline_queue_v1';
  static int _sequenceCounter = 0;

  /// Get current queue from persistent storage
  Future<List<OfflineRequest>> _get() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null || raw.isEmpty) return [];

    try {
      return OfflineRequest.decodeList(raw);
    } catch (e) {
      debugPrint('❌ Error reading queue: $e');
      // Clear corrupted data
      await prefs.remove(_key);
      return [];
    }
  }

  /// Save queue to persistent storage
  Future<void> _save(List<OfflineRequest> list) async {
    final prefs = await SharedPreferences.getInstance();
    if (list.isEmpty) {
      await prefs.remove(_key);
    } else {
      await prefs.setString(_key, OfflineRequest.encodeList(list));
    }
  }

  Future<void> enqueue(OfflineRequest request) async {
    final list = await _get();
    final sequence = DateTime.now().millisecondsSinceEpoch;

    final requestWithSequence = OfflineRequest(
      id: request.id,
      url: request.url,
      method: request.method,
      body: request.body,
      headers: request.headers,
      description: request.description,
      sequenceNumber: sequence, // Use timestamp
      workOrderId: request.workOrderId,
    );

    list.add(requestWithSequence);

    // Sort by sequence number to ensure Pause 1 is before Resume 1, etc.
    list.sort((a, b) => a.sequenceNumber.compareTo(b.sequenceNumber));

    await _save(list);
  }

  /// Process queue with a processor function
  /// Returns true if request succeeded (remove from queue)
  /// Returns false if request failed (keep in queue and STOP processing)
  Future<void> processQueue(
    Future<bool> Function(OfflineRequest req) processor,
  ) async {
    final list = await _get();

    if (list.isEmpty) {
      debugPrint('ℹ️ Queue is empty');
      return;
    }
    // Sort by work order AND sequence to ensure proper order
    list.sort((a, b) {
      if (a.workOrderId != b.workOrderId) {
        return (a.workOrderId ?? '').compareTo(b.workOrderId ?? '');
      }
      return a.sequenceNumber.compareTo(b.sequenceNumber);
    });

    debugPrint('🔄 Processing ${list.length} requests in queue');

    final remaining = <OfflineRequest>[];
    int successCount = 0;

    // Process sequentially - STOP on first failure
    for (final request in list) {
      try {
        debugPrint(
            '⚙️ Processing [${request.sequenceNumber}]: ${request.description}');

        final success = await processor(request);

        if (success) {
          successCount++;
          debugPrint(
              '✅ Success [${request.sequenceNumber}]: ${request.description}');
        } else {
          // FAILED - stop processing and keep this + all remaining in queue
          debugPrint(
              '❌ Failed [${request.sequenceNumber}]: ${request.description}');
          debugPrint(
              '⏸️ Stopping queue processing. ${list.length - successCount} requests remain.');

          // Keep failed request and all subsequent requests
          final currentIndex = list.indexOf(request);
          remaining.addAll(list.sublist(currentIndex));
          break;
        }
      } catch (e, stackTrace) {
        // Exception - stop processing
        debugPrint(
            '💥 Exception [${request.sequenceNumber}]: ${request.description} - $e');
        print(stackTrace);
        debugPrint('⏸️ Stopping queue processing due to exception.');

        // Keep failed request and all subsequent requests
        final currentIndex = list.indexOf(request);
        remaining.addAll(list.sublist(currentIndex));
        break;
      }
    }

    // Save remaining requests
    await _save(remaining);

    if (remaining.isEmpty) {
      debugPrint('✅ All $successCount requests processed successfully');
    } else {
      debugPrint(
          '⚠️ Processed $successCount requests. ${remaining.length} remaining in queue.');
    }
  }

  /// Clear all queued requests
  Future<void> clearQueue() async {
    await _save([]);
    debugPrint('🗑️ Queue cleared');
  }

  /// Get queue size
  Future<int> getQueueSize() async {
    final list = await _get();
    return list.length;
  }

  /// Check if queue has pending requests
  Future<bool> hasPendingRequests() async {
    final size = await getQueueSize();
    return size > 0;
  }

  /// Get all pending requests (for debugging/monitoring)
  Future<List<OfflineRequest>> getAllPendingRequests() async {
    return await _get();
  }
}
