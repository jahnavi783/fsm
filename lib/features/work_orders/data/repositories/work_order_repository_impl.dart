import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/core/error/hive_ce_error_handler.dart';
import 'package:fsm/core/network/network_info.dart';
import 'package:fsm/core/services/logging_service.dart';
import 'package:fsm/features/work_orders/data/datasources/work_order_local_datasource.dart';
import 'package:fsm/features/work_orders/data/datasources/work_order_remote_datasource.dart';
import 'package:fsm/features/work_orders/data/models/work_order_dto.dart';
import 'package:fsm/features/work_orders/data/models/work_order_grouped_images_response_dto.dart';
import 'package:fsm/features/work_orders/data/models/work_order_hive_model.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_grouped_images_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/work_orders_data.dart';
import 'package:fsm/features/work_orders/domain/repositories/i_work_order_repository.dart';
import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../models/work_log_hive_model.dart';
import '../services/background_sync_service.dart'; // contains OfflineSyncService
import '../services/local_user_store.dart';
import '../services/offline_queue_service.dart';
import '../services/offline_request.dart';

@Injectable(as: IWorkOrderRepository)
class WorkOrderRepositoryImpl implements IWorkOrderRepository {
  final WorkOrderRemoteDataSource _remoteDataSource;
  final WorkOrderLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;
  final LoggingService _logger;
  final LocalUserStore _userStore;

  WorkOrderRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._networkInfo,
    this._logger,
    this._userStore,
  );

  static const _uuid = Uuid();

  /// Stores files locally and returns their paths
  Future<List<String>> _storeFilesLocally(
    List<File> files,
    String workOrderId,
    String action,
  ) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final offlineFilesDir = Directory(
        path.join(appDir.path, 'offline_files', workOrderId, action),
      );

      if (!await offlineFilesDir.exists()) {
        await offlineFilesDir.create(recursive: true);
      }

      final List<String> storedPaths = [];

      for (int i = 0; i < files.length; i++) {
        final file = files[i];
        final fileName = path.basename(file.path);
        final timestamp = DateTime.now().millisecondsSinceEpoch;
        final newFileName = '${timestamp}_$i\_$fileName';
        final newPath = path.join(offlineFilesDir.path, newFileName);

        // Copy file to offline storage
        await file.copy(newPath);
        storedPaths.add(newPath);

        _logger.debug(
          'Stored file locally: $newPath',
          tag: 'WORK_ORDER_REPO',
        );
      }

      return storedPaths;
    } catch (e, stackTrace) {
      _logger.error(
        'Error storing files locally',
        tag: 'WORK_ORDER_REPO',
        error: e,
        stackTrace: stackTrace,
      );
      return [];
    }
  }

  /// Retrieves stored files from local paths
  Future<List<File>> _retrieveStoredFiles(List<String> filePaths) async {
    final List<File> files = [];

    for (final filePath in filePaths) {
      try {
        final file = File(filePath);
        if (await file.exists()) {
          files.add(file);
        } else {
          _logger.warning(
            'Stored file not found: $filePath',
            tag: 'WORK_ORDER_REPO',
          );
        }
      } catch (e) {
        _logger.error(
          'Error retrieving file: $filePath',
          tag: 'WORK_ORDER_REPO',
          error: e,
        );
      }
    }

    return files;
  }

  /// Cleans up stored files after successful sync
  Future<void> _cleanupStoredFiles(String workOrderId, String action) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final offlineFilesDir = Directory(
        path.join(appDir.path, 'offline_files', workOrderId, action),
      );

      if (await offlineFilesDir.exists()) {
        await offlineFilesDir.delete(recursive: true);
        _logger.debug(
          'Cleaned up offline files for WO $workOrderId action $action',
          tag: 'WORK_ORDER_REPO',
        );
      }
    } catch (e, stackTrace) {
      _logger.error(
        'Error cleaning up stored files',
        tag: 'WORK_ORDER_REPO',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  void init() {
    // Register callback to fetch fresh data after sync
    OfflineSyncService.instance.setWorkOrderSyncCallback((workOrderId) async {
      try {
        final freshDto = await _remoteDataSource.getWorkOrderById(workOrderId);
        await _updateWorkOrderSafely(freshDto);
      } catch (e) {
        debugPrint(' Failed to fetch fresh data: $e');
      }
    });
  }

  Future<void> _updateWorkOrderSafely(WorkOrderDto dto) async {
    final serverModel = await _mapDtoToHiveModel(dto);
    final localModel = await _localDataSource.getCachedWorkOrderById(dto.id);

    if (localModel == null) {
      await _localDataSource.updateWorkOrder(serverModel);
      return;
    }

    // FIX: Merge work logs properly using timestamp + action as unique key
    final Map<int, WorkLogHiveModel> uniqueLogs = {};

    // Add server logs first
    for (final log in serverModel.workLogs ?? const []) {
      uniqueLogs[log.timestamp.millisecondsSinceEpoch] = log;
    }

    // Add local logs (only if not already present from server)
    for (final log in localModel.workLogs ?? const []) {
      final timestamp = log.timestamp.millisecondsSinceEpoch;
      if (!uniqueLogs.containsKey(timestamp)) {
        uniqueLogs[timestamp] = log;
      }
    }

    // Sort by timestamp
    final mergedLogs = uniqueLogs.values.toList()
      ..sort((a, b) => a.timestamp.compareTo(b.timestamp));

    // Count pauses from merged logs
    final mergedPauseCount =
        mergedLogs.where((l) => l.action == 'pause').length;

    final merged = localModel.copyWith(
      status: serverModel.status,
      pauseCount: mergedPauseCount,
      pauseLogs: serverModel.pauseLogs, // Use server pause logs
      startedAt: serverModel.startedAt,
      resumedAt: serverModel.resumedAt,
      completedAt: serverModel.completedAt,
      workLog: serverModel.workLog,
      images: serverModel.images,
      partsUsed: serverModel.partsUsed,
      isPendingSync: false,
      workLogs: mergedLogs,
    );

    await _localDataSource.updateWorkOrder(merged);
  } // ---------------------------------------------------------------------------

  // FETCH LIST
  // ---------------------------------------------------------------------------
  @override
  Future<Either<Failure, WorkOrdersData>> getWorkOrders({
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
        // Online: remote + cache
        final response = await _remoteDataSource.getWorkOrders(
          // page: page,
          // limit: limit,
          page: 1,
          limit: 1000,
          status: status,
          priority: priority,
          searchQuery: searchQuery,
        );

        final allWorkOrders = [
          ...response.workOrders,
          ...response.unassignedWorkOrders,
        ];
        for (final dto in allWorkOrders) {
          await _updateWorkOrderSafely(dto);
        }

        _logger.info(
          'Successfully fetched and cached ${allWorkOrders.length} work orders '
          '(${response.workOrders.length} assigned, ${response.unassignedWorkOrders.length} unassigned)',
          tag: 'WORK_ORDER_REPO',
        );

        final workOrdersData = WorkOrdersData(
          workOrders: response.workOrders.map((dto) => dto.toEntity()).toList(),
          unassignedWorkOrders: response.unassignedWorkOrders
              .map((dto) => dto.toEntity())
              .toList(),
          total: response.total,
          page: 1,
          pages: 1,
          unassignedCount: response.unassignedCount,
        );
        return Right(workOrdersData);
      } else {
        _logger.warning(
          'No internet connection, falling back to cache',
          tag: 'WORK_ORDER_REPO',
        );

        final cachedModels =
            await _localDataSource.getCachedWorkOrders(status: status);

        final currentUserId = await _userStore.getUserId();
        final filtered =
            cachedModels.where((m) => m.userId == currentUserId).toList();

        _logger.info(
          'Filtered ${filtered.length} work orders for user $currentUserId',
          tag: 'WORK_ORDER_REPO',
        );

        if (filtered.isEmpty) {
          _logger.warning(
            'No cached work orders available offline for this user',
            tag: 'WORK_ORDER_REPO',
          );
          return const Left(
            CacheFailure(message: 'No cached work orders available offline'),
          );
        }

        final entities = filtered.map((m) => m.toEntity()).toList();

        final assignedEntities =
            entities.where((e) => e.status != WorkOrderStatus.created).toList();
        final unassignedEntities =
            entities.where((e) => e.status == WorkOrderStatus.created).toList();

        final workOrdersData = WorkOrdersData(
          workOrders: assignedEntities,
          unassignedWorkOrders: unassignedEntities,
          total: entities.length,
          page: 1,
          pages: 1,
          unassignedCount: unassignedEntities.length,
        );
        return Right(workOrdersData);
      }
    } on DioException catch (e, stackTrace) {
      _logger.error(
        'Dio exception in getWorkOrders',
        tag: 'WORK_ORDER_REPO',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(_handleDioException(e));
    } on HiveError catch (e, stackTrace) {
      _logger.error(
        'Hive error in getWorkOrders',
        tag: 'WORK_ORDER_REPO',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(HiveCEErrorHandler.handleHiveError(e));
    } catch (e, stackTrace) {
      _logger.error(
        'Unexpected error in getWorkOrders',
        tag: 'WORK_ORDER_REPO',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(ServerFailure(message: e.toString()));
    }
  }

  // ---------------------------------------------------------------------------
  // FETCH BY ID
  // ---------------------------------------------------------------------------
  @override
  Future<Either<Failure, WorkOrderEntity>> getWorkOrderById(int id) async {
    _logger.info('Getting work order by ID: $id', tag: 'WORK_ORDER_REPO');

    try {
      final cachedModel = await _localDataSource.getCachedWorkOrderById(id);
      if (await _networkInfo.isConnected) {
        final workOrderDto = await _remoteDataSource.getWorkOrderById(id);

        // final hiveModel = await _mapDtoToHiveModel(workOrderDto);
        // await _localDataSource.updateWorkOrder(hiveModel);
        if (cachedModel == null || cachedModel.isPendingSync == false) {
          await _updateWorkOrderSafely(workOrderDto);
        }

        _logger.info(
          'Successfully fetched work order $id',
          tag: 'WORK_ORDER_REPO',
        );
        final updated = await _localDataSource.getCachedWorkOrderById(id);
        return Right(workOrderDto.toEntity());
      } else {
        _logger.warning(
          'No internet connection, checking cache for work order $id',
          tag: 'WORK_ORDER_REPO',
        );

        final cachedModel = await _localDataSource.getCachedWorkOrderById(id);
        if (cachedModel == null) {
          _logger.warning(
            'Work order $id not found in cache',
            tag: 'WORK_ORDER_REPO',
          );
          return const Left(
            CacheFailure(message: 'Work order not found in cache'),
          );
        }

        _logger.info(
          'Retrieved work order $id from cache',
          tag: 'WORK_ORDER_REPO',
        );
        return Right(cachedModel.toEntity());
      }
    } on DioException catch (e, stackTrace) {
      _logger.error(
        'Dio exception in getWorkOrderById for ID: $id',
        tag: 'WORK_ORDER_REPO',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(_handleDioException(e));
    } on HiveError catch (e, stackTrace) {
      _logger.error(
        'Hive error in getWorkOrderById for ID: $id',
        tag: 'WORK_ORDER_REPO',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(HiveCEErrorHandler.handleHiveError(e));
    } catch (e, stackTrace) {
      _logger.error(
        'Unexpected error in getWorkOrderById for ID: $id',
        tag: 'WORK_ORDER_REPO',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(ServerFailure(message: e.toString()));
    }
  }

  // ---------------------------------------------------------------------------
  // START
  // ---------------------------------------------------------------------------
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

        await _updateWorkOrderSafely(workOrderDto);

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

        final now = DateTime.now();
        final storedFilePaths = await _storeFilesLocally(
          files,
          workOrderId.toString(),
          'start',
        );

        final updatedModel = cachedModel.copyWith(
          status: WorkOrderStatus.inProgress.index,
          startedAt: now,
          workLogs: [
            ...(cachedModel.workLogs ?? []),
            WorkLogHiveModel(
                action: 'start',
                timestamp: now,
                notes: notes,
                latitude: latitude,
                longitude: longitude,
                imageUrls: storedFilePaths),
          ],
        );
        await _localDataSource.updateWorkOrder(updatedModel);

        final req = OfflineRequest(
          id: _uuid.v4(),
          url: '/work-orders/$workOrderId/start',
          method: 'PATCH',
          body: {
            'gps_coordinates': '[$longitude, $latitude]',
            'file_paths': storedFilePaths,
            if (notes != null) 'comments': notes,
          },
          description: 'Start work order #$workOrderId',
          headers: {},
          sequenceNumber: now.millisecondsSinceEpoch,
          workOrderId: workOrderId.toString(),
        );

        await OfflineQueueService.instance.enqueue(req);
        await OfflineSyncService.instance
            .notifyQueued('Start work order #$workOrderId');

        _logger.workOrder(
          'Optimistically started work order $workOrderId offline',
        );
        return Right(updatedModel.toEntity());
      }
    } on DioException catch (e, stackTrace) {
      _logger.error(
        'Dio exception in startWorkOrder for ID: $workOrderId',
        tag: 'WORK_ORDER_REPO',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(_handleDioException(e));
    } on HiveError catch (e, stackTrace) {
      _logger.error(
        'Hive error in startWorkOrder for ID: $workOrderId',
        tag: 'WORK_ORDER_REPO',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(HiveCEErrorHandler.handleHiveError(e));
    } catch (e, stackTrace) {
      _logger.error(
        'Unexpected error in startWorkOrder for ID: $workOrderId',
        tag: 'WORK_ORDER_REPO',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(ServerFailure(message: e.toString()));
    }
  }

  // ---------------------------------------------------------------------------
  // PAUSE
  // ---------------------------------------------------------------------------
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
        await _updateWorkOrderSafely(workOrderDto);

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
        final now = DateTime.now();
        await Future.delayed(const Duration(milliseconds: 10));

        final storedFilePaths = await _storeFilesLocally(
          files,
          workOrderId.toString(),
          'pause',
        );

        final updatedModel = cachedModel.copyWith(
          status: WorkOrderStatus.paused.index,
          pausedAt: now,
          workLogs: [
            ...(cachedModel.workLogs ?? []),
            WorkLogHiveModel(
                action: 'pause',
                timestamp: now,
                notes: reason,
                latitude: latitude,
                longitude: longitude,
                imageUrls: storedFilePaths),
          ],
          pauseLogs: [
            ...(cachedModel.pauseLogs ?? []),
            reason,
          ],
          pauseCount: (cachedModel.pauseCount ?? 0) + 1,
          isPendingSync: true,
        );
        await _localDataSource.updateWorkOrder(updatedModel);

        final req = OfflineRequest(
          id: _uuid.v4(),
          url: '/work-orders/$workOrderId/pause',
          method: 'PATCH',
          body: {
            'reason': reason,
            'gps_coordinates': '[$longitude, $latitude]',
            'file_paths': storedFilePaths,
          },
          description: 'Pause work order #$workOrderId',
          headers: {},
          sequenceNumber: now.millisecondsSinceEpoch,
          workOrderId: workOrderId.toString(),
        );

        await OfflineQueueService.instance.enqueue(req);
        await OfflineSyncService.instance
            .notifyQueued('Pause work order #$workOrderId');

        _logger.workOrder(
          'Optimistically paused work order $workOrderId offline',
        );
        return Right(updatedModel.toEntity());
      }
    } on DioException catch (e, stackTrace) {
      _logger.error(
        'Dio exception in pauseWorkOrder for ID: $workOrderId',
        tag: 'WORK_ORDER_REPO',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(_handleDioException(e));
    } on HiveError catch (e, stackTrace) {
      _logger.error(
        'Hive error in pauseWorkOrder for ID: $workOrderId',
        tag: 'WORK_ORDER_REPO',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(HiveCEErrorHandler.handleHiveError(e));
    } catch (e, stackTrace) {
      _logger.error(
        'Unexpected error in pauseWorkOrder for ID: $workOrderId',
        tag: 'WORK_ORDER_REPO',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(ServerFailure(message: e.toString()));
    }
  }

  // ---------------------------------------------------------------------------
  // RESUME
  // ---------------------------------------------------------------------------
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
        await _updateWorkOrderSafely(workOrderDto);

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
        final now = DateTime.now();
        await Future.delayed(const Duration(milliseconds: 10));

        final storedFilePaths = await _storeFilesLocally(
          files,
          workOrderId.toString(),
          'resume',
        );

        final updatedModel = cachedModel.copyWith(
          status: WorkOrderStatus.inProgress.index,
          resumedAt: now,
          workLogs: [
            ...(cachedModel.workLogs ?? []),
            WorkLogHiveModel(
                action: 'resume',
                timestamp: now,
                notes: notes,
                latitude: latitude,
                longitude: longitude,
                imageUrls: storedFilePaths),
          ],
        );
        await _localDataSource.updateWorkOrder(updatedModel);

        final req = OfflineRequest(
          id: _uuid.v4(),
          url: '/work-orders/$workOrderId/resume',
          method: 'PATCH',
          body: {
            'gps_coordinates': '[$longitude, $latitude]',
            'file_paths': storedFilePaths,
            if (notes != null) 'comments': notes,
          },
          description: 'Resume work order #$workOrderId',
          headers: {},
          sequenceNumber: now.millisecondsSinceEpoch,
          workOrderId: workOrderId.toString(),
        );

        await OfflineQueueService.instance.enqueue(req);
        await OfflineSyncService.instance
            .notifyQueued('Resume work order #$workOrderId');

        _logger.workOrder(
          'Optimistically resumed work order $workOrderId offline',
        );
        return Right(updatedModel.toEntity());
      }
    } on DioException catch (e, stackTrace) {
      _logger.error(
        'Dio exception in resumeWorkOrder for ID: $workOrderId',
        tag: 'WORK_ORDER_REPO',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(_handleDioException(e));
    } on HiveError catch (e, stackTrace) {
      _logger.error(
        'Hive error in resumeWorkOrder for ID: $workOrderId',
        tag: 'WORK_ORDER_REPO',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(HiveCEErrorHandler.handleHiveError(e));
    } catch (e, stackTrace) {
      _logger.error(
        'Unexpected error in resumeWorkOrder for ID: $workOrderId',
        tag: 'WORK_ORDER_REPO',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(ServerFailure(message: e.toString()));
    }
  }

  // ---------------------------------------------------------------------------
  // COMPLETE
  // ---------------------------------------------------------------------------
  @override
  Future<Either<Failure, WorkOrderEntity>> completeWorkOrder({
    required int workOrderId,
    required String workLog,
    required String customerName,
    required File signature,
    required List<PartUsedEntity> partsUsed,
    required List<File> files,
    required double latitude,
    required double longitude,
    String? completionNotes,
  }) async {
    _logger.workOrder('Completing work order $workOrderId', data: {
      'workOrderId': workOrderId,
      'workLogLength': workLog.length,
      'customerName': customerName,
      'hasSignature': true,
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
          customerName: customerName,
          signature: signature,
          partsUsed: partsUsed,
          files: files,
          latitude: latitude,
          longitude: longitude,
          completionNotes: completionNotes,
        );

        // Update cache
        final hiveModel = _mapDtoToHiveModel(workOrderDto);
        await _localDataSource.updateWorkOrder(await hiveModel);

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

        final allFilesToStore = [signature, ...files];
        final storedFilePaths = await _storeFilesLocally(
          allFilesToStore,
          workOrderId.toString(),
          'complete',
        );
        final now = DateTime.now();
        final signaturePath =
            storedFilePaths.isNotEmpty ? storedFilePaths.first : '';
        final filePaths = storedFilePaths.length > 1
            ? storedFilePaths.sublist(1)
            : <String>[];

        final updatedModel = cachedModel.copyWith(
          status: WorkOrderStatus.completed.index,
          // completedAt: DateTime.now(),
          completedAt: now,
          workLogs: [
            ...(cachedModel.workLogs ?? []),
            WorkLogHiveModel(
                action: 'complete',
                timestamp: now,
                latitude: latitude,
                longitude: longitude,
                imageUrls: storedFilePaths),
          ],
          workLog: workLog,
          partsUsed: partsUsed
              .map(
                (p) => PartUsedHiveModel(
                  partNumber: p.partNumber,
                  quantityUsed: p.quantityUsed,
                  partName: p.partName ?? '',
                  description: p.description ?? '',
                ),
              )
              .toList(),
          images: filePaths,
        );
        await _localDataSource.updateWorkOrder(updatedModel);

        final req = OfflineRequest(
          id: _uuid.v4(),
          url: '/work-orders/$workOrderId/complete',
          method: 'PATCH',
          body: {
            'work_log': workLog,
            'customer_name': customerName,
            'signature_path': signaturePath, // Store signature path
            'file_paths': filePaths, // Store file paths
            'parts_used': partsUsed
                .map(
                  (p) => {
                    'part_number': p.partNumber,
                    'quantity_used': p.quantityUsed,
                  },
                )
                .toList(),
            // 'gps_coordinates': '[$latitude, $longitude]',
            'gps_coordinates': [longitude, latitude],

            if (completionNotes != null) 'completion_notes': completionNotes,
          },
          description: 'Complete work order #$workOrderId',
          headers: {},
          sequenceNumber: DateTime.now().millisecondsSinceEpoch,
          workOrderId: workOrderId.toString(),
        );

        await OfflineQueueService.instance.enqueue(req);
        await OfflineSyncService.instance
            .notifyQueued('Complete work order #$workOrderId');

        _logger.workOrder(
          'Optimistically completed work order $workOrderId offline',
        );
        return Right(updatedModel.toEntity());
      }
    } on DioException catch (e, stackTrace) {
      _logger.error(
        'Dio exception in completeWorkOrder for ID: $workOrderId',
        tag: 'WORK_ORDER_REPO',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(_handleDioException(e));
    } on HiveError catch (e, stackTrace) {
      _logger.error(
        'Hive error in completeWorkOrder for ID: $workOrderId',
        tag: 'WORK_ORDER_REPO',
        error: e,
        stackTrace: stackTrace,
      );
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

  // ---------------------------------------------------------------------------
  // REJECT
  // ---------------------------------------------------------------------------
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
        await _updateWorkOrderSafely(workOrderDto);

        _logger.workOrder('Successfully rejected work order $workOrderId');
        return Right(workOrderDto.toEntity());
      } else {
        _logger.warning(
          'Offline: queuing reject action for work order $workOrderId',
          tag: 'WORK_ORDER_REPO',
        );

        final cachedModel =
            await _localDataSource.getCachedWorkOrderById(workOrderId);
        if (cachedModel == null) {
          _logger.error(
            'Work order $workOrderId not found in cache for reject action',
            tag: 'WORK_ORDER_REPO',
          );
          return const Left(
            CacheFailure(message: 'Work order not found in cache'),
          );
        }

        final updatedModel = cachedModel.copyWith(
          status: WorkOrderStatus.rejected.index,
          workLogs: [
            ...(cachedModel.workLogs ?? []),
            WorkLogHiveModel(
              action: 'reject',
              timestamp: DateTime.now(),
              notes: reason,
              latitude: latitude,
              longitude: longitude,
            ),
          ],
          // pauseLogs: reason,
          pauseLogs: [
            ...(cachedModel.pauseLogs ?? []),
            reason,
          ],
        );
        await _localDataSource.updateWorkOrder(updatedModel);

        final req = OfflineRequest(
          id: _uuid.v4(),
          url: '/work-orders/$workOrderId/reject',
          method: 'PATCH',
          body: {
            'reason': reason,
            'gps_coordinates': '[$longitude, $latitude]',
          },
          description: 'Reject work order #$workOrderId',
          headers: {},
          sequenceNumber: 0,
          workOrderId: workOrderId.toString(),
        );

        await OfflineQueueService.instance.enqueue(req);
        await OfflineSyncService.instance
            .notifyQueued('Reject work order #$workOrderId');

        _logger.workOrder(
          'Optimistically rejected work order $workOrderId offline',
        );
        return Right(updatedModel.toEntity());
      }
    } on DioException catch (e, stackTrace) {
      _logger.error(
        'Dio exception in rejectWorkOrder for ID: $workOrderId',
        tag: 'WORK_ORDER_REPO',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(_handleDioException(e));
    } on HiveError catch (e, stackTrace) {
      _logger.error(
        'Hive error in rejectWorkOrder for ID: $workOrderId',
        tag: 'WORK_ORDER_REPO',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(HiveCEErrorHandler.handleHiveError(e));
    } catch (e, stackTrace) {
      _logger.error(
        'Unexpected error in rejectWorkOrder for ID: $workOrderId',
        tag: 'WORK_ORDER_REPO',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(ServerFailure(message: e.toString()));
    }
  }

  // ---------------------------------------------------------------------------
  // ASSIGN
  // ---------------------------------------------------------------------------
  @override
  Future<Either<Failure, WorkOrderEntity>> assignWorkOrder({
    required int workOrderId,
    required int technicianId,
  }) async {
    _logger.info(
      'Assigning work order $workOrderId to technician $technicianId',
      tag: 'WORK_ORDER_REPO',
      data: {
        'workOrderId': workOrderId,
        'technicianId': technicianId,
      },
    );

    try {
      if (await _networkInfo.isConnected) {
        final workOrderDto = await _remoteDataSource.assignWorkOrder(
          workOrderId: workOrderId,
          technicianId: technicianId,
        );

        await _updateWorkOrderSafely(workOrderDto);

        _logger.info(
          'Successfully assigned work order $workOrderId to technician $technicianId',
          tag: 'WORK_ORDER_REPO',
        );
        return Right(workOrderDto.toEntity());
      } else {
        _logger.warning(
          'Offline: queuing assign action for work order $workOrderId',
          tag: 'WORK_ORDER_REPO',
        );

        final cachedModel =
            await _localDataSource.getCachedWorkOrderById(workOrderId);
        if (cachedModel == null) {
          _logger.error(
            'Work order $workOrderId not found in cache for assign action',
            tag: 'WORK_ORDER_REPO',
          );
          return const Left(
            CacheFailure(message: 'Work order not found in cache'),
          );
        }

        final updatedModel = cachedModel.copyWith(
          status: WorkOrderStatus.assigned.index,
          workLogs: [],
        );
        await _localDataSource.updateWorkOrder(updatedModel);

        final req = OfflineRequest(
          id: _uuid.v4(),
          url: '/work-orders/$workOrderId/assign',
          method: 'PATCH',
          body: {
            'assigned_to': technicianId,
          },
          description:
              'Assign work order #$workOrderId to technician $technicianId',
          headers: {},
          sequenceNumber: 0,
          workOrderId: workOrderId.toString(),
        );

        await OfflineQueueService.instance.enqueue(req);
        await OfflineSyncService.instance
            .notifyQueued('Assign work order #$workOrderId');

        _logger.info(
          'Optimistically assigned work order $workOrderId offline',
          tag: 'WORK_ORDER_REPO',
        );
        return Right(updatedModel.toEntity());
      }
    } on DioException catch (e, stackTrace) {
      _logger.error(
        'Dio exception in assignWorkOrder for ID: $workOrderId',
        tag: 'WORK_ORDER_REPO',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(_handleDioException(e));
    } on HiveError catch (e, stackTrace) {
      _logger.error(
        'Hive error in assignWorkOrder for ID: $workOrderId',
        tag: 'WORK_ORDER_REPO',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(HiveCEErrorHandler.handleHiveError(e));
    } catch (e, stackTrace) {
      _logger.error(
        'Unexpected error in assignWorkOrder for ID: $workOrderId',
        tag: 'WORK_ORDER_REPO',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(ServerFailure(message: e.toString()));
    }
  }

  // ---------------------------------------------------------------------------
  // SYNC – now delegated to background service
  // ---------------------------------------------------------------------------
  @override
  Future<Either<Failure, List<WorkOrderEntity>>> syncPendingWorkOrders() async {
    _logger.info(
      'syncPendingWorkOrders called; sync handled by OfflineSyncService in background.',
      tag: 'WORK_ORDER_REPO',
    );
    return Right(<WorkOrderEntity>[]);
  }

  // ---------------------------------------------------------------------------
  // CACHE HELPERS
  // ---------------------------------------------------------------------------
  @override
  Future<Either<Failure, void>> cacheWorkOrders(
      List<WorkOrderEntity> workOrders) async {
    _logger.info(
      'Caching ${workOrders.length} work orders',
      tag: 'WORK_ORDER_REPO',
    );

    try {
      final hiveModels =
          workOrders.map((entity) => _mapEntityToHiveModel(entity)).toList();
      await _localDataSource.cacheWorkOrders(hiveModels);

      _logger.info(
        'Successfully cached ${workOrders.length} work orders',
        tag: 'WORK_ORDER_REPO',
      );
      return const Right(null);
    } on HiveError catch (e, stackTrace) {
      _logger.error(
        'Hive error in cacheWorkOrders',
        tag: 'WORK_ORDER_REPO',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(HiveCEErrorHandler.handleHiveError(e));
    } catch (e, stackTrace) {
      _logger.error(
        'Unexpected error in cacheWorkOrders',
        tag: 'WORK_ORDER_REPO',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<WorkOrderEntity>>> getCachedWorkOrders({
    WorkOrderStatus? status,
  }) async {
    _logger.info(
      'Getting cached work orders',
      tag: 'WORK_ORDER_REPO',
      data: {'status': status},
    );

    try {
      final cachedModels =
          await _localDataSource.getCachedWorkOrders(status: status);

      _logger.info(
        'Retrieved ${cachedModels.length} cached work orders',
        tag: 'WORK_ORDER_REPO',
      );

      final entities = cachedModels.map((m) => m.toEntity()).toList();
      return Right(entities);
    } on HiveError catch (e, stackTrace) {
      _logger.error(
        'Hive error in getCachedWorkOrders',
        tag: 'WORK_ORDER_REPO',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(HiveCEErrorHandler.handleHiveError(e));
    } catch (e, stackTrace) {
      _logger.error(
        'Unexpected error in getCachedWorkOrders',
        tag: 'WORK_ORDER_REPO',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(ServerFailure(message: e.toString()));
    }
  }

  // ---------------------------------------------------------------------------
  // ERROR MAPPING
  // ---------------------------------------------------------------------------
  Failure _handleDioException(DioException e) {
    _logger.error(
      'Handling Dio exception',
      tag: 'WORK_ORDER_REPO',
      error: {
        'type': e.type.toString(),
        'statusCode': e.response?.statusCode,
        'message': e.message,
        'data': e.response?.data,
      },
    );

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return NetworkFailure(message: 'Connection timeout');
      case DioExceptionType.connectionError:
        return NetworkFailure(message: 'No internet connection');
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final responseData = e.response?.data;

        String message;
        if (responseData is Map<String, dynamic>) {
          message = responseData['message'] as String? ?? 'Server error';
        } else if (responseData is String) {
          message = responseData;
        } else {
          message = 'Server error';
        }

        return ServerFailure(message: message, statusCode: statusCode);
      default:
        return ServerFailure(message: 'Unknown error occurred');
    }
  }

  // ---------------------------------------------------------------------------
  // MAPPERS
  // ---------------------------------------------------------------------------
  Future<WorkOrderHiveModel> _mapDtoToHiveModel(WorkOrderDto dto) async {
    final userId = await _userStore.getUserId();
    // The backend sends it inside serviceRequest object, not as serviceRequestNumber
    final ticketNumber = dto.serviceRequestNumber ??
        dto.serviceRequest?.srNumber ??
        'SR-${dto.srId.toString().padLeft(12, '0')}';
    return WorkOrderHiveModel(
      id: dto.id,
      woNumber: dto.woNumber,
      srId: dto.srId,
      serviceRequestNumber: ticketNumber,
      userId: userId,
      summary: dto.summary,
      problemDescription: dto.problemDescription,
      priority: _mapPriorityToIndex(dto.priority),
      visitDate: DateTime.parse(dto.visitDate),
      pauseCount: dto.pauseCount ?? 0,
      location: dto.location,
      status: _mapStatusToIndex(dto.status),
      durationDays: dto.durationDays,
      durationHours: dto.durationHours,
      createdAt: DateTime.parse(dto.createdAt),
      updatedAt: DateTime.parse(dto.updatedAt),
      startedAt: dto.startedAt != null ? DateTime.parse(dto.startedAt!) : null,
      resumedAt: dto.resumedAt != null ? DateTime.parse(dto.resumedAt!) : null,
      completedAt:
          dto.completedAt != null ? DateTime.parse(dto.completedAt!) : null,
      pauseLogs: dto.pauseLogs ?? [],
      workLog: dto.workLog,
      partsUsed: [], // you can enrich this later if backend sends parts
      images: dto.images ?? [],
      cachedAt: DateTime.now(),
      isPendingSync: false,
      pendingAction: null,
    );
  }

  WorkOrderHiveModel _mapEntityToHiveModel(WorkOrderEntity entity) {
    return WorkOrderHiveModel(
      id: entity.id,
      woNumber: entity.woNumber,
      srId: entity.srId,
      serviceRequestNumber: entity.serviceRequestNumber,
      userId: entity.userId,
      summary: entity.summary,
      problemDescription: entity.problemDescription,
      priority: entity.priority.index,
      visitDate: entity.visitDate,
      location: entity.location,
      status: entity.status.index,
      durationDays: entity.durationDays,
      durationHours: entity.durationHours,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      startedAt: entity.startedAt,
      resumedAt: entity.resumedAt,
      completedAt: entity.completedAt,
      pauseCount: entity.pauseCount,
      pauseLogs: entity.pauseLogs ?? [],
      workLog: entity.workLog,
      partsUsed: entity.partsUsed
          .map(
            (p) => PartUsedHiveModel(
              partNumber: p.partNumber,
              quantityUsed: p.quantityUsed,
              partName: p.partName,
              description: p.description,
            ),
          )
          .toList(),
      images: entity.images,
      cachedAt: DateTime.now(),
      isPendingSync: false,
      pendingAction: null,
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
        return WorkOrderStatus.assigned.index;
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

  // ---------------------------------------------------------------------------
  // GROUPED IMAGES
  // ---------------------------------------------------------------------------
  @override
  Future<Either<Failure, WorkOrderGroupedImagesEntity>> getGroupedImages(
      int workOrderId) async {
    _logger.info(
      'Getting grouped images for work order $workOrderId',
      tag: 'WORK_ORDER_REPO',
    );

    try {
      if (await _networkInfo.isConnected) {
        final WorkOrderGroupedImagesResponseDto groupedImagesDto =
            await _remoteDataSource.getGroupedImages(workOrderId);

        _logger.info(
          'Successfully fetched grouped images for work order $workOrderId',
          tag: 'WORK_ORDER_REPO',
        );

        return Right(groupedImagesDto.toEntity());
      } else {
        _logger.warning(
          'No internet connection, grouped images not available offline',
          tag: 'WORK_ORDER_REPO',
        );
        return const Left(
          NetworkFailure(message: 'Grouped images require internet connection'),
        );
      }
    } on DioException catch (e, stackTrace) {
      _logger.error(
        'Dio exception in getGroupedImages for ID: $workOrderId',
        tag: 'WORK_ORDER_REPO',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(_handleDioException(e));
    } catch (e, stackTrace) {
      _logger.error(
        'Unexpected error in getGroupedImages for ID: $workOrderId',
        tag: 'WORK_ORDER_REPO',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
