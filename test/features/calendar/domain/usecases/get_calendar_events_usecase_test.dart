import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/calendar/domain/entities/calendar_event_entity.dart';
import 'package:fsm/features/calendar/domain/repositories/i_calendar_repository.dart';
import 'package:fsm/features/calendar/domain/usecases/get_calendar_events_usecase.dart';

class MockCalendarRepository extends Mock implements ICalendarRepository {}

void main() {
  group('GetCalendarEventsUseCase', () {
    late GetCalendarEventsUseCase useCase;
    late MockCalendarRepository mockRepository;

    final testStartDate = DateTime(2024, 1, 1);
    final testEndDate = DateTime(2024, 1, 31);

    final testEvents = [
      CalendarEventEntity(
        id: 1,
        title: 'Work Order #001',
        startTime: DateTime(2024, 1, 15, 9, 0),
        endTime: DateTime(2024, 1, 15, 11, 0),
        type: CalendarEventType.workOrder,
        description: 'Maintenance work',
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

    setUp(() {
      mockRepository = MockCalendarRepository();
      useCase = GetCalendarEventsUseCase(mockRepository);
    });

    test(
        'should return list of calendar events when repository call is successful',
        () async {
      // Arrange
      when(() => mockRepository.getCalendarEvents(
            startDate: any(named: 'startDate'),
            endDate: any(named: 'endDate'),
            type: any(named: 'type'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => Right(testEvents));

      final params = GetCalendarEventsParams(
        startDate: testStartDate,
        endDate: testEndDate,
      );

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(Right(testEvents)));
      verify(() => mockRepository.getCalendarEvents(
            startDate: testStartDate,
            endDate: testEndDate,
            type: null,
            searchQuery: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return NetworkFailure when there is no internet connection',
        () async {
      // Arrange
      const failure = NetworkFailure(message: 'No internet connection');
      when(() => mockRepository.getCalendarEvents(
            startDate: any(named: 'startDate'),
            endDate: any(named: 'endDate'),
            type: any(named: 'type'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => const Left(failure));

      final params = GetCalendarEventsParams(
        startDate: testStartDate,
        endDate: testEndDate,
      );

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.getCalendarEvents(
            startDate: testStartDate,
            endDate: testEndDate,
            type: null,
            searchQuery: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return ServerFailure when server returns error', () async {
      // Arrange
      const failure = ServerFailure(
        message: 'Internal server error',
        statusCode: 500,
      );
      when(() => mockRepository.getCalendarEvents(
            startDate: any(named: 'startDate'),
            endDate: any(named: 'endDate'),
            type: any(named: 'type'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => const Left(failure));

      final params = GetCalendarEventsParams(
        startDate: testStartDate,
        endDate: testEndDate,
      );

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.getCalendarEvents(
            startDate: testStartDate,
            endDate: testEndDate,
            type: null,
            searchQuery: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return CacheFailure when offline and no cached data',
        () async {
      // Arrange
      const failure = CacheFailure(message: 'No cached events available');
      when(() => mockRepository.getCalendarEvents(
            startDate: any(named: 'startDate'),
            endDate: any(named: 'endDate'),
            type: any(named: 'type'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => const Left(failure));

      final params = GetCalendarEventsParams(
        startDate: testStartDate,
        endDate: testEndDate,
      );

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.getCalendarEvents(
            startDate: testStartDate,
            endDate: testEndDate,
            type: null,
            searchQuery: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle filtering by event type', () async {
      // Arrange
      final workOrderEvents = [testEvents.first];
      when(() => mockRepository.getCalendarEvents(
            startDate: any(named: 'startDate'),
            endDate: any(named: 'endDate'),
            type: any(named: 'type'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => Right(workOrderEvents));

      final params = GetCalendarEventsParams(
        startDate: testStartDate,
        endDate: testEndDate,
        type: CalendarEventType.workOrder,
      );

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(Right(workOrderEvents)));
      verify(() => mockRepository.getCalendarEvents(
            startDate: testStartDate,
            endDate: testEndDate,
            type: CalendarEventType.workOrder,
            searchQuery: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle search query', () async {
      // Arrange
      final searchResults = [testEvents.first];
      when(() => mockRepository.getCalendarEvents(
            startDate: any(named: 'startDate'),
            endDate: any(named: 'endDate'),
            type: any(named: 'type'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => Right(searchResults));

      final params = GetCalendarEventsParams(
        startDate: testStartDate,
        endDate: testEndDate,
        searchQuery: 'work order',
      );

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(Right(searchResults)));
      verify(() => mockRepository.getCalendarEvents(
            startDate: testStartDate,
            endDate: testEndDate,
            type: null,
            searchQuery: 'work order',
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle both type filter and search query', () async {
      // Arrange
      final filteredResults = [testEvents.first];
      when(() => mockRepository.getCalendarEvents(
            startDate: any(named: 'startDate'),
            endDate: any(named: 'endDate'),
            type: any(named: 'type'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => Right(filteredResults));

      final params = GetCalendarEventsParams(
        startDate: testStartDate,
        endDate: testEndDate,
        type: CalendarEventType.workOrder,
        searchQuery: 'maintenance',
      );

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(Right(filteredResults)));
      verify(() => mockRepository.getCalendarEvents(
            startDate: testStartDate,
            endDate: testEndDate,
            type: CalendarEventType.workOrder,
            searchQuery: 'maintenance',
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return empty list when no events found', () async {
      // Arrange
      when(() => mockRepository.getCalendarEvents(
            startDate: any(named: 'startDate'),
            endDate: any(named: 'endDate'),
            type: any(named: 'type'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => const Right([]));

      final params = GetCalendarEventsParams(
        startDate: testStartDate,
        endDate: testEndDate,
      );

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(const Right([])));
      verify(() => mockRepository.getCalendarEvents(
            startDate: testStartDate,
            endDate: testEndDate,
            type: null,
            searchQuery: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle different date ranges', () async {
      // Arrange
      final weekStart = DateTime(2024, 1, 15);
      final weekEnd = DateTime(2024, 1, 21);
      when(() => mockRepository.getCalendarEvents(
            startDate: any(named: 'startDate'),
            endDate: any(named: 'endDate'),
            type: any(named: 'type'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => Right(testEvents));

      final params = GetCalendarEventsParams(
        startDate: weekStart,
        endDate: weekEnd,
      );

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(Right(testEvents)));
      verify(() => mockRepository.getCalendarEvents(
            startDate: weekStart,
            endDate: weekEnd,
            type: null,
            searchQuery: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle single day range', () async {
      // Arrange
      final singleDay = DateTime(2024, 1, 15);
      when(() => mockRepository.getCalendarEvents(
            startDate: any(named: 'startDate'),
            endDate: any(named: 'endDate'),
            type: any(named: 'type'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => Right([testEvents.first]));

      final params = GetCalendarEventsParams(
        startDate: singleDay,
        endDate: singleDay,
      );

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(Right([testEvents.first])));
      verify(() => mockRepository.getCalendarEvents(
            startDate: singleDay,
            endDate: singleDay,
            type: null,
            searchQuery: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
