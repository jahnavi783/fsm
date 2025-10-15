import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/documents/domain/entities/document_entity.dart';
import 'package:fsm/features/documents/domain/repositories/i_document_repository.dart';
import 'package:fsm/features/documents/domain/usecases/get_documents_usecase.dart';

class MockDocumentRepository extends Mock implements IDocumentRepository {}

void main() {
  group('GetDocumentsUseCase', () {
    late GetDocumentsUseCase useCase;
    late MockDocumentRepository mockRepository;

    final testDocuments = [
      const DocumentEntity(
        id: 1,
        title: 'Test Manual',
        description: 'Test manual description',
        type: DocumentType.manual,
        fileUrl: 'https://example.com/manual.pdf',
        fileName: 'manual.pdf',
        fileSize: 1024,
        createdAt: DateTime(2024, 1, 1),
        updatedAt: DateTime(2024, 1, 1),
        tags: ['manual', 'test'],
        categories: ['equipment'],
      ),
      const DocumentEntity(
        id: 2,
        title: 'Safety Procedure',
        description: 'Safety procedure document',
        type: DocumentType.safety,
        fileUrl: 'https://example.com/safety.pdf',
        fileName: 'safety.pdf',
        fileSize: 2048,
        createdAt: DateTime(2024, 1, 2),
        updatedAt: DateTime(2024, 1, 2),
        tags: ['safety', 'procedure'],
        categories: ['safety'],
      ),
    ];

    setUp(() {
      mockRepository = MockDocumentRepository();
      useCase = GetDocumentsUseCase(mockRepository);
    });

    test('should return list of documents when repository call is successful',
        () async {
      // Arrange
      when(() => mockRepository.getDocuments(
            page: any(named: 'page'),
            limit: any(named: 'limit'),
            type: any(named: 'type'),
            category: any(named: 'category'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => Right(testDocuments));

      // Act
      final result = await useCase(
        page: 1,
        limit: 20,
        type: DocumentType.manual,
        category: 'equipment',
        searchQuery: 'test',
      );

      // Assert
      expect(result, equals(Right(testDocuments)));
      verify(() => mockRepository.getDocuments(
            page: 1,
            limit: 20,
            type: DocumentType.manual,
            category: 'equipment',
            searchQuery: 'test',
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return NetworkFailure when there is no internet connection',
        () async {
      // Arrange
      const failure = NetworkFailure(message: 'No internet connection');
      when(() => mockRepository.getDocuments(
            page: any(named: 'page'),
            limit: any(named: 'limit'),
            type: any(named: 'type'),
            category: any(named: 'category'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(
        page: 1,
        limit: 20,
      );

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.getDocuments(
            page: 1,
            limit: 20,
            type: null,
            category: null,
            searchQuery: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return ServerFailure when server returns error', () async {
      // Arrange
      const failure = ServerFailure(
        message: 'Internal server error',
        statusCode: 500,
      );
      when(() => mockRepository.getDocuments(
            page: any(named: 'page'),
            limit: any(named: 'limit'),
            type: any(named: 'type'),
            category: any(named: 'category'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(
        page: 1,
        limit: 20,
      );

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.getDocuments(
            page: 1,
            limit: 20,
            type: null,
            category: null,
            searchQuery: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return CacheFailure when offline and no cached data',
        () async {
      // Arrange
      const failure = CacheFailure(message: 'No cached documents available');
      when(() => mockRepository.getDocuments(
            page: any(named: 'page'),
            limit: any(named: 'limit'),
            type: any(named: 'type'),
            category: any(named: 'category'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(
        page: 1,
        limit: 20,
      );

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.getDocuments(
            page: 1,
            limit: 20,
            type: null,
            category: null,
            searchQuery: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle pagination correctly', () async {
      // Arrange
      when(() => mockRepository.getDocuments(
            page: any(named: 'page'),
            limit: any(named: 'limit'),
            type: any(named: 'type'),
            category: any(named: 'category'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => Right(testDocuments));

      // Act
      final result = await useCase(
        page: 2,
        limit: 10,
      );

      // Assert
      expect(result, equals(Right(testDocuments)));
      verify(() => mockRepository.getDocuments(
            page: 2,
            limit: 10,
            type: null,
            category: null,
            searchQuery: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle filtering by document type', () async {
      // Arrange
      final filteredDocuments = [testDocuments.first];
      when(() => mockRepository.getDocuments(
            page: any(named: 'page'),
            limit: any(named: 'limit'),
            type: any(named: 'type'),
            category: any(named: 'category'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => Right(filteredDocuments));

      // Act
      final result = await useCase(
        page: 1,
        limit: 20,
        type: DocumentType.manual,
      );

      // Assert
      expect(result, equals(Right(filteredDocuments)));
      verify(() => mockRepository.getDocuments(
            page: 1,
            limit: 20,
            type: DocumentType.manual,
            category: null,
            searchQuery: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle filtering by category', () async {
      // Arrange
      final filteredDocuments = [testDocuments.first];
      when(() => mockRepository.getDocuments(
            page: any(named: 'page'),
            limit: any(named: 'limit'),
            type: any(named: 'type'),
            category: any(named: 'category'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => Right(filteredDocuments));

      // Act
      final result = await useCase(
        page: 1,
        limit: 20,
        category: 'equipment',
      );

      // Assert
      expect(result, equals(Right(filteredDocuments)));
      verify(() => mockRepository.getDocuments(
            page: 1,
            limit: 20,
            type: null,
            category: 'equipment',
            searchQuery: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle search query', () async {
      // Arrange
      when(() => mockRepository.getDocuments(
            page: any(named: 'page'),
            limit: any(named: 'limit'),
            type: any(named: 'type'),
            category: any(named: 'category'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => Right(testDocuments));

      // Act
      final result = await useCase(
        page: 1,
        limit: 20,
        searchQuery: 'manual',
      );

      // Assert
      expect(result, equals(Right(testDocuments)));
      verify(() => mockRepository.getDocuments(
            page: 1,
            limit: 20,
            type: null,
            category: null,
            searchQuery: 'manual',
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return empty list when no documents found', () async {
      // Arrange
      when(() => mockRepository.getDocuments(
            page: any(named: 'page'),
            limit: any(named: 'limit'),
            type: any(named: 'type'),
            category: any(named: 'category'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => const Right([]));

      // Act
      final result = await useCase(
        page: 1,
        limit: 20,
      );

      // Assert
      expect(result, equals(const Right([])));
      verify(() => mockRepository.getDocuments(
            page: 1,
            limit: 20,
            type: null,
            category: null,
            searchQuery: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
