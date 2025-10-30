import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/part_entity.dart';
import '../../domain/repositories/i_parts_repository.dart';
import '../datasources/parts_remote_datasource.dart';
import '../datasources/parts_local_datasource.dart';
import '../models/part_dto.dart';
import '../models/part_hive_model.dart';

@Injectable(as: IPartsRepository)
class PartsRepositoryImpl implements IPartsRepository {
  final PartsRemoteDataSource _remoteDataSource;
  final PartsLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  PartsRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, List<PartEntity>>> getParts({
    String? category,
    PartStatus? status,
    String? searchQuery,
  }) async {
    try {
      if (await _networkInfo.isConnected) {
        // Try remote first
        final response = await _remoteDataSource.getParts();

        // Convert DTOs to entities
        var entities = response.parts.map((dto) => dto.toEntity()).toList();

        // Apply filters
        if (category != null) {
          entities = entities
              .where((part) =>
                  part.category.toLowerCase() == category.toLowerCase())
              .toList();
        }

        if (status != null) {
          entities = entities.where((part) => part.status == status).toList();
        }

        if (searchQuery != null && searchQuery.isNotEmpty) {
          final query = searchQuery.toLowerCase();
          entities = entities
              .where((part) =>
                  part.partNumber.toLowerCase().contains(query) ||
                  part.partName.toLowerCase().contains(query))
              .toList();
        }

        // Cache successful response
        final hiveModels = response.parts
            .map((dto) => PartHiveModelX.fromEntity(dto.toEntity()))
            .toList();
        await _localDataSource.cacheParts(hiveModels);

        return Right(entities);
      } else {
        // Fallback to cache when offline
        final cachedModels = await _localDataSource.getCachedParts(
          category: category,
          status: status,
          searchQuery: searchQuery,
        );

        if (cachedModels.isEmpty) {
          return const Left(CacheFailure(
            message: 'No cached parts available offline',
          ));
        }

        final entities = cachedModels.map((model) => model.toEntity()).toList();
        return Right(entities);
      }
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PartEntity>> checkPartAvailability(
      String query) async {
    try {
      if (await _networkInfo.isConnected) {
        final dto = await _remoteDataSource.checkPartAvailability(query);

        // Cache the part
        final entity = dto.toEntity();
        final hiveModel = PartHiveModelX.fromEntity(entity);
        final cachedParts = await _localDataSource.getCachedParts();
        await _localDataSource.cacheParts([...cachedParts, hiveModel]);

        return Right(dto.toEntity());
      } else {
        // Search in cache for the query
        final cachedModels = await _localDataSource.getCachedParts(
          searchQuery: query,
        );

        if (cachedModels.isEmpty) {
          return const Left(CacheFailure(
            message: 'Part not found in cache',
          ));
        }

        return Right(cachedModels.first.toEntity());
      }
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PartEntity>>> searchParts({
    required String query,
  }) async {
    try {
      if (await _networkInfo.isConnected) {
        final parts = await _remoteDataSource.searchParts(query: query);
        final entities = parts.map((dto) => dto.toEntity()).toList();
        return Right(entities);
      } else {
        // Search in cached data
        final cachedModels = await _localDataSource.getCachedParts(
          searchQuery: query,
        );

        final entities = cachedModels.map((model) => model.toEntity()).toList();
        return Right(entities);
      }
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PartEntity>>> getLowStockParts() async {
    try {
      if (await _networkInfo.isConnected) {
        final parts = await _remoteDataSource.getLowStockParts();
        final entities = parts.map((dto) => dto.toEntity()).toList();
        return Right(entities);
      } else {
        // Get low stock parts from cache
        final cachedModels = await _localDataSource.getCachedParts();
        final lowStockParts = cachedModels
            .map((model) => model.toEntity())
            .where((entity) => entity.isLowStock)
            .toList();
        return Right(lowStockParts);
      }
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getPartCategories() async {
    try {
      if (await _networkInfo.isConnected) {
        try {
          final categories = await _remoteDataSource.getPartCategories();
          return Right(categories);
        } catch (e) {
          // If remote fails, fallback to cache
          final cachedModels = await _localDataSource.getCachedParts();
          final categories = cachedModels
              .map((model) => model.category)
              .toSet()
              .toList()
            ..sort();
          return Right(categories);
        }
      } else {
        // Get categories from cached parts
        final cachedModels = await _localDataSource.getCachedParts();
        final categories = cachedModels
            .map((model) => model.category)
            .toSet()
            .toList()
          ..sort();
        return Right(categories);
      }
    } on DioException catch (e) {
      // Fallback to cache even on network errors
      try {
        final cachedModels = await _localDataSource.getCachedParts();
        final categories = cachedModels
            .map((model) => model.category)
            .toSet()
            .toList()
          ..sort();
        return Right(categories);
      } catch (_) {
        return Left(_handleDioException(e));
      }
    } catch (e) {
      // Final fallback - return empty list or cached data
      try {
        final cachedModels = await _localDataSource.getCachedParts();
        final categories = cachedModels
            .map((model) => model.category)
            .toSet()
            .toList()
          ..sort();
        return Right(categories);
      } catch (_) {
        return Left(ServerFailure(message: e.toString()));
      }
    }
  }

  Failure _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return const NetworkFailure(message: 'Connection timeout');
      case DioExceptionType.connectionError:
        return const NetworkFailure(message: 'No internet connection');
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        String message = 'Server error';
        try {
          final data = e.response?.data;
          if (data != null) {
            if (data is Map) {
              // Handle both Map<String, dynamic> and Map<String, Object?>
              final messageValue = data.containsKey('message') 
                  ? data['message'] 
                  : null;
              message = messageValue?.toString() ?? 'Server error';
            } else if (data is String) {
              message = data;
            } else {
              message = data.toString();
            }
          }
        } catch (error) {
          message = 'Server error: ${error.toString()}';
        }
        return ServerFailure(message: message, statusCode: statusCode);
      default:
        return const ServerFailure(message: 'Unknown error occurred');
    }
  }
}
