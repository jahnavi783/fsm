import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/profile/domain/entities/profile_entity.dart';
import 'package:fsm/features/profile/domain/repositories/i_profile_repository.dart';
import 'package:fsm/features/profile/domain/usecases/get_profile_usecase.dart';

class MockProfileRepository extends Mock implements IProfileRepository {}

void main() {
  group('GetProfileUseCase', () {
    late GetProfileUseCase useCase;
    late MockProfileRepository mockRepository;

    const testProfile = ProfileEntity(
      id: 1,
      firstName: 'John',
      lastName: 'Doe',
      email: 'john.doe@example.com',
      phone: '+1234567890',
      role: 'Field Technician',
      city: 'New York',
      dob: '1990-01-15',
      profileImageUrl: 'https://example.com/profile.jpg',
      preferences: ProfilePreferences(
        notificationsEnabled: true,
        pushNotificationsEnabled: true,
        emailNotificationsEnabled: false,
        locationTrackingEnabled: true,
        language: 'en',
        darkModeEnabled: false,
        offlineSyncEnabled: true,
        syncIntervalMinutes: 30,
        autoLogoutEnabled: true,
        autoLogoutMinutes: 60,
      ),
    );

    setUp(() {
      mockRepository = MockProfileRepository();
      useCase = GetProfileUseCase(mockRepository);
    });

    test('should return profile when repository call is successful', () async {
      // Arrange
      when(() => mockRepository.getProfile())
          .thenAnswer((_) async => const Right(testProfile));

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Right(testProfile)));
      verify(() => mockRepository.getProfile()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return NetworkFailure when there is no internet connection',
        () async {
      // Arrange
      const failure = NetworkFailure(message: 'No internet connection');
      when(() => mockRepository.getProfile())
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.getProfile()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return ServerFailure when server returns error', () async {
      // Arrange
      const failure = ServerFailure(
        message: 'Internal server error',
        statusCode: 500,
      );
      when(() => mockRepository.getProfile())
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.getProfile()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return AuthenticationFailure when user is not authenticated',
        () async {
      // Arrange
      const failure = AuthenticationFailure(message: 'User not authenticated');
      when(() => mockRepository.getProfile())
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.getProfile()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return CacheFailure when offline and no cached profile',
        () async {
      // Arrange
      const failure = CacheFailure(message: 'No cached profile available');
      when(() => mockRepository.getProfile())
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.getProfile()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return profile with minimal information', () async {
      // Arrange
      const minimalProfile = ProfileEntity(
        id: 2,
        firstName: 'Jane',
        lastName: 'Smith',
        email: 'jane.smith@example.com',
        preferences: ProfilePreferences(),
      );
      when(() => mockRepository.getProfile())
          .thenAnswer((_) async => const Right(minimalProfile));

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Right(minimalProfile)));
      verify(() => mockRepository.getProfile()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return profile with custom preferences', () async {
      // Arrange
      const customProfile = ProfileEntity(
        id: 3,
        firstName: 'Bob',
        lastName: 'Johnson',
        email: 'bob.johnson@example.com',
        preferences: ProfilePreferences(
          notificationsEnabled: false,
          pushNotificationsEnabled: false,
          emailNotificationsEnabled: true,
          locationTrackingEnabled: false,
          language: 'es',
          darkModeEnabled: true,
          offlineSyncEnabled: false,
          syncIntervalMinutes: 60,
          autoLogoutEnabled: false,
          autoLogoutMinutes: 120,
        ),
      );
      when(() => mockRepository.getProfile())
          .thenAnswer((_) async => const Right(customProfile));

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Right(customProfile)));
      verify(() => mockRepository.getProfile()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle profile with special characters in name', () async {
      // Arrange
      const specialProfile = ProfileEntity(
        id: 4,
        firstName: 'José',
        lastName: 'García-López',
        email: 'jose.garcia@example.com',
        preferences: ProfilePreferences(),
      );
      when(() => mockRepository.getProfile())
          .thenAnswer((_) async => const Right(specialProfile));

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Right(specialProfile)));
      verify(() => mockRepository.getProfile()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle profile with long email address', () async {
      // Arrange
      const longEmailProfile = ProfileEntity(
        id: 5,
        firstName: 'Alexander',
        lastName: 'Williamson',
        email: 'alexander.williamson.very.long.email@company.example.com',
        preferences: ProfilePreferences(),
      );
      when(() => mockRepository.getProfile())
          .thenAnswer((_) async => const Right(longEmailProfile));

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Right(longEmailProfile)));
      verify(() => mockRepository.getProfile()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle profile with all optional fields populated', () async {
      // Arrange
      const completeProfile = ProfileEntity(
        id: 6,
        firstName: 'Sarah',
        lastName: 'Connor',
        email: 'sarah.connor@example.com',
        phone: '+1-555-123-4567',
        role: 'Senior Field Technician',
        city: 'Los Angeles',
        dob: '1985-05-12',
        profileImageUrl: 'https://cdn.example.com/profiles/sarah_connor.jpg',
        preferences: ProfilePreferences(
          notificationsEnabled: true,
          pushNotificationsEnabled: true,
          emailNotificationsEnabled: true,
          locationTrackingEnabled: true,
          language: 'en',
          darkModeEnabled: true,
          offlineSyncEnabled: true,
          syncIntervalMinutes: 15,
          autoLogoutEnabled: true,
          autoLogoutMinutes: 30,
        ),
      );
      when(() => mockRepository.getProfile())
          .thenAnswer((_) async => const Right(completeProfile));

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Right(completeProfile)));
      verify(() => mockRepository.getProfile()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
