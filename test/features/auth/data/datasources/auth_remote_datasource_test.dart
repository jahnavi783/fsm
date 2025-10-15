import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fsm/features/auth/data/api/auth_api_client.dart';
import 'package:fsm/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:fsm/features/auth/data/models/login_request.dart';
import 'package:fsm/features/auth/data/models/login_response.dart';
import 'package:fsm/features/auth/data/models/refresh_token_response.dart';
import 'package:fsm/features/auth/data/models/user_dto.dart';

class MockAuthApiClient extends Mock implements AuthApiClient {}

void main() {
  group('AuthRemoteDataSourceImpl', () {
    late AuthRemoteDataSourceImpl dataSource;
    late MockAuthApiClient mockApiClient;

    const testEmail = 'test@example.com';
    const testPassword = 'password123';
    const testRefreshToken = 'refresh_token_123';
    const testAccessToken = 'access_token_123';
    const testNewAccessToken = 'new_access_token_123';

    const testLoginRequest = LoginRequest(
      email: testEmail,
      password: testPassword,
    );

    const testUserDto = UserDto(
      id: 1,
      firstName: 'John',
      lastName: 'Doe',
      email: testEmail,
    );

    const testLoginResponse = LoginResponse(
      message: 'Login successful',
      accessToken: testAccessToken,
      refreshToken: testRefreshToken,
      user: testUserDto,
    );

    const testRefreshTokenResponse = RefreshTokenResponse(
      accessToken: testNewAccessToken,
      refreshToken: testRefreshToken,
    );

    setUp(() {
      mockApiClient = MockAuthApiClient();
      dataSource = AuthRemoteDataSourceImpl(mockApiClient);
    });

    group('login', () {
      test('should return LoginResponse when API call is successful', () async {
        // Arrange
        when(() => mockApiClient.login(any())).thenAnswer(
          (_) async => testLoginResponse,
        );

        // Act
        final result = await dataSource.login(testLoginRequest);

        // Assert
        expect(result, equals(testLoginResponse));
        verify(() => mockApiClient.login(testLoginRequest)).called(1);
        verifyNoMoreInteractions(mockApiClient);
      });

      test('should throw exception when API call fails', () async {
        // Arrange
        when(() => mockApiClient.login(any())).thenThrow(
          Exception('API call failed'),
        );

        // Act & Assert
        expect(
          () => dataSource.login(testLoginRequest),
          throwsA(isA<Exception>()),
        );
        verify(() => mockApiClient.login(testLoginRequest)).called(1);
        verifyNoMoreInteractions(mockApiClient);
      });
    });

    group('refreshToken', () {
      test('should return RefreshTokenResponse when API call is successful',
          () async {
        // Arrange
        when(() => mockApiClient.refreshToken(any())).thenAnswer(
          (_) async => testRefreshTokenResponse,
        );

        // Act
        final result = await dataSource.refreshToken(testRefreshToken);

        // Assert
        expect(result, equals(testRefreshTokenResponse));
        verify(() => mockApiClient.refreshToken({
              'refresh_token': testRefreshToken,
            })).called(1);
        verifyNoMoreInteractions(mockApiClient);
      });

      test('should throw exception when API call fails', () async {
        // Arrange
        when(() => mockApiClient.refreshToken(any())).thenThrow(
          Exception('API call failed'),
        );

        // Act & Assert
        expect(
          () => dataSource.refreshToken(testRefreshToken),
          throwsA(isA<Exception>()),
        );
        verify(() => mockApiClient.refreshToken({
              'refresh_token': testRefreshToken,
            })).called(1);
        verifyNoMoreInteractions(mockApiClient);
      });
    });

    group('getCurrentUser', () {
      test('should return UserDto when API call is successful', () async {
        // Arrange
        when(() => mockApiClient.getCurrentUser()).thenAnswer(
          (_) async => testUserDto,
        );

        // Act
        final result = await dataSource.getCurrentUser();

        // Assert
        expect(result, equals(testUserDto));
        verify(() => mockApiClient.getCurrentUser()).called(1);
        verifyNoMoreInteractions(mockApiClient);
      });

      test('should throw exception when API call fails', () async {
        // Arrange
        when(() => mockApiClient.getCurrentUser()).thenThrow(
          Exception('API call failed'),
        );

        // Act & Assert
        expect(
          () => dataSource.getCurrentUser(),
          throwsA(isA<Exception>()),
        );
        verify(() => mockApiClient.getCurrentUser()).called(1);
        verifyNoMoreInteractions(mockApiClient);
      });
    });

    group('logout', () {
      test('should complete successfully when API call is successful',
          () async {
        // Arrange
        when(() => mockApiClient.logout()).thenAnswer((_) async {});

        // Act
        await dataSource.logout();

        // Assert
        verify(() => mockApiClient.logout()).called(1);
        verifyNoMoreInteractions(mockApiClient);
      });

      test('should throw exception when API call fails', () async {
        // Arrange
        when(() => mockApiClient.logout()).thenThrow(
          Exception('API call failed'),
        );

        // Act & Assert
        expect(
          () => dataSource.logout(),
          throwsA(isA<Exception>()),
        );
        verify(() => mockApiClient.logout()).called(1);
        verifyNoMoreInteractions(mockApiClient);
      });
    });
  });
}
