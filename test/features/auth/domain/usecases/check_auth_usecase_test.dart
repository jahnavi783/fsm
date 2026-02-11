import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/auth/domain/entities/user_entity.dart';
import 'package:fsm/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:fsm/features/auth/domain/usecases/check_auth_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  late CheckAuthUseCase useCase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = CheckAuthUseCase(mockRepository);
  });

  const tUser = UserEntity(
    id: 1,
    firstName: 'John',
    lastName: 'Doe',
    email: 'test@example.com',
    accessToken: 'access_token',
    refreshToken: 'refresh_token',
  );

  group('CheckAuthUseCase', () {
    test('should return UserEntity when user is authenticated', () async {
      // Arrange
      when(() => mockRepository.checkAuth())
          .thenAnswer((_) async => const Right(tUser));

      // Act
      final result = await useCase();

      // Assert
      expect(result.isRight, true);
      expect(result.right, tUser);
      verify(() => mockRepository.checkAuth()).called(1);
    });

    test('should return null when user is not authenticated', () async {
      // Arrange
      when(() => mockRepository.checkAuth())
          .thenAnswer((_) async => const Right(null));

      // Act
      final result = await useCase();

      // Assert
      expect(result.isRight, true);
      expect(result.right, null);
    });

    test('should return Failure when check fails', () async {
      // Arrange
      const tFailure = CacheFailure(message: 'Cache error');
      when(() => mockRepository.checkAuth())
          .thenAnswer((_) async => const Left(tFailure));

      // Act
      final result = await useCase();

      // Assert
      expect(result.isLeft, true);
      expect(result.left, tFailure);
    });
  });
}
