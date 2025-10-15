import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';

import '../constants/app_constants.dart';
import '../constants/hive_boxes.dart';
import '../../features/work_orders/data/models/work_order_hive_model.dart';
import '../../features/documents/data/models/document_hive_model.dart';
import '../../features/calendar/data/models/calendar_event_hive_model.dart';
import '../../features/profile/data/models/profile_hive_model.dart';
import '../../features/parts/data/models/part_hive_model.dart' as parts;

@singleton
class HiveService {
  late Box _authBox;
  late Box _settingsBox;

  @factoryMethod
  static Future<HiveService> create() async {
    final service = HiveService._();
    await service._init();
    return service;
  }

  HiveService._();

  Future<void> _init() async {
    // Initialize Hive CE (no initFlutter method needed in Hive CE)
    // Hive CE automatically handles Flutter initialization

    // Register Hive adapters
    _registerAdapters();

    // Open essential boxes
    _authBox = await Hive.openBox(HiveBoxes.authBox);
    _settingsBox = await Hive.openBox(HiveBoxes.settingsBox);

    // Open feature-specific boxes
    await _openFeatureBoxes();
  }

  void _registerAdapters() {
    try {
      // Register Work Order related adapters
      if (!Hive.isAdapterRegistered(HiveBoxes.workOrderEntityTypeId)) {
        Hive.registerAdapter(WorkOrderHiveModelAdapter());
      }
      if (!Hive.isAdapterRegistered(HiveBoxes.partUsedEntityTypeId)) {
        Hive.registerAdapter(PartUsedHiveModelAdapter());
      }
      if (!Hive.isAdapterRegistered(HiveBoxes.customerEntityTypeId)) {
        Hive.registerAdapter(CustomerHiveModelAdapter());
      }
      if (!Hive.isAdapterRegistered(HiveBoxes.locationEntityTypeId)) {
        Hive.registerAdapter(LocationHiveModelAdapter());
      }
      if (!Hive.isAdapterRegistered(HiveBoxes.serviceRequestEntityTypeId)) {
        Hive.registerAdapter(ServiceRequestHiveModelAdapter());
      }
      if (!Hive.isAdapterRegistered(HiveBoxes.workLogEntityTypeId)) {
        Hive.registerAdapter(WorkLogHiveModelAdapter());
      }

      // Register Parts adapter (using alias to avoid conflict)
      if (!Hive.isAdapterRegistered(HiveBoxes.partEntityTypeId)) {
        Hive.registerAdapter(parts.PartHiveModelAdapter());
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
    } catch (e) {
      // Log adapter registration errors but don't crash the app
      print('Error registering Hive adapters: $e');
      rethrow;
    }
  }

  Future<void> _openFeatureBoxes() async {
    try {
      // Open typed boxes for different features
      await Hive.openBox<WorkOrderHiveModel>(HiveBoxes.workOrders);
      await Hive.openBox<DocumentHiveModel>(HiveBoxes.documents);
      await Hive.openBox<parts.PartHiveModel>(HiveBoxes.parts);
      await Hive.openBox(HiveBoxes.inventory); // Generic box for inventory data
      await Hive.openBox<CalendarEventHiveModel>(HiveBoxes.calendarEvents);
      await Hive.openBox(
          HiveBoxes.calendarBox); // Generic box for calendar data
      await Hive.openBox<ProfileHiveModel>(HiveBoxes.profile);
      await Hive.openBox<ProfilePreferencesHiveModel>(
          HiveBoxes.profilePreferences);
    } catch (e) {
      print('Error opening feature boxes: $e');
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
      print('Error getting box $boxName: $e');
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
      print('Error getting typed box $boxName: $e');
      rethrow;
    }
  }

  Future<void> closeBox(String boxName) async {
    try {
      if (Hive.isBoxOpen(boxName)) {
        await Hive.box(boxName).close();
      }
    } catch (e) {
      print('Error closing box $boxName: $e');
      rethrow;
    }
  }

  Future<void> clearBox(String boxName) async {
    try {
      final box = await getBox(boxName);
      await box.clear();
    } catch (e) {
      print('Error clearing box $boxName: $e');
      rethrow;
    }
  }

  Future<void> closeAllBoxes() async {
    try {
      await Hive.close();
    } catch (e) {
      print('Error closing all boxes: $e');
      rethrow;
    }
  }
}
