import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/core/network/network_info.dart';
import 'package:fsm/features/calendar/domain/entities/calendar_event_entity.dart';
import 'package:fsm/features/calendar/domain/repositories/i_calendar_repository.dart';
import 'package:fsm/features/calendar/data/datasources/calendar_remote_datasource.dart';
import 'package:fsm/features/calendar/data/datasources/calendar_local_datasource.dart';
import 'package:fsm/features/calendar/data/models/calendar_event_hive_model.dart';
import 'package:fsm/features/calendar/data/models/calendar_event_dto.dart';

@Injectable(as: ICalendarRepository)
class CalendarRepositoryImpl implements ICalendarRepository {
  final CalendarRemoteDataSource _remoteDataSource;
  final CalendarLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  CalendarRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, List<CalendarEventEntity>>> getCalendarEvents({
    required DateTime startDate,
    required DateTime endDate,
    CalendarEventType? type,
    String? searchQuery,
  }) async {
    try {
      if (await _networkInfo.isConnected) {
        // Try remote first
        final eventDtos = await _remoteDataSource.getCalendarEvents(
          startDate: startDate,
          endDate: endDate,
          type: type,
          searchQuery: searchQuery,
        );

        // Cache successful response
        final hiveModels = eventDtos.map((dto) => _mapDtoToHiveModel(dto)).toList();
        await _localDataSource.cacheEvents(hiveModels);

        // Return domain entities
        final entities = eventDtos.map((dto) => dto.toEntity()).toList();
        return Right(entities);
      } else {
        // Fallback to cache when offline
        final cachedModels = await _localDataSource.getCachedEvents(
          startDate: startDate,
          endDate: endDate,
          type: type,
        );

        if (cachedModels.isEmpty) {
          return Left(CacheFailure(
            message: 'No cached calendar events available offline',
          ));
        }

        final entities = cachedModels.map((model) => model.toEntity()).toList();
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
  Future<Either<Failure, List<CalendarEventEntity>>> getDailySchedule({
    required DateTime date,
    CalendarEventType? type,
  }) async {
    try {
      if (await _networkInfo.isConnected) {
        final eventDtos = await _remoteDataSource.getDailySchedule(
          date: date,
          type: type,
        );

        // Cache successful response
        final hiveModels = eventDtos.map((dto) => _mapDtoToHiveModel(dto)).toList();
        await _localDataSource.cacheEvents(hiveModels);

        final entities = eventDtos.map((dto) => dto.toEntity()).toList();
        return Right(entities);
      } else {
        // Fallback to cache when offline
        final cachedModels = await _localDataSource.getEventsForDate(date);
        
        // Filter by type if provided
        var filteredModels = cachedModels;
        if (type != null) {
          filteredModels = cachedModels
              .where((model) => model.type == type.index)
              .toList();
        }

        final entities = filteredModels.map((model) => model.toEntity()).toList();
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
  Future<Either<Failure, List<CalendarEventEntity>>> getWeeklySchedule({
    required DateTime weekStart,
  }) async {
    try {
      if (await _networkInfo.isConnected) {
        final eventDtos = await _remoteDataSource.getWeeklySchedule(
          weekStart: weekStart,
        );

        // Cache successful response
        final hiveModels = eventDtos.map((dto) => _mapDtoToHiveModel(dto)).toList();
        await _localDataSource.cacheEvents(hiveModels);

        final entities = eventDtos.map((dto) => dto.toEntity()).toList();
        return Right(entities);
      } else {
        // Fallback to cache when offline
        final weekEnd = weekStart.add(Duration(days: 7));
        final cachedModels = await _localDataSource.getEventsForDateRange(
          startDate: weekStart,
          endDate: weekEnd,
        );

        final entities = cachedModels.map((model) => model.toEntity()).toList();
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
  Future<Either<Failure, List<CalendarEventEntity>>> getMonthlySchedule({
    required DateTime month,
  }) async {
    try {
      if (await _networkInfo.isConnected) {
        final eventDtos = await _remoteDataSource.getMonthlySchedule(
          month: month,
        );

        // Cache successful response
        final hiveModels = eventDtos.map((dto) => _mapDtoToHiveModel(dto)).toList();
        await _localDataSource.cacheEvents(hiveModels);

        final entities = eventDtos.map((dto) => dto.toEntity()).toList();
        return Right(entities);
      } else {
        // Fallback to cache when offline
        final monthStart = DateTime(month.year, month.month, 1);
        final monthEnd = DateTime(month.year, month.month + 1, 0);
        final cachedModels = await _localDataSource.getEventsForDateRange(
          startDate: monthStart,
          endDate: monthEnd,
        );

        final entities = cachedModels.map((model) => model.toEntity()).toList();
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
  Future<Either<Failure, List<CalendarEventEntity>>> getOptimizedDailyRoute({
    required DateTime date,
    required double currentLatitude,
    required double currentLongitude,
  }) async {
    try {
      if (await _networkInfo.isConnected) {
        final eventDtos = await _remoteDataSource.getOptimizedDailyRoute(
          date: date,
          currentLatitude: currentLatitude,
          currentLongitude: currentLongitude,
        );

        final entities = eventDtos.map((dto) => dto.toEntity()).toList();
        return Right(entities);
      } else {
        // Fallback to basic date-based ordering when offline
        final cachedModels = await _localDataSource.getEventsForDate(date);
        
        // Filter only work orders for route optimization
        final workOrderModels = cachedModels
            .where((model) => model.type == CalendarEventType.workOrder.index)
            .toList();

        final entities = workOrderModels.map((model) => model.toEntity()).toList();
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
  Future<Either<Failure, CalendarEventEntity>> createEvent({
    required CalendarEventEntity event,
  }) async {
    try {
      if (await _networkInfo.isConnected) {
        final eventDto = await _remoteDataSource.createEvent(event: event);
        
        // Cache the created event
        final hiveModel = _mapDtoToHiveModel(eventDto);
        await _localDataSource.updateEvent(hiveModel);

        return Right(eventDto.toEntity());
      } else {
        // Store locally for sync when online
        final hiveModel = event.toHiveModel().copyWith(
          isPendingSync: true,
          pendingAction: 'create',
        );
        await _localDataSource.updateEvent(hiveModel);

        return Right(event);
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
  Future<Either<Failure, CalendarEventEntity>> updateEvent({
    required CalendarEventEntity event,
  }) async {
    try {
      if (await _networkInfo.isConnected) {
        final eventDto = await _remoteDataSource.updateEvent(event: event);
        
        // Cache the updated event
        final hiveModel = _mapDtoToHiveModel(eventDto);
        await _localDataSource.updateEvent(hiveModel);

        return Right(eventDto.toEntity());
      } else {
        // Store locally for sync when online
        await _localDataSource.markEventForSync(event.id, 'update');
        final hiveModel = event.toHiveModel();
        await _localDataSource.updateEvent(hiveModel);

        return Right(event);
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
  Future<Either<Failure, void>> deleteEvent({
    required int eventId,
  }) async {
    try {
      if (await _networkInfo.isConnected) {
        await _remoteDataSource.deleteEvent(eventId: eventId);
        await _localDataSource.deleteEvent(eventId);
        return Right(null);
      } else {
        // Mark for deletion when online
        await _localDataSource.markEventForSync(eventId, 'delete');
        return Right(null);
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
  Future<Either<Failure, List<CalendarEventEntity>>> syncPendingChanges() async {
    try {
      if (!await _networkInfo.isConnected) {
        return Left(NetworkFailure(message: 'No internet connection'));
      }

      final pendingEvents = await _localDataSource.getPendingSyncEvents();
      final syncedEvents = <CalendarEventEntity>[];

      for (final event in pendingEvents) {
        try {
          switch (event.pendingAction) {
            case 'create':
              final eventDto = await _remoteDataSource.createEvent(
                event: event.toEntity(),
              );
              syncedEvents.add(eventDto.toEntity());
              break;
            case 'update':
              final eventDto = await _remoteDataSource.updateEvent(
                event: event.toEntity(),
              );
              syncedEvents.add(eventDto.toEntity());
              break;
            case 'delete':
              await _remoteDataSource.deleteEvent(eventId: event.id);
              await _localDataSource.deleteEvent(event.id);
              continue;
          }
          
          // Clear sync flag on success
          await _localDataSource.clearSyncFlag(event.id);
        } catch (e) {
          // Continue with other events if one fails
          continue;
        }
      }

      return Right(syncedEvents);
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cacheEvents(
    List<CalendarEventEntity> events,
  ) async {
    try {
      final hiveModels = events.map((event) => event.toHiveModel()).toList();
      await _localDataSource.cacheEvents(hiveModels);
      return Right(null);
    } on HiveError catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CalendarEventEntity>>> getCachedEvents({
    DateTime? startDate,
    DateTime? endDate,
    CalendarEventType? type,
  }) async {
    try {
      final cachedModels = await _localDataSource.getCachedEvents(
        startDate: startDate,
        endDate: endDate,
        type: type,
      );
      
      final entities = cachedModels.map((model) => model.toEntity()).toList();
      return Right(entities);
    } on HiveError catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CalendarEventEntity>>> getConflictingEvents({
    required DateTime startTime,
    required DateTime endTime,
    int? excludeEventId,
  }) async {
    try {
      if (await _networkInfo.isConnected) {
        final eventDtos = await _remoteDataSource.getConflictingEvents(
          startTime: startTime,
          endTime: endTime,
          excludeEventId: excludeEventId,
        );

        final entities = eventDtos.map((dto) => dto.toEntity()).toList();
        return Right(entities);
      } else {
        // Check conflicts locally
        final cachedModels = await _localDataSource.getEventsForDateRange(
          startDate: startTime.subtract(Duration(hours: 1)),
          endDate: endTime.add(Duration(hours: 1)),
        );

        final conflictingModels = cachedModels.where((model) {
          if (excludeEventId != null && model.id == excludeEventId) {
            return false;
          }
          
          // Check if events overlap
          return model.startTime.isBefore(endTime) && 
                 model.endTime.isAfter(startTime);
        }).toList();

        final entities = conflictingModels.map((model) => model.toEntity()).toList();
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

  // Helper methods
  CalendarEventHiveModel _mapDtoToHiveModel(CalendarEventDto dto) {
    return CalendarEventHiveModel(
      id: dto.id,
      title: dto.title,
      startTime: DateTime.parse(dto.startTime),
      endTime: DateTime.parse(dto.endTime),
      type: dto.toEntity().type.index,
      description: dto.description,
      workOrderId: dto.workOrderId,
      location: dto.location,
      isAllDay: dto.isAllDay,
      color: dto.color,
      metadata: dto.metadata,
      cachedAt: DateTime.now(),
    );
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