import 'dart:io';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:fsm/features/documents/data/models/document_hive_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/document_entity.dart';
import '../../domain/repositories/i_document_repository.dart';
import '../datasources/document_local_datasource.dart';
import '../datasources/document_remote_datasource.dart';

@Injectable(as: IDocumentRepository)
class DocumentRepositoryImpl implements IDocumentRepository {
  final DocumentRemoteDataSource _remoteDataSource;
  final DocumentLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  DocumentRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, List<DocumentEntity>>> getDocuments({
    required int page,
    required int limit,
    DocumentType? type,
    String? category,
    String? searchQuery,
  }) async {
    try {
      if (await _networkInfo.isConnected) {
        // Try remote first - map parameters to API format
        final documentDtos = await _remoteDataSource.getDocuments(
          model: null, // Not used in current API
          category: category,
          keyword: searchQuery,
          page: page,
          limit: limit,
        );

        // Filter by type locally since API doesn't support it
        var filteredDtos = documentDtos;
        if (type != null) {
          filteredDtos = documentDtos
              .where((dto) =>
                  dto.fileType.toLowerCase() == type.name.toLowerCase())
              .toList();
        }

        // Cache successful response
        final hiveModels =
            filteredDtos.map((dto) => DocumentHiveModel.fromDto(dto)).toList();
        await _localDataSource.cacheDocuments(hiveModels);

        // Return domain entities with download status from cache
        final entities = <DocumentEntity>[];
        for (final dto in filteredDtos) {
          final cachedDoc =
              await _localDataSource.getCachedDocumentById(dto.id);
          entities.add(dto.toEntity(
            isDownloaded: cachedDoc?.isDownloaded,
            localPath: cachedDoc?.localPath,
          ));
        }

        return Right(entities);
      } else {
        // Fallback to cache when offline
        final cachedModels = await _localDataSource.getCachedDocuments(
          type: type,
          category: category,
        );

        if (cachedModels.isEmpty) {
          return const Left(CacheFailure(
            message: 'No cached documents available offline',
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
  Future<Either<Failure, List<DocumentEntity>>> searchDocuments({
    required String query,
    DocumentType? type,
    String? category,
    required int page,
    required int limit,
  }) async {
    try {
      // Always search locally in cached documents - no API calls for search
      final cachedModels = await _localDataSource.getCachedDocuments(
        type: type,
        category: category,
      );

      // Perform local text search in cached documents
      final filteredModels = cachedModels.where((doc) {
        final searchLower = query.toLowerCase();
        return doc.title.toLowerCase().contains(searchLower) ||
            doc.description.toLowerCase().contains(searchLower) ||
            (doc.keywords?.toLowerCase().contains(searchLower) ?? false) ||
            doc.tags.any((tag) => tag.toLowerCase().contains(searchLower)) ||
            doc.category.toLowerCase().contains(searchLower) ||
            doc.categories
                .any((cat) => cat.toLowerCase().contains(searchLower));
      }).toList();

      // Apply pagination locally
      final startIndex = (page - 1) * limit;
      final endIndex = startIndex + limit;
      final paginatedModels = filteredModels.length > startIndex
          ? filteredModels.sublist(
              startIndex,
              endIndex > filteredModels.length
                  ? filteredModels.length
                  : endIndex,
            )
          : <DocumentHiveModel>[];

      final entities =
          paginatedModels.map((model) => model.toEntity()).toList();

      return Right(entities);
    } catch (e) {
      return Left(CacheFailure(message: 'Search failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, DocumentEntity>> getDocumentById(int id) async {
    try {
      // Check cache first
      final cachedDoc = await _localDataSource.getCachedDocumentById(id);

      if (await _networkInfo.isConnected) {
        try {
          // Since API doesn't have getById endpoint, try to get from cache or fetch all
          if (cachedDoc != null) {
            return Right(cachedDoc.toEntity());
          } else {
            // Fallback: try to fetch documents and find the one we need
            final documentDtos = await _remoteDataSource.getDocuments(
              limit: 100, // Get more documents to find the one we need
            );

            final targetDto = documentDtos.firstWhere(
              (dto) => dto.id == id,
              orElse: () => throw Exception('Document not found'),
            );

            // Cache the found document
            final hiveModel = DocumentHiveModel.fromDto(targetDto);
            await _localDataSource.cacheDocument(hiveModel);

            return Right(targetDto.toEntity());
          }
        } catch (e) {
          // If remote fails but we have cache, use cache
          if (cachedDoc != null) {
            return Right(cachedDoc.toEntity());
          }
          rethrow;
        }
      } else {
        // Offline - use cache only
        if (cachedDoc != null) {
          return Right(cachedDoc.toEntity());
        } else {
          return const Left(CacheFailure(
            message: 'Document not available offline',
          ));
        }
      }
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> downloadDocument({
    required int documentId,
    required String fileUrl,
    required String fileName,
  }) async {
    try {
      if (!await _networkInfo.isConnected) {
        return const Left(NetworkFailure(
          message: 'Internet connection required to download documents',
        ));
      }

      // Check if already downloaded
      final cachedDoc =
          await _localDataSource.getCachedDocumentById(documentId);
      if (cachedDoc?.isDownloaded == true && cachedDoc?.localPath != null) {
        final file = File(cachedDoc!.localPath!);
        if (await file.exists()) {
          return Right(cachedDoc.localPath!);
        }
      }

      // Download from remote using file URL directly
      final response = await _remoteDataSource.downloadDocumentFromUrl(fileUrl);

      if (response.statusCode == 200 && response.data != null) {
        final bytes = <int>[];
        await for (final chunk in response.data!.stream) {
          bytes.addAll(chunk);
        }

        // Save to local storage
        final localPath = await _localDataSource.saveDocumentFile(
          documentId: documentId,
          fileName: fileName,
          bytes: bytes,
        );

        // Update download status in cache
        await _localDataSource.updateDocumentDownloadStatus(
          documentId: documentId,
          isDownloaded: true,
          localPath: localPath,
        );

        return Right(localPath);
      } else {
        return Left(ServerFailure(
          message: 'Failed to download document',
          statusCode: response.statusCode,
        ));
      }
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getDocumentCategories() async {
    try {
      if (await _networkInfo.isConnected) {
        // Since API doesn't have categories endpoint, extract from documents
        final documentDtos = await _remoteDataSource.getDocuments(
          limit: 100, // Get more documents to extract categories
        );

        final categories = <String>{};
        for (final dto in documentDtos) {
          categories.add(dto.category);
          categories.addAll(dto.categories);
        }

        final categoryList = categories.toList()..sort();
        return Right(categoryList);
      } else {
        // Fallback to cached categories
        final cachedCategories = await _localDataSource.getCachedCategories();
        return Right(cachedCategories);
      }
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DocumentEntity>>> getCachedDocuments({
    DocumentType? type,
    String? category,
  }) async {
    try {
      final cachedModels = await _localDataSource.getCachedDocuments(
        type: type,
        category: category,
      );

      final entities = cachedModels.map((model) => model.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> clearDocumentCache() async {
    try {
      await _localDataSource.clearCache();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteDownloadedDocument(int documentId) async {
    try {
      await _localDataSource.deleteDocumentFile(documentId);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  Failure _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return const TimeoutFailure(message: 'Connection timeout');
      case DioExceptionType.connectionError:
        return const NetworkFailure(message: 'No internet connection');
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final message = e.response?.data?['message'] ?? 'Server error';
        return ServerFailure(message: message, statusCode: statusCode);
      default:
        return const ServerFailure(message: 'Unknown network error occurred');
    }
  }
}
