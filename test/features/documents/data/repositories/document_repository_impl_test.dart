import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/core/network/network_info.dart';
import 'package:fsm/features/documents/data/datasources/document_local_datasource.dart';
import 'package:fsm/features/documents/data/datasources/document_remote_datasource.dart';
import 'package:fsm/features/documents/data/models/document_dto.dart';
import 'package:fsm/features/documents/data/models/document_hive_model.dart';
import 'package:fsm/features/documents/data/models/uploaded_by_dto.dart';
import 'package:fsm/features/documents/data/repositories/document_repository_impl.dart';
import 'package:fsm/features/documents/domain/entities/document_entity.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'document_repository_impl_test.mocks.dart';

@GenerateMocks([
  DocumentRemoteDataSource,
  DocumentLocalDataSource,
  NetworkInfo,
])
void main() {
  late DocumentRepositoryImpl repository;
  late MockDocumentRemoteDataSource mockRemoteDataSource;
  late MockDocumentLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUpAll(() {
    provideDummy<Either<Failure, List<DocumentEntity>>>(const Right([]));
    provideDummy<Either<Failure, DocumentEntity>>(Right(DocumentEntity(
      id: '1',
      title: 'T',
      description: 'D',
      type: DocumentType.manual,
      fileUrl: 'U',
      fileName: 'F',
      fileSize: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      tags: [],
      categories: [],
    )));
  });

  setUp(() {
    mockRemoteDataSource = MockDocumentRemoteDataSource();
    mockLocalDataSource = MockDocumentLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = DocumentRepositoryImpl(
      mockRemoteDataSource,
      mockLocalDataSource,
      mockNetworkInfo,
    );
  });

  group('getDocuments', () {
    final tDocumentDto = DocumentDto(
      id: '1',
      title: 'Test',
      description: 'Desc',
      category: 'manual',
      files: [],
      uploadedBy: 1,
      uploader: const UploadedByDto(
        id: 1,
        firstName: 'Test',
        email: 'test@test.com',
        roleId: 1,
      ),
      createdAt: '2025-01-01T00:00:00Z',
    );
    final tDocumentDtos = [tDocumentDto];
    final tEntities = tDocumentDtos.map((dto) => dto.toEntity()).toList();

    test('should return remote data when device is online', () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getDocuments(
        page: anyNamed('page'),
        limit: anyNamed('limit'),
        category: anyNamed('category'),
        keyword: anyNamed('keyword'),
        model: anyNamed('model'),
      )).thenAnswer((_) async => tDocumentDtos);
      when(mockLocalDataSource.cacheDocuments(any)).thenAnswer((_) async {});
      when(mockLocalDataSource.getCachedDocumentById(any))
          .thenAnswer((_) async => null);

      // Act
      final result = await repository.getDocuments(page: 1, limit: 10);

      // Assert
      expect(result.isRight, true);
      verify(mockRemoteDataSource.getDocuments(page: 1, limit: 10)).called(1);
      verify(mockLocalDataSource.cacheDocuments(any)).called(1);
    });

    test('should return cached data when device is offline', () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      final tHiveModel = DocumentHiveModel.fromDto(tDocumentDto);
      when(mockLocalDataSource.getCachedDocuments(
        type: anyNamed('type'),
        category: anyNamed('category'),
      )).thenAnswer((_) async => [tHiveModel]);

      // Act
      final result = await repository.getDocuments(page: 1, limit: 10);

      // Assert
      expect(result.isRight, true);
      verify(mockLocalDataSource.getCachedDocuments()).called(1);
      verifyZeroInteractions(mockRemoteDataSource);
    });
  });
}
