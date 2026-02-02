import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/calendar/data/models/calendar_event_hive_model.dart';
import '../../features/documents/data/models/document_hive_model.dart';
import '../../features/parts/data/models/part_hive_model.dart';
import '../../features/profile/data/models/profile_hive_model.dart';
import '../../features/work_orders/data/models/work_log_hive_model.dart';
import '../../features/work_orders/data/models/work_order_completion_cache_model.dart';
import '../../features/work_orders/data/models/work_order_hive_model.dart';
import '../constants/app_constants.dart';
import '../constants/hive_boxes.dart';
import '../services/logging_service.dart';

@preResolve
@singleton
class HiveService {
  late Box _authBox;
  late Box _settingsBox;
  final LoggingService _loggingService;

  @FactoryMethod()
  static Future<HiveService> create(LoggingService loggingService) async {
    final service = HiveService._(loggingService);
    await service._init();
    return service;
  }

  HiveService._(this._loggingService);

  Future<void> _init() async {
    // Initialize Hive CE with proper path
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = appDocDir.path;
    Hive.init(appDocPath);

    // Register Hive adapters
    _registerAdapters();
    _settingsBox = await Hive.openBox(HiveBoxes.settingsBox);

    // Check if migration is needed (one-time only)
    final needsMigration =
        _settingsBox.get('needs_typeid_migration', defaultValue: true);

    if (needsMigration) {
      _loggingService.info('🔄 Performing one-time Hive migration...');

      // Close settings box before deleting
      await _settingsBox.close();

      // Delete all .hive files
      final dir = Directory(appDocPath);
      await for (final file in dir.list()) {
        if (file.path.contains('.hive')) {
          await file.delete();
        }
      }

      // Reopen settings box and mark migration complete
      _settingsBox = await Hive.openBox(HiveBoxes.settingsBox);
      await _settingsBox.put('needs_typeid_migration', false);

      _loggingService.info('✅ Migration complete');
    }

    // Open essential boxes
    _authBox = await Hive.openBox(HiveBoxes.authBox);
    debugPrint('DEBUG: Is WorkLog registered? ${Hive.isAdapterRegistered(6)}');

    // Open feature-specific boxes
    await _openFeatureBoxes();
    // await _fixHiveCorruptionIfNeeded();
  }

  void _registerAdapters() {
    try {
      // Register Work Log adapter (TIMELINE)
      if (!Hive.isAdapterRegistered(HiveBoxes.workLogEntityTypeId)) {
        Hive.registerAdapter(WorkLogHiveModelAdapter());
      }

      // Register Work Order related adapters
      if (!Hive.isAdapterRegistered(HiveBoxes.workOrderEntityTypeId)) {
        Hive.registerAdapter(WorkOrderHiveModelAdapter());
      }
      if (!Hive.isAdapterRegistered(HiveBoxes.partUsedEntityTypeId)) {
        Hive.registerAdapter(PartUsedHiveModelAdapter());
      }

      // Register Parts adapter (using alias to avoid conflict)
      if (!Hive.isAdapterRegistered(HiveBoxes.partEntityTypeId)) {
        Hive.registerAdapter(PartHiveModelAdapter());
      }

      // Register Document adapter
      if (!Hive.isAdapterRegistered(HiveBoxes.documentEntityTypeId)) {
        Hive.registerAdapter(DocumentHiveModelAdapter());
      }
      // Register Calendar Event adapter
      if (!Hive.isAdapterRegistered(HiveBoxes.calendarEventEntityTypeId)) {
        Hive.registerAdapter(CalendarEventHiveModelAdapter());
      }

      // Register Profile adapters
      if (!Hive.isAdapterRegistered(HiveBoxes.profileEntityTypeId)) {
        Hive.registerAdapter(ProfileHiveModelAdapter());
      }
      if (!Hive.isAdapterRegistered(HiveBoxes.profilePreferencesEntityTypeId)) {
        Hive.registerAdapter(ProfilePreferencesHiveModelAdapter());
      }

      // Register Work Order Completion Cache adapters
      if (!Hive.isAdapterRegistered(HiveBoxes.workOrderCompletionCacheTypeId)) {
        Hive.registerAdapter(WorkOrderCompletionCacheModelAdapter());
      }
      if (!Hive.isAdapterRegistered(HiveBoxes.cachedPartUsedTypeId)) {
        Hive.registerAdapter(CachedPartUsedModelAdapter());
      }
      debugPrint('WorkLog adapter registered: '
          '${Hive.isAdapterRegistered(HiveBoxes.workLogEntityTypeId)}');
    } catch (e) {
      // Log adapter registration errors but don't crash the app
      _loggingService.error('Error registering Hive adapters: $e', error: e);
      rethrow;
    }
  }

  Future<void> _openFeatureBoxes() async {
    try {
      // Open typed boxes for different features
      await Hive.openBox<WorkOrderHiveModel>(HiveBoxes.workOrders);
      await Hive.openBox<WorkOrderCompletionCacheModel>(
          HiveBoxes.workOrderCompletionCache);
      await Hive.openBox<DocumentHiveModel>(HiveBoxes.documents);
      await Hive.openBox<PartHiveModel>(HiveBoxes.parts);
      await Hive.openBox(HiveBoxes.inventory); // Generic box for inventory data
      await Hive.openBox<CalendarEventHiveModel>(HiveBoxes.calendarEvents);
      await Hive.openBox(
          HiveBoxes.calendarBox); // Generic box for calendar data
      await Hive.openBox<ProfileHiveModel>(HiveBoxes.profile);
      await Hive.openBox<ProfilePreferencesHiveModel>(
          HiveBoxes.profilePreferences);
      await Hive.openBox<WorkLogHiveModel>(HiveBoxes.workLogs);
    } catch (e) {
      _loggingService.error('Error opening feature boxes: $e', error: e);
      rethrow;
    }
  }

  // Auth token methods
  Future<void> saveAccessToken(String token) async {
    await _authBox.put(AppConstants.accessToken, token);
  }

  Future<void> saveRefreshToken(String token) async {
    await _authBox.put(AppConstants.refreshToken, token);
  }

  Future<String?> getAccessToken() async {
    return _authBox.get(AppConstants.accessToken);
  }

  Future<String?> getRefreshToken() async {
    return _authBox.get(AppConstants.refreshToken);
  }

  Future<void> clearAuthTokens() async {
    await _authBox.delete(AppConstants.accessToken);
    await _authBox.delete(AppConstants.refreshToken);
    await _authBox.delete(AppConstants.userDataKey);
  }

  // User data methods
  Future<void> saveUserData(Map<String, dynamic> userData) async {
    await _authBox.put(AppConstants.userDataKey, userData);
  }

  Future<Map<String, dynamic>?> getUserData() async {
    final data = _authBox.get(AppConstants.userDataKey);
    return data != null ? Map<String, dynamic>.from(data) : null;
  }

  // Settings methods
  Future<void> saveSetting(String key, dynamic value) async {
    await _settingsBox.put(key, value);
  }

  Future<T?> getSetting<T>(String key) async {
    return _settingsBox.get(key) as T?;
  }

  // Box management
  Future<Box> getBox(String boxName) async {
    try {
      if (Hive.isBoxOpen(boxName)) {
        return Hive.box(boxName);
      }
      return await Hive.openBox(boxName);
    } catch (e) {
      _loggingService.error('Error getting box $boxName: $e', error: e);
      rethrow;
    }
  }

  // Typed box management for Hive CE models
  Future<Box<T>> getTypedBox<T>(String boxName) async {
    try {
      if (Hive.isBoxOpen(boxName)) {
        return Hive.box<T>(boxName);
      }
      return await Hive.openBox<T>(boxName);
    } catch (e) {
      _loggingService.error('Error getting typed box $boxName: $e', error: e);
      rethrow;
    }
  }

  Future<void> closeBox(String boxName) async {
    try {
      if (Hive.isBoxOpen(boxName)) {
        await Hive.box(boxName).close();
      }
    } catch (e) {
      _loggingService.error('Error closing box $boxName: $e', error: e);
      rethrow;
    }
  }

  Future<void> clearBox(String boxName) async {
    try {
      final box = Hive.box(boxName);
      await box.clear();
    } catch (e) {
      _loggingService.error('Error clearing box $boxName: $e', error: e);
      rethrow;
    }
  }

  Future<void> closeAllBoxes() async {
    try {
      await Hive.close();
    } catch (e) {
      _loggingService.error('Error closing all boxes: $e', error: e);
      rethrow;
    }
  }
}
