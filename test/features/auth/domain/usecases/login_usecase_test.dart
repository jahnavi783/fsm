import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/auth/domain/entities/user_entity.dart';
import 'package:fsm/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:fsm/features/auth/domain/usecases/login_usecase.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  group('LoginUseCase', () {
    late LoginUseCase useCase;
    late MockAuthRepository mockRepository;

    const testEmail = 'ayush.kumar@global-csg.com';
    const testPassword = '123456';
    const testUser = UserEntity(
      id: 1,
      firstName: 'John',
      lastName: 'Doe',
      email: testEmail,
    );

    setUp(() {
      mockRepository = MockAuthRepository();
      useCase = LoginUseCase(mockRepository);
    });

    test('should return UserEntity when login is successful', () async {
      // Arrange
      when(() => mockRepository.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => const Right(testUser));

      // Act
      final result = await useCase(email: testEmail, password: testPassword);

      // Assert
      expect(result, equals(const Right(testUser)));
      verify(() => mockRepository.login(
            email: testEmail,
            password: testPassword,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return NetworkFailure when there is no internet connection',
        () async {
      // Arrange
      const failure = NetworkFailure(message: 'No internet connection');
      when(() => mockRepository.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(email: testEmail, password: testPassword);

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.login(
            email: testEmail,
            password: testPassword,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return AuthenticationFailure when credentials are invalid',
        () async {
      // Arrange
      const failure = AuthenticationFailure(message: 'Invalid credentials');
      when(() => mockRepository.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(email: testEmail, password: testPassword);

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.login(
            email: testEmail,
            password: testPassword,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return ServerFailure when server returns error', () async {
      // Arrange
      const failure = ServerFailure(
        message: 'Internal server error',
        statusCode: 500,
      );
      when(() => mockRepository.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(email: testEmail, password: testPassword);

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.login(
            email: testEmail,
            password: testPassword,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return ValidationFailure when email format is invalid',
        () async {
      // Arrange
      const failure = ValidationFailure(
        message: 'Invalid email format',
        fieldErrors: {'email': 'Please enter a valid email address'},
      );
      when(() => mockRepository.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => const Left(failure));

      // Act
      final result =
          await useCase(email: 'invalid-email', password: testPassword);

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.login(
            email: 'invalid-email',
            password: testPassword,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle empty email and password', () async {
      // Arrange
      const failure = ValidationFailure(
        message: 'Email and password are required',
        fieldErrors: {
          'email': 'Email is required',
          'password': 'Password is required',
        },
      );
      when(() => mockRepository.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(email: '', password: '');

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.login(
            email: '',
            password: '',
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
