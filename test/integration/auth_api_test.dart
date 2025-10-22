import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'helpers/dio_helper.dart';
import 'helpers/auth_helper.dart';
import 'fixtures/test_data.dart';

/// Integration tests for Authentication APIs
///
/// API Documentation Reference: docs/api.md
/// - POST /api/auth/login (Login)
/// - POST /api/auth/refresh-token (Refresh Token)
/// - GET /api/users/me (Get Current User Profile)
void main() {
  late Dio dio;

  setUpAll(() {
    dio = DioHelper.createDio();
  });

  tearDownAll(() {
    AuthHelper.clearTokens();
    dio.close();
  });

  group('Authentication APIs - POST /api/auth/login', () {
    test('should login successfully with valid technician credentials', () async {
      // Arrange
      final loginData = {
        'email': TestUsers.technicianEmail,
        'password': TestUsers.technicianPassword,
      };

      // Act
      final response = await dio.post('/auth/login', data: loginData);

      // Assert
      expect(response.statusCode, 200);
      expect(response.data, isNotNull);
      expect(response.data['message'], 'Login successful');
      expect(response.data['accessToken'], isNotNull);
      expect(response.data['refreshToken'], isNotNull);
      expect(response.data['user'], isNotNull);
      expect(response.data['user']['email'], TestUsers.technicianEmail);
      expect(response.data['user']['role_id'], 4); // Technician role
      expect(response.data['user']['role'], 'technician'); // role is a string, not object
    });

    test('should login successfully with valid manager credentials', () async {
      // Arrange
      final loginData = {
        'email': TestUsers.managerEmail,
        'password': TestUsers.managerPassword,
      };

      // Act
      final response = await dio.post('/auth/login', data: loginData);

      // Assert
      expect(response.statusCode, 200);
      expect(response.data, isNotNull);
      expect(response.data['accessToken'], isNotNull);
      expect(response.data['user']['role_id'], 1); // Manager role
    });

    test('should fail login with invalid credentials', () async {
      // Arrange
      final loginData = {
        'email': TestUsers.technicianEmail,
        'password': 'wrongpassword',
      };

      // Act & Assert
      try {
        await dio.post('/auth/login', data: loginData);
        fail('Should have thrown DioException');
      } on DioException catch (e) {
        expect(e.response?.statusCode, 401);
        expect(e.response?.data['message'], contains('Invalid credentials'));
      }
    });

    test('should fail login with non-existent email', () async {
      // Arrange
      final loginData = {
        'email': 'nonexistent@example.com',
        'password': '123456',
      };

      // Act & Assert
      try {
        await dio.post('/auth/login', data: loginData);
        fail('Should have thrown DioException');
      } on DioException catch (e) {
        expect(e.response?.statusCode, 401);
      }
    });

    test('should fail login with missing email', () async {
      // Arrange
      final loginData = {
        'password': '123456',
      };

      // Act & Assert
      try {
        await dio.post('/auth/login', data: loginData);
        fail('Should have thrown DioException');
      } on DioException catch (e) {
        expect(e.response?.statusCode, anyOf([400, 401]));
      }
    });

    test('should fail login with missing password', () async {
      // Arrange
      final loginData = {
        'email': TestUsers.technicianEmail,
      };

      // Act & Assert
      try {
        await dio.post('/auth/login', data: loginData);
        fail('Should have thrown DioException');
      } on DioException catch (e) {
        expect(e.response?.statusCode, anyOf([400, 401]));
      }
    });
  });

  group('Authentication APIs - POST /api/auth/refresh-token', () {
    test('should refresh token successfully with valid refresh token', () async {
      // Arrange - First login to get a refresh token
      await AuthHelper.loginAsTechnician();
      final refreshToken = AuthHelper.cachedRefreshToken;

      expect(refreshToken, isNotNull, reason: 'Refresh token should be cached after login');

      // Act
      final response = await dio.post(
        '/auth/refresh-token',
        data: {'refreshToken': refreshToken},
      );

      // Assert
      expect(response.statusCode, 200);
      expect(response.data, isNotNull);
      expect(response.data['accessToken'], isNotNull);
      expect(response.data['accessToken'], isA<String>());
    });

    test('should fail to refresh token with invalid refresh token', () async {
      // Arrange
      final invalidRefreshToken = 'invalid.refresh.token.jwt';

      // Act & Assert
      try {
        await dio.post(
          '/auth/refresh-token',
          data: {'refreshToken': invalidRefreshToken},
        );
        fail('Should have thrown DioException');
      } on DioException catch (e) {
        expect(e.response?.statusCode, 401);
        expect(
          e.response?.data['message'],
          anyOf([
            contains('Invalid refresh token'),
            contains('Invalid or expired refresh token'),
          ]),
        );
      }
    });

    test('should fail to refresh token with missing refresh token', () async {
      // Act & Assert
      try {
        await dio.post('/auth/refresh-token', data: {});
        fail('Should have thrown DioException');
      } on DioException catch (e) {
        expect(e.response?.statusCode, anyOf([400, 401]));
      }
    });
  });

  group('User Management APIs - GET /api/users/me', () {
    late Dio authenticatedDio;

    setUp(() async {
      final token = await AuthHelper.loginAsTechnician();
      authenticatedDio = DioHelper.createDio(authToken: token);
    });

    tearDown(() {
      authenticatedDio.close();
    });

    test('should get current user profile successfully', () async {
      // Act
      final response = await authenticatedDio.get('/users/me');

      // Assert
      expect(response.statusCode, 200);
      expect(response.data, isNotNull);
      expect(response.data['id'], isNotNull);
      expect(response.data['email'], TestUsers.technicianEmail);
      expect(response.data['first_name'], isNotNull);
      expect(response.data['last_name'], isNotNull);
      expect(response.data['role_id'], 4); // Technician role
      expect(response.data['role'], isNotNull);
      expect(response.data['role'], 'technician'); // role is a string, not object
      expect(response.data['status'], 'active');
    });

    test('should fail to get profile without authentication token', () async {
      // Arrange - Create dio without auth token
      final unauthenticatedDio = DioHelper.createDio();

      // Act & Assert
      try {
        await unauthenticatedDio.get('/users/me');
        fail('Should have thrown DioException');
      } on DioException catch (e) {
        expect(e.response?.statusCode, 401);
      } finally {
        unauthenticatedDio.close();
      }
    });

    test('should fail to get profile with invalid token', () async {
      // Arrange - Create dio with invalid token
      final invalidDio = DioHelper.createDio(authToken: 'invalid.token.here');

      // Act & Assert
      try {
        await invalidDio.get('/users/me');
        fail('Should have thrown DioException');
      } on DioException catch (e) {
        expect(e.response?.statusCode, 401);
      } finally {
        invalidDio.close();
      }
    });
  });

  group('Authentication Flow - End to End', () {
    test('should complete full authentication flow: login -> get profile -> refresh token', () async {
      // Step 1: Login
      final loginResponse = await dio.post(
        '/auth/login',
        data: {
          'email': TestUsers.helpdeskEmail,
          'password': TestUsers.helpdeskPassword,
        },
      );

      expect(loginResponse.statusCode, 200);
      final accessToken = loginResponse.data['accessToken'] as String;
      final refreshToken = loginResponse.data['refreshToken'] as String;

      // Step 2: Get Profile using access token
      final authenticatedDio = DioHelper.createDio(authToken: accessToken);
      final profileResponse = await authenticatedDio.get('/users/me');

      expect(profileResponse.statusCode, 200);
      expect(profileResponse.data['email'], TestUsers.helpdeskEmail);
      expect(profileResponse.data['role'], 'helpdesk'); // role is a string, not object

      // Step 3: Refresh token
      final refreshResponse = await dio.post(
        '/auth/refresh-token',
        data: {'refreshToken': refreshToken},
      );

      expect(refreshResponse.statusCode, 200);
      final newAccessToken = refreshResponse.data['accessToken'] as String;
      expect(newAccessToken, isNotNull);
      // Note: New token might be same if refresh happens within same second
      // The important thing is that we got a valid token back

      // Step 4: Use new access token to verify it works
      final newAuthDio = DioHelper.createDio(authToken: newAccessToken);
      final verifyResponse = await newAuthDio.get('/users/me');

      expect(verifyResponse.statusCode, 200);
      expect(verifyResponse.data['email'], TestUsers.helpdeskEmail);

      // Cleanup
      authenticatedDio.close();
      newAuthDio.close();
    });
  });
}
