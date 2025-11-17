import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/i_auth_repository.dart';
import '../datasources/auth_local_datasource.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/login_request.dart';
import '../models/user_dto.dart';

@Injectable(as: IAuthRepository)
class AuthRepositoryImpl implements IAuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  AuthRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      if (!await _networkInfo.isConnected) {
        return const Left(NetworkFailure(
          message: 'No internet connection available',
        ));
      }

      final loginRequest = LoginRequest(email: email, password: password);
      final response = await _remoteDataSource.login(loginRequest);

      // Save tokens and user data locally
      await _localDataSource.saveTokens(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      );
      await _localDataSource.saveUser(response.user);

      return Right(response.user.toEntity(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      ));
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      if (await _networkInfo.isConnected) {
        try {
          await _remoteDataSource.logout();
        } catch (e) {
          // Continue with local logout even if remote logout fails
        }
      }

      await _localDataSource.clearAuthData();
      return const Right(null);
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> checkAuth() async {
    try {
      final accessToken = await _localDataSource.getAccessToken();
      if (accessToken == null) {
        return const Right(null);
      }

      final user = await _localDataSource.getUser();
      if (user == null) {
        return const Right(null);
      }

      // ✅ FIXED: Get refreshToken from local storage
      final refreshToken = await _localDataSource.getRefreshToken();

      return Right(user.toEntity(
        accessToken: accessToken,
        refreshToken: refreshToken,
      ));
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> refreshToken() async {
    try {
      if (!await _networkInfo.isConnected) {
        return const Left(NetworkFailure(
          message: 'No internet connection available',
        ));
      }

      final refreshToken = await _localDataSource.getRefreshToken();
      if (refreshToken == null) {
        return const Left(AuthenticationFailure(
          message: 'No refresh token available',
        ));
      }

      final response = await _remoteDataSource.refreshToken(refreshToken);

      // Save new tokens
      await _localDataSource.saveTokens(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      );

      return Right(response.accessToken);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        // Refresh token is invalid, clear auth data
        await _localDataSource.clearAuthData();
        return const Left(AuthenticationFailure(
          message: 'Session expired. Please log in again.',
        ));
      }
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      if (await _networkInfo.isConnected) {
        // Try to get fresh user data from server
        try {
          final userDto = await _remoteDataSource.getCurrentUser();
          await _localDataSource.saveUser(userDto);

          // ✅ FIXED: Get tokens from local storage
          final accessToken = await _localDataSource.getAccessToken();
          final refreshToken = await _localDataSource.getRefreshToken();

          return Right(userDto.toEntity(
            accessToken: accessToken ?? '',
            refreshToken: refreshToken,
          ));
        } catch (e) {
          // Fall back to cached user if remote fails
        }
      }

      // Get cached user data
      final cachedUser = await _localDataSource.getUser();
      if (cachedUser != null) {
        // ✅ FIXED: Get tokens from local storage
        final accessToken = await _localDataSource.getAccessToken();
        final refreshToken = await _localDataSource.getRefreshToken();

        return Right(cachedUser.toEntity(
          accessToken: accessToken ?? '',
          refreshToken: refreshToken,
        ));
      }

      return const Left(CacheFailure(
        message: 'No user data available',
      ));
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  Failure _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return const TimeoutFailure(message: 'Request timed out');
      case DioExceptionType.connectionError:
        return const NetworkFailure(message: 'No internet connection');
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final message = e.response?.data?['message'] ?? 'Server error';

        if (statusCode == 401) {
          return const AuthenticationFailure(
            message: 'Invalid credentials or session expired',
          );
        }

        return ServerFailure(
          message: message,
          statusCode: statusCode,
        );
      default:
        return UnknownFailure(message: e.message ?? 'Unknown error occurred');
    }
  }
}

