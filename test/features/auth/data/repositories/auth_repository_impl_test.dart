import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fsm/core/error/failures.dart';
import 'package:fsm/core/network/network_info.dart';
import 'package:fsm/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:fsm/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:fsm/features/auth/data/models/login_request.dart';
import 'package:fsm/features/auth/data/models/login_response.dart';
import 'package:fsm/features/auth/data/models/refresh_token_response.dart';
import 'package:fsm/features/auth/data/models/user_dto.dart';
import 'package:fsm/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:fsm/features/auth/domain/entities/user_entity.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockAuthLocalDataSource extends Mock implements AuthLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

// Fake classes for mocktail fallback values
class FakeUserDto extends Fake implements UserDto {}

class FakeLoginRequest extends Fake implements LoginRequest {}

void main() {
  setUpAll(() {
    // Register fallback values for mocktail
    registerFallbackValue(FakeUserDto());
    registerFallbackValue(FakeLoginRequest());
  });
  group('AuthRepositoryImpl', () {
    late AuthRepositoryImpl repository;
    late MockAuthRemoteDataSource mockRemoteDataSource;
    late MockAuthLocalDataSource mockLocalDataSource;
    late MockNetworkInfo mockNetworkInfo;

    const testEmail = 'ayush.kumar@global-csg.com';
    const testPassword = '123456';
    const testAccessToken = 'access_token_123';
    const testRefreshToken = 'refresh_token_123';
    const testNewAccessToken = 'new_access_token_123';

    const testUserDto = UserDto(
      id: 1,
      firstName: 'John',
      lastName: 'Doe',
      email: testEmail,
    );

    const testUser = UserEntity(
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
      mockRemoteDataSource = MockAuthRemoteDataSource();
      mockLocalDataSource = MockAuthLocalDataSource();
      mockNetworkInfo = MockNetworkInfo();
      repository = AuthRepositoryImpl(
        mockRemoteDataSource,
        mockLocalDataSource,
        mockNetworkInfo,
      );
    });

    group('login', () {
      test('should return UserEntity when login is successful and online',
          () async {
        // Arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(() => mockRemoteDataSource.login(any())).thenAnswer(
          (_) async => testLoginResponse,
        );
        when(() => mockLocalDataSource.saveTokens(
              accessToken: any(named: 'accessToken'),
              refreshToken: any(named: 'refreshToken'),
            )).thenAnswer((_) async {});
        when(() => mockLocalDataSource.saveUser(any()))
            .thenAnswer((_) async {});

        // Act
        final result = await repository.login(
          email: testEmail,
          password: testPassword,
        );

        // Assert
        expect(result, equals(const Right(testUser)));
        verify(() => mockNetworkInfo.isConnected).called(1);
        verify(() => mockRemoteDataSource.login(
              const LoginRequest(email: testEmail, password: testPassword),
            )).called(1);
        verify(() => mockLocalDataSource.saveTokens(
              accessToken: testAccessToken,
              refreshToken: testRefreshToken,
            )).called(1);
        verify(() => mockLocalDataSource.saveUser(testUserDto)).called(1);
      });

      test('should return NetworkFailure when offline', () async {
        // Arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);

        // Act
        final result = await repository.login(
          email: testEmail,
          password: testPassword,
        );

        // Assert
        expect(
          result,
          equals(const Left(NetworkFailure(
            message: 'No internet connection available',
          ))),
        );
        verify(() => mockNetworkInfo.isConnected).called(1);
        verifyNever(() => mockRemoteDataSource.login(any()));
      });

      test('should return AuthenticationFailure when credentials are invalid',
          () async {
        // Arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(() => mockRemoteDataSource.login(any())).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: '/login'),
            response: Response(
              requestOptions: RequestOptions(path: '/login'),
              statusCode: 401,
              data: {'message': 'Invalid credentials'},
            ),
            type: DioExceptionType.badResponse,
          ),
        );

        // Act
        final result = await repository.login(
          email: testEmail,
          password: testPassword,
        );

        // Assert
        expect(
          result,
          equals(const Left(AuthenticationFailure(
            message: 'Invalid credentials or session expired',
          ))),
        );
        verify(() => mockNetworkInfo.isConnected).called(1);
        verify(() => mockRemoteDataSource.login(any())).called(1);
      });

      test('should return TimeoutFailure when request times out', () async {
        // Arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(() => mockRemoteDataSource.login(any())).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: '/login'),
            type: DioExceptionType.connectionTimeout,
          ),
        );

        // Act
        final result = await repository.login(
          email: testEmail,
          password: testPassword,
        );

        // Assert
        expect(
          result,
          equals(const Left(TimeoutFailure(message: 'Request timed out'))),
        );
        verify(() => mockNetworkInfo.isConnected).called(1);
        verify(() => mockRemoteDataSource.login(any())).called(1);
      });

      test('should return ServerFailure when server returns 500', () async {
        // Arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(() => mockRemoteDataSource.login(any())).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: '/login'),
            response: Response(
              requestOptions: RequestOptions(path: '/login'),
              statusCode: 500,
              data: {'message': 'Internal server error'},
            ),
            type: DioExceptionType.badResponse,
          ),
        );

        // Act
        final result = await repository.login(
          email: testEmail,
          password: testPassword,
        );

        // Assert
        expect(
          result,
          equals(const Left(ServerFailure(
            message: 'Internal server error',
            statusCode: 500,
          ))),
        );
      });
    });

    group('logout', () {
      test('should return success when logout is successful and online',
          () async {
        // Arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(() => mockRemoteDataSource.logout()).thenAnswer((_) async {});
        when(() => mockLocalDataSource.clearAuthData())
            .thenAnswer((_) async {});

        // Act
        final result = await repository.logout();

        // Assert
        expect(result, equals(const Right(null)));
        verify(() => mockNetworkInfo.isConnected).called(1);
        verify(() => mockRemoteDataSource.logout()).called(1);
        verify(() => mockLocalDataSource.clearAuthData()).called(1);
      });

      test('should return success when logout is successful but offline',
          () async {
        // Arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        when(() => mockLocalDataSource.clearAuthData())
            .thenAnswer((_) async {});

        // Act
        final result = await repository.logout();

        // Assert
        expect(result, equals(const Right(null)));
        verify(() => mockNetworkInfo.isConnected).called(1);
        verifyNever(() => mockRemoteDataSource.logout());
        verify(() => mockLocalDataSource.clearAuthData()).called(1);
      });

      test(
          'should return success even when remote logout fails but local succeeds',
          () async {
        // Arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(() => mockRemoteDataSource.logout())
            .thenThrow(Exception('Remote logout failed'));
        when(() => mockLocalDataSource.clearAuthData())
            .thenAnswer((_) async {});

        // Act
        final result = await repository.logout();

        // Assert
        expect(result, equals(const Right(null)));
        verify(() => mockNetworkInfo.isConnected).called(1);
        verify(() => mockRemoteDataSource.logout()).called(1);
        verify(() => mockLocalDataSource.clearAuthData()).called(1);
      });

      test('should return UnknownFailure when local logout fails', () async {
        // Arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        when(() => mockLocalDataSource.clearAuthData())
            .thenThrow(Exception('Local logout failed'));

        // Act
        final result = await repository.logout();

        // Assert
        expect(
          result,
          equals(const Left(
              UnknownFailure(message: 'Exception: Local logout failed'))),
        );
      });
    });

    group('checkAuth', () {
      test('should return UserEntity when user is authenticated', () async {
        // Arrange
        when(() => mockLocalDataSource.getAccessToken()).thenAnswer(
          (_) async => testAccessToken,
        );
        when(() => mockLocalDataSource.getUser()).thenAnswer(
          (_) async => testUserDto,
        );

        // Act
        final result = await repository.checkAuth();

        // Assert
        expect(result, equals(const Right(testUser)));
        verify(() => mockLocalDataSource.getAccessToken()).called(1);
        verify(() => mockLocalDataSource.getUser()).called(1);
      });

      test('should return null when no access token is available', () async {
        // Arrange
        when(() => mockLocalDataSource.getAccessToken()).thenAnswer(
          (_) async => null,
        );

        // Act
        final result = await repository.checkAuth();

        // Assert
        expect(result, equals(const Right(null)));
        verify(() => mockLocalDataSource.getAccessToken()).called(1);
        verifyNever(() => mockLocalDataSource.getUser());
      });

      test('should return null when no user data is available', () async {
        // Arrange
        when(() => mockLocalDataSource.getAccessToken()).thenAnswer(
          (_) async => testAccessToken,
        );
        when(() => mockLocalDataSource.getUser()).thenAnswer(
          (_) async => null,
        );

        // Act
        final result = await repository.checkAuth();

        // Assert
        expect(result, equals(const Right(null)));
        verify(() => mockLocalDataSource.getAccessToken()).called(1);
        verify(() => mockLocalDataSource.getUser()).called(1);
      });

      test('should return CacheFailure when local storage fails', () async {
        // Arrange
        when(() => mockLocalDataSource.getAccessToken()).thenThrow(
          Exception('Storage error'),
        );

        // Act
        final result = await repository.checkAuth();

        // Assert
        expect(
          result,
          equals(const Left(CacheFailure(message: 'Exception: Storage error'))),
        );
      });
    });

    group('refreshToken', () {
      test('should return new token when refresh is successful', () async {
        // Arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(() => mockLocalDataSource.getRefreshToken()).thenAnswer(
          (_) async => testRefreshToken,
        );
        when(() => mockRemoteDataSource.refreshToken(any())).thenAnswer(
          (_) async => testRefreshTokenResponse,
        );
        when(() => mockLocalDataSource.saveTokens(
              accessToken: any(named: 'accessToken'),
              refreshToken: any(named: 'refreshToken'),
            )).thenAnswer((_) async {});

        // Act
        final result = await repository.refreshToken();

        // Assert
        expect(result, equals(const Right(testNewAccessToken)));
        verify(() => mockNetworkInfo.isConnected).called(1);
        verify(() => mockLocalDataSource.getRefreshToken()).called(1);
        verify(() => mockRemoteDataSource.refreshToken(testRefreshToken))
            .called(1);
        verify(() => mockLocalDataSource.saveTokens(
              accessToken: testNewAccessToken,
              refreshToken: testRefreshToken,
            )).called(1);
      });

      test('should return NetworkFailure when offline', () async {
        // Arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);

        // Act
        final result = await repository.refreshToken();

        // Assert
        expect(
          result,
          equals(const Left(NetworkFailure(
            message: 'No internet connection available',
          ))),
        );
        verify(() => mockNetworkInfo.isConnected).called(1);
        verifyNever(() => mockLocalDataSource.getRefreshToken());
      });

      test(
          'should return AuthenticationFailure when no refresh token is available',
          () async {
        // Arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(() => mockLocalDataSource.getRefreshToken()).thenAnswer(
          (_) async => null,
        );

        // Act
        final result = await repository.refreshToken();

        // Assert
        expect(
          result,
          equals(const Left(AuthenticationFailure(
            message: 'No refresh token available',
          ))),
        );
        verify(() => mockNetworkInfo.isConnected).called(1);
        verify(() => mockLocalDataSource.getRefreshToken()).called(1);
        verifyNever(() => mockRemoteDataSource.refreshToken(any()));
      });

      test(
          'should clear auth data and return AuthenticationFailure when refresh token is invalid',
          () async {
        // Arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(() => mockLocalDataSource.getRefreshToken()).thenAnswer(
          (_) async => testRefreshToken,
        );
        when(() => mockRemoteDataSource.refreshToken(any())).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: '/refresh'),
            response: Response(
              requestOptions: RequestOptions(path: '/refresh'),
              statusCode: 401,
            ),
            type: DioExceptionType.badResponse,
          ),
        );
        when(() => mockLocalDataSource.clearAuthData())
            .thenAnswer((_) async {});

        // Act
        final result = await repository.refreshToken();

        // Assert
        expect(
          result,
          equals(const Left(AuthenticationFailure(
            message: 'Session expired. Please log in again.',
          ))),
        );
        verify(() => mockLocalDataSource.clearAuthData()).called(1);
      });
    });

    group('getCurrentUser', () {
      test('should return fresh user data when online and remote call succeeds',
          () async {
        // Arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(() => mockRemoteDataSource.getCurrentUser()).thenAnswer(
          (_) async => testUserDto,
        );
        when(() => mockLocalDataSource.saveUser(any()))
            .thenAnswer((_) async {});

        // Act
        final result = await repository.getCurrentUser();

        // Assert
        expect(result, equals(const Right(testUser)));
        verify(() => mockNetworkInfo.isConnected).called(1);
        verify(() => mockRemoteDataSource.getCurrentUser()).called(1);
        verify(() => mockLocalDataSource.saveUser(testUserDto)).called(1);
      });

      test('should return cached user data when online but remote call fails',
          () async {
        // Arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(() => mockRemoteDataSource.getCurrentUser()).thenThrow(
          Exception('Remote call failed'),
        );
        when(() => mockLocalDataSource.getUser()).thenAnswer(
          (_) async => testUserDto,
        );

        // Act
        final result = await repository.getCurrentUser();

        // Assert
        expect(result, equals(const Right(testUser)));
        verify(() => mockNetworkInfo.isConnected).called(1);
        verify(() => mockRemoteDataSource.getCurrentUser()).called(1);
        verify(() => mockLocalDataSource.getUser()).called(1);
      });

      test('should return cached user data when offline', () async {
        // Arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        when(() => mockLocalDataSource.getUser()).thenAnswer(
          (_) async => testUserDto,
        );

        // Act
        final result = await repository.getCurrentUser();

        // Assert
        expect(result, equals(const Right(testUser)));
        verify(() => mockNetworkInfo.isConnected).called(1);
        verifyNever(() => mockRemoteDataSource.getCurrentUser());
        verify(() => mockLocalDataSource.getUser()).called(1);
      });

      test('should return CacheFailure when no cached user data is available',
          () async {
        // Arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        when(() => mockLocalDataSource.getUser()).thenAnswer(
          (_) async => null,
        );

        // Act
        final result = await repository.getCurrentUser();

        // Assert
        expect(
          result,
          equals(const Left(CacheFailure(
            message: 'No user data available',
          ))),
        );
      });
    });
  });
}
