import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:fsm/features/auth/domain/usecases/logout_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  late LogoutUseCase useCase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = LogoutUseCase(mockRepository);
  });

  group('LogoutUseCase', () {
    test('should return success when logout is successful', () async {
      // Arrange
      when(() => mockRepository.logout())
          .thenAnswer((_) async => const Right(null));

      // Act
      final result = await useCase();

      // Assert
      expect(result.isRight, true);
      verify(() => mockRepository.logout()).called(1);
    });

    test('should return Failure when logout fails', () async {
      // Arrange
      const tFailure = UnknownFailure(message: 'Logout failed');
      when(() => mockRepository.logout())
          .thenAnswer((_) async => const Left(tFailure));

      // Act
      final result = await useCase();

      // Assert
      expect(result.isLeft, true);
      expect(result.left, tFailure);
    });
  });
}
