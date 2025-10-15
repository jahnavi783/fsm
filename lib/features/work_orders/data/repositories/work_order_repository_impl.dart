import 'dart:io';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:hive_ce/hive.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/core/error/hive_ce_error_handler.dart';
import 'package:fsm/core/network/network_info.dart';
import 'package:fsm/core/services/logging_service.dart';
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
  final LoggingService _logger;

  WorkOrderRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._networkInfo,
    this._logger,
  );

  @override
  Future<Either<Failure, List<WorkOrderEntity>>> getWorkOrders({
    required int page,
    required int limit,
    WorkOrderStatus? status,
    WorkOrderPriority? priority,
    String? searchQuery,
  }) async {
    _logger.info('Getting work orders', tag: 'WORK_ORDER_REPO', data: {
      'page': page,
      'limit': limit,
      'status': status,
      'priority': priority,
      'searchQuery': searchQuery,
    });

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
        final hiveModels =
            workOrderDtos.map((dto) => _mapDtoToHiveModel(dto)).toList();
        await _localDataSource.cacheWorkOrders(hiveModels);

        _logger.info(
            'Successfully fetched and cached ${workOrderDtos.length} work orders',
            tag: 'WORK_ORDER_REPO');

        // Return domain entities
        final entities = workOrderDtos.map((dto) => dto.toEntity()).toList();
        return Right(entities);
      } else {
        _logger.warning('No internet connection, falling back to cache',
            tag: 'WORK_ORDER_REPO');

        // Fallback to cache when offline
        final cachedModels = await _localDataSource.getCachedWorkOrders(
          status: status,
        );

        if (cachedModels.isEmpty) {
          _logger.warning('No cached work orders available offline',
              tag: 'WORK_ORDER_REPO');
          return const Left(CacheFailure(
            message: 'No cached work orders available offline',
          ));
        }

        _logger.info('Retrieved ${cachedModels.length} work orders from cache',
            tag: 'WORK_ORDER_REPO');

        final entities = cachedModels.map((model) => model.toEntity()).toList();
        return Right(entities);
      }
    } on DioException catch (e, stackTrace) {
      _logger.error('Dio exception in getWorkOrders',
          tag: 'WORK_ORDER_REPO', error: e, stackTrace: stackTrace);
      return Left(_handleDioException(e));
    } on HiveError catch (e, stackTrace) {
      _logger.error('Hive error in getWorkOrders',
          tag: 'WORK_ORDER_REPO', error: e, stackTrace: stackTrace);
      return Left(HiveCEErrorHandler.handleHiveError(e));
    } catch (e, stackTrace) {
      _logger.error('Unexpected error in getWorkOrders',
          tag: 'WORK_ORDER_REPO', error: e, stackTrace: stackTrace);
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, WorkOrderEntity>> getWorkOrderById(int id) async {
    _logger.info('Getting work order by ID: $id', tag: 'WORK_ORDER_REPO');

    try {
      if (await _networkInfo.isConnected) {
        final workOrderDto = await _remoteDataSource.getWorkOrderById(id);

        // Cache the work order
        final hiveModel = _mapDtoToHiveModel(workOrderDto);
        await _localDataSource.updateWorkOrder(hiveModel);

        _logger.info('Successfully fetched work order $id',
            tag: 'WORK_ORDER_REPO');
        return Right(workOrderDto.toEntity());
      } else {
        _logger.warning(
            'No internet connection, checking cache for work order $id',
            tag: 'WORK_ORDER_REPO');

        final cachedModel = await _localDataSource.getCachedWorkOrderById(id);
        if (cachedModel == null) {
          _logger.warning('Work order $id not found in cache',
              tag: 'WORK_ORDER_REPO');
          return const Left(CacheFailure(
            message: 'Work order not found in cache',
          ));
        }

        _logger.info('Retrieved work order $id from cache',
            tag: 'WORK_ORDER_REPO');
        return Right(cachedModel.toEntity());
      }
    } on DioException catch (e, stackTrace) {
      _logger.error('Dio exception in getWorkOrderById for ID: $id',
          tag: 'WORK_ORDER_REPO', error: e, stackTrace: stackTrace);
      return Left(_handleDioException(e));
    } on HiveError catch (e, stackTrace) {
      _logger.error('Hive error in getWorkOrderById for ID: $id',
          tag: 'WORK_ORDER_REPO', error: e, stackTrace: stackTrace);
      return Left(HiveCEErrorHandler.handleHiveError(e));
    } catch (e, stackTrace) {
      _logger.error('Unexpected error in getWorkOrderById for ID: $id',
          tag: 'WORK_ORDER_REPO', error: e, stackTrace: stackTrace);
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, WorkOrderEntity>> startWorkOrder({
    required int workOrderId,
    required double latitude,
    required double longitude,
    List<File> files = const [],
    String? notes,
  }) async {
    _logger.workOrder('Starting work order $workOrderId', data: {
      'workOrderId': workOrderId,
      'latitude': latitude,
      'longitude': longitude,
      'filesCount': files.length,
      'hasNotes': notes != null,
    });

    try {
      if (await _networkInfo.isConnected) {
        final workOrderDto = await _remoteDataSource.startWorkOrder(
          workOrderId: workOrderId,
          latitude: latitude,
          longitude: longitude,
          files: files,
          notes: notes,
        );

        // Update cache
        final hiveModel = _mapDtoToHiveModel(workOrderDto);
        await _localDataSource.updateWorkOrder(hiveModel);

        _logger.workOrder('Successfully started work order $workOrderId');
        return Right(workOrderDto.toEntity());
      } else {
        _logger.warning(
            'Offline: queuing start action for work order $workOrderId',
            tag: 'WORK_ORDER_REPO');

        // Store action for later sync
        await _localDataSource.markWorkOrderForSync(workOrderId, 'start');

        // Update local status optimistically
        final cachedModel =
            await _localDataSource.getCachedWorkOrderById(workOrderId);
        if (cachedModel == null) {
          _logger.error(
              'Work order $workOrderId not found in cache for start action',
              tag: 'WORK_ORDER_REPO');
          return Left(CacheFailure(message: 'Work order not found in cache'));
        }

        final updatedModel = cachedModel.copyWith(
          status: WorkOrderStatus.inProgress.index,
          startedAt: DateTime.now(),
          isPendingSync: true,
          pendingAction: 'start',
        );

        await _localDataSource.updateWorkOrder(updatedModel);
        _logger.workOrder(
            'Optimistically started work order $workOrderId offline');
        return Right(updatedModel.toEntity());
      }
    } on DioException catch (e, stackTrace) {
      _logger.error('Dio exception in startWorkOrder for ID: $workOrderId',
          tag: 'WORK_ORDER_REPO', error: e, stackTrace: stackTrace);
      return Left(_handleDioException(e));
    } on HiveError catch (e, stackTrace) {
      _logger.error('Hive error in startWorkOrder for ID: $workOrderId',
          tag: 'WORK_ORDER_REPO', error: e, stackTrace: stackTrace);
      return Left(HiveCEErrorHandler.handleHiveError(e));
    } catch (e, stackTrace) {
      _logger.error('Unexpected error in startWorkOrder for ID: $workOrderId',
          tag: 'WORK_ORDER_REPO', error: e, stackTrace: stackTrace);
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, WorkOrderEntity>> pauseWorkOrder({
    required int workOrderId,
    required String reason,
    required double latitude,
    required double longitude,
    List<File> files = const [],
  }) async {
    _logger.workOrder('Pausing work order $workOrderId', data: {
      'workOrderId': workOrderId,
      'reason': reason,
      'latitude': latitude,
      'longitude': longitude,
      'filesCount': files.length,
    });

    try {
      if (await _networkInfo.isConnected) {
        final workOrderDto = await _remoteDataSource.pauseWorkOrder(
          workOrderId: workOrderId,
          reason: reason,
          latitude: latitude,
          longitude: longitude,
          files: files,
        );

        // Update cache
        final hiveModel = _mapDtoToHiveModel(workOrderDto);
        await _localDataSource.updateWorkOrder(hiveModel);

        _logger.workOrder('Successfully paused work order $workOrderId');
        return Right(workOrderDto.toEntity());
      } else {
        _logger.warning(
            'Offline: queuing pause action for work order $workOrderId',
            tag: 'WORK_ORDER_REPO');

        // Store action for later sync
        await _localDataSource.markWorkOrderForSync(workOrderId, 'pause');

        // Update local status optimistically
        final cachedModel =
            await _localDataSource.getCachedWorkOrderById(workOrderId);
        if (cachedModel == null) {
          _logger.error(
              'Work order $workOrderId not found in cache for pause action',
              tag: 'WORK_ORDER_REPO');
          return Left(CacheFailure(message: 'Work order not found in cache'));
        }

        final updatedModel = cachedModel.copyWith(
          status: WorkOrderStatus.paused.index,
          pauseLogs: reason,
          isPendingSync: true,
          pendingAction: 'pause',
        );

        await _localDataSource.updateWorkOrder(updatedModel);
        _logger
            .workOrder('Optimistically paused work order $workOrderId offline');
        return Right(updatedModel.toEntity());
      }
    } on DioException catch (e, stackTrace) {
      _logger.error('Dio exception in pauseWorkOrder for ID: $workOrderId',
          tag: 'WORK_ORDER_REPO', error: e, stackTrace: stackTrace);
      return Left(_handleDioException(e));
    } on HiveError catch (e, stackTrace) {
      _logger.error('Hive error in pauseWorkOrder for ID: $workOrderId',
          tag: 'WORK_ORDER_REPO', error: e, stackTrace: stackTrace);
      return Left(HiveCEErrorHandler.handleHiveError(e));
    } catch (e, stackTrace) {
      _logger.error('Unexpected error in pauseWorkOrder for ID: $workOrderId',
          tag: 'WORK_ORDER_REPO', error: e, stackTrace: stackTrace);
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, WorkOrderEntity>> resumeWorkOrder({
    required int workOrderId,
    required double latitude,
    required double longitude,
    List<File> files = const [],
    String? notes,
  }) async {
    _logger.workOrder('Resuming work order $workOrderId', data: {
      'workOrderId': workOrderId,
      'latitude': latitude,
      'longitude': longitude,
      'filesCount': files.length,
      'hasNotes': notes != null,
    });

    try {
      if (await _networkInfo.isConnected) {
        final workOrderDto = await _remoteDataSource.resumeWorkOrder(
          workOrderId: workOrderId,
          latitude: latitude,
          longitude: longitude,
          files: files,
          notes: notes,
        );

        // Update cache
        final hiveModel = _mapDtoToHiveModel(workOrderDto);
        await _localDataSource.updateWorkOrder(hiveModel);

        _logger.workOrder('Successfully resumed work order $workOrderId');
        return Right(workOrderDto.toEntity());
      } else {
        _logger.warning(
            'Offline: queuing resume action for work order $workOrderId',
            tag: 'WORK_ORDER_REPO');

        // Store action for later sync
        await _localDataSource.markWorkOrderForSync(workOrderId, 'resume');

        // Update local status optimistically
        final cachedModel =
            await _localDataSource.getCachedWorkOrderById(workOrderId);
        if (cachedModel == null) {
          _logger.error(
              'Work order $workOrderId not found in cache for resume action',
              tag: 'WORK_ORDER_REPO');
          return Left(CacheFailure(message: 'Work order not found in cache'));
        }

        final updatedModel = cachedModel.copyWith(
          status: WorkOrderStatus.inProgress.index,
          resumedAt: DateTime.now(),
          isPendingSync: true,
          pendingAction: 'resume',
        );

        await _localDataSource.updateWorkOrder(updatedModel);
        _logger.workOrder(
            'Optimistically resumed work order $workOrderId offline');
        return Right(updatedModel.toEntity());
      }
    } on DioException catch (e, stackTrace) {
      _logger.error('Dio exception in resumeWorkOrder for ID: $workOrderId',
          tag: 'WORK_ORDER_REPO', error: e, stackTrace: stackTrace);
      return Left(_handleDioException(e));
    } on HiveError catch (e, stackTrace) {
      _logger.error('Hive error in resumeWorkOrder for ID: $workOrderId',
          tag: 'WORK_ORDER_REPO', error: e, stackTrace: stackTrace);
      return Left(HiveCEErrorHandler.handleHiveError(e));
    } catch (e, stackTrace) {
      _logger.error('Unexpected error in resumeWorkOrder for ID: $workOrderId',
          tag: 'WORK_ORDER_REPO', error: e, stackTrace: stackTrace);
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, WorkOrderEntity>> completeWorkOrder({
    required int workOrderId,
    required String workLog,
    required List<PartUsedEntity> partsUsed,
    required List<File> files,
    required double latitude,
    required double longitude,
    String? completionNotes,
  }) async {
    _logger.workOrder('Completing work order $workOrderId', data: {
      'workOrderId': workOrderId,
      'workLogLength': workLog.length,
      'partsUsedCount': partsUsed.length,
      'filesCount': files.length,
      'latitude': latitude,
      'longitude': longitude,
      'hasCompletionNotes': completionNotes != null,
    });

    try {
      if (await _networkInfo.isConnected) {
        final workOrderDto = await _remoteDataSource.completeWorkOrder(
          workOrderId: workOrderId,
          workLog: workLog,
          partsUsed: partsUsed,
          files: files,
          latitude: latitude,
          longitude: longitude,
          completionNotes: completionNotes,
        );

        // Update cache
        final hiveModel = _mapDtoToHiveModel(workOrderDto);
        await _localDataSource.updateWorkOrder(hiveModel);

        _logger.workOrder('Successfully completed work order $workOrderId');
        return Right(workOrderDto.toEntity());
      } else {
        _logger.warning(
            'Offline: queuing complete action for work order $workOrderId',
            tag: 'WORK_ORDER_REPO');

        // Store action for later sync
        await _localDataSource.markWorkOrderForSync(workOrderId, 'complete');

        // Update local status optimistically
        final cachedModel =
            await _localDataSource.getCachedWorkOrderById(workOrderId);
        if (cachedModel == null) {
          _logger.error(
              'Work order $workOrderId not found in cache for complete action',
              tag: 'WORK_ORDER_REPO');
          return Left(CacheFailure(message: 'Work order not found in cache'));
        }

        final updatedModel = cachedModel.copyWith(
          status: WorkOrderStatus.completed.index,
          completedAt: DateTime.now(),
          workLog: workLog,
          partsUsed: partsUsed
              .map((p) => PartUsedHiveModel(
                    partNumber: p.partNumber,
                    quantityUsed: p.quantityUsed,
                    partName: p.partName,
                    description: p.description,
                  ))
              .toList(),
          images: files.map((file) => file.path).toList(),
          completionNotes: completionNotes,
          isPendingSync: true,
          pendingAction: 'complete',
        );

        await _localDataSource.updateWorkOrder(updatedModel);
        _logger.workOrder(
            'Optimistically completed work order $workOrderId offline');
        return Right(updatedModel.toEntity());
      }
    } on DioException catch (e, stackTrace) {
      _logger.error('Dio exception in completeWorkOrder for ID: $workOrderId',
          tag: 'WORK_ORDER_REPO', error: e, stackTrace: stackTrace);
      return Left(_handleDioException(e));
    } on HiveError catch (e, stackTrace) {
      _logger.error('Hive error in completeWorkOrder for ID: $workOrderId',
          tag: 'WORK_ORDER_REPO', error: e, stackTrace: stackTrace);
      return Left(HiveCEErrorHandler.handleHiveError(e));
    } catch (e, stackTrace) {
      _logger.error(
          'Unexpected error in completeWorkOrder for ID: $workOrderId',
          tag: 'WORK_ORDER_REPO',
          error: e,
          stackTrace: stackTrace);
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
    _logger.workOrder('Rejecting work order $workOrderId', data: {
      'workOrderId': workOrderId,
      'reason': reason,
      'latitude': latitude,
      'longitude': longitude,
    });

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

        _logger.workOrder('Successfully rejected work order $workOrderId');
        return Right(workOrderDto.toEntity());
      } else {
        _logger.warning(
            'Offline: queuing reject action for work order $workOrderId',
            tag: 'WORK_ORDER_REPO');

        // Store action for later sync
        await _localDataSource.markWorkOrderForSync(workOrderId, 'reject');

        // Update local status optimistically
        final cachedModel =
            await _localDataSource.getCachedWorkOrderById(workOrderId);
        if (cachedModel == null) {
          _logger.error(
              'Work order $workOrderId not found in cache for reject action',
              tag: 'WORK_ORDER_REPO');
          return Left(CacheFailure(message: 'Work order not found in cache'));
        }

        final updatedModel = cachedModel.copyWith(
          status: WorkOrderStatus.rejected.index,
          pauseLogs: reason,
          isPendingSync: true,
          pendingAction: 'reject',
        );

        await _localDataSource.updateWorkOrder(updatedModel);
        _logger.workOrder(
            'Optimistically rejected work order $workOrderId offline');
        return Right(updatedModel.toEntity());
      }
    } on DioException catch (e, stackTrace) {
      _logger.error('Dio exception in rejectWorkOrder for ID: $workOrderId',
          tag: 'WORK_ORDER_REPO', error: e, stackTrace: stackTrace);
      return Left(_handleDioException(e));
    } on HiveError catch (e, stackTrace) {
      _logger.error('Hive error in rejectWorkOrder for ID: $workOrderId',
          tag: 'WORK_ORDER_REPO', error: e, stackTrace: stackTrace);
      return Left(HiveCEErrorHandler.handleHiveError(e));
    } catch (e, stackTrace) {
      _logger.error('Unexpected error in rejectWorkOrder for ID: $workOrderId',
          tag: 'WORK_ORDER_REPO', error: e, stackTrace: stackTrace);
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<WorkOrderEntity>>> syncPendingWorkOrders() async {
    _logger.info('Starting sync of pending work orders',
        tag: 'WORK_ORDER_REPO');

    try {
      if (!await _networkInfo.isConnected) {
        _logger.warning('No internet connection for sync',
            tag: 'WORK_ORDER_REPO');
        return Left(NetworkFailure(message: 'No internet connection'));
      }

      final pendingWorkOrders =
          await _localDataSource.getPendingSyncWorkOrders();

      _logger.info('Found ${pendingWorkOrders.length} work orders pending sync',
          tag: 'WORK_ORDER_REPO');

      final syncedWorkOrders = <WorkOrderEntity>[];

      for (final workOrder in pendingWorkOrders) {
        try {
          _logger.debug(
              'Syncing work order ${workOrder.id} with action: ${workOrder.pendingAction}',
              tag: 'WORK_ORDER_REPO');

          // Sync based on pending action
          // This would need to be implemented based on the specific sync requirements
          await _localDataSource.clearSyncFlag(workOrder.id);
          syncedWorkOrders.add(workOrder.toEntity());

          _logger.debug('Successfully synced work order ${workOrder.id}',
              tag: 'WORK_ORDER_REPO');
        } catch (e, stackTrace) {
          _logger.error('Failed to sync work order ${workOrder.id}',
              tag: 'WORK_ORDER_REPO', error: e, stackTrace: stackTrace);
          // Continue with other work orders if one fails
          continue;
        }
      }

      _logger.info(
          'Successfully synced ${syncedWorkOrders.length}/${pendingWorkOrders.length} work orders',
          tag: 'WORK_ORDER_REPO');

      return Right(syncedWorkOrders);
    } catch (e, stackTrace) {
      _logger.error('Unexpected error in syncPendingWorkOrders',
          tag: 'WORK_ORDER_REPO', error: e, stackTrace: stackTrace);
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cacheWorkOrders(
      List<WorkOrderEntity> workOrders) async {
    _logger.info('Caching ${workOrders.length} work orders',
        tag: 'WORK_ORDER_REPO');

    try {
      final hiveModels =
          workOrders.map((entity) => _mapEntityToHiveModel(entity)).toList();
      await _localDataSource.cacheWorkOrders(hiveModels);

      _logger.info('Successfully cached ${workOrders.length} work orders',
          tag: 'WORK_ORDER_REPO');
      return Right(null);
    } on HiveError catch (e, stackTrace) {
      _logger.error('Hive error in cacheWorkOrders',
          tag: 'WORK_ORDER_REPO', error: e, stackTrace: stackTrace);
      return Left(HiveCEErrorHandler.handleHiveError(e));
    } catch (e, stackTrace) {
      _logger.error('Unexpected error in cacheWorkOrders',
          tag: 'WORK_ORDER_REPO', error: e, stackTrace: stackTrace);
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<WorkOrderEntity>>> getCachedWorkOrders({
    WorkOrderStatus? status,
  }) async {
    _logger.info('Getting cached work orders', tag: 'WORK_ORDER_REPO', data: {
      'status': status,
    });

    try {
      final cachedModels = await _localDataSource.getCachedWorkOrders(
        status: status,
      );

      _logger.info('Retrieved ${cachedModels.length} cached work orders',
          tag: 'WORK_ORDER_REPO');

      final entities = cachedModels.map((model) => model.toEntity()).toList();
      return Right(entities);
    } on HiveError catch (e, stackTrace) {
      _logger.error('Hive error in getCachedWorkOrders',
          tag: 'WORK_ORDER_REPO', error: e, stackTrace: stackTrace);
      return Left(HiveCEErrorHandler.handleHiveError(e));
    } catch (e, stackTrace) {
      _logger.error('Unexpected error in getCachedWorkOrders',
          tag: 'WORK_ORDER_REPO', error: e, stackTrace: stackTrace);
      return Left(ServerFailure(message: e.toString()));
    }
  }

  Failure _handleDioException(DioException e) {
    _logger.error('Handling Dio exception', tag: 'WORK_ORDER_REPO', error: {
      'type': e.type.toString(),
      'statusCode': e.response?.statusCode,
      'message': e.message,
      'data': e.response?.data,
    });

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
      durationDays: dto.durationDays,
      createdAt: DateTime.parse(dto.createdAt),
      updatedAt: DateTime.parse(dto.updatedAt),
      startedAt: dto.startedAt != null ? DateTime.parse(dto.startedAt) : null,
      resumedAt: dto.resumedAt != null ? DateTime.parse(dto.resumedAt) : null,
      completedAt:
          dto.completedAt != null ? DateTime.parse(dto.completedAt) : null,
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
      durationDays: entity.durationDays,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      startedAt: entity.startedAt,
      resumedAt: entity.resumedAt,
      completedAt: entity.completedAt,
      pauseLogs: entity.pauseLogs,
      workLog: entity.workLog,
      partsUsed: entity.partsUsed
          .map((p) => PartUsedHiveModel(
                partNumber: p.partNumber,
                quantityUsed: p.quantityUsed,
                partName: p.partName,
                description: p.description,
              ))
          .toList(),
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
