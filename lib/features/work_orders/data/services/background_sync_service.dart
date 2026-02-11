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

  //  ADD: Callback for work order sync
  Function(int workOrderId)? _onWorkOrderSynced;

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
  }

  /// ADD: Set callback to refresh work order after sync
  void setWorkOrderSyncCallback(Function(int workOrderId) callback) {
    _onWorkOrderSynced = callback;
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

    if (online && !_isSyncing) {
      debugPrint('📡 Network connected - attempting sync');
      await _flush();
    } else {
      debugPrint(' Network disconnected');
    }
  }

  // ─────────────────────────────────────────────
  // Flush offline queue
  // ─────────────────────────────────────────────
  Future<void> _flush() async {
    if (_isSyncing) {
      return;
    }
    _isSyncing = true;

    final queueSize = await OfflineQueueService.instance.getQueueSize();
    if (queueSize == 0) {
      _isSyncing = false;
      return;
    }

    SyncEvents.instance.notify(
      SyncEvent(type: SyncEventType.syncStarted, pendingCount: queueSize),
    );

    try {
      await OfflineQueueService.instance.processQueue(
        (req) => _processRequest(req),
      );

      final remainingSize = await OfflineQueueService.instance.getQueueSize();

      if (remainingSize == 0) {
        await _notify(" Sync Complete", "All changes synced successfully");

        SyncEvents.instance.notify(
          SyncEvent(type: SyncEventType.syncCompleted, pendingCount: 0),
        );
      } else {
        await _notify(
          " Sync Incomplete",
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
      print(stackTrace);
      await _notify(
        " Sync Error",
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
      final filePathsDynamic = request.body['file_paths'] as List<dynamic>?;
      final signaturePath = request.body['signature_path'] as String?;

      final filePaths =
          filePathsDynamic?.map((e) => e.toString()).toList(growable: false);

      Response response =
          await _sendWithCurrentToken(request, filePaths, signaturePath);

      int status = response.statusCode ?? 0;

      // If unauthorized → try refresh once and retry
      if (status == 401) {
        final refreshed = await _tryRefreshToken();

        if (refreshed) {
          response =
              await _sendWithCurrentToken(request, filePaths, signaturePath);
          status = response.statusCode ?? 0;
        } else {
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
        await _notify("✓ Synced", request.description);

        await _cleanupFiles(filePaths, signaturePath);

        //  CRITICAL FIX: Extract work order ID and trigger refresh
        final workOrderId = _extractWorkOrderId(request);
        if (workOrderId != null && _onWorkOrderSynced != null) {
          _onWorkOrderSynced!(workOrderId);
        }

        return true;
      }

      // CLIENT ERROR 4xx (after optional refresh) → drop from queue
      if (status >= 400 && status < 500) {
        await _notify(
          " Sync Error",
          "${request.description} - Error $status",
        );

        await _cleanupFiles(filePaths, signaturePath);
        return true;
      }

      // SERVER ERROR 5xx → keep in queue, stop processing
      await _notify(
        " Sync Failed",
        "${request.description} - Server error",
      );
      return false;
    } on DioException catch (e) {
      // Network/timeouts → keep in queue and stop
      await _notify(
        " Sync Failed",
        "${request.description} - Network error",
      );
      return false;
    } catch (e, stackTrace) {
      print(stackTrace);
      await _notify(
        " Sync Failed",
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
        debugPrint('Signature file not found: $signaturePath');
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
          debugPrint(' File not found: $filePath');
        }
      }
    }

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
      return true;
    } catch (e, stackTrace) {
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
        }
      }

      if (filePaths != null && filePaths.isNotEmpty) {
        for (final filePath in filePaths) {
          final file = File(filePath);
          if (await file.exists()) {
            await file.delete();
          }
        }
      }
    } catch (e, stackTrace) {
      print(stackTrace);
    }
  }

  // ADD: Extract work order ID from request
  int? _extractWorkOrderId(OfflineRequest request) {
    try {
      // Check URL for work order ID pattern like /work-orders/123/pause
      final urlPattern = RegExp(r'/work-orders/(\d+)');
      final match = urlPattern.firstMatch(request.url);
      if (match != null) {
        return int.parse(match.group(1)!);
      }

      // Or check in body
      if (request.body.containsKey('work_order_id')) {
        return request.body['work_order_id'] as int?;
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  // ─────────────────────────────────────────────
  // Public helpers
  // ─────────────────────────────────────────────
  Future<void> manualSync() async {
    await _flush();
  }

  Future<void> notifyQueued(String description) async {
    await _notify(" Queued Offline", description);
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
