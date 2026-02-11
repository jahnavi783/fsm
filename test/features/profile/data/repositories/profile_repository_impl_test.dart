import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:either_dart/either.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/core/network/network_info.dart';
import 'package:fsm/features/profile/data/datasources/profile_local_datasource.dart';
import 'package:fsm/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:fsm/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:fsm/features/auth/data/models/user_dto.dart';
import 'package:fsm/features/profile/data/models/profile_dto.dart';
import 'package:fsm/features/profile/data/models/profile_hive_model.dart';
import 'package:fsm/features/profile/domain/entities/profile_entity.dart';

import 'profile_repository_impl_test.mocks.dart';

@GenerateMocks([ProfileRemoteDataSource, ProfileLocalDataSource, NetworkInfo])
void main() {
  late ProfileRepositoryImpl repository;
  late MockProfileRemoteDataSource mockRemoteDataSource;
  late MockProfileLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockProfileRemoteDataSource();
    mockLocalDataSource = MockProfileLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ProfileRepositoryImpl(
      mockRemoteDataSource,
      mockLocalDataSource,
      mockNetworkInfo,
    );
  });

  final tUserDto = UserDto(
    id: 1,
    firstName: 'John',
    lastName: 'Doe',
    email: 'john.doe@example.com',
  );

  final tProfileHiveModel = ProfileHiveModel(
    id: 1,
    firstName: 'John',
    lastName: 'Doe',
    email: 'john.doe@example.com',
    preferences: const ProfilePreferences().toHiveModel(),
    cachedAt: DateTime(2025),
  );

  group('getProfile', () {
    test('should check if the device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getCurrentUser())
          .thenAnswer((_) async => tUserDto);
      when(mockLocalDataSource.getCachedPreferences())
          .thenAnswer((_) async => null);

      // act
      await repository.getProfile();

      // assert
      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getCurrentUser())
            .thenAnswer((_) async => tUserDto);
        when(mockLocalDataSource.getCachedPreferences())
            .thenAnswer((_) async => null);

        // act
        final result = await repository.getProfile();

        // assert
        verify(mockRemoteDataSource.getCurrentUser());
        expect(result.isRight, true);
        final profile = (result as Right).value as ProfileEntity;
        expect(profile.id, tUserDto.id);
      });

      test(
          'should cache the data locally when the call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getCurrentUser())
            .thenAnswer((_) async => tUserDto);
        when(mockLocalDataSource.getCachedPreferences())
            .thenAnswer((_) async => null);

        // act
        await repository.getProfile();

        // assert
        verify(mockRemoteDataSource.getCurrentUser());
        verify(mockLocalDataSource.cacheProfile(any));
      });
    });

    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test(
          'should return last locally cached data when the cached data is present',
          () async {
        // arrange
        when(mockLocalDataSource.getCachedProfile())
            .thenAnswer((_) async => tProfileHiveModel);

        // act
        final result = await repository.getProfile();

        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getCachedProfile());
        expect(result.isRight, true);
      });

      test('should return CacheFailure when there is no cached data present',
          () async {
        // arrange
        when(mockLocalDataSource.getCachedProfile())
            .thenAnswer((_) async => null);

        // act
        final result = await repository.getProfile();

        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getCachedProfile());
        expect(result.isLeft, true);
      });
    });
  });

  group('updatePreferences', () {
    test('should update local cache immediately', () async {
      // arrange
      const tPrefs = ProfilePreferences(darkModeEnabled: true);
      when(mockLocalDataSource.cachePreferences(any))
          .thenAnswer((_) async => {});
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);

      // act
      await repository.updatePreferences(tPrefs);

      // assert
      verify(mockLocalDataSource.cachePreferences(any));
    });
  });
}
