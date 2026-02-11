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
      return;
    }
    // Sort by work order AND sequence to ensure proper order
    list.sort((a, b) {
      if (a.workOrderId != b.workOrderId) {
        return (a.workOrderId ?? '').compareTo(b.workOrderId ?? '');
      }
      return a.sequenceNumber.compareTo(b.sequenceNumber);
    });

    final remaining = <OfflineRequest>[];
    int successCount = 0;

    // Process sequentially - STOP on first failure
    for (final request in list) {
      try {
        final success = await processor(request);

        if (success) {
          successCount++;
        } else {
          // FAILED - stop processing and keep this + all remaining in queue

          // Keep failed request and all subsequent requests
          final currentIndex = list.indexOf(request);
          remaining.addAll(list.sublist(currentIndex));
          break;
        }
      } catch (e, stackTrace) {
        // Exception - stop processing

        print(stackTrace);
        // Keep failed request and all subsequent requests
        final currentIndex = list.indexOf(request);
        remaining.addAll(list.sublist(currentIndex));
        break;
      }
    }

    // Save remaining requests
    await _save(remaining);

    if (remaining.isEmpty) {
    } else {}
  }

  /// Clear all queued requests
  Future<void> clearQueue() async {
    await _save([]);
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
