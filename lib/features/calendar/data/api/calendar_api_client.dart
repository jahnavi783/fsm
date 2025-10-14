import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:fsm/features/calendar/data/models/calendar_event_dto.dart';

part 'calendar_api_client.g.dart';

@RestApi()
abstract class CalendarApiClient {
  factory CalendarApiClient(Dio dio, {String? baseUrl}) = _CalendarApiClient;

  @GET('/calendar/events')
  Future<List<CalendarEventDto>> getCalendarEvents({
    @Query('start_date') required String startDate,
    @Query('end_date') required String endDate,
    @Query('type') String? type,
    @Query('search') String? searchQuery,
  });

  @GET('/calendar/events/daily')
  Future<List<CalendarEventDto>> getDailySchedule({
    @Query('date') required String date,
    @Query('type') String? type,
  });

  @GET('/calendar/events/weekly')
  Future<List<CalendarEventDto>> getWeeklySchedule({
    @Query('week_start') required String weekStart,
  });

  @GET('/calendar/events/monthly')
  Future<List<CalendarEventDto>> getMonthlySchedule({
    @Query('month') required String month,
  });

  @GET('/calendar/events/optimize-route')
  Future<List<CalendarEventDto>> getOptimizedDailyRoute({
    @Query('date') required String date,
    @Query('latitude') required double latitude,
    @Query('longitude') required double longitude,
  });

  @POST('/calendar/events')
  Future<CalendarEventDto> createEvent({
    @Body() required CalendarEventDto event,
  });

  @PUT('/calendar/events/{id}')
  Future<CalendarEventDto> updateEvent({
    @Path('id') required int id,
    @Body() required CalendarEventDto event,
  });

  @DELETE('/calendar/events/{id}')
  Future<void> deleteEvent({
    @Path('id') required int id,
  });

  @GET('/calendar/events/conflicts')
  Future<List<CalendarEventDto>> getConflictingEvents({
    @Query('start_time') required String startTime,
    @Query('end_time') required String endTime,
    @Query('exclude_event_id') int? excludeEventId,
  });
}
