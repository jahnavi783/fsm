import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/features/profile/data/api/profile_api_client.dart';
import 'package:fsm/features/auth/data/models/user_dto.dart';
import 'package:fsm/features/profile/data/models/profile_dto.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late ProfileApiClient apiClient;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://api.example.com'));
    dioAdapter = DioAdapter(dio: dio);
    apiClient = ProfileApiClient(dio);
  });

  const tUserDto = UserDto(
    id: 1,
    firstName: 'John',
    lastName: 'Doe',
    email: 'john.doe@example.com',
  );

  const tPreferencesDto = ProfilePreferencesDto(
    language: 'en',
    darkModeEnabled: true,
  );

  group('getCurrentUser', () {
    test('should return UserDto when successful', () async {
      // arrange
      dioAdapter.onGet(
        '/users/me',
        (server) => server.reply(200, tUserDto.toJson()),
      );

      // act
      final result = await apiClient.getCurrentUser();

      // assert
      expect(result, tUserDto);
    });

    test('should throw DioException when unsuccessful', () async {
      // arrange
      dioAdapter.onGet(
        '/users/me',
        (server) => server.reply(404, {'message': 'Not Found'}),
      );

      // act & assert
      expect(() => apiClient.getCurrentUser(), throwsA(isA<DioException>()));
    });
  });

  group('updateProfile', () {
    test('should return updated UserDto when successful', () async {
      // arrange
      final updateData = {'first_name': 'Jane'};
      dioAdapter.onPut(
        '/users/me',
        (server) =>
            server.reply(200, tUserDto.copyWith(firstName: 'Jane').toJson()),
        data: updateData,
      );

      // act
      final result = await apiClient.updateProfile(updateData);

      // assert
      expect(result.firstName, 'Jane');
    });
  });

  group('getPreferences', () {
    test('should return ProfilePreferencesDto when successful', () async {
      // arrange
      dioAdapter.onGet(
        '/users/me/preferences',
        (server) => server.reply(200, tPreferencesDto.toJson()),
      );

      // act
      final result = await apiClient.getPreferences();

      // assert
      expect(result, tPreferencesDto);
    });
  });

  group('updatePreferences', () {
    test('should return updated ProfilePreferencesDto when successful',
        () async {
      // arrange
      dioAdapter.onPut(
        RegExp(r'.*preferences.*'),
        (server) => server.reply(200, tPreferencesDto.toJson()),
      );

      // act
      final result = await apiClient.updatePreferences(tPreferencesDto);

      // assert
      expect(result, tPreferencesDto);
    });
  });

  group('logout', () {
    test('should complete successfully when status is 200', () async {
      // arrange
      dioAdapter.onPost(
        '/auth/logout',
        (server) => server.reply(200, null),
      );

      // act & assert
      await apiClient.logout();
      // If no exception, test passed
    });
  });

  group('deleteAccount', () {
    test('should complete successfully when status is 204', () async {
      // arrange
      dioAdapter.onDelete(
        '/users/me',
        (server) => server.reply(204, null),
      );

      // act & assert
      await apiClient.deleteAccount();
    });
  });
}
