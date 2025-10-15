import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fsm/core/error/failures.dart';
import 'package:fsm/core/network/network_info.dart';
import 'package:fsm/features/calendar/domain/entities/calendar_event_entity.dart';
import 'package:fsm/features/calendar/domain/repositories/i_calendar_repository.dart';
import 'package:fsm/features/calendar/domain/usecases/get_calendar_events_usecase.dart';
import 'package:fsm/features/calendar/domain/usecases/get_daily_schedule_usecase.dart';
import 'package:fsm/features/calendar/domain/usecases/optimize_route_usecase.dart';
import 'package:fsm/features/calendar/presentation/blocs/calendar/calendar_bloc.dart';
import 'package:fsm/features/calendar/presentation/blocs/calendar/calendar_event.dart';
import 'package:fsm/features/calendar/presentation/blocs/calendar/calendar_state.dart';

// Mock classes
class MockGetCalendarEventsUseCase extends Mock
    implements GetCalendarEventsUseCase {}

class MockGetDailyScheduleUseCase extends Mock
    implements GetDailyScheduleUseCase {}

class MockOptimizeRouteUseCase extends Mock implements OptimizeRouteUseCase {}

class MockCalendarRepository extends Mock implements ICalendarRepository {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  group('CalendarBloc', () {
    late CalendarBloc calendarBloc;
    late MockGetCalendarEventsUseCase mockGetCalendarEventsUseCase;
    late MockGetDailyScheduleUseCase mockGetDailyScheduleUseCase;
    late MockOptimizeRouteUseCase mockOptimizeRouteUseCase;
    late MockCalendarRepository mockCalendarRepository;
    late MockNetworkInfo mockNetworkInfo;

    // Test data
    final testDate = DateTime(2024, 1, 15);
    final testStartDate = DateTime(2024, 1, 1);
    final testEndDate = DateTime(2024, 1, 31);

    final testEvents = [
      CalendarEventEntity(
        id: 1,
        title: 'Work Order #001',
        startTime: DateTime(2024, 1, 15, 9, 0),
        endTime: DateTime(2024, 1, 15, 11, 0),
        type: CalendarEventType.workOrder,
        description: 'Equipment maintenance',
        workOrderId: 1,
        location: 'Site A',
      ),
      CalendarEventEntity(
        id: 2,
        title: 'Team Meeting',
        startTime: DateTime(2024, 1, 16, 14, 0),
        endTime: DateTime(2024, 1, 16, 15, 0),
        type: CalendarEventType.meeting,
        description: 'Weekly team meeting',
        location: 'Office',
      ),
    ];

    final testOptimizedRoute = [
      CalendarEventEntity(
        id: 1,
        title: 'Optimized Work Order #001',
        startTime: DateTime(2024, 1, 15, 9, 0),
        endTime: DateTime(2024, 1, 15, 11, 0),
        type: CalendarEventType.workOrder,
        description: 'Nearest location first',
        workOrderId: 1,
        location: 'Site A',
      ),
    ];

    const testFailure = NetworkFailure(message: 'Network error');

    setUp(() {
      mockGetCalendarEventsUseCase = MockGetCalendarEventsUseCase();
      mockGetDailyScheduleUseCase = MockGetDailyScheduleUseCase();
      mockOptimizeRouteUseCase = MockOptimizeRouteUseCase();
      mockCalendarRepository = MockCalendarRepository();
      mockNetworkInfo = MockNetworkInfo();

      calendarBloc = CalendarBloc(
        mockGetCalendarEventsUseCase,
        mockGetDailyScheduleUseCase,
        mockOptimizeRouteUseCase,
        mockCalendarRepository,
        mockNetworkInfo,
      );

      // Setup default network info
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockCalendarRepository.getCachedEvents())
          .thenAnswer((_) async => const Right([]));
    });

    tearDown(() {
      calendarBloc.close();
    });

    test('initial state should be CalendarState.initial', () {
      expect(calendarBloc.state, equals(const CalendarState.initial()));
    });

    group('LoadEvents', () {
      blocTest<CalendarBloc, CalendarState>(
        'emits [loading, loaded] when load events succeeds',
        build: () {
          when(() => mockGetCalendarEventsUseCase(any()))
              .thenAnswer((_) async => Right(testEvents));
          return calendarBloc;
        },
        act: (bloc) => bloc.add(CalendarEvent.loadEvents(
          startDate: testStartDate,
          endDate: testEndDate,
        )),
        expect: () => [
          const CalendarState.loading(),
          CalendarState.loaded(
            events: testEvents,
            currentDate: testStartDate,
            viewType: CalendarViewType.month,
          ),
        ],
        verify: (_) {
          verify(() => mockGetCalendarEventsUseCase(any())).called(1);
        },
      );

      blocTest<CalendarBloc, CalendarState>(
        'emits [loading, error] when load events fails',
        build: () {
          when(() => mockGetCalendarEventsUseCase(any()))
              .thenAnswer((_) async => const Left(testFailure));
          return calendarBloc;
        },
        act: (bloc) => bloc.add(CalendarEvent.loadEvents(
          startDate: testStartDate,
          endDate: testEndDate,
        )),
        expect: () => [
          const CalendarState.loading(),
          CalendarState.error(
            failure: testFailure,
            events: const [],
            currentDate: testStartDate,
            viewType: CalendarViewType.month,
            isOffline: false,
          ),
        ],
        verify: (_) {
          verify(() => mockGetCalendarEventsUseCase(any())).called(1);
        },
      );

      blocTest<CalendarBloc, CalendarState>(
        'emits correct state when loading with filters',
        build: () {
          when(() => mockGetCalendarEventsUseCase(any()))
              .thenAnswer((_) async => Right(testEvents));
          return calendarBloc;
        },
        act: (bloc) => bloc.add(CalendarEvent.loadEvents(
          startDate: testStartDate,
          endDate: testEndDate,
          type: CalendarEventType.workOrder,
          searchQuery: 'maintenance',
        )),
        expect: () => [
          const CalendarState.loading(),
          CalendarState.loaded(
            events: testEvents,
            currentDate: testStartDate,
            viewType: CalendarViewType.month,
            typeFilter: CalendarEventType.workOrder,
            searchQuery: 'maintenance',
          ),
        ],
        verify: (_) {
          verify(() => mockGetCalendarEventsUseCase(any())).called(1);
        },
      );
    });

    group('LoadDailySchedule', () {
      blocTest<CalendarBloc, CalendarState>(
        'emits [loading, loaded] when load daily schedule succeeds',
        build: () {
          when(() => mockGetDailyScheduleUseCase(any()))
              .thenAnswer((_) async => Right(testEvents));
          return calendarBloc;
        },
        act: (bloc) => bloc.add(CalendarEvent.loadDailySchedule(
          date: testDate,
        )),
        expect: () => [
          const CalendarState.loading(),
          CalendarState.loaded(
            events: testEvents,
            currentDate: testDate,
            viewType: CalendarViewType.day,
          ),
        ],
        verify: (_) {
          verify(() => mockGetDailyScheduleUseCase(any())).called(1);
        },
      );

      blocTest<CalendarBloc, CalendarState>(
        'emits [loading, error] when load daily schedule fails',
        build: () {
          when(() => mockGetDailyScheduleUseCase(any()))
              .thenAnswer((_) async => const Left(testFailure));
          return calendarBloc;
        },
        act: (bloc) => bloc.add(CalendarEvent.loadDailySchedule(
          date: testDate,
        )),
        expect: () => [
          const CalendarState.loading(),
          CalendarState.error(
            failure: testFailure,
            events: const [],
            currentDate: testDate,
            viewType: CalendarViewType.day,
            isOffline: false,
          ),
        ],
        verify: (_) {
          verify(() => mockGetDailyScheduleUseCase(any())).called(1);
        },
      );
    });

    group('OptimizeRoute', () {
      const testLatitude = 40.7128;
      const testLongitude = -74.0060;

      blocTest<CalendarBloc, CalendarState>(
        'emits [routeOptimized] when optimize route succeeds',
        build: () {
          when(() => mockOptimizeRouteUseCase(any()))
              .thenAnswer((_) async => Right(testOptimizedRoute));
          return calendarBloc;
        },
        act: (bloc) => bloc.add(CalendarEvent.optimizeRoute(
          date: testDate,
          currentLatitude: testLatitude,
          currentLongitude: testLongitude,
        )),
        expect: () => [
          CalendarState.routeOptimized(
            optimizedRoute: testOptimizedRoute,
            events: const [],
            currentDate: testDate,
            viewType: CalendarViewType.day,
          ),
        ],
        verify: (_) {
          verify(() => mockOptimizeRouteUseCase(any())).called(1);
        },
      );

      blocTest<CalendarBloc, CalendarState>(
        'emits [error] when optimize route fails',
        build: () {
          when(() => mockOptimizeRouteUseCase(any()))
              .thenAnswer((_) async => const Left(testFailure));
          return calendarBloc;
        },
        act: (bloc) => bloc.add(CalendarEvent.optimizeRoute(
          date: testDate,
          currentLatitude: testLatitude,
          currentLongitude: testLongitude,
        )),
        expect: () => [
          CalendarState.error(
            failure: testFailure,
            events: const [],
            currentDate: testDate,
            viewType: CalendarViewType.day,
          ),
        ],
        verify: (_) {
          verify(() => mockOptimizeRouteUseCase(any())).called(1);
        },
      );
    });

    group('CreateEvent', () {
      final newEvent = CalendarEventEntity(
        id: 3,
        title: 'New Event',
        startTime: DateTime(2024, 1, 17, 10, 0),
        endTime: DateTime(2024, 1, 17, 11, 0),
        type: CalendarEventType.meeting,
        description: 'New meeting',
        location: 'Conference Room',
      );

      blocTest<CalendarBloc, CalendarState>(
        'emits [eventCreated] when create event succeeds',
        build: () {
          when(() => mockCalendarRepository.createEvent(
                  event: any(named: 'event')))
              .thenAnswer((_) async => Right(newEvent));
          return calendarBloc;
        },
        seed: () => CalendarState.loaded(
          events: testEvents,
          currentDate: testDate,
          viewType: CalendarViewType.day,
        ),
        act: (bloc) => bloc.add(CalendarEvent.createEvent(newEvent)),
        expect: () => [
          CalendarState.eventCreated(
            event: newEvent,
            events: [...testEvents, newEvent],
            currentDate: newEvent.startTime,
            viewType: CalendarViewType.day,
          ),
        ],
        verify: (_) {
          verify(() => mockCalendarRepository.createEvent(event: newEvent))
              .called(1);
        },
      );

      blocTest<CalendarBloc, CalendarState>(
        'emits [error] when create event fails',
        build: () {
          when(() => mockCalendarRepository.createEvent(
                  event: any(named: 'event')))
              .thenAnswer((_) async => const Left(testFailure));
          return calendarBloc;
        },
        seed: () => CalendarState.loaded(
          events: testEvents,
          currentDate: testDate,
          viewType: CalendarViewType.day,
        ),
        act: (bloc) => bloc.add(CalendarEvent.createEvent(newEvent)),
        expect: () => [
          CalendarState.error(
            failure: testFailure,
            events: testEvents,
            currentDate: newEvent.startTime,
            viewType: CalendarViewType.day,
          ),
        ],
        verify: (_) {
          verify(() => mockCalendarRepository.createEvent(event: newEvent))
              .called(1);
        },
      );
    });

    group('UpdateEvent', () {
      final updatedEvent = testEvents.first.copyWith(
        title: 'Updated Work Order #001',
        description: 'Updated description',
      );

      blocTest<CalendarBloc, CalendarState>(
        'emits [eventUpdated] when update event succeeds',
        build: () {
          when(() => mockCalendarRepository.updateEvent(
                  event: any(named: 'event')))
              .thenAnswer((_) async => Right(updatedEvent));
          return calendarBloc;
        },
        seed: () => CalendarState.loaded(
          events: testEvents,
          currentDate: testDate,
          viewType: CalendarViewType.day,
        ),
        act: (bloc) => bloc.add(CalendarEvent.updateEvent(updatedEvent)),
        expect: () => [
          CalendarState.eventUpdated(
            event: updatedEvent,
            events: [updatedEvent, testEvents.last],
            currentDate: updatedEvent.startTime,
            viewType: CalendarViewType.day,
          ),
        ],
        verify: (_) {
          verify(() => mockCalendarRepository.updateEvent(event: updatedEvent))
              .called(1);
        },
      );
    });

    group('DeleteEvent', () {
      const eventIdToDelete = 1;

      blocTest<CalendarBloc, CalendarState>(
        'emits [eventDeleted] when delete event succeeds',
        build: () {
          when(() => mockCalendarRepository.deleteEvent(
                  eventId: any(named: 'eventId')))
              .thenAnswer((_) async => const Right(null));
          return calendarBloc;
        },
        seed: () => CalendarState.loaded(
          events: testEvents,
          currentDate: testDate,
          viewType: CalendarViewType.day,
        ),
        act: (bloc) =>
            bloc.add(const CalendarEvent.deleteEvent(eventIdToDelete)),
        expect: () => [
          CalendarState.eventDeleted(
            eventId: eventIdToDelete,
            events: [testEvents.last], // Only second event remains
            currentDate: DateTime.now().copyWith(
              year: DateTime.now().year,
              month: DateTime.now().month,
              day: DateTime.now().day,
              hour: 0,
              minute: 0,
              second: 0,
              millisecond: 0,
              microsecond: 0,
            ),
            viewType: CalendarViewType.day,
          ),
        ],
        verify: (_) {
          verify(() =>
                  mockCalendarRepository.deleteEvent(eventId: eventIdToDelete))
              .called(1);
        },
      );
    });

    group('ChangeView', () {
      blocTest<CalendarBloc, CalendarState>(
        'triggers appropriate load event when changing to day view',
        build: () {
          when(() => mockGetDailyScheduleUseCase(any()))
              .thenAnswer((_) async => Right(testEvents));
          return calendarBloc;
        },
        seed: () => CalendarState.loaded(
          events: testEvents,
          currentDate: testDate,
          viewType: CalendarViewType.month,
        ),
        act: (bloc) =>
            bloc.add(const CalendarEvent.changeView(CalendarViewType.day)),
        expect: () => [
          const CalendarState.loading(),
          CalendarState.loaded(
            events: testEvents,
            currentDate: testDate,
            viewType: CalendarViewType.day,
          ),
        ],
        verify: (_) {
          verify(() => mockGetDailyScheduleUseCase(any())).called(1);
        },
      );
    });

    group('SyncPendingChanges', () {
      blocTest<CalendarBloc, CalendarState>(
        'emits [syncing] then triggers refresh when sync succeeds',
        build: () {
          when(() => mockCalendarRepository.syncPendingChanges())
              .thenAnswer((_) async => Right(testEvents));
          when(() => mockCalendarRepository.getMonthlySchedule(
                  month: any(named: 'month')))
              .thenAnswer((_) async => Right(testEvents));
          return calendarBloc;
        },
        seed: () => CalendarState.loaded(
          events: testEvents,
          currentDate: testDate,
          viewType: CalendarViewType.month,
        ),
        act: (bloc) => bloc.add(const CalendarEvent.syncPendingChanges()),
        expect: () => [
          CalendarState.syncing(
            events: testEvents,
            currentDate: testDate,
            viewType: CalendarViewType.month,
          ),
          const CalendarState.loading(),
          CalendarState.loaded(
            events: testEvents,
            currentDate: testDate,
            viewType: CalendarViewType.month,
          ),
        ],
        verify: (_) {
          verify(() => mockCalendarRepository.syncPendingChanges()).called(1);
        },
      );
    });

    group('CheckConflicts', () {
      final conflictingEvents = [testEvents.first];
      final conflictStartTime = DateTime(2024, 1, 15, 9, 30);
      final conflictEndTime = DateTime(2024, 1, 15, 10, 30);

      blocTest<CalendarBloc, CalendarState>(
        'emits [conflictsFound] when conflicts are detected',
        build: () {
          when(() => mockCalendarRepository.getConflictingEvents(
                startTime: any(named: 'startTime'),
                endTime: any(named: 'endTime'),
                excludeEventId: any(named: 'excludeEventId'),
              )).thenAnswer((_) async => Right(conflictingEvents));
          return calendarBloc;
        },
        seed: () => CalendarState.loaded(
          events: testEvents,
          currentDate: testDate,
          viewType: CalendarViewType.day,
        ),
        act: (bloc) => bloc.add(CalendarEvent.checkConflicts(
          startTime: conflictStartTime,
          endTime: conflictEndTime,
        )),
        expect: () => [
          CalendarState.conflictsFound(
            conflictingEvents: conflictingEvents,
            events: testEvents,
            currentDate: conflictStartTime,
            viewType: CalendarViewType.day,
          ),
        ],
        verify: (_) {
          verify(() => mockCalendarRepository.getConflictingEvents(
                startTime: conflictStartTime,
                endTime: conflictEndTime,
                excludeEventId: null,
              )).called(1);
        },
      );
    });

    group('Offline scenarios', () {
      blocTest<CalendarBloc, CalendarState>(
        'sets isOffline flag when network is unavailable',
        build: () {
          when(() => mockNetworkInfo.isConnected)
              .thenAnswer((_) async => false);
          when(() => mockGetCalendarEventsUseCase(any()))
              .thenAnswer((_) async => Right(testEvents));
          return calendarBloc;
        },
        act: (bloc) => bloc.add(CalendarEvent.loadEvents(
          startDate: testStartDate,
          endDate: testEndDate,
        )),
        expect: () => [
          const CalendarState.loading(),
          CalendarState.loaded(
            events: testEvents,
            currentDate: testStartDate,
            viewType: CalendarViewType.month,
            isOffline: true,
          ),
        ],
        verify: (_) {
          verify(() => mockNetworkInfo.isConnected).called(1);
        },
      );
    });
  });
}
