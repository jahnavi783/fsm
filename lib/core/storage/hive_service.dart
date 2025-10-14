import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../constants/app_constants.dart';
import '../constants/hive_boxes.dart';
import '../../features/work_orders/data/models/work_order_hive_model.dart'
    as wo;

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
    await Hive.initFlutter();

    // Register Hive adapters
    _registerAdapters();

    // Open essential boxes
    _authBox = await Hive.openBox(HiveBoxes.authBox);
    _settingsBox = await Hive.openBox(HiveBoxes.settingsBox);

    // Open feature-specific boxes
    await _openFeatureBoxes();
  }

  void _registerAdapters() {
    // Only register if not already registered
    if (!Hive.isAdapterRegistered(HiveBoxes.workOrderEntityTypeId)) {
      Hive.registerAdapter(wo.WorkOrderHiveModelAdapter());
    }
    if (!Hive.isAdapterRegistered(HiveBoxes.partUsedEntityTypeId)) {
      Hive.registerAdapter(wo.PartUsedHiveModelAdapter());
    }
    if (!Hive.isAdapterRegistered(HiveBoxes.customerEntityTypeId)) {
      Hive.registerAdapter(wo.CustomerHiveModelAdapter());
    }
    if (!Hive.isAdapterRegistered(HiveBoxes.locationEntityTypeId)) {
      Hive.registerAdapter(wo.LocationHiveModelAdapter());
    }
    if (!Hive.isAdapterRegistered(HiveBoxes.serviceRequestEntityTypeId)) {
      Hive.registerAdapter(wo.ServiceRequestHiveModelAdapter());
    }
    if (!Hive.isAdapterRegistered(HiveBoxes.workLogEntityTypeId)) {
      Hive.registerAdapter(wo.WorkLogHiveModelAdapter());
    }
    if (!Hive.isAdapterRegistered(HiveBoxes.partEntityTypeId)) {
      Hive.registerAdapter(wo.PartHiveModelAdapter());
    }
  }

  Future<void> _openFeatureBoxes() async {
    // Open boxes for different features
    await Hive.openBox<wo.WorkOrderHiveModel>(HiveBoxes.workOrders);
    await Hive.openBox(HiveBoxes.documents);
    await Hive.openBox(HiveBoxes.parts);
    await Hive.openBox(HiveBoxes.inventory);
    await Hive.openBox(HiveBoxes.calendarEvents);
    await Hive.openBox(HiveBoxes.calendarBox);
    await Hive.openBox(HiveBoxes.profile);
    await Hive.openBox(HiveBoxes.profilePreferences);
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
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box(boxName);
    }
    return await Hive.openBox(boxName);
  }

  // Typed box management for WorkOrderHiveModel
  Future<Box<T>> getTypedBox<T>(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box<T>(boxName);
    }
    return await Hive.openBox<T>(boxName);
  }

  Future<void> closeBox(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      await Hive.box(boxName).close();
    }
  }

  Future<void> clearBox(String boxName) async {
    final box = await getBox(boxName);
    await box.clear();
  }

  Future<void> closeAllBoxes() async {
    await Hive.close();
  }
}
