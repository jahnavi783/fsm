import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/repositories/i_profile_repository.dart';
import '../datasources/profile_local_datasource.dart';
import '../datasources/profile_remote_datasource.dart';
import '../models/profile_dto.dart';
import '../models/profile_hive_model.dart';

@Injectable(as: IProfileRepository)
class ProfileRepositoryImpl implements IProfileRepository {
  final ProfileRemoteDataSource _remoteDataSource;
  final ProfileLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  ProfileRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, ProfileEntity>> getProfile() async {
    try {
      if (await _networkInfo.isConnected) {
        // Make only ONE API call to get current user data
        final userDto = await _remoteDataSource.getCurrentUser();

        // Create default preferences (can be loaded separately if needed)
        final defaultPreferences = const ProfilePreferences();

        // Try to get cached preferences, fallback to defaults
        ProfilePreferences preferences = defaultPreferences;
        try {
          final cachedPrefs = await _localDataSource.getCachedPreferences();
          if (cachedPrefs != null) {
            preferences = cachedPrefs.toEntity();
          }
        } catch (e) {
          // Use defaults if cache fails
          preferences = defaultPreferences;
        }

        // Convert UserDto to ProfileEntity
        final profileEntity = ProfileEntity(
          id: userDto.id,
          firstName: userDto.firstName,
          lastName: userDto.lastName,
          email: userDto.email,
          phone: userDto.phone,
          role: userDto.role,
          city: userDto.city,
          dob: userDto.dob,
          profileImageUrl: null, // UserDto doesn't have this field
          preferences: preferences,
        );

        // Cache the profile data
        final profileHiveModel = ProfileHiveModel(
          id: userDto.id,
          firstName: userDto.firstName,
          lastName: userDto.lastName,
          email: userDto.email,
          phone: userDto.phone,
          role: userDto.role,
          city: userDto.city,
          dob: userDto.dob,
          profileImageUrl: null,
          preferences: preferences.toHiveModel(),
          cachedAt: DateTime.now(),
        );

        await _localDataSource.cacheProfile(profileHiveModel);

        return Right(profileEntity);
      } else {
        // Fallback to cache when offline
        final cachedProfile = await _localDataSource.getCachedProfile();

        if (cachedProfile == null) {
          return Left(CacheFailure(
            message: 'No cached profile available offline',
          ));
        }

        final entity = cachedProfile.toEntity();
        return Right(entity);
      }
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } on HiveError catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> updateProfile(
      ProfileEntity profile) async {
    try {
      if (await _networkInfo.isConnected) {
        // Convert ProfileEntity to the format expected by the API
        final profileData = {
          'first_name': profile.firstName,
          'last_name': profile.lastName,
          'email': profile.email,
          'phone': profile.phone,
          'city': profile.city,
          'date_of_birth': profile.dob?.toIso8601String(),
        };

        // Update remote
        final updatedUserDto =
            await _remoteDataSource.updateProfile(profileData);

        // Create updated profile entity
        final updatedProfile = ProfileEntity(
          id: updatedUserDto.id,
          firstName: updatedUserDto.firstName,
          lastName: updatedUserDto.lastName,
          email: updatedUserDto.email,
          phone: updatedUserDto.phone,
          role: updatedUserDto.role,
          city: updatedUserDto.city,
          dob: updatedUserDto.dob,
          profileImageUrl: profile.profileImageUrl, // Keep existing image
          preferences: profile.preferences, // Keep existing preferences
        );

        // Update cache
        final profileHiveModel = ProfileHiveModel(
          id: updatedProfile.id,
          firstName: updatedProfile.firstName,
          lastName: updatedProfile.lastName,
          email: updatedProfile.email,
          phone: updatedProfile.phone,
          role: updatedProfile.role,
          city: updatedProfile.city,
          dob: updatedProfile.dob,
          profileImageUrl: updatedProfile.profileImageUrl,
          preferences: updatedProfile.preferences.toHiveModel(),
          cachedAt: DateTime.now(),
        );

        await _localDataSource.cacheProfile(profileHiveModel);

        return Right(updatedProfile);
      } else {
        return Left(NetworkFailure(
          message: 'Cannot update profile while offline',
        ));
      }
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } on HiveError catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfilePreferences>> getPreferences() async {
    try {
      if (await _networkInfo.isConnected) {
        // Try remote first
        final preferencesDto = await _remoteDataSource.getPreferences();

        // Cache successful response
        await _localDataSource
            .cachePreferences(preferencesDto.toEntity().toHiveModel());

        // Return domain entity
        final entity = preferencesDto.toEntity();
        return Right(entity);
      } else {
        // Fallback to cache when offline
        final cachedPreferences = await _localDataSource.getCachedPreferences();

        if (cachedPreferences == null) {
          return Left(CacheFailure(
            message: 'No cached preferences available offline',
          ));
        }

        final entity = cachedPreferences.toEntity();
        return Right(entity);
      }
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } on HiveError catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfilePreferences>> updatePreferences(
      ProfilePreferences preferences) async {
    try {
      // Always update local preferences immediately for better UX
      await _localDataSource.cachePreferences(preferences.toHiveModel());

      if (await _networkInfo.isConnected) {
        // Update remote
        final preferencesDto = preferences.toDto();
        final updatedPreferencesDto =
            await _remoteDataSource.updatePreferences(preferencesDto);

        // Update cache with server response
        await _localDataSource
            .cachePreferences(updatedPreferencesDto.toEntity().toHiveModel());

        // Return updated entity
        final entity = updatedPreferencesDto.toEntity();
        return Right(entity);
      } else {
        // Return local preferences when offline
        return Right(preferences);
      }
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } on HiveError catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      if (await _networkInfo.isConnected) {
        // Logout from server
        await _remoteDataSource.logout();
      }

      // Clear local cache regardless of network status
      await _localDataSource.clearCache();

      return const Right(null);
    } on DioException catch (e) {
      // Still clear cache even if server logout fails
      await _localDataSource.clearCache();
      return Left(_handleDioException(e));
    } on HiveError catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      // Still clear cache even if error occurs
      await _localDataSource.clearCache();
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAccount() async {
    try {
      if (await _networkInfo.isConnected) {
        // Delete account from server
        await _remoteDataSource.deleteAccount();

        // Clear local cache
        await _localDataSource.clearCache();

        return const Right(null);
      } else {
        return Left(NetworkFailure(
          message: 'Cannot delete account while offline',
        ));
      }
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } on HiveError catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  Failure _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkFailure(message: 'Connection timeout');
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        if (statusCode == 401) {
          return const AuthenticationFailure(message: 'Authentication failed');
        } else if (statusCode == 404) {
          return ServerFailure(message: 'Profile not found');
        } else {
          return ServerFailure(
            message:
                'Server error: ${e.response?.statusMessage ?? 'Unknown error'}',
          );
        }
      case DioExceptionType.cancel:
        return NetworkFailure(message: 'Request cancelled');
      case DioExceptionType.connectionError:
        return NetworkFailure(message: 'No internet connection');
      case DioExceptionType.unknown:
      default:
        return ServerFailure(message: 'Unexpected error: ${e.message}');
    }
  }
}
