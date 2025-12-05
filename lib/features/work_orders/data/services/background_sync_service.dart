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
// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
//
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:fsm/features/work_orders/data/services/sync_events.dart';
// import 'package:http_parser/http_parser.dart';
// import 'package:path/path.dart' as path;
//
// import 'local_user_store.dart';
// import 'offline_queue_service.dart';
// import 'offline_request.dart';
//
// /// Background service that monitors connectivity and syncs offline requests
// class OfflineSyncService {
//   OfflineSyncService._();
//   static final OfflineSyncService instance = OfflineSyncService._();
//   late LocalUserStore _userStore;
//   late final Dio _dio;
//   StreamSubscription<List<ConnectivityResult>>? _subscription;
//
//   final _notifications = FlutterLocalNotificationsPlugin();
//   bool _initialized = false;
//   bool _isSyncing = false;
//
//   /// Initialize the sync service - call once during app startup
//   Future<void> init(Dio dio, LocalUserStore userStore) async {
//     if (_initialized) return;
//     _initialized = true;
//
//     _dio = dio;
//     _userStore = userStore;
//     // Initialize notifications
//     const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
//     await _notifications.initialize(
//       const InitializationSettings(android: androidInit),
//     );
//
//     // Listen to connectivity changes
//     _subscription = Connectivity()
//         .onConnectivityChanged
//         .listen((List<ConnectivityResult> results) async {
//       await _handleConnectivityChange(results);
//     });
//
//     // Check initial connectivity on startup
//     final currentResults = await Connectivity().checkConnectivity();
//     await _handleConnectivityChange(currentResults);
//
//     debugPrint('✅ OfflineSyncService initialized');
//   }
//
//   /// Dispose resources
//   Future<void> dispose() async {
//     await _subscription?.cancel();
//     _subscription = null;
//   }
//
//   /// Handle connectivity changes
//   Future<void> _handleConnectivityChange(
//       List<ConnectivityResult> results) async {
//     final online = results.contains(ConnectivityResult.mobile) ||
//         results.contains(ConnectivityResult.wifi);
//
//     if (online) {
//       debugPrint('📡 Network connected - attempting sync');
//       await _flush();
//     } else {
//       debugPrint('📴 Network disconnected');
//     }
//   }
//
//   /// Flush offline requests when online
//   Future<void> _flush() async {
//     if (_isSyncing) {
//       debugPrint('⏭️ Sync already in progress, skipping');
//       return;
//     }
//     final token = await _userStore.getAccessToken();
//
//     _dio.options.headers['Authorization'] = 'Bearer $token';
//
//     final queueSize = await OfflineQueueService.instance.getQueueSize();
//     if (queueSize == 0) {
//       return;
//     }
//
//     _isSyncing = true;
//     SyncEvents.instance.notify(
//       SyncEvent(type: SyncEventType.syncStarted, pendingCount: queueSize),
//     );
//
//     try {
//       debugPrint('🔄 Starting sync: $queueSize requests in queue');
//
//       await OfflineQueueService.instance.processQueue(
//         (req) => _processRequest(req), // ✅ Properly handles all file logic
//       );
//
//       final remainingSize = await OfflineQueueService.instance.getQueueSize();
//
//       if (remainingSize == 0) {
//         debugPrint('✅ Sync completed - all requests processed');
//         await _notify("✅ Sync Complete", "All changes synced successfully");
//
//         // 🔔 notify sync completed
//         SyncEvents.instance.notify(
//           SyncEvent(type: SyncEventType.syncCompleted, pendingCount: 0),
//         );
//       } else {
//         debugPrint('⚠️ Sync incomplete - $remainingSize requests remaining');
//         await _notify(
//           "⚠️ Sync Incomplete",
//           "$remainingSize action(s) pending. Will retry automatically.",
//         );
//
//         // 🔔 notify sync incomplete
//         SyncEvents.instance.notify(
//           SyncEvent(
//             type: SyncEventType.syncIncomplete,
//             pendingCount: remainingSize,
//           ),
//         );
//       }
//     } catch (e, stackTrace) {
//       debugPrint('💥 Sync error: $e');
//       print(stackTrace);
//       await _notify(
//           "❌ Sync Error", "Failed to sync. Will retry automatically.");
//
//       // 🔔 notify sync error
//       SyncEvents.instance.notify(
//         SyncEvent(type: SyncEventType.syncError),
//       );
//     } finally {
//       _isSyncing = false;
//     }
//   }
//
//   /// Process a single offline request with file handling
//   Future<bool> _processRequest(OfflineRequest request) async {
//     try {
//       debugPrint('📤 Processing: ${request.description}');
//
//       // Check if request has files to upload
//       final filePaths = request.body['file_paths'] as List<dynamic>?;
//       final signaturePath = request.body['signature_path'] as String?;
//
//       final hasFiles = (filePaths != null && filePaths.isNotEmpty) ||
//           (signaturePath != null && signaturePath.isNotEmpty);
//
//       Response response;
//
//       if (hasFiles) {
//         // Process request with file uploads
//         response = await _processRequestWithFiles(
//           request,
//           filePaths?.cast<String>(),
//           signaturePath,
//         );
//       } else {
//         // Process regular request without files
//         response = await _processRegularRequest(request);
//       }
//
//       final status = response.statusCode ?? 0;
//
//       // SUCCESS: 2xx status codes
//       if (status >= 200 && status < 300) {
//         debugPrint('✅ Success: ${request.description}');
//         await _notify("✓ Synced", request.description);
//
//         // Clean up files after successful sync
//         if (hasFiles) {
//           await _cleanupFiles(filePaths?.cast<String>(), signaturePath);
//         }
//
//         return true; // Remove from queue
//       }
//
//       // CLIENT ERROR: 4xx - Don't retry, remove from queue
//       if (status >= 400 && status < 500) {
//         debugPrint('⚠️ Client error $status for ${request.description}');
//         await _notify(
//             "⚠️ Sync Error", "${request.description} - Error $status");
//
//         // Clean up files even on client error to avoid orphans
//         if (hasFiles) {
//           await _cleanupFiles(filePaths?.cast<String>(), signaturePath);
//         }
//
//         return true; // Remove from queue to unblock others
//       }
//
//       // SERVER ERROR: 5xx - Keep in queue and STOP
//
//       await _notify("❌ Sync Failed", "${request.description} - Server error");
//       return false; // Stop processing queue
//     } on DioException catch (e) {
//       // Network/timeout errors - Keep in queue and STOP
//
//       await _notify("❌ Sync Failed", "${request.description} - Network error");
//       return false; // Stop processing queue
//     } catch (e, stackTrace) {
//       // Unknown errors - Keep in queue and STOP
//       debugPrint('❌ Unknown error for ${request.description}: $e');
//       print(stackTrace);
//       await _notify("❌ Sync Failed", "${request.description} - Error occurred");
//       return false; // Stop processing queue
//     }
//   }
//
//   /// Process regular request without files
//   Future<Response> _processRegularRequest(OfflineRequest request) async {
//     return await _dio.request(
//       request.url,
//       data: request.body,
//       options: Options(
//         method: request.method,
//         headers: request.headers,
//         validateStatus: (status) => status != null && status < 500,
//       ),
//     );
//   }
//
//   /// Process request with file uploads using multipart/form-data
//   Future<Response> _processRequestWithFiles(
//     OfflineRequest request,
//     List<String>? filePaths,
//     String? signaturePath,
//   ) async {
//     debugPrint('📎 Processing request with files');
//     debugPrint('   Files: ${filePaths?.length ?? 0}');
//     debugPrint('   Signature: ${signaturePath != null ? "Yes" : "No"}');
//
//     final formData = FormData();
//
//     // Add all non-file fields from body
//     final bodyWithoutFiles = Map<String, dynamic>.from(request.body);
//     bodyWithoutFiles.remove('file_paths');
//     bodyWithoutFiles.remove('signature_path');
//
//     // Add regular fields to form data
//     for (final entry in bodyWithoutFiles.entries) {
//       final key = entry.key;
//       final value = entry.value;
//
//       if (value == null) continue;
//
//       if (value is List) {
//         // For lists like gps_coordinates or parts_used
//         if (value.isEmpty) continue;
//
//         // If it's a list of maps (like parts_used), convert to JSON string
//         if (value.first is Map) {
//           formData.fields.add(MapEntry(key, jsonEncode(value)));
//         } else {
//           // For simple lists like coordinates, convert to string
//           formData.fields.add(MapEntry(key, value.toString()));
//         }
//       } else {
//         // Regular string/number fields
//         formData.fields.add(MapEntry(key, value.toString()));
//       }
//     }
//
//     // Add signature file if present
//     if (signaturePath != null && signaturePath.isNotEmpty) {
//       final signatureFile = File(signaturePath);
//       if (await signatureFile.exists()) {
//         final fileName = path.basename(signaturePath);
//         debugPrint('   📸 Adding signature: $fileName');
//
//         formData.files.add(
//           MapEntry(
//             'signature',
//             await MultipartFile.fromFile(
//               signaturePath,
//               filename: fileName,
//               contentType: MediaType('image', 'png'),
//             ),
//           ),
//         );
//       } else {
//         debugPrint('   ⚠️ Signature file not found: $signaturePath');
//       }
//     }
//
//     // Add regular files if present
//     if (filePaths != null && filePaths.isNotEmpty) {
//       for (final filePath in filePaths) {
//         final file = File(filePath);
//         if (await file.exists()) {
//           final fileName = path.basename(filePath);
//
//           // Determine content type based on file extension
//           MediaType contentType;
//           final ext = path.extension(fileName).toLowerCase();
//
//           if (ext == '.jpg' || ext == '.jpeg') {
//             contentType = MediaType('image', 'jpeg');
//           } else if (ext == '.png') {
//             contentType = MediaType('image', 'png');
//           } else if (ext == '.pdf') {
//             contentType = MediaType('application', 'pdf');
//           } else {
//             contentType = MediaType('application', 'octet-stream');
//           }
//
//           debugPrint('   📎 Adding file: $fileName ($contentType)');
//
//           formData.files.add(
//             MapEntry(
//               'files',
//               await MultipartFile.fromFile(
//                 filePath,
//                 filename: fileName,
//                 contentType: contentType,
//               ),
//             ),
//           );
//         } else {
//           debugPrint('   ⚠️ File not found: $filePath');
//         }
//       }
//     }
//
//     debugPrint('   📤 Uploading ${formData.files.length} file(s)...');
//
//     // Send the request
//     final response = await _dio.request(
//       request.url,
//       data: formData,
//       options: Options(
//         method: request.method,
//         headers: {
//           ...request.headers,
//           'Content-Type': 'multipart/form-data',
//         },
//         validateStatus: (status) => status != null && status < 500,
//       ),
//     );
//
//     debugPrint('   ✅ Upload completed with status ${response.statusCode}');
//     return response;
//   }
//
//   /// Clean up stored files after successful sync
//   Future<void> _cleanupFiles(
//     List<String>? filePaths,
//     String? signaturePath,
//   ) async {
//     try {
//       int deletedCount = 0;
//
//       // Delete signature file
//       if (signaturePath != null && signaturePath.isNotEmpty) {
//         final signatureFile = File(signaturePath);
//         if (await signatureFile.exists()) {
//           await signatureFile.delete();
//           deletedCount++;
//           debugPrint('   🗑️ Deleted signature file');
//         }
//       }
//
//       // Delete regular files
//       if (filePaths != null && filePaths.isNotEmpty) {
//         for (final filePath in filePaths) {
//           final file = File(filePath);
//           if (await file.exists()) {
//             await file.delete();
//             deletedCount++;
//           }
//         }
//         debugPrint('   🗑️ Deleted $deletedCount file(s)');
//       }
//
//       // Clean up empty parent directory
//       if (signaturePath != null ||
//           (filePaths != null && filePaths.isNotEmpty)) {
//         final firstPath = signaturePath ?? filePaths!.first;
//         final parentDir = Directory(firstPath).parent;
//
//         if (await parentDir.exists()) {
//           final contents = await parentDir.list().toList();
//           if (contents.isEmpty) {
//             await parentDir.delete(recursive: true);
//             debugPrint('   🗑️ Deleted empty directory');
//           }
//         }
//       }
//     } catch (e, stackTrace) {
//       debugPrint('⚠️ Error cleaning up files: $e');
//       print(stackTrace);
//       // Don't throw - cleanup failure shouldn't fail the sync
//     }
//   }
//
//   /// Manually trigger sync
//   Future<void> manualSync() async {
//     debugPrint('🔄 Manual sync triggered');
//     await _flush();
//   }
//
//   /// Notify when request is queued offline
//   Future<void> notifyQueued(String description) async {
//     await _notify("📦 Queued Offline", description);
//   }
//
//   /// Show notification
//   Future<void> _notify(String title, String body) async {
//     const android = AndroidNotificationDetails(
//       'offline_sync_channel',
//       'Offline Sync',
//       channelDescription: 'Notifications for offline action synchronization',
//       importance: Importance.high,
//       priority: Priority.high,
//     );
//
//     final id = DateTime.now().millisecondsSinceEpoch & 0x7fffffff;
//
//     await _notifications.show(
//       id,
//       title,
//       body,
//       const NotificationDetails(android: android),
//     );
//   }
//
//   /// Check if currently syncing
//   bool get isSyncing => _isSyncing;
//
//   /// Get pending request count
//   Future<int> getPendingCount() async {
//     return await OfflineQueueService.instance.getQueueSize();
//   }
// }
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// Auth + user store
import 'package:fsm/features/auth/data/api/auth_api_client.dart';
import 'package:fsm/features/auth/data/models/refresh_token_request.dart';
import 'package:fsm/features/work_orders/data/services/sync_events.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;

import 'local_user_store.dart';
import 'offline_queue_service.dart';
import 'offline_request.dart';

/// Background service that monitors connectivity and syncs offline requests
class OfflineSyncService {
  OfflineSyncService._();
  static final OfflineSyncService instance = OfflineSyncService._();

  late LocalUserStore _userStore;
  late Dio _dio;
  late AuthApiClient _authApi;

  StreamSubscription<List<ConnectivityResult>>? _subscription;

  final _notifications = FlutterLocalNotificationsPlugin();
  bool _initialized = false;
  bool _isSyncing = false;

  /// Initialize the sync service - call once during app startup
  Future<void> init(Dio dio, LocalUserStore userStore) async {
    if (_initialized) return;
    _initialized = true;

    _dio = dio;
    _userStore = userStore;
    _authApi = AuthApiClient(dio, baseUrl: dio.options.baseUrl);

    // Notifications
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    await _notifications.initialize(
      const InitializationSettings(android: androidInit),
    );

    // Connectivity listener
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> results) async {
      await _handleConnectivityChange(results);
    });

    // Initial connectivity check
    final currentResults = await Connectivity().checkConnectivity();
    await _handleConnectivityChange(currentResults);

    debugPrint('✅ OfflineSyncService initialized');
  }

  /// Dispose resources
  Future<void> dispose() async {
    await _subscription?.cancel();
    _subscription = null;
  }

  // ─────────────────────────────────────────────
  // Connectivity handling
  // ─────────────────────────────────────────────
  Future<void> _handleConnectivityChange(
      List<ConnectivityResult> results) async {
    final online = results.contains(ConnectivityResult.mobile) ||
        results.contains(ConnectivityResult.wifi);

    if (online) {
      debugPrint('📡 Network connected - attempting sync');
      await _flush();
    } else {
      debugPrint('📴 Network disconnected');
    }
  }

  // ─────────────────────────────────────────────
  // Flush offline queue
  // ─────────────────────────────────────────────
  Future<void> _flush() async {
    if (_isSyncing) {
      debugPrint('⏭️ Sync already in progress, skipping');
      return;
    }

    final queueSize = await OfflineQueueService.instance.getQueueSize();
    if (queueSize == 0) {
      return;
    }

    _isSyncing = true;

    SyncEvents.instance.notify(
      SyncEvent(type: SyncEventType.syncStarted, pendingCount: queueSize),
    );

    try {
      debugPrint('🔄 Starting sync: $queueSize requests in queue');

      await OfflineQueueService.instance.processQueue(
        (req) => _processRequest(req),
      );

      final remainingSize = await OfflineQueueService.instance.getQueueSize();

      if (remainingSize == 0) {
        debugPrint('✅ Sync completed - all requests processed');
        await _notify("✅ Sync Complete", "All changes synced successfully");

        SyncEvents.instance.notify(
          SyncEvent(type: SyncEventType.syncCompleted, pendingCount: 0),
        );
      } else {
        debugPrint('⚠️ Sync incomplete - $remainingSize requests remaining');
        await _notify(
          "⚠️ Sync Incomplete",
          "$remainingSize action(s) pending. Will retry automatically.",
        );

        SyncEvents.instance.notify(
          SyncEvent(
            type: SyncEventType.syncIncomplete,
            pendingCount: remainingSize,
          ),
        );
      }
    } catch (e, stackTrace) {
      debugPrint('💥 Sync error: $e');
      print(stackTrace);
      await _notify(
        "❌ Sync Error",
        "Failed to sync. Will retry automatically.",
      );

      SyncEvents.instance.notify(
        SyncEvent(type: SyncEventType.syncError),
      );
    } finally {
      _isSyncing = false;
    }
  }

  // ─────────────────────────────────────────────
  // Main request processor with refresh + retry
  // ─────────────────────────────────────────────
  Future<bool> _processRequest(OfflineRequest request) async {
    try {
      debugPrint('📤 Processing: ${request.description}');

      final filePathsDynamic = request.body['file_paths'] as List<dynamic>?;
      final signaturePath = request.body['signature_path'] as String?;

      final filePaths =
          filePathsDynamic?.map((e) => e.toString()).toList(growable: false);

      Response response =
          await _sendWithCurrentToken(request, filePaths, signaturePath);

      int status = response.statusCode ?? 0;

      // If unauthorized → try refresh once and retry
      if (status == 401) {
        debugPrint(
            '🔒 401 for ${request.description} – attempting token refresh');

        final refreshed = await _tryRefreshToken();

        if (refreshed) {
          debugPrint(
              '🔑 Token refreshed – retrying ${request.description} once');
          response =
              await _sendWithCurrentToken(request, filePaths, signaturePath);
          status = response.statusCode ?? 0;
        } else {
          debugPrint(
              '❌ Token refresh failed – dropping request ${request.id} from queue');
          await _notify(
            "Session Expired",
            "Could not sync '${request.description}' because your session expired. Please log in again.",
          );
          // Drop this item from queue - user must log in again
          return true;
        }
      }

      // SUCCESS 2xx
      if (status >= 200 && status < 300) {
        debugPrint('✅ Success: ${request.description}');
        await _notify("✓ Synced", request.description);

        await _cleanupFiles(filePaths, signaturePath);
        return true;
      }

      // CLIENT ERROR 4xx (after optional refresh) → drop from queue
      if (status >= 400 && status < 500) {
        debugPrint('⚠️ Client error $status for ${request.description}');
        await _notify(
          "⚠️ Sync Error",
          "${request.description} - Error $status",
        );

        await _cleanupFiles(filePaths, signaturePath);
        return true;
      }

      // SERVER ERROR 5xx → keep in queue, stop processing
      debugPrint(
          '❌ Server error $status for ${request.description} - will retry later');
      await _notify(
        "❌ Sync Failed",
        "${request.description} - Server error",
      );
      return false;
    } on DioException catch (e) {
      // Network/timeouts → keep in queue and stop
      debugPrint(
          '⚠️ Network error for ${request.description}: ${e.type} (${e.message})');
      await _notify(
        "❌ Sync Failed",
        "${request.description} - Network error",
      );
      return false;
    } catch (e, stackTrace) {
      debugPrint('❌ Unknown error for ${request.description}: $e');
      print(stackTrace);
      await _notify(
        "❌ Sync Failed",
        "${request.description} - Error occurred",
      );
      return false;
    }
  }

  // ─────────────────────────────────────────────
  // Send request using latest access token
  // ─────────────────────────────────────────────
  Future<Response> _sendWithCurrentToken(
    OfflineRequest request,
    List<String>? filePaths,
    String? signaturePath,
  ) async {
    final freshToken = await _userStore.getAccessToken();

    final mergedHeaders = <String, String>{
      ...request.headers,
      if (freshToken != null && freshToken.isNotEmpty)
        'Authorization': 'Bearer $freshToken',
    };

    final hasFiles = (filePaths != null && filePaths.isNotEmpty) ||
        (signaturePath != null && signaturePath.isNotEmpty);

    if (hasFiles) {
      return _processRequestWithFiles(
        request,
        mergedHeaders,
        filePaths,
        signaturePath,
      );
    } else {
      return _processRegularRequest(
        request,
        mergedHeaders,
      );
    }
  }

  // ─────────────────────────────────────────────
  // Regular (JSON) request
  // ─────────────────────────────────────────────
  Future<Response> _processRegularRequest(
    OfflineRequest request,
    Map<String, String> mergedHeaders,
  ) async {
    return await _dio.request(
      request.url,
      data: request.body,
      options: Options(
        method: request.method,
        headers: mergedHeaders,
        validateStatus: (status) => status != null && status < 500,
      ),
    );
  }

  // ─────────────────────────────────────────────
  // Multipart/form-data request with files
  // ─────────────────────────────────────────────
  Future<Response> _processRequestWithFiles(
    OfflineRequest request,
    Map<String, String> mergedHeaders,
    List<String>? filePaths,
    String? signaturePath,
  ) async {
    debugPrint('📎 Processing request with files');

    final formData = FormData();

    // Non-file body fields
    final bodyWithoutFiles = Map<String, dynamic>.from(request.body);
    bodyWithoutFiles.remove('file_paths');
    bodyWithoutFiles.remove('signature_path');

    for (final entry in bodyWithoutFiles.entries) {
      final key = entry.key;
      final value = entry.value;

      if (value == null) continue;

      if (value is List) {
        if (value.isEmpty) continue;

        if (value.isNotEmpty && value.first is Map) {
          formData.fields.add(MapEntry(key, jsonEncode(value)));
        } else {
          formData.fields.add(MapEntry(key, value.toString()));
        }
      } else {
        formData.fields.add(MapEntry(key, value.toString()));
      }
    }

    // Signature
    if (signaturePath != null && signaturePath.isNotEmpty) {
      final sigFile = File(signaturePath);
      if (await sigFile.exists()) {
        final fileName = path.basename(signaturePath);
        debugPrint('   📸 Adding signature: $fileName');

        formData.files.add(
          MapEntry(
            'signature',
            await MultipartFile.fromFile(
              signaturePath,
              filename: fileName,
              contentType: MediaType('image', 'png'),
            ),
          ),
        );
      } else {
        debugPrint('   ⚠️ Signature file not found: $signaturePath');
      }
    }

    // Other files
    if (filePaths != null && filePaths.isNotEmpty) {
      for (final filePath in filePaths) {
        final file = File(filePath);
        if (await file.exists()) {
          final fileName = path.basename(filePath);
          final ext = path.extension(fileName).toLowerCase();

          final contentType = ext == '.jpg' || ext == '.jpeg'
              ? MediaType('image', 'jpeg')
              : ext == '.png'
                  ? MediaType('image', 'png')
                  : ext == '.pdf'
                      ? MediaType('application', 'pdf')
                      : MediaType('application', 'octet-stream');

          debugPrint('   📎 Adding file: $fileName ($contentType)');

          formData.files.add(
            MapEntry(
              'files',
              await MultipartFile.fromFile(
                filePath,
                filename: fileName,
                contentType: contentType,
              ),
            ),
          );
        } else {
          debugPrint('   ⚠️ File not found: $filePath');
        }
      }
    }

    debugPrint('   📤 Uploading ${formData.files.length} file(s)...');

    return await _dio.request(
      request.url,
      data: formData,
      options: Options(
        method: request.method,
        headers: {
          ...mergedHeaders,
          'Content-Type': 'multipart/form-data',
        },
        validateStatus: (status) => status != null && status < 500,
      ),
    );
  }

  // ─────────────────────────────────────────────
  // Token refresh
  // ─────────────────────────────────────────────
  Future<bool> _tryRefreshToken() async {
    try {
      final refreshToken = await _userStore.getRefreshToken();
      if (refreshToken == null || refreshToken.isEmpty) {
        debugPrint('🔑 No refresh token available – cannot refresh');
        return false;
      }

      final response = await _authApi.refreshToken(
        RefreshTokenRequest(refreshToken: refreshToken),
      );

      // Persist new tokens
      await _userStore.saveTokens(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      );

      debugPrint('🔑 Token refreshed for offline sync');
      return true;
    } catch (e, stackTrace) {
      debugPrint('❌ Refresh token call failed: $e');
      print(stackTrace);
      return false;
    }
  }

  // ─────────────────────────────────────────────
  // File cleanup
  // ─────────────────────────────────────────────
  Future<void> _cleanupFiles(
    List<String>? filePaths,
    String? signaturePath,
  ) async {
    try {
      if (signaturePath != null && signaturePath.isNotEmpty) {
        final sig = File(signaturePath);
        if (await sig.exists()) {
          await sig.delete();
          debugPrint('   🗑️ Deleted signature file');
        }
      }

      if (filePaths != null && filePaths.isNotEmpty) {
        for (final filePath in filePaths) {
          final file = File(filePath);
          if (await file.exists()) {
            await file.delete();
          }
        }
        debugPrint('   🗑️ Deleted ${filePaths.length} file(s)');
      }
    } catch (e, stackTrace) {
      debugPrint('⚠️ Error cleaning up files: $e');
      print(stackTrace);
    }
  }

  // ─────────────────────────────────────────────
  // Public helpers
  // ─────────────────────────────────────────────
  Future<void> manualSync() async {
    debugPrint('🔄 Manual sync triggered');
    await _flush();
  }

  Future<void> notifyQueued(String description) async {
    await _notify("📦 Queued Offline", description);
  }

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

  bool get isSyncing => _isSyncing;

  Future<int> getPendingCount() async {
    return await OfflineQueueService.instance.getQueueSize();
  }
}
