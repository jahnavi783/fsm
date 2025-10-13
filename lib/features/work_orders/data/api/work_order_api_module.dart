import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:fsm/features/work_orders/data/api/work_order_api_client.dart';

@module
abstract class WorkOrderApiModule {
  @injectable
  WorkOrderApiClient workOrderApiClient(Dio dio) => WorkOrderApiClient(dio);
}