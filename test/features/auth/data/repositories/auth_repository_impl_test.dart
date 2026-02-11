import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/core/network/network_info.dart';
import 'package:fsm/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:fsm/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:fsm/features/auth/data/models/login_request.dart';
import 'package:fsm/features/auth/data/models/login_response.dart';
import 'package:fsm/features/auth/data/models/refresh_token_response.dart';
import 'package:fsm/features/auth/data/models/user_dto.dart';
import 'package:fsm/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockAuthLocalDataSource extends Mock implements AuthLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late AuthRepositoryImpl repository;
  late MockAuthRemoteDataSource mockRemoteDataSource;
  late MockAuthLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockAuthRemoteDataSource();
    mockLocalDataSource = MockAuthLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = AuthRepositoryImpl(
      mockRemoteDataSource,
      mockLocalDataSource,
      mockNetworkInfo,
    );
  });

  setUpAll(() {
    // Register all fallback values needed for any() matchers
    registerFallbackValue(const LoginRequest(
      email: 'test@example.com',
      password: 'password',
    ));
    registerFallbackValue(const UserDto(
      id: 0,
      firstName: 'dummy',
      lastName: 'dummy',
      email: 'dummy@dummy.com',
    ));
    registerFallbackValue('dummy_string'); // For any String parameters
  });

  const tEmail = 'test@example.com';
  const tPassword = 'password123';
  const tAccessToken = 'access_token';
  const tRefreshToken = 'refresh_token';
  const tUserDto = UserDto(
    id: 1,
    firstName: 'John',
    lastName: 'Doe',
    email: tEmail,
  );
  const tLoginResponse = LoginResponse(
    message: 'Login successful',
    accessToken: tAccessToken,
    refreshToken: tRefreshToken,
    user: tUserDto,
  );

  group('login', () {
    test('should return UserEntity when login is successful', () async {
      // Arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockRemoteDataSource.login(any()))
          .thenAnswer((_) async => tLoginResponse);
      when(() => mockLocalDataSource.saveTokens(
            accessToken: any(named: 'accessToken'),
            refreshToken: any(named: 'refreshToken'),
          )).thenAnswer((_) async {});
      when(() => mockLocalDataSource.saveUser(any())).thenAnswer((_) async {});

      // Act
      final result = await repository.login(
        email: tEmail,
        password: tPassword,
      );

      // Assert
      expect(result.isRight, true);
      expect(result.right.email, tEmail);
      expect(result.right.accessToken, tAccessToken);
      verify(() => mockRemoteDataSource.login(any())).called(1);
      verify(() => mockLocalDataSource.saveTokens(
            accessToken: tAccessToken,
            refreshToken: tRefreshToken,
          )).called(1);
      verify(() => mockLocalDataSource.saveUser(tUserDto)).called(1);
    });

    test('should return NetworkFailure when there is no internet', () async {
      // Arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);

      // Act
      final result = await repository.login(
        email: tEmail,
        password: tPassword,
      );

      // Assert
      expect(result.isLeft, true);
      expect(result.left, isA<NetworkFailure>());
      verifyNever(() => mockRemoteDataSource.login(any()));
    });

    test('should return AuthenticationFailure on 401 error', () async {
      // Arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockRemoteDataSource.login(any())).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: ''),
          response: Response(
            requestOptions: RequestOptions(path: ''),
            statusCode: 401,
          ),
          type: DioExceptionType.badResponse,
        ),
      );

      // Act
      final result = await repository.login(
        email: tEmail,
        password: tPassword,
      );

      // Assert
      expect(result.isLeft, true);
      expect(result.left, isA<AuthenticationFailure>());
    });
  });

  group('logout', () {
    test('should clear local data when logout is successful', () async {
      // Arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockRemoteDataSource.logout()).thenAnswer((_) async {});
      when(() => mockLocalDataSource.clearAuthData()).thenAnswer((_) async {});

      // Act
      final result = await repository.logout();

      // Assert
      expect(result.isRight, true);
      verify(() => mockRemoteDataSource.logout()).called(1);
      verify(() => mockLocalDataSource.clearAuthData()).called(1);
    });

    test('should clear local data even when remote logout fails', () async {
      // Arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockRemoteDataSource.logout())
          .thenThrow(Exception('Server error'));
      when(() => mockLocalDataSource.clearAuthData()).thenAnswer((_) async {});

      // Act
      final result = await repository.logout();

      // Assert
      expect(result.isRight, true);
      verify(() => mockLocalDataSource.clearAuthData()).called(1);
    });

    test('should clear local data when offline', () async {
      // Arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      when(() => mockLocalDataSource.clearAuthData()).thenAnswer((_) async {});

      // Act
      final result = await repository.logout();

      // Assert
      expect(result.isRight, true);
      verify(() => mockLocalDataSource.clearAuthData()).called(1);
      verifyNever(() => mockRemoteDataSource.logout());
    });
  });

  group('checkAuth', () {
    test('should return UserEntity when tokens and user exist', () async {
      // Arrange
      when(() => mockLocalDataSource.getAccessToken())
          .thenAnswer((_) async => tAccessToken);
      when(() => mockLocalDataSource.getUser())
          .thenAnswer((_) async => tUserDto);
      when(() => mockLocalDataSource.getRefreshToken())
          .thenAnswer((_) async => tRefreshToken);

      // Act
      final result = await repository.checkAuth();

      // Assert
      expect(result.isRight, true);
      expect(result.right, isNotNull);
      expect(result.right!.email, tEmail);
    });

    test('should return null when access token does not exist', () async {
      // Arrange
      when(() => mockLocalDataSource.getAccessToken())
          .thenAnswer((_) async => null);

      // Act
      final result = await repository.checkAuth();

      // Assert
      expect(result.isRight, true);
      expect(result.right, null);
    });

    test('should return null when user does not exist', () async {
      // Arrange
      when(() => mockLocalDataSource.getAccessToken())
          .thenAnswer((_) async => tAccessToken);
      when(() => mockLocalDataSource.getUser()).thenAnswer((_) async => null);

      // Act
      final result = await repository.checkAuth();

      // Assert
      expect(result.isRight, true);
      expect(result.right, null);
    });
  });

  group('refreshToken', () {
    const tRefreshTokenResponse = RefreshTokenResponse(
      accessToken: 'new_access_token',
      refreshToken: 'new_refresh_token',
    );

    test('should return new access token when refresh is successful', () async {
      // Arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockLocalDataSource.getRefreshToken())
          .thenAnswer((_) async => tRefreshToken);
      when(() => mockRemoteDataSource.refreshToken(any()))
          .thenAnswer((_) async => tRefreshTokenResponse);
      when(() => mockLocalDataSource.saveTokens(
            accessToken: any(named: 'accessToken'),
            refreshToken: any(named: 'refreshToken'),
          )).thenAnswer((_) async {});

      // Act
      final result = await repository.refreshToken();

      // Assert
      expect(result.isRight, true);
      expect(result.right, 'new_access_token');
      verify(() => mockLocalDataSource.saveTokens(
            accessToken: 'new_access_token',
            refreshToken: 'new_refresh_token',
          )).called(1);
    });

    test('should clear auth data on 401 error', () async {
      // Arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockLocalDataSource.getRefreshToken())
          .thenAnswer((_) async => tRefreshToken);
      when(() => mockRemoteDataSource.refreshToken(any())).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: ''),
          response: Response(
            requestOptions: RequestOptions(path: ''),
            statusCode: 401,
          ),
          type: DioExceptionType.badResponse,
        ),
      );
      when(() => mockLocalDataSource.clearAuthData()).thenAnswer((_) async {});

      // Act
      final result = await repository.refreshToken();

      // Assert
      expect(result.isLeft, true);
      expect(result.left, isA<AuthenticationFailure>());
      verify(() => mockLocalDataSource.clearAuthData()).called(1);
    });

    test('should return AuthenticationFailure when refresh token is null',
        () async {
      // Arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockLocalDataSource.getRefreshToken())
          .thenAnswer((_) async => null);

      // Act
      final result = await repository.refreshToken();

      // Assert
      expect(result.isLeft, true);
      expect(result.left, isA<AuthenticationFailure>());
    });
  });
}
