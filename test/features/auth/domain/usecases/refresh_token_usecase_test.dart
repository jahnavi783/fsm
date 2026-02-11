import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:fsm/features/auth/domain/usecases/refresh_token_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  late RefreshTokenUseCase useCase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = RefreshTokenUseCase(mockRepository);
  });

  const tNewAccessToken = 'new_access_token';

  group('RefreshTokenUseCase', () {
    test('should return new access token when refresh is successful', () async {
      // Arrange
      when(() => mockRepository.refreshToken())
          .thenAnswer((_) async => const Right(tNewAccessToken));

      // Act
      final result = await useCase();

      // Assert
      expect(result.isRight, true);
      expect(result.right, tNewAccessToken);
      verify(() => mockRepository.refreshToken()).called(1);
    });

    test('should return Failure when refresh fails', () async {
      // Arrange
      const tFailure = AuthenticationFailure(
        message: 'Session expired. Please log in again.',
      );
      when(() => mockRepository.refreshToken())
          .thenAnswer((_) async => const Left(tFailure));

      // Act
      final result = await useCase();

      // Assert
      expect(result.isLeft, true);
      expect(result.left, tFailure);
    });
  });
}
