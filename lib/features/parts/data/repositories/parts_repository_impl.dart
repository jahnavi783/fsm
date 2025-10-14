import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/part_entity.dart';
import '../../domain/entities/inventory_entity.dart';
import '../../domain/repositories/i_parts_repository.dart';
import '../datasources/parts_remote_datasource.dart';
import '../datasources/parts_local_datasource.dart';
import '../models/part_hive_model.dart';
import '../models/inventory_dto.dart';

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
    required int page,
    required int limit,
    String? category,
    PartStatus? status,
    String? searchQuery,
  }) async {
    try {
      if (await _networkInfo.isConnected) {
        // Try remote first
        final response = await _remoteDataSource.getParts(
          page: page,
          limit: limit,
          category: category,
          status: status?.name,
          searchQuery: searchQuery,
        );

        // Cache successful response
        final hiveModels = response.parts
            .map((dto) => PartHiveModel.fromEntity(dto.toEntity()))
            .toList();
        await _localDataSource.cacheParts(hiveModels);

        // Return domain entities
        final entities = response.parts.map((dto) => dto.toEntity()).toList();
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
  Future<Either<Failure, PartEntity>> getPartById(int id) async {
    try {
      if (await _networkInfo.isConnected) {
        final dto = await _remoteDataSource.getPartById(id);
        
        // Cache the part
        final hiveModel = PartHiveModel.fromEntity(dto.toEntity());
        final box = await _localDataSource.getCachedParts();
        await _localDataSource.cacheParts([...box, hiveModel]);

        return Right(dto.toEntity());
      } else {
        final cachedModel = await _localDataSource.getCachedPartById(id);
        if (cachedModel == null) {
          return const Left(CacheFailure(
            message: 'Part not found in cache',
          ));
        }
        return Right(cachedModel.toEntity());
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
    String? category,
    PartStatus? status,
  }) async {
    try {
      if (await _networkInfo.isConnected) {
        final response = await _remoteDataSource.searchParts(
          query: query,
          category: category,
          status: status?.name,
        );

        final entities = response.parts.map((dto) => dto.toEntity()).toList();
        return Right(entities);
      } else {
        // Search in cached data
        final cachedModels = await _localDataSource.getCachedParts(
          category: category,
          status: status,
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
        final response = await _remoteDataSource.getLowStockParts();
        final entities = response.parts.map((dto) => dto.toEntity()).toList();
        return Right(entities);
      } else {
        // Get low stock parts from cache
        final cachedModels = await _localDataSource.getCachedParts();
        final lowStockParts = cachedModels
            .where((model) => model.quantityAvailable <= model.minQuantity)
            .map((model) => model.toEntity())
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
        final categories = await _remoteDataSource.getPartCategories();
        return Right(categories);
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
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, InventoryEntity>> getInventoryByPartId(int partId) async {
    try {
      if (await _networkInfo.isConnected) {
        final dto = await _remoteDataSource.getInventoryByPartId(partId);
        
        // Cache the inventory item
        final hiveModel = InventoryHiveModel.fromEntity(dto.toEntity());
        final existingInventory = await _localDataSource.getCachedInventory();
        await _localDataSource.cacheInventory([
          ...existingInventory.where((item) => item.partId != partId),
          hiveModel,
        ]);

        return Right(dto.toEntity());
      } else {
        final cachedModel = await _localDataSource.getCachedInventoryByPartId(partId);
        if (cachedModel == null) {
          return const Left(CacheFailure(
            message: 'Inventory not found in cache',
          ));
        }
        return Right(cachedModel.toEntity());
      }
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<InventoryEntity>>> getInventoryList({
    required int page,
    required int limit,
    bool? lowStockOnly,
  }) async {
    try {
      if (await _networkInfo.isConnected) {
        final response = await _remoteDataSource.getInventoryList(
          page: page,
          limit: limit,
          lowStockOnly: lowStockOnly,
        );

        // Cache successful response
        final hiveModels = response.inventory
            .map((dto) => InventoryHiveModel.fromEntity(dto.toEntity()))
            .toList();
        await _localDataSource.cacheInventory(hiveModels);

        final entities = response.inventory.map((dto) => dto.toEntity()).toList();
        return Right(entities);
      } else {
        final cachedModels = await _localDataSource.getCachedInventory(
          lowStockOnly: lowStockOnly,
        );

        if (cachedModels.isEmpty) {
          return const Left(CacheFailure(
            message: 'No cached inventory available offline',
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
  Future<Either<Failure, void>> updateInventory({
    required int partId,
    required int quantityChange,
    required InventoryUpdateType type,
    required String reason,
    String? workOrderId,
    String? notes,
  }) async {
    try {
      if (await _networkInfo.isConnected) {
        await _remoteDataSource.updateInventory(
          partId: partId,
          quantityChange: quantityChange,
          type: type,
          reason: reason,
          workOrderId: workOrderId,
          notes: notes,
        );

        // Update cached inventory
        final cachedInventory = await _localDataSource.getCachedInventoryByPartId(partId);
        if (cachedInventory != null) {
          final newQuantity = cachedInventory.quantity + quantityChange;
          await _localDataSource.updateCachedInventory(partId, newQuantity);
        }

        return const Right(null);
      } else {
        // Store update for later sync when online
        final cachedInventory = await _localDataSource.getCachedInventoryByPartId(partId);
        if (cachedInventory != null) {
          final newQuantity = cachedInventory.quantity + quantityChange;
          await _localDataSource.updateCachedInventory(partId, newQuantity);
        }

        // TODO: Store pending update for sync when online
        return const Right(null);
      }
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<InventoryUpdateEntity>>> getInventoryHistory({
    required int partId,
    required int page,
    required int limit,
  }) async {
    try {
      if (await _networkInfo.isConnected) {
        final dtos = await _remoteDataSource.getInventoryHistory(
          partId: partId,
          page: page,
          limit: limit,
        );

        final entities = dtos.map((dto) => dto.toEntity()).toList();
        return Right(entities);
      } else {
        return const Left(NetworkFailure(
          message: 'Inventory history requires internet connection',
        ));
      }
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
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
        final message = e.response?.data?['message'] ?? 'Server error';
        return ServerFailure(message: message, statusCode: statusCode);
      default:
        return const ServerFailure(message: 'Unknown error occurred');
    }
  }
}