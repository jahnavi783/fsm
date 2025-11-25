// // import 'dart:async';
// //
// // import 'package:connectivity_plus/connectivity_plus.dart';
// // import 'package:dio/dio.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// //
// // import 'offline_queue_service.dart';
// //
// // class OfflineSyncService {
// //   OfflineSyncService._();
// //   static final OfflineSyncService instance = OfflineSyncService._();
// //
// //   late final Dio _dio;
// //   StreamSubscription<List<ConnectivityResult>>? _subscription;
// //
// //   final _notifications = FlutterLocalNotificationsPlugin();
// //   bool _initialized = false;
// //
// //   /// Call once during DI configuration
// //   Future<void> init(Dio dio) async {
// //     if (_initialized) return;
// //     _initialized = true;
// //
// //     _dio = dio;
// //
// //     // Init notifications
// //     const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
// //     await _notifications.initialize(
// //       const InitializationSettings(android: androidInit),
// //     );
// //
// //     // CONNECTIVITY LISTENER FOR connectivity_plus 7.0.0
// //     _subscription = Connectivity()
// //         .onConnectivityChanged
// //         .listen((List<ConnectivityResult> results) async {
// //       await _handleConnectivityChange(results);
// //     });
// //
// //     // Initial check on startup
// //     final currentResults = await Connectivity().checkConnectivity();
// //     await _handleConnectivityChange(currentResults);
// //   }
// //
// //   Future<void> dispose() async {
// //     await _subscription?.cancel();
// //     _subscription = null;
// //   }
// //
// //   // Handler signature for connectivity_plus 7.0.0
// //   Future<void> _handleConnectivityChange(
// //       List<ConnectivityResult> results) async {
// //     final online = results.contains(ConnectivityResult.mobile) ||
// //         results.contains(ConnectivityResult.wifi);
// //
// //     if (online) {
// //       await _flush();
// //     }
// //   }
// //
// //   // Flush offline requests
// //   Future<void> _flush() async {
// //     await OfflineQueueService.instance.processQueue((req) async {
// //       try {
// //         final response = await _dio.request(
// //           req.url,
// //           data: req.body,
// //           options: Options(
// //             method: req.method,
// //             headers: req.headers,
// //           ),
// //         );
// //
// //         final status = response.statusCode ?? 0;
// //         if (status >= 200 && status < 300) {
// //           await _notify("Synced", req.description);
// //           return true; // removed from queue
// //         }
// //       } catch (_) {
// //         // keep in queue, retry later
// //       }
// //
// //       return false;
// //     });
// //   }
// //
// //   Future<void> notifyQueued(String description) async {
// //     await _notify("Queued Offline", description);
// //   }
// //
// //   Future<void> _notify(String title, String body) async {
// //     const android = AndroidNotificationDetails(
// //       'offline_sync_channel',
// //       'Offline Sync',
// //       importance: Importance.high,
// //       priority: Priority.high,
// //     );
// //
// //     final id = DateTime.now().millisecondsSinceEpoch & 0x7fffffff;
// //
// //     await _notifications.show(
// //       id,
// //       title,
// //       body,
// //       const NotificationDetails(android: android),
// //     );
// //   }
// // }
// import 'dart:async';
//
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// import 'offline_queue_service.dart';
// import 'offline_request.dart';
//
// /// Background service that monitors connectivity and syncs offline requests
// class OfflineSyncService {
//   OfflineSyncService._();
//   static final OfflineSyncService instance = OfflineSyncService._();
//
//   late final Dio _dio;
//   StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;
//   Timer? _periodicSyncTimer;
//
//   final _notifications = FlutterLocalNotificationsPlugin();
//   bool _initialized = false;
//   bool _isSyncing = false;
//
//   final _syncStatusController = StreamController<SyncStatus>.broadcast();
//
//   /// Stream of sync status updates
//   Stream<SyncStatus> get syncStatusStream => _syncStatusController.stream;
//
//   /// Initialize the sync service
//   Future<void> init(Dio dio) async {
//     if (_initialized) return;
//     _initialized = true;
//
//     _dio = dio;
//
//     // Initialize notifications
//     const androidSettings =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//     const initSettings = InitializationSettings(android: androidSettings);
//     await _notifications.initialize(initSettings);
//
//     // Listen to connectivity changes
//     _connectivitySubscription =
//         Connectivity().onConnectivityChanged.listen(_handleConnectivityChange);
//
//     // Check initial connectivity and sync if online
//     final initialResults = await Connectivity().checkConnectivity();
//     await _handleConnectivityChange(initialResults);
//
//     // Periodic sync every 30 seconds when online (as backup)
//     _periodicSyncTimer = Timer.periodic(
//       const Duration(seconds: 30),
//       (_) => _attemptSync(background: true),
//     );
//
//     print('✓ OfflineSyncService initialized');
//   }
//
//   /// Dispose resources
//   Future<void> dispose() async {
//     await _connectivitySubscription?.cancel();
//     _connectivitySubscription = null;
//     _periodicSyncTimer?.cancel();
//     _periodicSyncTimer = null;
//     await _syncStatusController.close();
//   }
//
//   /// Handle connectivity changes
//   Future<void> _handleConnectivityChange(
//       List<ConnectivityResult> results) async {
//     final online = results.contains(ConnectivityResult.mobile) ||
//         results.contains(ConnectivityResult.wifi) ||
//         results.contains(ConnectivityResult.ethernet);
//
//     if (online) {
//       print('📡 Network connected - attempting sync');
//       _syncStatusController.add(SyncStatus.connecting);
//       await _attemptSync();
//     } else {
//       print('📡 Network disconnected');
//       _syncStatusController.add(SyncStatus.offline);
//     }
//   }
//
//   /// Attempt to sync offline queue
//   Future<void> _attemptSync({bool background = false}) async {
//     // Prevent concurrent syncs
//     if (_isSyncing) {
//       print('⚠️ Sync already in progress, skipping');
//       return;
//     }
//
//     final queueSize = await OfflineQueueService.instance.getQueueSize();
//     if (queueSize == 0) {
//       if (!background) {
//         _syncStatusController.add(SyncStatus.idle);
//       }
//       return;
//     }
//
//     _isSyncing = true;
//     _syncStatusController.add(SyncStatus.syncing);
//
//     try {
//       print('🔄 Starting sync - $queueSize requests in queue');
//
//       final result = await OfflineQueueService.instance.processQueue(
//         (request) => _processRequest(request),
//       );
//
//       if (result.success) {
//         print(
//             '✅ Sync completed successfully - ${result.processedCount} requests processed');
//         await _notifySuccess(result);
//         _syncStatusController.add(SyncStatus.success);
//       } else {
//         print('⚠️ Sync partially completed - ${result.message}');
//         await _notifyPartialSuccess(result);
//         _syncStatusController.add(SyncStatus.partialSuccess);
//       }
//     } catch (e, stackTrace) {
//       print('❌ Sync failed with error: $e');
//       print(stackTrace);
//       await _notifyError(e.toString());
//       _syncStatusController.add(SyncStatus.error);
//     } finally {
//       _isSyncing = false;
//
//       // Check if there are still pending requests
//       final remainingSize = await OfflineQueueService.instance.getQueueSize();
//       if (remainingSize == 0) {
//         _syncStatusController.add(SyncStatus.idle);
//       }
//     }
//   }
//
//   /// Process a single offline request
//   Future<bool> _processRequest(OfflineRequest request) async {
//     try {
//       final response = await _dio.request(
//         request.url,
//         data: request.body,
//         options: Options(
//           method: request.method,
//           headers: request.headers,
//           validateStatus: (status) => status != null && status < 500,
//         ),
//       );
//
//       final statusCode = response.statusCode ?? 0;
//
//       // Success: 2xx status codes
//       if (statusCode >= 200 && statusCode < 300) {
//         return true;
//       }
//
//       // Client errors (4xx): Don't retry, remove from queue
//       if (statusCode >= 400 && statusCode < 500) {
//         print(
//             '⚠️ Client error ${statusCode} for ${request.description} - removing from queue');
//         return true; // Remove from queue
//       }
//
//       // Server errors (5xx): Retry later
//       return false;
//     } on DioException catch (e) {
//       // Network errors: Keep in queue for retry
//       if (e.type == DioExceptionType.connectionTimeout ||
//           e.type == DioExceptionType.connectionError ||
//           e.type == DioExceptionType.receiveTimeout ||
//           e.type == DioExceptionType.sendTimeout) {
//         print('⚠️ Network error for ${request.description} - will retry later');
//         return false;
//       }
//
//       // Other Dio errors: Remove from queue to prevent blocking
//       print(
//           '⚠️ Dio error for ${request.description}: ${e.type} - removing from queue');
//       return true;
//     } catch (e) {
//       // Unknown errors: Keep in queue but log
//       print('❌ Unknown error for ${request.description}: $e');
//       return false;
//     }
//   }
//
//   /// Manually trigger sync
//   Future<void> manualSync() async {
//     print('🔄 Manual sync triggered');
//     await _attemptSync();
//   }
//
//   /// Notify when request is queued
//   Future<void> notifyQueued(String description) async {
//     await _notify(
//       'Action Queued',
//       description,
//       importance: Importance.low,
//     );
//   }
//
//   /// Notify sync success
//   Future<void> _notifySuccess(ProcessResult result) async {
//     await _notify(
//       'Sync Complete',
//       '${result.processedCount} action(s) synced successfully',
//       importance: Importance.defaultImportance,
//     );
//   }
//
//   /// Notify partial success
//   Future<void> _notifyPartialSuccess(ProcessResult result) async {
//     await _notify(
//       'Sync Incomplete',
//       '${result.processedCount} synced, ${result.failedCount} failed. Will retry.',
//       importance: Importance.high,
//     );
//   }
//
//   /// Notify sync error
//   Future<void> _notifyError(String error) async {
//     await _notify(
//       'Sync Error',
//       'Failed to sync offline actions. Will retry automatically.',
//       importance: Importance.high,
//     );
//   }
//
//   /// Show notification
//   Future<void> _notify(
//     String title,
//     String body, {
//     Importance importance = Importance.defaultImportance,
//   }) async {
//     final androidDetails = AndroidNotificationDetails(
//       'offline_sync_channel',
//       'Offline Sync',
//       channelDescription: 'Notifications for offline action synchronization',
//       importance: importance,
//       priority: importance == Importance.high
//           ? Priority.high
//           : Priority.defaultPriority,
//     );
//
//     final id = DateTime.now().millisecondsSinceEpoch & 0x7fffffff;
//
//     await _notifications.show(
//       id,
//       title,
//       body,
//       NotificationDetails(android: androidDetails),
//     );
//   }
//
//   /// Get current sync status
//   Future<bool> get isSyncing async => _isSyncing;
//
//   /// Get pending request count
//   Future<int> getPendingCount() async {
//     return await OfflineQueueService.instance.getQueueSize();
//   }
// }
//
// /// Sync status enumeration
// enum SyncStatus {
//   idle,
//   offline,
//   connecting,
//   syncing,
//   success,
//   partialSuccess,
//   error,
// }
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'offline_queue_service.dart';

/// Background service that monitors connectivity and syncs offline requests
class OfflineSyncService {
  OfflineSyncService._();
  static final OfflineSyncService instance = OfflineSyncService._();

  late final Dio _dio;
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  final _notifications = FlutterLocalNotificationsPlugin();
  bool _initialized = false;
  bool _isSyncing = false;

  /// Initialize the sync service - call once during app startup
  Future<void> init(Dio dio) async {
    if (_initialized) return;
    _initialized = true;

    _dio = dio;

    // Initialize notifications
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    await _notifications.initialize(
      const InitializationSettings(android: androidInit),
    );

    // Listen to connectivity changes
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> results) async {
      await _handleConnectivityChange(results);
    });

    // Check initial connectivity on startup
    final currentResults = await Connectivity().checkConnectivity();
    await _handleConnectivityChange(currentResults);

    print('✅ OfflineSyncService initialized');
  }

  /// Dispose resources
  Future<void> dispose() async {
    await _subscription?.cancel();
    _subscription = null;
  }

  /// Handle connectivity changes
  Future<void> _handleConnectivityChange(
      List<ConnectivityResult> results) async {
    final online = results.contains(ConnectivityResult.mobile) ||
        results.contains(ConnectivityResult.wifi);

    if (online) {
      print('📡 Network connected - attempting sync');
      await _flush();
    } else {
      print('📴 Network disconnected');
    }
  }

  /// Flush offline requests when online
  Future<void> _flush() async {
    if (_isSyncing) {
      print('⏭️ Sync already in progress, skipping');
      return;
    }

    final queueSize = await OfflineQueueService.instance.getQueueSize();
    if (queueSize == 0) {
      return;
    }

    _isSyncing = true;

    try {
      print('🔄 Starting sync: $queueSize requests in queue');

      await OfflineQueueService.instance.processQueue((req) async {
        try {
          final response = await _dio.request(
            req.url,
            data: req.body,
            options: Options(
              method: req.method,
              headers: req.headers,
              validateStatus: (status) => status != null && status < 500,
            ),
          );

          final status = response.statusCode ?? 0;

          // SUCCESS: 2xx status codes
          if (status >= 200 && status < 300) {
            await _notify("✓ Synced", req.description);
            return true; // Remove from queue
          }

          // CLIENT ERROR: 4xx - Don't retry, remove from queue
          if (status >= 400 && status < 500) {
            print('⚠️ Client error $status for ${req.description}');
            await _notify(
                "⚠️ Sync Error", "${req.description} - Error $status");
            return true; // Remove from queue to unblock others
          }

          // SERVER ERROR: 5xx - Keep in queue and STOP
          print('❌ Server error $status for ${req.description}');
          await _notify("❌ Sync Failed", "${req.description} - Server error");
          return false; // Stop processing queue
        } on DioException catch (e) {
          // Network/timeout errors - Keep in queue and STOP
          print('❌ Network error for ${req.description}: ${e.type}');
          await _notify("❌ Sync Failed", "${req.description} - Network error");
          return false; // Stop processing queue
        } catch (e) {
          // Unknown errors - Keep in queue and STOP
          print('❌ Unknown error for ${req.description}: $e');
          await _notify("❌ Sync Failed", "${req.description} - Error occurred");
          return false; // Stop processing queue
        }
      });

      final remainingSize = await OfflineQueueService.instance.getQueueSize();

      if (remainingSize == 0) {
        print('✅ Sync completed - all requests processed');
        await _notify("✅ Sync Complete", "All changes synced successfully");
      } else {
        print('⚠️ Sync incomplete - $remainingSize requests remaining');
        await _notify(
          "⚠️ Sync Incomplete",
          "$remainingSize action(s) pending. Will retry automatically.",
        );
      }
    } catch (e, stackTrace) {
      print('💥 Sync error: $e');
      print(stackTrace);
      await _notify(
          "❌ Sync Error", "Failed to sync. Will retry automatically.");
    } finally {
      _isSyncing = false;
    }
  }

  /// Manually trigger sync
  Future<void> manualSync() async {
    print('🔄 Manual sync triggered');
    await _flush();
  }

  /// Notify when request is queued offline
  Future<void> notifyQueued(String description) async {
    await _notify("📦 Queued Offline", description);
  }

  /// Show notification
  Future<void> _notify(String title, String body) async {
    const android = AndroidNotificationDetails(
      'offline_sync_channel',
      'Offline Sync',
      channelDescription: 'Notifications for offline action synchronization',
      importance: Importance.high,
      priority: Priority.high,
    );

    final id = DateTime.now().millisecondsSinceEpoch & 0x7fffffff;

    await _notifications.show(
      id,
      title,
      body,
      const NotificationDetails(android: android),
    );
  }

  /// Check if currently syncing
  bool get isSyncing => _isSyncing;

  /// Get pending request count
  Future<int> getPendingCount() async {
    return await OfflineQueueService.instance.getQueueSize();
  }
}
