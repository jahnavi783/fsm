import 'package:hive_ce/hive.dart';
import 'package:fsm/features/calendar/data/models/calendar_event_hive_model.dart';
import 'package:fsm/features/profile/data/models/profile_hive_model.dart';
import 'package:fsm/features/work_orders/data/models/work_order_hive_model.dart';
import 'package:fsm/features/parts/data/models/part_hive_model.dart';
import 'package:fsm/features/documents/data/models/document_hive_model.dart';

extension HiveRegistrar on HiveInterface {
  void registerAdapters() {
    registerAdapter(CalendarEventHiveModelAdapter());
    registerAdapter(ProfileHiveModelAdapter());
    registerAdapter(ProfilePreferencesHiveModelAdapter());
    registerAdapter(WorkOrderHiveModelAdapter());
    registerAdapter(PartUsedHiveModelAdapter());
    registerAdapter(CustomerHiveModelAdapter());
    registerAdapter(LocationHiveModelAdapter());
    registerAdapter(ServiceRequestHiveModelAdapter());
    registerAdapter(WorkLogHiveModelAdapter());
    registerAdapter(PartHiveModelAdapter());
    registerAdapter(DocumentHiveModelAdapter());
  }
}
