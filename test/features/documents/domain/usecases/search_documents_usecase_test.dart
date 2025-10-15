import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/documents/domain/entities/document_entity.dart';
import 'package:fsm/features/documents/domain/repositories/i_document_repository.dart';
import 'package:fsm/features/documents/domain/usecases/search_documents_usecase.dart';

class MockDocumentRepository extends Mock implements IDocumentRepository {}

void main() {
  group('SearchDocumentsUseCase', () {
    late SearchDocumentsUseCase useCase;
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
    ];

    setUp(() {
      mockRepository = MockDocumentRepository();
      useCase = SearchDocumentsUseCase(mockRepository);
    });

    test('should return list of documents when search is successful', () async {
      // Arrange
      when(() => mockRepository.searchDocuments(
            query: any(named: 'query'),
            type: any(named: 'type'),
            category: any(named: 'category'),
            page: any(named: 'page'),
            limit: any(named: 'limit'),
          )).thenAnswer((_) async => Right(testDocuments));

      // Act
      final result = await useCase(
        query: 'manual',
        page: 1,
        limit: 20,
      );

      // Assert
      expect(result, equals(Right(testDocuments)));
      verify(() => mockRepository.searchDocuments(
            query: 'manual',
            type: null,
            category: null,
            page: 1,
            limit: 20,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return ValidationFailure when query is empty', () async {
      // Act
      final result = await useCase(
        query: '',
        page: 1,
        limit: 20,
      );

      // Assert
      expect(
          result,
          equals(const Left(ValidationFailure(
            message: 'Search query cannot be empty',
          ))));
      verifyNever(() => mockRepository.searchDocuments(
            query: any(named: 'query'),
            type: any(named: 'type'),
            category: any(named: 'category'),
            page: any(named: 'page'),
            limit: any(named: 'limit'),
          ));
    });

    test('should return ValidationFailure when query is only whitespace',
        () async {
      // Act
      final result = await useCase(
        query: '   ',
        page: 1,
        limit: 20,
      );

      // Assert
      expect(
          result,
          equals(const Left(ValidationFailure(
            message: 'Search query cannot be empty',
          ))));
      verifyNever(() => mockRepository.searchDocuments(
            query: any(named: 'query'),
            type: any(named: 'type'),
            category: any(named: 'category'),
            page: any(named: 'page'),
            limit: any(named: 'limit'),
          ));
    });

    test('should trim whitespace from query before searching', () async {
      // Arrange
      when(() => mockRepository.searchDocuments(
            query: any(named: 'query'),
            type: any(named: 'type'),
            category: any(named: 'category'),
            page: any(named: 'page'),
            limit: any(named: 'limit'),
          )).thenAnswer((_) async => Right(testDocuments));

      // Act
      final result = await useCase(
        query: '  manual  ',
        page: 1,
        limit: 20,
      );

      // Assert
      expect(result, equals(Right(testDocuments)));
      verify(() => mockRepository.searchDocuments(
            query: 'manual',
            type: null,
            category: null,
            page: 1,
            limit: 20,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return NetworkFailure when there is no internet connection',
        () async {
      // Arrange
      const failure = NetworkFailure(message: 'No internet connection');
      when(() => mockRepository.searchDocuments(
            query: any(named: 'query'),
            type: any(named: 'type'),
            category: any(named: 'category'),
            page: any(named: 'page'),
            limit: any(named: 'limit'),
          )).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(
        query: 'manual',
        page: 1,
        limit: 20,
      );

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.searchDocuments(
            query: 'manual',
            type: null,
            category: null,
            page: 1,
            limit: 20,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return ServerFailure when server returns error', () async {
      // Arrange
      const failure = ServerFailure(
        message: 'Internal server error',
        statusCode: 500,
      );
      when(() => mockRepository.searchDocuments(
            query: any(named: 'query'),
            type: any(named: 'type'),
            category: any(named: 'category'),
            page: any(named: 'page'),
            limit: any(named: 'limit'),
          )).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(
        query: 'manual',
        page: 1,
        limit: 20,
      );

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.searchDocuments(
            query: 'manual',
            type: null,
            category: null,
            page: 1,
            limit: 20,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle search with type filter', () async {
      // Arrange
      when(() => mockRepository.searchDocuments(
            query: any(named: 'query'),
            type: any(named: 'type'),
            category: any(named: 'category'),
            page: any(named: 'page'),
            limit: any(named: 'limit'),
          )).thenAnswer((_) async => Right(testDocuments));

      // Act
      final result = await useCase(
        query: 'manual',
        type: DocumentType.manual,
        page: 1,
        limit: 20,
      );

      // Assert
      expect(result, equals(Right(testDocuments)));
      verify(() => mockRepository.searchDocuments(
            query: 'manual',
            type: DocumentType.manual,
            category: null,
            page: 1,
            limit: 20,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle search with category filter', () async {
      // Arrange
      when(() => mockRepository.searchDocuments(
            query: any(named: 'query'),
            type: any(named: 'type'),
            category: any(named: 'category'),
            page: any(named: 'page'),
            limit: any(named: 'limit'),
          )).thenAnswer((_) async => Right(testDocuments));

      // Act
      final result = await useCase(
        query: 'manual',
        category: 'equipment',
        page: 1,
        limit: 20,
      );

      // Assert
      expect(result, equals(Right(testDocuments)));
      verify(() => mockRepository.searchDocuments(
            query: 'manual',
            type: null,
            category: 'equipment',
            page: 1,
            limit: 20,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle search with both type and category filters', () async {
      // Arrange
      when(() => mockRepository.searchDocuments(
            query: any(named: 'query'),
            type: any(named: 'type'),
            category: any(named: 'category'),
            page: any(named: 'page'),
            limit: any(named: 'limit'),
          )).thenAnswer((_) async => Right(testDocuments));

      // Act
      final result = await useCase(
        query: 'manual',
        type: DocumentType.manual,
        category: 'equipment',
        page: 1,
        limit: 20,
      );

      // Assert
      expect(result, equals(Right(testDocuments)));
      verify(() => mockRepository.searchDocuments(
            query: 'manual',
            type: DocumentType.manual,
            category: 'equipment',
            page: 1,
            limit: 20,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle pagination in search results', () async {
      // Arrange
      when(() => mockRepository.searchDocuments(
            query: any(named: 'query'),
            type: any(named: 'type'),
            category: any(named: 'category'),
            page: any(named: 'page'),
            limit: any(named: 'limit'),
          )).thenAnswer((_) async => Right(testDocuments));

      // Act
      final result = await useCase(
        query: 'manual',
        page: 2,
        limit: 10,
      );

      // Assert
      expect(result, equals(Right(testDocuments)));
      verify(() => mockRepository.searchDocuments(
            query: 'manual',
            type: null,
            category: null,
            page: 2,
            limit: 10,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return empty list when no search results found', () async {
      // Arrange
      when(() => mockRepository.searchDocuments(
            query: any(named: 'query'),
            type: any(named: 'type'),
            category: any(named: 'category'),
            page: any(named: 'page'),
            limit: any(named: 'limit'),
          )).thenAnswer((_) async => const Right([]));

      // Act
      final result = await useCase(
        query: 'nonexistent',
        page: 1,
        limit: 20,
      );

      // Assert
      expect(result, equals(const Right([])));
      verify(() => mockRepository.searchDocuments(
            query: 'nonexistent',
            type: null,
            category: null,
            page: 1,
            limit: 20,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
