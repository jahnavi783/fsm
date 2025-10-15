import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/calendar/domain/entities/calendar_event_entity.dart';
import 'package:fsm/features/calendar/domain/repositories/i_calendar_repository.dart';
import 'package:fsm/features/calendar/domain/usecases/get_daily_schedule_usecase.dart';

class MockCalendarRepository extends Mock implements ICalendarRepository {}

void main() {
  group('GetDailyScheduleUseCase', () {
    late GetDailyScheduleUseCase useCase;
    late MockCalendarRepository mockRepository;

    final testDate = DateTime(2024, 1, 15);

    final testDailyEvents = [
      CalendarEventEntity(
        id: 1,
        title: 'Morning Work Order',
        startTime: DateTime(2024, 1, 15, 9, 0),
        endTime: DateTime(2024, 1, 15, 11, 0),
        type: CalendarEventType.workOrder,
        description: 'Equipment maintenance',
        workOrderId: 1,
        location: 'Site A',
      ),
      CalendarEventEntity(
        id: 2,
        title: 'Lunch Break',
        startTime: DateTime(2024, 1, 15, 12, 0),
        endTime: DateTime(2024, 1, 15, 13, 0),
        type: CalendarEventType.breakTime,
        description: 'Lunch break',
        location: 'Office',
      ),
      CalendarEventEntity(
        id: 3,
        title: 'Afternoon Work Order',
        startTime: DateTime(2024, 1, 15, 14, 0),
        endTime: DateTime(2024, 1, 15, 16, 0),
        type: CalendarEventType.workOrder,
        description: 'System inspection',
        workOrderId: 2,
        location: 'Site B',
      ),
    ];

    setUp(() {
      mockRepository = MockCalendarRepository();
      useCase = GetDailyScheduleUseCase(mockRepository);
    });

    test('should return daily schedule when repository call is successful',
        () async {
      // Arrange
      when(() => mockRepository.getDailySchedule(
            date: any(named: 'date'),
            type: any(named: 'type'),
          )).thenAnswer((_) async => Right(testDailyEvents));

      final params = GetDailyScheduleParams(date: testDate);

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(Right(testDailyEvents)));
      verify(() => mockRepository.getDailySchedule(
            date: testDate,
            type: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return NetworkFailure when there is no internet connection',
        () async {
      // Arrange
      const failure = NetworkFailure(message: 'No internet connection');
      when(() => mockRepository.getDailySchedule(
            date: any(named: 'date'),
            type: any(named: 'type'),
          )).thenAnswer((_) async => const Left(failure));

      final params = GetDailyScheduleParams(date: testDate);

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.getDailySchedule(
            date: testDate,
            type: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return ServerFailure when server returns error', () async {
      // Arrange
      const failure = ServerFailure(
        message: 'Internal server error',
        statusCode: 500,
      );
      when(() => mockRepository.getDailySchedule(
            date: any(named: 'date'),
            type: any(named: 'type'),
          )).thenAnswer((_) async => const Left(failure));

      final params = GetDailyScheduleParams(date: testDate);

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.getDailySchedule(
            date: testDate,
            type: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return CacheFailure when offline and no cached data',
        () async {
      // Arrange
      const failure = CacheFailure(message: 'No cached schedule available');
      when(() => mockRepository.getDailySchedule(
            date: any(named: 'date'),
            type: any(named: 'type'),
          )).thenAnswer((_) async => const Left(failure));

      final params = GetDailyScheduleParams(date: testDate);

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.getDailySchedule(
            date: testDate,
            type: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle filtering by event type', () async {
      // Arrange
      final workOrderEvents = testDailyEvents
          .where((event) => event.type == CalendarEventType.workOrder)
          .toList();
      when(() => mockRepository.getDailySchedule(
            date: any(named: 'date'),
            type: any(named: 'type'),
          )).thenAnswer((_) async => Right(workOrderEvents));

      final params = GetDailyScheduleParams(
        date: testDate,
        type: CalendarEventType.workOrder,
      );

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(Right(workOrderEvents)));
      verify(() => mockRepository.getDailySchedule(
            date: testDate,
            type: CalendarEventType.workOrder,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle filtering by meeting type', () async {
      // Arrange
      final meetingEvent = CalendarEventEntity(
        id: 4,
        title: 'Team Meeting',
        startTime: DateTime(2024, 1, 15, 10, 0),
        endTime: DateTime(2024, 1, 15, 11, 0),
        type: CalendarEventType.meeting,
        description: 'Weekly team meeting',
        location: 'Conference Room',
      );
      when(() => mockRepository.getDailySchedule(
            date: any(named: 'date'),
            type: any(named: 'type'),
          )).thenAnswer((_) async => Right([meetingEvent]));

      final params = GetDailyScheduleParams(
        date: testDate,
        type: CalendarEventType.meeting,
      );

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(Right([meetingEvent])));
      verify(() => mockRepository.getDailySchedule(
            date: testDate,
            type: CalendarEventType.meeting,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return empty list when no events scheduled for the day',
        () async {
      // Arrange
      when(() => mockRepository.getDailySchedule(
            date: any(named: 'date'),
            type: any(named: 'type'),
          )).thenAnswer((_) async => const Right([]));

      final params = GetDailyScheduleParams(date: testDate);

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(const Right([])));
      verify(() => mockRepository.getDailySchedule(
            date: testDate,
            type: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle different dates', () async {
      // Arrange
      final differentDate = DateTime(2024, 2, 20);
      when(() => mockRepository.getDailySchedule(
            date: any(named: 'date'),
            type: any(named: 'type'),
          )).thenAnswer((_) async => Right(testDailyEvents));

      final params = GetDailyScheduleParams(date: differentDate);

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(Right(testDailyEvents)));
      verify(() => mockRepository.getDailySchedule(
            date: differentDate,
            type: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle weekend dates', () async {
      // Arrange
      final weekendDate = DateTime(2024, 1, 13); // Saturday
      when(() => mockRepository.getDailySchedule(
            date: any(named: 'date'),
            type: any(named: 'type'),
          )).thenAnswer((_) async => const Right([]));

      final params = GetDailyScheduleParams(date: weekendDate);

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(const Right([])));
      verify(() => mockRepository.getDailySchedule(
            date: weekendDate,
            type: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle past dates', () async {
      // Arrange
      final pastDate = DateTime(2023, 12, 15);
      when(() => mockRepository.getDailySchedule(
            date: any(named: 'date'),
            type: any(named: 'type'),
          )).thenAnswer((_) async => Right(testDailyEvents));

      final params = GetDailyScheduleParams(date: pastDate);

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(Right(testDailyEvents)));
      verify(() => mockRepository.getDailySchedule(
            date: pastDate,
            type: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle future dates', () async {
      // Arrange
      final futureDate = DateTime(2024, 12, 25);
      when(() => mockRepository.getDailySchedule(
            date: any(named: 'date'),
            type: any(named: 'type'),
          )).thenAnswer((_) async => Right(testDailyEvents));

      final params = GetDailyScheduleParams(date: futureDate);

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(Right(testDailyEvents)));
      verify(() => mockRepository.getDailySchedule(
            date: futureDate,
            type: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle training events filter', () async {
      // Arrange
      final trainingEvent = CalendarEventEntity(
        id: 5,
        title: 'Safety Training',
        startTime: DateTime(2024, 1, 15, 8, 0),
        endTime: DateTime(2024, 1, 15, 9, 0),
        type: CalendarEventType.training,
        description: 'Monthly safety training',
        location: 'Training Room',
      );
      when(() => mockRepository.getDailySchedule(
            date: any(named: 'date'),
            type: any(named: 'type'),
          )).thenAnswer((_) async => Right([trainingEvent]));

      final params = GetDailyScheduleParams(
        date: testDate,
        type: CalendarEventType.training,
      );

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(Right([trainingEvent])));
      verify(() => mockRepository.getDailySchedule(
            date: testDate,
            type: CalendarEventType.training,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle maintenance events filter', () async {
      // Arrange
      final maintenanceEvent = CalendarEventEntity(
        id: 6,
        title: 'Equipment Maintenance',
        startTime: DateTime(2024, 1, 15, 17, 0),
        endTime: DateTime(2024, 1, 15, 18, 0),
        type: CalendarEventType.maintenance,
        description: 'Scheduled maintenance',
        location: 'Maintenance Bay',
      );
      when(() => mockRepository.getDailySchedule(
            date: any(named: 'date'),
            type: any(named: 'type'),
          )).thenAnswer((_) async => Right([maintenanceEvent]));

      final params = GetDailyScheduleParams(
        date: testDate,
        type: CalendarEventType.maintenance,
      );

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(Right([maintenanceEvent])));
      verify(() => mockRepository.getDailySchedule(
            date: testDate,
            type: CalendarEventType.maintenance,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
