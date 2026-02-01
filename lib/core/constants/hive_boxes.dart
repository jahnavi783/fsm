abstract class HiveBoxes {
  // Box names
  static const String authBox = 'auth_box';
  static const String workOrders = 'work_orders_box';
  static const String documents = 'documents_box';
  static const String parts = 'parts_box';
  static const String inventory = 'inventory_box';
  static const String calendarEvents = 'calendar_events_box';
  static const String calendarBox = 'calendar_box';
  static const String profile = 'profile_box';
  static const String profilePreferences = 'profile_preferences_box';
  static const String settingsBox = 'settings_box';
  static const String workOrderCompletionCache =
      'work_order_completion_cache_box';
  static const String chatMessages = 'chat_messages_box';
  static const String chatSessions = 'chat_sessions_box';
  static const String workLogs = 'work_logs_box';

  // Type IDs for Hive adapters
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
  static const int profilePreferencesEntityTypeId = 11;
  static const int workOrderPartEntityTypeId = 12;
  static const int workOrderCompletionCacheTypeId = 13;
  static const int cachedPartUsedTypeId = 14;
  static const int chatMessageHiveModelTypeId = 15;
  static const int chatSessionHiveModelTypeId = 16;
}
