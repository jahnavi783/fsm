import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/calendar/domain/entities/calendar_event_entity.dart';
import 'package:fsm/features/calendar/domain/repositories/i_calendar_repository.dart';

@injectable
class OptimizeRouteUseCase {
  final ICalendarRepository _repository;
  
  OptimizeRouteUseCase(this._repository);
  
  Future<Either<Failure, List<CalendarEventEntity>>> call(
    OptimizeRouteParams params,
  ) {
    return _repository.getOptimizedDailyRoute(
      date: params.date,
      currentLatitude: params.currentLatitude,
      currentLongitude: params.currentLongitude,
    );
  }
}

class OptimizeRouteParams {
  final DateTime date;
  final double currentLatitude;
  final double currentLongitude;
  
  OptimizeRouteParams({
    required this.date,
    required this.currentLatitude,
    required this.currentLongitude,
  });
}