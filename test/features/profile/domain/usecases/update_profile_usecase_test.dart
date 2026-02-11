import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:either_dart/either.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/profile/domain/entities/profile_entity.dart';
import 'package:fsm/features/profile/domain/repositories/i_profile_repository.dart';
import 'package:fsm/features/profile/domain/usecases/update_profile_usecase.dart';

import 'update_profile_usecase_test.mocks.dart';

@GenerateMocks([IProfileRepository])
void main() {
  late UpdateProfileUseCase usecase;
  late MockIProfileRepository mockRepository;

  setUp(() {
    mockRepository = MockIProfileRepository();
    usecase = UpdateProfileUseCase(mockRepository);
  });

  setUpAll(() {
    provideDummy<Either<Failure, ProfileEntity>>(
      const Right(ProfileEntity(
        id: 1,
        firstName: 'John',
        lastName: 'Doe',
        email: 'john.doe@example.com',
        preferences: ProfilePreferences(),
      )),
    );
  });

  const tProfile = ProfileEntity(
    id: 1,
    firstName: 'John',
    lastName: 'Doe',
    email: 'john.doe@example.com',
    preferences: ProfilePreferences(),
  );

  test('should update profile via the repository', () async {
    // arrange
    when(mockRepository.updateProfile(any))
        .thenAnswer((_) async => const Right(tProfile));

    // act
    final result = await usecase(tProfile);

    // assert
    expect(result, const Right(tProfile));
    verify(mockRepository.updateProfile(tProfile));
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return failure when update fails', () async {
    // arrange
    const tFailure = Failure.server(message: 'Update Failed');
    when(mockRepository.updateProfile(any))
        .thenAnswer((_) async => const Left(tFailure));

    // act
    final result = await usecase(tProfile);

    // assert
    expect(result, const Left(tFailure));
    verify(mockRepository.updateProfile(tProfile));
    verifyNoMoreInteractions(mockRepository);
  });
}
