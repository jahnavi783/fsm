import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/services/logging_service.dart';
import '../../domain/entities/chat_message_entity.dart';
import '../../domain/entities/chat_session_entity.dart';
import '../../domain/repositories/i_chat_repository.dart';
import '../datasources/chat_local_datasource.dart';
import '../datasources/chat_remote_datasource.dart';
import '../models/chat_message_hive_model.dart';
import '../models/chat_session_hive_model.dart';

/// Implementation of IChatRepository with offline-first strategy
///
/// This coordinates between remote API and local Hive storage to provide:
/// - Offline-first message persistence
/// - Session restoration
/// - Automatic sync when connection restored
@Injectable(as: IChatRepository)
class ChatRepository implements IChatRepository {
  final ChatRemoteDataSource _remoteDataSource;
  final ChatLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;
  final LoggingService _logger;

  ChatRepository(
    this._remoteDataSource,
    this._localDataSource,
    this._networkInfo,
    this._logger,
  );

  @override
  Future<Either<Failure, ChatSessionEntity>> startSession() async {
    _logger.info('Starting new chat session', tag: 'CHAT_REPO');

    try {
      if (await _networkInfo.isConnected) {
        // Start session via API
        final sessionDto = await _remoteDataSource.startSession();
        final sessionEntity = sessionDto.toDomain();

        // Save session locally
        final hiveModel = ChatSessionHiveModel.fromEntity(sessionEntity);
        await _localDataSource.saveSession(hiveModel);

        _logger.info(
          'Successfully started session: ${sessionEntity.sessionId}',
          tag: 'CHAT_REPO',
        );

        return Right(sessionEntity);
      } else {
        _logger.warning('No internet connection, cannot start session',
            tag: 'CHAT_REPO');
        return const Left(NetworkFailure(
          message: 'No internet connection. Cannot start chat session.',
        ));
      }
    } on DioException catch (e) {
      _logger.error('Dio error starting session', tag: 'CHAT_REPO', error: e);
      return Left(_handleDioError(e));
    } catch (e) {
      _logger.error('Unexpected error starting session', tag: 'CHAT_REPO',
          error: e);
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ChatMessageEntity>> sendMessage({
    required String sessionId,
    required String message,
  }) async {
    _logger.info('Sending message', tag: 'CHAT_REPO', data: {
      'sessionId': sessionId,
      'messageLength': message.length,
    });

    try {
      if (await _networkInfo.isConnected) {
        // Send message via API
        final response = await _remoteDataSource.sendMessage(
          sessionId: sessionId,
          message: message,
        );

        // Convert response to entity
        final assistantMessage = response.toEntity(sessionId);

        // Save assistant response locally
        final hiveModel = ChatMessageHiveModel.fromEntity(assistantMessage);
        await _localDataSource.saveMessage(hiveModel);

        // Update session activity
        await _localDataSource.updateSessionActivity(sessionId);

        _logger.info('Successfully sent message and received response',
            tag: 'CHAT_REPO');

        return Right(assistantMessage);
      } else {
        _logger.warning('No internet connection, message queued',
            tag: 'CHAT_REPO');
        return const Left(NetworkFailure(
          message: 'No internet connection. Message not sent.',
        ));
      }
    } on DioException catch (e) {
      _logger.error('Dio error sending message', tag: 'CHAT_REPO', error: e);
      return Left(_handleDioError(e));
    } catch (e) {
      _logger.error('Unexpected error sending message', tag: 'CHAT_REPO',
          error: e);
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ChatMessageEntity>>> getChatHistory({
    required String sessionId,
  }) async {
    _logger.info('Getting chat history', tag: 'CHAT_REPO',
        data: {'sessionId': sessionId});

    try {
      // Always try cache first for instant loading
      final cachedMessages = await _localDataSource.getMessages(sessionId);
      final cachedEntities =
          cachedMessages.map((model) => model.toEntity()).toList();

      if (await _networkInfo.isConnected) {
        // Fetch fresh data from API
        final messageDtos = await _remoteDataSource.getChatHistory(
          sessionId: sessionId,
        );

        // Convert to entities
        final apiEntities = messageDtos.map((dto) => dto.toDomain()).toList();

        // Save to cache
        for (final entity in apiEntities) {
          final hiveModel = ChatMessageHiveModel.fromEntity(entity);
          await _localDataSource.saveMessage(hiveModel);
        }

        _logger.info('Successfully fetched ${apiEntities.length} messages',
            tag: 'CHAT_REPO');

        return Right(apiEntities);
      } else {
        // Return cached data when offline
        _logger.info(
          'No internet, returning ${cachedEntities.length} cached messages',
          tag: 'CHAT_REPO',
        );

        if (cachedEntities.isEmpty) {
          return const Left(CacheFailure(
            message: 'No cached messages available offline',
          ));
        }

        return Right(cachedEntities);
      }
    } on DioException catch (e) {
      _logger.error('Dio error getting history', tag: 'CHAT_REPO', error: e);

      // Fallback to cache on error
      final cachedMessages = await _localDataSource.getMessages(sessionId);
      final cachedEntities =
          cachedMessages.map((model) => model.toEntity()).toList();

      if (cachedEntities.isNotEmpty) {
        return Right(cachedEntities);
      }

      return Left(_handleDioError(e));
    } catch (e) {
      _logger.error('Unexpected error getting history', tag: 'CHAT_REPO',
          error: e);
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> endSession({
    required String sessionId,
  }) async {
    _logger.info('Ending session', tag: 'CHAT_REPO',
        data: {'sessionId': sessionId});

    try {
      if (await _networkInfo.isConnected) {
        // End session via API
        await _remoteDataSource.endSession(sessionId: sessionId);

        // Mark session as inactive locally
        await _localDataSource.deactivateSession(sessionId);

        _logger.info('Successfully ended session', tag: 'CHAT_REPO');

        return const Right(null);
      } else {
        // Mark session inactive locally even if offline
        await _localDataSource.deactivateSession(sessionId);

        _logger.warning('No internet, session ended locally only',
            tag: 'CHAT_REPO');

        return const Right(null);
      }
    } on DioException catch (e) {
      _logger.error('Dio error ending session', tag: 'CHAT_REPO', error: e);
      return Left(_handleDioError(e));
    } catch (e) {
      _logger.error('Unexpected error ending session', tag: 'CHAT_REPO',
          error: e);
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ChatSessionEntity?>> getActiveSession() async {
    _logger.info('Getting active session', tag: 'CHAT_REPO');

    try {
      final sessionModel = await _localDataSource.getActiveSession();

      if (sessionModel == null) {
        _logger.info('No active session found', tag: 'CHAT_REPO');
        return const Right(null);
      }

      final sessionEntity = sessionModel.toEntity();

      _logger.info('Found active session: ${sessionEntity.sessionId}',
          tag: 'CHAT_REPO');

      return Right(sessionEntity);
    } catch (e) {
      _logger.error('Error getting active session', tag: 'CHAT_REPO',
          error: e);
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveSession({
    required ChatSessionEntity session,
  }) async {
    try {
      final hiveModel = ChatSessionHiveModel.fromEntity(session);
      await _localDataSource.saveSession(hiveModel);
      return const Right(null);
    } catch (e) {
      _logger.error('Error saving session', tag: 'CHAT_REPO', error: e);
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveMessage({
    required ChatMessageEntity message,
  }) async {
    try {
      final hiveModel = ChatMessageHiveModel.fromEntity(message);
      await _localDataSource.saveMessage(hiveModel);
      return const Right(null);
    } catch (e) {
      _logger.error('Error saving message', tag: 'CHAT_REPO', error: e);
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ChatMessageEntity>>> getCachedMessages({
    required String sessionId,
  }) async {
    try {
      final messages = await _localDataSource.getMessages(sessionId);
      final entities = messages.map((model) => model.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      _logger.error('Error getting cached messages', tag: 'CHAT_REPO',
          error: e);
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> clearLocalData() async {
    try {
      await _localDataSource.clearAllData();
      _logger.info('Cleared all chat data', tag: 'CHAT_REPO');
      return const Right(null);
    } catch (e) {
      _logger.error('Error clearing data', tag: 'CHAT_REPO', error: e);
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> syncPendingMessages() async {
    _logger.info('Syncing pending messages', tag: 'CHAT_REPO');

    try {
      if (!await _networkInfo.isConnected) {
        return const Left(NetworkFailure(
          message: 'No internet connection for sync',
        ));
      }

      final pendingMessages = await _localDataSource.getPendingMessages();

      if (pendingMessages.isEmpty) {
        _logger.info('No pending messages to sync', tag: 'CHAT_REPO');
        return const Right(0);
      }

      int syncedCount = 0;

      for (final messageModel in pendingMessages) {
        try {
          // Attempt to send pending message
          final response = await _remoteDataSource.sendMessage(
            sessionId: messageModel.sessionId,
            message: messageModel.content,
          );

          // Update message as synced
          final syncedMessage = messageModel.toEntity().copyWith(
                isSynced: true,
                isPending: false,
              );

          final syncedModel = ChatMessageHiveModel.fromEntity(syncedMessage);
          await _localDataSource.saveMessage(syncedModel);

          // Save assistant response
          final assistantMessage = response.toEntity(messageModel.sessionId);
          final assistantModel =
              ChatMessageHiveModel.fromEntity(assistantMessage);
          await _localDataSource.saveMessage(assistantModel);

          syncedCount++;
        } catch (e) {
          _logger.error('Failed to sync message ${messageModel.id}',
              tag: 'CHAT_REPO', error: e);
          // Continue with next message
        }
      }

      _logger.info('Synced $syncedCount pending messages', tag: 'CHAT_REPO');
      return Right(syncedCount);
    } catch (e) {
      _logger.error('Error syncing pending messages', tag: 'CHAT_REPO',
          error: e);
      return Left(ServerFailure(message: e.toString()));
    }
  }

  /// Handle DioException and convert to Failure
  Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkFailure(
          message: 'Connection timeout. Please check your internet.',
        );

      case DioExceptionType.connectionError:
        return const NetworkFailure(
          message: 'No internet connection.',
        );

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = error.response?.data?['message'] ?? 'Server error';

        switch (statusCode) {
          case 401:
            return const AuthFailure(message: 'Session expired. Please login again.');
          case 403:
            return const AuthFailure(
              message: 'Only technicians can use the chatbot.',
            );
          case 404:
            return const ServerFailure(
              message: 'Session not found. Please start a new chat.',
            );
          case 500:
          default:
            return ServerFailure(message: message);
        }

      default:
        return ServerFailure(message: error.message ?? 'Network error');
    }
  }
}
