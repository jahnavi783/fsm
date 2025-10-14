import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/calendar/domain/entities/calendar_event_entity.dart';
import 'package:fsm/features/calendar/domain/repositories/i_calendar_repository.dart';

@injectable
class GetCalendarEventsUseCase {
  final ICalendarRepository _repository;
  
  GetCalendarEventsUseCase(this._repository);
  
  Future<Either<Failure, List<CalendarEventEntity>>> call(
    GetCalendarEventsParams params,
  ) {
    return _repository.getCalendarEvents(
      startDate: params.startDate,
      endDate: params.endDate,
      type: params.type,
      searchQuery: params.searchQuery,
    );
  }
}

class GetCalendarEventsParams {
  final DateTime startDate;
  final DateTime endDate;
  final CalendarEventType? type;
  final String? searchQuery;
  
  GetCalendarEventsParams({
    required this.startDate,
    required this.endDate,
    this.type,
    this.searchQuery,
  });
}