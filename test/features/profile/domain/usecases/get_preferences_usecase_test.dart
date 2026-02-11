import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:either_dart/either.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/profile/domain/entities/profile_entity.dart';
import 'package:fsm/features/profile/domain/repositories/i_profile_repository.dart';
import 'package:fsm/features/profile/domain/usecases/get_preferences_usecase.dart';

import 'get_preferences_usecase_test.mocks.dart';

@GenerateMocks([IProfileRepository])
void main() {
  late GetPreferencesUseCase usecase;
  late MockIProfileRepository mockRepository;

  setUp(() {
    mockRepository = MockIProfileRepository();
    usecase = GetPreferencesUseCase(mockRepository);
  });

  setUpAll(() {
    provideDummy<Either<Failure, ProfilePreferences>>(
      const Right(ProfilePreferences()),
    );
  });

  const tPreferences = ProfilePreferences();

  test('should get preferences from the repository', () async {
    // arrange
    when(mockRepository.getPreferences())
        .thenAnswer((_) async => const Right(tPreferences));

    // act
    final result = await usecase();

    // assert
    expect(result, const Right(tPreferences));
    verify(mockRepository.getPreferences());
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return failure when getting preferences fails', () async {
    // arrange
    const tFailure = Failure.server(message: 'Preferences Error');
    when(mockRepository.getPreferences())
        .thenAnswer((_) async => const Left(tFailure));

    // act
    final result = await usecase();

    // assert
    expect(result, const Left(tFailure));
    verify(mockRepository.getPreferences());
    verifyNoMoreInteractions(mockRepository);
  });
}
