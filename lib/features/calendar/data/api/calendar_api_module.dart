import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:fsm/features/calendar/data/api/calendar_api_client.dart';

@module
abstract class CalendarApiModule {
  @lazySingleton
  CalendarApiClient calendarApiClient(Dio dio) => CalendarApiClient(dio);
}