abstract class HiveBoxes {
  // Box names
  static const String authBox = 'auth_box';
  static const String workOrders = 'work_orders_box';
  static const String documents = 'documents_box';
  static const String partsBox = 'parts_box';
  static const String calendarBox = 'calendar_box';
  static const String profileBox = 'profile_box';
  static const String settingsBox = 'settings_box';
  
  // Type IDs for Hive adapters (matching work_order_hive_model.dart)
  static const int userEntityTypeId = 0;
  static const int workOrderEntityTypeId = 1;
  static const int partUsedEntityTypeId = 2;
  static const int customerEntityTypeId = 3;
  static const int locationEntityTypeId = 4;
  static const int serviceRequestEntityTypeId = 5;
  static const int workLogEntityTypeId = 6;
  static const int partEntityTypeId = 7;
  static const int documentEntityTypeId = 8;
  static const int calendarEventEntityTypeId = 9;
  static const int profileEntityTypeId = 10;
}