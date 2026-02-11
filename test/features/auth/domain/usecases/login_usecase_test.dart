import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/auth/domain/entities/user_entity.dart';
import 'package:fsm/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:fsm/features/auth/domain/usecases/login_usecase.dart';
import 'package:mocktail/mocktail.dart';

// Mock class
class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  late LoginUseCase useCase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = LoginUseCase(mockRepository);
  });

  const tEmail = 'test@example.com';
  const tPassword = 'password123';
  const tUser = UserEntity(
    id: 1,
    firstName: 'John',
    lastName: 'Doe',
    email: tEmail,
    accessToken: 'access_token',
    refreshToken: 'refresh_token',
  );

  group('LoginUseCase', () {
    test('should return UserEntity when login is successful', () async {
      // Arrange
      when(() => mockRepository.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => const Right(tUser));

      // Act
      final result = await useCase(email: tEmail, password: tPassword);

      // Assert
      expect(result.isRight, true);
      expect(result.right, tUser);
      verify(() => mockRepository.login(
            email: tEmail,
            password: tPassword,
          )).called(1);
    });

    test('should return Failure when login fails', () async {
      // Arrange
      const tFailure = AuthenticationFailure(message: 'Invalid credentials');
      when(() => mockRepository.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => const Left(tFailure));

      // Act
      final result = await useCase(email: tEmail, password: tPassword);

      // Assert
      expect(result.isLeft, true);
      expect(result.left, tFailure);
    });
  });
}
