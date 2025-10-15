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
        // Try remote first
        final profileDto = await _remoteDataSource.getProfile();
        final preferencesDto = await _remoteDataSource.getPreferences();
        
        // Cache successful response
        final profileHiveModel = ProfileHiveModel(
          id: profileDto.id,
          firstName: profileDto.firstName,
          lastName: profileDto.lastName,
          email: profileDto.email,
          phone: profileDto.phone,
          role: profileDto.role,
          city: profileDto.city,
          dob: profileDto.dob != null ? DateTime.tryParse(profileDto.dob!) : null,
          profileImageUrl: profileDto.profileImageUrl,
          preferences: preferencesDto.toEntity().toHiveModel(),
          cachedAt: DateTime.now(),
        );
        
        await _localDataSource.cacheProfile(profileHiveModel);
        await _localDataSource.cachePreferences(preferencesDto.toEntity().toHiveModel());
        
        // Return domain entity
        final entity = profileDto.toEntity(preferencesDto.toEntity());
        return Right(entity);
        
      } else {
        // Fallback to cache when offline
        final cachedProfile = await _localDataSource.getCachedProfile();
        final cachedPreferences = await _localDataSource.getCachedPreferences();
        
        if (cachedProfile == null || cachedPreferences == null) {
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
  Future<Either<Failure, ProfileEntity>> updateProfile(ProfileEntity profile) async {
    try {
      if (await _networkInfo.isConnected) {
        // Update remote
        final profileDto = profile.toDto();
        final updatedProfileDto = await _remoteDataSource.updateProfile(profileDto);
        
        // Update cache
        final profileHiveModel = ProfileHiveModel(
          id: updatedProfileDto.id,
          firstName: updatedProfileDto.firstName,
          lastName: updatedProfileDto.lastName,
          email: updatedProfileDto.email,
          phone: updatedProfileDto.phone,
          role: updatedProfileDto.role,
          city: updatedProfileDto.city,
          dob: updatedProfileDto.dob != null ? DateTime.tryParse(updatedProfileDto.dob!) : null,
          profileImageUrl: updatedProfileDto.profileImageUrl,
          preferences: profile.preferences.toHiveModel(),
          cachedAt: DateTime.now(),
        );
        
        await _localDataSource.cacheProfile(profileHiveModel);
        
        // Return updated entity
        final entity = updatedProfileDto.toEntity(profile.preferences);
        return Right(entity);
        
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
        await _localDataSource.cachePreferences(preferencesDto.toEntity().toHiveModel());
        
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
  Future<Either<Failure, ProfilePreferences>> updatePreferences(ProfilePreferences preferences) async {
    try {
      // Always update local preferences immediately for better UX
      await _localDataSource.cachePreferences(preferences.toHiveModel());
      
      if (await _networkInfo.isConnected) {
        // Update remote
        final preferencesDto = preferences.toDto();
        final updatedPreferencesDto = await _remoteDataSource.updatePreferences(preferencesDto);
        
        // Update cache with server response
        await _localDataSource.cachePreferences(updatedPreferencesDto.toEntity().toHiveModel());
        
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
      
      return Right(null);
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
        
        return Right(null);
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
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return NetworkFailure(message: 'Connection timeout');
      case DioExceptionType.connectionError:
        return NetworkFailure(message: 'No internet connection');
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final message = e.response?.data?['message'] ?? 'Server error';
        return ServerFailure(message: message, statusCode: statusCode);
      default:
        return ServerFailure(message: 'Unknown error occurred');
    }
  }
}