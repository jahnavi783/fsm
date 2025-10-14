import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/calendar/domain/entities/calendar_event_entity.dart';
import 'package:fsm/features/calendar/domain/repositories/i_calendar_repository.dart';

@injectable
class GetDailyScheduleUseCase {
  final ICalendarRepository _repository;
  
  GetDailyScheduleUseCase(this._repository);
  
  Future<Either<Failure, List<CalendarEventEntity>>> call(
    GetDailyScheduleParams params,
  ) {
    return _repository.getDailySchedule(
      date: params.date,
      type: params.type,
    );
  }
}

class GetDailyScheduleParams {
  final DateTime date;
  final CalendarEventType? type;
  
  GetDailyScheduleParams({
    required this.date,
    this.type,
  });
}