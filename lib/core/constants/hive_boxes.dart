abstract class HiveBoxes {
  // Box names
  static const String authBox = 'auth_box';
  static const String workOrdersBox = 'work_orders_box';
  static const String documentsBox = 'documents_box';
  static const String partsBox = 'parts_box';
  static const String calendarBox = 'calendar_box';
  static const String profileBox = 'profile_box';
  static const String settingsBox = 'settings_box';
  
  // Type IDs for Hive adapters
  static const int userEntityTypeId = 0;
  static const int workOrderEntityTypeId = 1;
  static const int documentEntityTypeId = 2;
  static const int partEntityTypeId = 3;
  static const int calendarEventEntityTypeId = 4;
  static const int profileEntityTypeId = 5;
}