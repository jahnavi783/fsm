import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:fsm/features/auth/domain/usecases/logout_usecase.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  group('LogoutUseCase', () {
    late LogoutUseCase useCase;
    late MockAuthRepository mockRepository;

    setUp(() {
      mockRepository = MockAuthRepository();
      useCase = LogoutUseCase(mockRepository);
    });

    test('should return success when logout is successful', () async {
      // Arrange
      when(() => mockRepository.logout()).thenAnswer(
        (_) async => const Right(null),
      );

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Right(null)));
      verify(() => mockRepository.logout()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return NetworkFailure when there is no internet connection',
        () async {
      // Arrange
      const failure = NetworkFailure(message: 'No internet connection');
      when(() => mockRepository.logout()).thenAnswer(
        (_) async => const Left(failure),
      );

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.logout()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return ServerFailure when server returns error', () async {
      // Arrange
      const failure = ServerFailure(
        message: 'Internal server error',
        statusCode: 500,
      );
      when(() => mockRepository.logout()).thenAnswer(
        (_) async => const Left(failure),
      );

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.logout()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return UnknownFailure when unexpected error occurs', () async {
      // Arrange
      const failure = UnknownFailure(message: 'Unexpected error occurred');
      when(() => mockRepository.logout()).thenAnswer(
        (_) async => const Left(failure),
      );

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.logout()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return CacheFailure when local data clearing fails', () async {
      // Arrange
      const failure = CacheFailure(message: 'Failed to clear local data');
      when(() => mockRepository.logout()).thenAnswer(
        (_) async => const Left(failure),
      );

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.logout()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
