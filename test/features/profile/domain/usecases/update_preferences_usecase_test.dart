import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:either_dart/either.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/profile/domain/entities/profile_entity.dart';
import 'package:fsm/features/profile/domain/repositories/i_profile_repository.dart';
import 'package:fsm/features/profile/domain/usecases/update_preferences_usecase.dart';

import 'update_preferences_usecase_test.mocks.dart';

@GenerateMocks([IProfileRepository])
void main() {
  late UpdatePreferencesUseCase usecase;
  late MockIProfileRepository mockRepository;

  setUp(() {
    mockRepository = MockIProfileRepository();
    usecase = UpdatePreferencesUseCase(mockRepository);
  });

  setUpAll(() {
    provideDummy<Either<Failure, ProfilePreferences>>(
      const Right(ProfilePreferences()),
    );
  });

  const tPreferences = ProfilePreferences(darkModeEnabled: true);

  test('should update preferences via the repository', () async {
    // arrange
    when(mockRepository.updatePreferences(any))
        .thenAnswer((_) async => const Right(tPreferences));

    // act
    final result = await usecase(tPreferences);

    // assert
    expect(result, const Right(tPreferences));
    verify(mockRepository.updatePreferences(tPreferences));
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return failure when update fails', () async {
    // arrange
    const tFailure = Failure.server(message: 'Preferences Update Failed');
    when(mockRepository.updatePreferences(any))
        .thenAnswer((_) async => const Left(tFailure));

    // act
    final result = await usecase(tPreferences);

    // assert
    expect(result, const Left(tFailure));
    verify(mockRepository.updatePreferences(tPreferences));
    verifyNoMoreInteractions(mockRepository);
  });
}
