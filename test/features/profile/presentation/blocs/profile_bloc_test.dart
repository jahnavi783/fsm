import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/profile/domain/entities/profile_entity.dart';
import 'package:fsm/features/profile/domain/usecases/get_preferences_usecase.dart';
import 'package:fsm/features/profile/domain/usecases/get_profile_usecase.dart';
import 'package:fsm/features/profile/domain/usecases/update_preferences_usecase.dart';
import 'package:fsm/features/profile/domain/usecases/update_profile_usecase.dart';
import 'package:fsm/features/profile/presentation/blocs/profile/profile_bloc.dart';
import 'package:fsm/features/profile/presentation/blocs/profile/profile_event.dart';
import 'package:fsm/features/profile/presentation/blocs/profile/profile_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_bloc_test.mock.dart';

@GenerateMocks([
  GetProfileUseCase,
  UpdateProfileUseCase,
  GetPreferencesUseCase,
  UpdatePreferencesUseCase,
])
void main() {
  late ProfileBloc bloc;
  late MockGetProfileUseCase mockGetProfileUseCase;
  late MockUpdateProfileUseCase mockUpdateProfileUseCase;
  late MockGetPreferencesUseCase mockGetPreferencesUseCase;
  late MockUpdatePreferencesUseCase mockUpdatePreferencesUseCase;

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
    provideDummy<Either<Failure, ProfilePreferences>>(
      const Right(ProfilePreferences()),
    );
  });

  setUp(() {
    mockGetProfileUseCase = MockGetProfileUseCase();
    mockUpdateProfileUseCase = MockUpdateProfileUseCase();
    mockGetPreferencesUseCase = MockGetPreferencesUseCase();
    mockUpdatePreferencesUseCase = MockUpdatePreferencesUseCase();

    bloc = ProfileBloc(
      mockGetProfileUseCase,
      mockUpdateProfileUseCase,
      mockGetPreferencesUseCase,
      mockUpdatePreferencesUseCase,
    );
  });

  const tProfile = ProfileEntity(
    id: 1,
    firstName: 'John',
    lastName: 'Doe',
    email: 'john.doe@example.com',
    preferences: ProfilePreferences(),
  );

  const tPreferences = ProfilePreferences(darkModeEnabled: true);

  tearDown(() {
    bloc.close();
  });

  test('initial state should be ProfileState.initial()', () {
    expect(bloc.state, const ProfileState.initial());
  });

  group('LoadProfile', () {
    blocTest<ProfileBloc, ProfileState>(
      'should emit [loading, loaded] when profile is loaded successfully',
      build: () {
        when(mockGetProfileUseCase())
            .thenAnswer((_) async => const Right(tProfile));
        return bloc;
      },
      act: (bloc) => bloc.add(const ProfileEvent.loadProfile()),
      expect: () => [
        const ProfileState.loading(),
        ProfileState.loaded(
          profile: tProfile,
          preferences: tProfile.preferences,
        ),
      ],
      verify: (_) {
        verify(mockGetProfileUseCase());
      },
    );

    blocTest<ProfileBloc, ProfileState>(
      'should emit [loading, error] when loading profile fails',
      build: () {
        when(mockGetProfileUseCase()).thenAnswer(
            (_) async => const Left(Failure.server(message: 'Server Error')));
        return bloc;
      },
      act: (bloc) => bloc.add(const ProfileEvent.loadProfile()),
      expect: () => [
        const ProfileState.loading(),
        const ProfileState.error('Server Error'),
      ],
    );
  });

  group('UpdateProfile', () {
    final tUpdatedProfile = tProfile.copyWith(firstName: 'Jane');

    blocTest<ProfileBloc, ProfileState>(
      'should emit [updating, updated] when profile is updated successfully',
      build: () {
        // Pre-load profile to set _currentProfile
        when(mockGetProfileUseCase())
            .thenAnswer((_) async => const Right(tProfile));
        when(mockUpdateProfileUseCase(any))
            .thenAnswer((_) async => Right(tUpdatedProfile));
        return bloc;
      },
      act: (bloc) async {
        bloc.add(const ProfileEvent.loadProfile());
        // Wait for load to complete
        await Future.delayed(Duration.zero);
        bloc.add(ProfileEvent.updateProfile(tUpdatedProfile));
      },
      skip: 2, // Skip initial and loading/loaded states
      expect: () => [
        const ProfileState.updating(),
        ProfileState.updated(
          profile: tUpdatedProfile,
          preferences: tProfile.preferences,
        ),
      ],
    );

    blocTest<ProfileBloc, ProfileState>(
      'should emit [error] if profile is not loaded',
      build: () => bloc,
      act: (bloc) => bloc.add(ProfileEvent.updateProfile(tUpdatedProfile)),
      expect: () => [
        const ProfileState.error('Profile not loaded'),
      ],
    );

    blocTest<ProfileBloc, ProfileState>(
      'should emit [updating, error] when update fails',
      build: () {
        when(mockGetProfileUseCase())
            .thenAnswer((_) async => const Right(tProfile));
        when(mockUpdateProfileUseCase(any)).thenAnswer(
            (_) async => const Left(Failure.server(message: 'Update Failed')));
        return bloc;
      },
      act: (bloc) async {
        bloc.add(const ProfileEvent.loadProfile());
        await Future.delayed(Duration.zero);
        bloc.add(ProfileEvent.updateProfile(tUpdatedProfile));
      },
      skip: 2,
      expect: () => [
        const ProfileState.updating(),
        const ProfileState.error('Update Failed'),
      ],
    );
  });

  group('LoadPreferences', () {
    blocTest<ProfileBloc, ProfileState>(
      'should emit [loaded] with new preferences when successful',
      build: () {
        when(mockGetProfileUseCase())
            .thenAnswer((_) async => const Right(tProfile));
        when(mockGetPreferencesUseCase())
            .thenAnswer((_) async => const Right(tPreferences));
        return bloc;
      },
      act: (bloc) async {
        bloc.add(const ProfileEvent.loadProfile());
        await Future.delayed(Duration.zero);
        bloc.add(const ProfileEvent.loadPreferences());
      },
      skip: 2,
      expect: () => [
        ProfileState.loaded(
          profile: tProfile,
          preferences: tPreferences,
        ),
      ],
    );

    blocTest<ProfileBloc, ProfileState>(
      'should emit [error] if profile is not loaded',
      build: () => bloc,
      act: (bloc) => bloc.add(const ProfileEvent.loadPreferences()),
      expect: () => [
        const ProfileState.error('Profile not loaded'),
      ],
    );
  });

  group('UpdatePreferences', () {
    blocTest<ProfileBloc, ProfileState>(
      'should emit [updating, preferencesUpdated] when preferences are updated successfully',
      build: () {
        when(mockGetProfileUseCase())
            .thenAnswer((_) async => const Right(tProfile));
        when(mockUpdatePreferencesUseCase(any))
            .thenAnswer((_) async => const Right(tPreferences));
        return bloc;
      },
      act: (bloc) async {
        bloc.add(const ProfileEvent.loadProfile());
        await Future.delayed(Duration.zero);
        bloc.add(const ProfileEvent.updatePreferences(tPreferences));
      },
      skip: 2,
      expect: () => [
        const ProfileState.updating(),
        ProfileState.preferencesUpdated(
          profile: tProfile.copyWith(preferences: tPreferences),
          preferences: tPreferences,
        ),
      ],
    );

    blocTest<ProfileBloc, ProfileState>(
      'should emit [updating, error] when preferences update fails',
      build: () {
        when(mockGetProfileUseCase())
            .thenAnswer((_) async => const Right(tProfile));
        when(mockUpdatePreferencesUseCase(any)).thenAnswer(
            (_) async => const Left(Failure.server(message: 'Update Failed')));
        return bloc;
      },
      act: (bloc) async {
        bloc.add(const ProfileEvent.loadProfile());
        await Future.delayed(Duration.zero);
        bloc.add(const ProfileEvent.updatePreferences(tPreferences));
      },
      skip: 2,
      expect: () => [
        const ProfileState.updating(),
        const ProfileState.error('Update Failed'),
      ],
    );

    blocTest<ProfileBloc, ProfileState>(
      'should emit [error] if profile is not loaded',
      build: () => bloc,
      act: (bloc) =>
          bloc.add(const ProfileEvent.updatePreferences(tPreferences)),
      expect: () => [
        const ProfileState.error('Profile not loaded'),
      ],
    );
  });
}
