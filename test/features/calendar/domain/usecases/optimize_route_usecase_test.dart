import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/calendar/domain/entities/calendar_event_entity.dart';
import 'package:fsm/features/calendar/domain/repositories/i_calendar_repository.dart';
import 'package:fsm/features/calendar/domain/usecases/optimize_route_usecase.dart';

class MockCalendarRepository extends Mock implements ICalendarRepository {}

void main() {
  group('OptimizeRouteUseCase', () {
    late OptimizeRouteUseCase useCase;
    late MockCalendarRepository mockRepository;

    final testDate = DateTime(2024, 1, 15);
    const testLatitude = 40.7128;
    const testLongitude = -74.0060;

    final testOptimizedRoute = [
      CalendarEventEntity(
        id: 1,
        title: 'Work Order #001 - Closest',
        startTime: DateTime(2024, 1, 15, 9, 0),
        endTime: DateTime(2024, 1, 15, 11, 0),
        type: CalendarEventType.workOrder,
        description: 'Nearest location maintenance',
        workOrderId: 1,
        location: 'Site A - 123 Main St',
      ),
      CalendarEventEntity(
        id: 2,
        title: 'Work Order #002 - Second',
        startTime: DateTime(2024, 1, 15, 11, 30),
        endTime: DateTime(2024, 1, 15, 13, 30),
        type: CalendarEventType.workOrder,
        description: 'Second closest location',
        workOrderId: 2,
        location: 'Site B - 456 Oak Ave',
      ),
      CalendarEventEntity(
        id: 3,
        title: 'Work Order #003 - Farthest',
        startTime: DateTime(2024, 1, 15, 14, 0),
        endTime: DateTime(2024, 1, 15, 16, 0),
        type: CalendarEventType.workOrder,
        description: 'Farthest location maintenance',
        workOrderId: 3,
        location: 'Site C - 789 Pine Rd',
      ),
    ];

    setUp(() {
      mockRepository = MockCalendarRepository();
      useCase = OptimizeRouteUseCase(mockRepository);
    });

    test('should return optimized route when repository call is successful',
        () async {
      // Arrange
      when(() => mockRepository.getOptimizedDailyRoute(
            date: any(named: 'date'),
            currentLatitude: any(named: 'currentLatitude'),
            currentLongitude: any(named: 'currentLongitude'),
          )).thenAnswer((_) async => Right(testOptimizedRoute));

      final params = OptimizeRouteParams(
        date: testDate,
        currentLatitude: testLatitude,
        currentLongitude: testLongitude,
      );

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(Right(testOptimizedRoute)));
      verify(() => mockRepository.getOptimizedDailyRoute(
            date: testDate,
            currentLatitude: testLatitude,
            currentLongitude: testLongitude,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return NetworkFailure when there is no internet connection',
        () async {
      // Arrange
      const failure = NetworkFailure(message: 'No internet connection');
      when(() => mockRepository.getOptimizedDailyRoute(
            date: any(named: 'date'),
            currentLatitude: any(named: 'currentLatitude'),
            currentLongitude: any(named: 'currentLongitude'),
          )).thenAnswer((_) async => const Left(failure));

      final params = OptimizeRouteParams(
        date: testDate,
        currentLatitude: testLatitude,
        currentLongitude: testLongitude,
      );

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.getOptimizedDailyRoute(
            date: testDate,
            currentLatitude: testLatitude,
            currentLongitude: testLongitude,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return ServerFailure when server returns error', () async {
      // Arrange
      const failure = ServerFailure(
        message: 'Route optimization service unavailable',
        statusCode: 503,
      );
      when(() => mockRepository.getOptimizedDailyRoute(
            date: any(named: 'date'),
            currentLatitude: any(named: 'currentLatitude'),
            currentLongitude: any(named: 'currentLongitude'),
          )).thenAnswer((_) async => const Left(failure));

      final params = OptimizeRouteParams(
        date: testDate,
        currentLatitude: testLatitude,
        currentLongitude: testLongitude,
      );

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.getOptimizedDailyRoute(
            date: testDate,
            currentLatitude: testLatitude,
            currentLongitude: testLongitude,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return LocationFailure when GPS coordinates are invalid',
        () async {
      // Arrange
      const failure = LocationFailure(message: 'Invalid GPS coordinates');
      when(() => mockRepository.getOptimizedDailyRoute(
            date: any(named: 'date'),
            currentLatitude: any(named: 'currentLatitude'),
            currentLongitude: any(named: 'currentLongitude'),
          )).thenAnswer((_) async => const Left(failure));

      final params = OptimizeRouteParams(
        date: testDate,
        currentLatitude: 999.0, // Invalid latitude
        currentLongitude: testLongitude,
      );

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.getOptimizedDailyRoute(
            date: testDate,
            currentLatitude: 999.0,
            currentLongitude: testLongitude,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return empty list when no work orders for the day', () async {
      // Arrange
      when(() => mockRepository.getOptimizedDailyRoute(
            date: any(named: 'date'),
            currentLatitude: any(named: 'currentLatitude'),
            currentLongitude: any(named: 'currentLongitude'),
          )).thenAnswer((_) async => const Right([]));

      final params = OptimizeRouteParams(
        date: testDate,
        currentLatitude: testLatitude,
        currentLongitude: testLongitude,
      );

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(const Right([])));
      verify(() => mockRepository.getOptimizedDailyRoute(
            date: testDate,
            currentLatitude: testLatitude,
            currentLongitude: testLongitude,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle different GPS coordinates', () async {
      // Arrange
      const differentLatitude = 34.0522;
      const differentLongitude = -118.2437;
      when(() => mockRepository.getOptimizedDailyRoute(
            date: any(named: 'date'),
            currentLatitude: any(named: 'currentLatitude'),
            currentLongitude: any(named: 'currentLongitude'),
          )).thenAnswer((_) async => Right(testOptimizedRoute));

      final params = OptimizeRouteParams(
        date: testDate,
        currentLatitude: differentLatitude,
        currentLongitude: differentLongitude,
      );

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(Right(testOptimizedRoute)));
      verify(() => mockRepository.getOptimizedDailyRoute(
            date: testDate,
            currentLatitude: differentLatitude,
            currentLongitude: differentLongitude,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle different dates', () async {
      // Arrange
      final differentDate = DateTime(2024, 2, 20);
      when(() => mockRepository.getOptimizedDailyRoute(
            date: any(named: 'date'),
            currentLatitude: any(named: 'currentLatitude'),
            currentLongitude: any(named: 'currentLongitude'),
          )).thenAnswer((_) async => Right(testOptimizedRoute));

      final params = OptimizeRouteParams(
        date: differentDate,
        currentLatitude: testLatitude,
        currentLongitude: testLongitude,
      );

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(Right(testOptimizedRoute)));
      verify(() => mockRepository.getOptimizedDailyRoute(
            date: differentDate,
            currentLatitude: testLatitude,
            currentLongitude: testLongitude,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle single work order', () async {
      // Arrange
      final singleWorkOrder = [testOptimizedRoute.first];
      when(() => mockRepository.getOptimizedDailyRoute(
            date: any(named: 'date'),
            currentLatitude: any(named: 'currentLatitude'),
            currentLongitude: any(named: 'currentLongitude'),
          )).thenAnswer((_) async => Right(singleWorkOrder));

      final params = OptimizeRouteParams(
        date: testDate,
        currentLatitude: testLatitude,
        currentLongitude: testLongitude,
      );

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(Right(singleWorkOrder)));
      verify(() => mockRepository.getOptimizedDailyRoute(
            date: testDate,
            currentLatitude: testLatitude,
            currentLongitude: testLongitude,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle edge case coordinates (equator and prime meridian)',
        () async {
      // Arrange
      const equatorLatitude = 0.0;
      const primeMeridianLongitude = 0.0;
      when(() => mockRepository.getOptimizedDailyRoute(
            date: any(named: 'date'),
            currentLatitude: any(named: 'currentLatitude'),
            currentLongitude: any(named: 'currentLongitude'),
          )).thenAnswer((_) async => Right(testOptimizedRoute));

      final params = OptimizeRouteParams(
        date: testDate,
        currentLatitude: equatorLatitude,
        currentLongitude: primeMeridianLongitude,
      );

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(Right(testOptimizedRoute)));
      verify(() => mockRepository.getOptimizedDailyRoute(
            date: testDate,
            currentLatitude: equatorLatitude,
            currentLongitude: primeMeridianLongitude,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle negative coordinates', () async {
      // Arrange
      const negativeLatitude = -33.8688;
      const negativeLongitude = -151.2093;
      when(() => mockRepository.getOptimizedDailyRoute(
            date: any(named: 'date'),
            currentLatitude: any(named: 'currentLatitude'),
            currentLongitude: any(named: 'currentLongitude'),
          )).thenAnswer((_) async => Right(testOptimizedRoute));

      final params = OptimizeRouteParams(
        date: testDate,
        currentLatitude: negativeLatitude,
        currentLongitude: negativeLongitude,
      );

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(Right(testOptimizedRoute)));
      verify(() => mockRepository.getOptimizedDailyRoute(
            date: testDate,
            currentLatitude: negativeLatitude,
            currentLongitude: negativeLongitude,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle CacheFailure when offline and no cached route',
        () async {
      // Arrange
      const failure = CacheFailure(message: 'No cached route available');
      when(() => mockRepository.getOptimizedDailyRoute(
            date: any(named: 'date'),
            currentLatitude: any(named: 'currentLatitude'),
            currentLongitude: any(named: 'currentLongitude'),
          )).thenAnswer((_) async => const Left(failure));

      final params = OptimizeRouteParams(
        date: testDate,
        currentLatitude: testLatitude,
        currentLongitude: testLongitude,
      );

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.getOptimizedDailyRoute(
            date: testDate,
            currentLatitude: testLatitude,
            currentLongitude: testLongitude,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
