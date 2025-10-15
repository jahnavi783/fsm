import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:fsm/features/auth/domain/usecases/refresh_token_usecase.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  group('RefreshTokenUseCase', () {
    late RefreshTokenUseCase useCase;
    late MockAuthRepository mockRepository;

    const testNewToken = 'new_access_token_123';

    setUp(() {
      mockRepository = MockAuthRepository();
      useCase = RefreshTokenUseCase(mockRepository);
    });

    test('should return new token when refresh is successful', () async {
      // Arrange
      when(() => mockRepository.refreshToken()).thenAnswer(
        (_) async => const Right(testNewToken),
      );

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Right(testNewToken)));
      verify(() => mockRepository.refreshToken()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return NetworkFailure when there is no internet connection',
        () async {
      // Arrange
      const failure = NetworkFailure(message: 'No internet connection');
      when(() => mockRepository.refreshToken()).thenAnswer(
        (_) async => const Left(failure),
      );

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.refreshToken()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return AuthenticationFailure when refresh token is invalid',
        () async {
      // Arrange
      const failure = AuthenticationFailure(
        message: 'Session expired. Please log in again.',
      );
      when(() => mockRepository.refreshToken()).thenAnswer(
        (_) async => const Left(failure),
      );

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.refreshToken()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test(
        'should return AuthenticationFailure when no refresh token is available',
        () async {
      // Arrange
      const failure = AuthenticationFailure(
        message: 'No refresh token available',
      );
      when(() => mockRepository.refreshToken()).thenAnswer(
        (_) async => const Left(failure),
      );

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.refreshToken()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return ServerFailure when server returns error', () async {
      // Arrange
      const failure = ServerFailure(
        message: 'Internal server error',
        statusCode: 500,
      );
      when(() => mockRepository.refreshToken()).thenAnswer(
        (_) async => const Left(failure),
      );

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.refreshToken()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return TimeoutFailure when request times out', () async {
      // Arrange
      const failure = TimeoutFailure(message: 'Request timed out');
      when(() => mockRepository.refreshToken()).thenAnswer(
        (_) async => const Left(failure),
      );

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.refreshToken()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
