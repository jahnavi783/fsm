import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/core/network/network_info.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/domain/repositories/i_work_order_repository.dart';
import 'package:fsm/features/work_orders/data/datasources/work_order_remote_datasource.dart';
import 'package:fsm/features/work_orders/data/datasources/work_order_local_datasource.dart';
import 'package:fsm/features/work_orders/data/models/work_order_hive_model.dart';
import 'package:fsm/features/work_orders/data/models/work_order_dto.dart';

@Injectable(as: IWorkOrderRepository)
class WorkOrderRepositoryImpl implements IWorkOrderRepository {
  final WorkOrderRemoteDataSource _remoteDataSource;
  final WorkOrderLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  WorkOrderRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, List<WorkOrderEntity>>> getWorkOrders({
    required int page,
    required int limit,
    WorkOrderStatus? status,
    WorkOrderPriority? priority,
    String? searchQuery,
  }) async {
    try {
      if (await _networkInfo.isConnected) {
        // Try remote first
        final workOrderDtos = await _remoteDataSource.getWorkOrders(
          page: page,
          limit: limit,
          status: status,
          priority: priority,
          searchQuery: searchQuery,
        );

        // Cache successful response
        final hiveModels = workOrderDtos
            .map((dto) => _mapDtoToHiveModel(dto))
            .toList();
        await _localDataSource.cacheWorkOrders(hiveModels);

        // Return domain entities
        final entities = workOrderDtos
            .map((dto) => dto.toEntity())
            .toList();
        return Right(entities);
      } else {
        // Fallback to cache when offline
        final cachedModels = await _localDataSource.getCachedWorkOrders(
          status: status,
        );

        if (cachedModels.isEmpty) {
          return const Left(CacheFailure(
            message: 'No cached work orders available offline',
          ));
        }

        final entities = cachedModels
            .map((model) => model.toEntity())
            .toList();
        return Right(entities);
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
  Future<Either<Failure, WorkOrderEntity>> getWorkOrderById(int id) async {
    try {
      if (await _networkInfo.isConnected) {
        final workOrderDto = await _remoteDataSource.getWorkOrderById(id);
        
        // Cache the work order
        final hiveModel = _mapDtoToHiveModel(workOrderDto);
        await _localDataSource.updateWorkOrder(hiveModel);
        
        return Right(workOrderDto.toEntity());
      } else {
        final cachedModel = await _localDataSource.getCachedWorkOrderById(id);
        if (cachedModel == null) {
          return const Left(CacheFailure(
            message: 'Work order not found in cache',
          ));
        }
        return Right(cachedModel.toEntity());
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
  Future<Either<Failure, WorkOrderEntity>> startWorkOrder({
    required int workOrderId,
    required double latitude,
    required double longitude,
    String? notes,
  }) async {
    try {
      if (await _networkInfo.isConnected) {
        final workOrderDto = await _remoteDataSource.startWorkOrder(
          workOrderId: workOrderId,
          latitude: latitude,
          longitude: longitude,
          notes: notes,
        );
        
        // Update cache
        final hiveModel = _mapDtoToHiveModel(workOrderDto);
        await _localDataSource.updateWorkOrder(hiveModel);
        
        return Right(workOrderDto.toEntity());
      } else {
        // Store action for later sync
        await _localDataSource.markWorkOrderForSync(workOrderId, 'start');
        
        // Update local status optimistically
        final cachedModel = await _localDataSource.getCachedWorkOrderById(workOrderId);
        if (cachedModel == null) {
          return Left(CacheFailure(message: 'Work order not found in cache'));
        }
        
        final updatedModel = cachedModel.copyWith(
          status: WorkOrderStatus.inProgress.index,
          startedAt: DateTime.now(),
          isPendingSync: true,
          pendingAction: 'start',
        );
        
        await _localDataSource.updateWorkOrder(updatedModel);
        return Right(updatedModel.toEntity());
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
  Future<Either<Failure, WorkOrderEntity>> pauseWorkOrder({
    required int workOrderId,
    required String reason,
    required double latitude,
    required double longitude,
  }) async {
    try {
      if (await _networkInfo.isConnected) {
        final workOrderDto = await _remoteDataSource.pauseWorkOrder(
          workOrderId: workOrderId,
          reason: reason,
          latitude: latitude,
          longitude: longitude,
        );
        
        // Update cache
        final hiveModel = _mapDtoToHiveModel(workOrderDto);
        await _localDataSource.updateWorkOrder(hiveModel);
        
        return Right(workOrderDto.toEntity());
      } else {
        // Store action for later sync
        await _localDataSource.markWorkOrderForSync(workOrderId, 'pause');
        
        // Update local status optimistically
        final cachedModel = await _localDataSource.getCachedWorkOrderById(workOrderId);
        if (cachedModel == null) {
          return Left(CacheFailure(message: 'Work order not found in cache'));
        }
        
        final updatedModel = cachedModel.copyWith(
          status: WorkOrderStatus.paused.index,
          pauseLogs: reason,
          isPendingSync: true,
          pendingAction: 'pause',
        );
        
        await _localDataSource.updateWorkOrder(updatedModel);
        return Right(updatedModel.toEntity());
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
  Future<Either<Failure, WorkOrderEntity>> resumeWorkOrder({
    required int workOrderId,
    required double latitude,
    required double longitude,
    String? notes,
  }) async {
    try {
      if (await _networkInfo.isConnected) {
        final workOrderDto = await _remoteDataSource.resumeWorkOrder(
          workOrderId: workOrderId,
          latitude: latitude,
          longitude: longitude,
          notes: notes,
        );
        
        // Update cache
        final hiveModel = _mapDtoToHiveModel(workOrderDto);
        await _localDataSource.updateWorkOrder(hiveModel);
        
        return Right(workOrderDto.toEntity());
      } else {
        // Store action for later sync
        await _localDataSource.markWorkOrderForSync(workOrderId, 'resume');
        
        // Update local status optimistically
        final cachedModel = await _localDataSource.getCachedWorkOrderById(workOrderId);
        if (cachedModel == null) {
          return Left(CacheFailure(message: 'Work order not found in cache'));
        }
        
        final updatedModel = cachedModel.copyWith(
          status: WorkOrderStatus.inProgress.index,
          resumedAt: DateTime.now(),
          isPendingSync: true,
          pendingAction: 'resume',
        );
        
        await _localDataSource.updateWorkOrder(updatedModel);
        return Right(updatedModel.toEntity());
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
  Future<Either<Failure, WorkOrderEntity>> completeWorkOrder({
    required int workOrderId,
    required String workLog,
    required List<PartUsedEntity> partsUsed,
    required List<String> images,
    required double latitude,
    required double longitude,
    String? completionNotes,
  }) async {
    try {
      if (await _networkInfo.isConnected) {
        final workOrderDto = await _remoteDataSource.completeWorkOrder(
          workOrderId: workOrderId,
          workLog: workLog,
          partsUsed: partsUsed,
          images: images,
          latitude: latitude,
          longitude: longitude,
          completionNotes: completionNotes,
        );
        
        // Update cache
        final hiveModel = _mapDtoToHiveModel(workOrderDto);
        await _localDataSource.updateWorkOrder(hiveModel);
        
        return Right(workOrderDto.toEntity());
      } else {
        // Store action for later sync
        await _localDataSource.markWorkOrderForSync(workOrderId, 'complete');
        
        // Update local status optimistically
        final cachedModel = await _localDataSource.getCachedWorkOrderById(workOrderId);
        if (cachedModel == null) {
          return Left(CacheFailure(message: 'Work order not found in cache'));
        }
        
        final updatedModel = cachedModel.copyWith(
          status: WorkOrderStatus.completed.index,
          completedAt: DateTime.now(),
          workLog: workLog,
          partsUsed: partsUsed.map((p) => PartUsedHiveModel(
            partNumber: p.partNumber,
            quantityUsed: p.quantityUsed,
            partName: p.partName,
            description: p.description,
          )).toList(),
          images: images,
          completionNotes: completionNotes,
          isPendingSync: true,
          pendingAction: 'complete',
        );
        
        await _localDataSource.updateWorkOrder(updatedModel);
        return Right(updatedModel.toEntity());
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
  Future<Either<Failure, WorkOrderEntity>> rejectWorkOrder({
    required int workOrderId,
    required String reason,
    required double latitude,
    required double longitude,
  }) async {
    try {
      if (await _networkInfo.isConnected) {
        final workOrderDto = await _remoteDataSource.rejectWorkOrder(
          workOrderId: workOrderId,
          reason: reason,
          latitude: latitude,
          longitude: longitude,
        );
        
        // Update cache
        final hiveModel = _mapDtoToHiveModel(workOrderDto);
        await _localDataSource.updateWorkOrder(hiveModel);
        
        return Right(workOrderDto.toEntity());
      } else {
        // Store action for later sync
        await _localDataSource.markWorkOrderForSync(workOrderId, 'reject');
        
        // Update local status optimistically
        final cachedModel = await _localDataSource.getCachedWorkOrderById(workOrderId);
        if (cachedModel == null) {
          return Left(CacheFailure(message: 'Work order not found in cache'));
        }
        
        final updatedModel = cachedModel.copyWith(
          status: WorkOrderStatus.rejected.index,
          pauseLogs: reason,
          isPendingSync: true,
          pendingAction: 'reject',
        );
        
        await _localDataSource.updateWorkOrder(updatedModel);
        return Right(updatedModel.toEntity());
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
  Future<Either<Failure, List<WorkOrderEntity>>> syncPendingWorkOrders() async {
    try {
      if (!await _networkInfo.isConnected) {
        return Left(NetworkFailure(message: 'No internet connection'));
      }

      final pendingWorkOrders = await _localDataSource.getPendingSyncWorkOrders();
      final syncedWorkOrders = <WorkOrderEntity>[];

      for (final workOrder in pendingWorkOrders) {
        try {
          // Sync based on pending action
          // This would need to be implemented based on the specific sync requirements
          await _localDataSource.clearSyncFlag(workOrder.id);
          syncedWorkOrders.add(workOrder.toEntity());
        } catch (e) {
          // Continue with other work orders if one fails
          continue;
        }
      }

      return Right(syncedWorkOrders);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cacheWorkOrders(List<WorkOrderEntity> workOrders) async {
    try {
      final hiveModels = workOrders
          .map((entity) => _mapEntityToHiveModel(entity))
          .toList();
      await _localDataSource.cacheWorkOrders(hiveModels);
      return Right(null);
    } on HiveError catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<WorkOrderEntity>>> getCachedWorkOrders({
    WorkOrderStatus? status,
  }) async {
    try {
      final cachedModels = await _localDataSource.getCachedWorkOrders(
        status: status,
      );
      final entities = cachedModels
          .map((model) => model.toEntity())
          .toList();
      return Right(entities);
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

  WorkOrderHiveModel _mapDtoToHiveModel(dynamic dto) {
    // This is a simplified mapping - in a real implementation,
    // you would need to properly map all fields from DTO to Hive model
    return WorkOrderHiveModel(
      id: dto.id,
      woNumber: dto.woNumber,
      srId: dto.srId,
      summary: dto.summary,
      problemDescription: dto.problemDescription,
      priority: _mapPriorityToIndex(dto.priority),
      visitDate: DateTime.parse(dto.visitDate),
      location: dto.location,
      status: _mapStatusToIndex(dto.status),
      duration: dto.duration,
      createdAt: DateTime.parse(dto.createdAt),
      updatedAt: DateTime.parse(dto.updatedAt),
      startedAt: dto.startedAt != null ? DateTime.parse(dto.startedAt) : null,
      resumedAt: dto.resumedAt != null ? DateTime.parse(dto.resumedAt) : null,
      completedAt: dto.completedAt != null ? DateTime.parse(dto.completedAt) : null,
      pauseLogs: dto.pauseLogs,
      workLog: dto.workLog,
      partsUsed: [], // Map from DTO
      images: dto.images ?? [],
      cachedAt: DateTime.now(),
      isPendingSync: false,
    );
  }

  WorkOrderHiveModel _mapEntityToHiveModel(WorkOrderEntity entity) {
    return WorkOrderHiveModel(
      id: entity.id,
      woNumber: entity.woNumber,
      srId: entity.srId,
      summary: entity.summary,
      problemDescription: entity.problemDescription,
      priority: entity.priority.index,
      visitDate: entity.visitDate,
      location: entity.location,
      status: entity.status.index,
      duration: entity.duration,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      startedAt: entity.startedAt,
      resumedAt: entity.resumedAt,
      completedAt: entity.completedAt,
      pauseLogs: entity.pauseLogs,
      workLog: entity.workLog,
      partsUsed: entity.partsUsed.map((p) => PartUsedHiveModel(
        partNumber: p.partNumber,
        quantityUsed: p.quantityUsed,
        partName: p.partName,
        description: p.description,
      )).toList(),
      images: entity.images,
      cachedAt: DateTime.now(),
      isPendingSync: false,
    );
  }

  int _mapStatusToIndex(String status) {
    switch (status.toLowerCase()) {
      case 'new':
        return WorkOrderStatus.created.index;
      case 'assigned':
        return WorkOrderStatus.assigned.index;
      case 'in progress':
        return WorkOrderStatus.inProgress.index;
      case 'paused':
        return WorkOrderStatus.paused.index;
      case 'completed':
        return WorkOrderStatus.completed.index;
      case 'rejected':
        return WorkOrderStatus.rejected.index;
      case 'reassigned':
        return WorkOrderStatus.reAssigned.index;
      default:
        return WorkOrderStatus.assigned.index;
    }
  }

  int _mapPriorityToIndex(String priority) {
    switch (priority.toLowerCase()) {
      case 'low':
        return WorkOrderPriority.low.index;
      case 'medium':
        return WorkOrderPriority.medium.index;
      case 'high':
        return WorkOrderPriority.high.index;
      case 'urgent':
        return WorkOrderPriority.urgent.index;
      default:
        return WorkOrderPriority.medium.index;
    }
  }
}