import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/auth/domain/entities/user_entity.dart';
import 'package:fsm/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:fsm/features/auth/domain/usecases/check_auth_usecase.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  group('CheckAuthUseCase', () {
    late CheckAuthUseCase useCase;
    late MockAuthRepository mockRepository;

    const testUser = UserEntity(
      id: 1,
      firstName: 'John',
      lastName: 'Doe',
      email: 'ayush.kumar@global-csg.com',
    );

    setUp(() {
      mockRepository = MockAuthRepository();
      useCase = CheckAuthUseCase(mockRepository);
    });

    test('should return UserEntity when user is authenticated', () async {
      // Arrange
      when(() => mockRepository.checkAuth()).thenAnswer(
        (_) async => const Right(testUser),
      );

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Right(testUser)));
      verify(() => mockRepository.checkAuth()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return null when user is not authenticated', () async {
      // Arrange
      when(() => mockRepository.checkAuth()).thenAnswer(
        (_) async => const Right(null),
      );

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Right(null)));
      verify(() => mockRepository.checkAuth()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return CacheFailure when local storage fails', () async {
      // Arrange
      const failure = CacheFailure(message: 'Failed to access local storage');
      when(() => mockRepository.checkAuth()).thenAnswer(
        (_) async => const Left(failure),
      );

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.checkAuth()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return AuthenticationFailure when token is invalid', () async {
      // Arrange
      const failure = AuthenticationFailure(message: 'Invalid token');
      when(() => mockRepository.checkAuth()).thenAnswer(
        (_) async => const Left(failure),
      );

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.checkAuth()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return UnknownFailure when unexpected error occurs', () async {
      // Arrange
      const failure = UnknownFailure(message: 'Unexpected error occurred');
      when(() => mockRepository.checkAuth()).thenAnswer(
        (_) async => const Left(failure),
      );

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.checkAuth()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
