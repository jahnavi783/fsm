import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fsm/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:fsm/features/profile/data/api/profile_api_client.dart';
import 'package:fsm/features/auth/data/models/user_dto.dart';
import 'package:fsm/features/profile/data/models/profile_dto.dart';

import 'profile_remote_datasource_test.mocks.dart';

@GenerateMocks([ProfileApiClient])
void main() {
  late ProfileRemoteDataSourceImpl dataSource;
  late MockProfileApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockProfileApiClient();
    dataSource = ProfileRemoteDataSourceImpl(mockApiClient);
  });

  final tUserDto = UserDto(
    id: 1,
    firstName: 'John',
    lastName: 'Doe',
    email: 'john.doe@example.com',
  );

  final tPreferencesDto = ProfilePreferencesDto(
    language: 'en',
    darkModeEnabled: false,
  );

  group('getCurrentUser', () {
    test('should call apiClient.getCurrentUser', () async {
      // arrange
      when(mockApiClient.getCurrentUser()).thenAnswer((_) async => tUserDto);

      // act
      final result = await dataSource.getCurrentUser();

      // assert
      expect(result, tUserDto);
      verify(mockApiClient.getCurrentUser());
    });
  });

  group('updateProfile', () {
    test('should call apiClient.updateProfile', () async {
      // arrange
      final profileData = {'first_name': 'John'};
      when(mockApiClient.updateProfile(any)).thenAnswer((_) async => tUserDto);

      // act
      final result = await dataSource.updateProfile(profileData);

      // assert
      expect(result, tUserDto);
      verify(mockApiClient.updateProfile(profileData));
    });
  });

  group('getPreferences', () {
    test('should call apiClient.getPreferences', () async {
      // arrange
      when(mockApiClient.getPreferences())
          .thenAnswer((_) async => tPreferencesDto);

      // act
      final result = await dataSource.getPreferences();

      // assert
      expect(result, tPreferencesDto);
      verify(mockApiClient.getPreferences());
    });
  });

  group('updatePreferences', () {
    test('should call apiClient.updatePreferences', () async {
      // arrange
      when(mockApiClient.updatePreferences(any))
          .thenAnswer((_) async => tPreferencesDto);

      // act
      final result = await dataSource.updatePreferences(tPreferencesDto);

      // assert
      expect(result, tPreferencesDto);
      verify(mockApiClient.updatePreferences(tPreferencesDto));
    });
  });

  group('logout', () {
    test('should call apiClient.logout', () async {
      // arrange
      when(mockApiClient.logout()).thenAnswer((_) async => {});

      // act
      await dataSource.logout();

      // assert
      verify(mockApiClient.logout());
    });
  });

  group('deleteAccount', () {
    test('should call apiClient.deleteAccount', () async {
      // arrange
      when(mockApiClient.deleteAccount()).thenAnswer((_) async => {});

      // act
      await dataSource.deleteAccount();

      // assert
      verify(mockApiClient.deleteAccount());
    });
  });
}
