import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/documents/domain/entities/document_entity.dart';
import 'package:fsm/features/documents/domain/repositories/i_document_repository.dart';
import 'package:fsm/features/documents/domain/usecases/get_document_by_id_usecase.dart';

class MockDocumentRepository extends Mock implements IDocumentRepository {}

void main() {
  group('GetDocumentByIdUseCase', () {
    late GetDocumentByIdUseCase useCase;
    late MockDocumentRepository mockRepository;

    const testDocument = DocumentEntity(
      id: 1,
      title: 'Test Manual',
      description: 'Test manual description',
      type: DocumentType.manual,
      fileUrl: 'https://example.com/manual.pdf',
      fileName: 'manual.pdf',
      fileSize: 1024,
      createdAt: '2024-01-01T00:00:00Z',
      updatedAt: '2024-01-01T00:00:00Z',
      tags: ['manual', 'test'],
      categories: ['equipment'],
    );

    setUp(() {
      mockRepository = MockDocumentRepository();
      useCase = GetDocumentByIdUseCase(mockRepository);
    });

    test('should return document when repository call is successful', () async {
      // Arrange
      when(() => mockRepository.getDocumentById(any()))
          .thenAnswer((_) async => const Right(testDocument));

      // Act
      final result = await useCase(1);

      // Assert
      expect(result, equals(const Right(testDocument)));
      verify(() => mockRepository.getDocumentById(1)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return ValidationFailure when document ID is zero', () async {
      // Act
      final result = await useCase(0);

      // Assert
      expect(
          result,
          equals(const Left(ValidationFailure(
            message: 'Invalid document ID',
          ))));
      verifyNever(() => mockRepository.getDocumentById(any()));
    });

    test('should return ValidationFailure when document ID is negative',
        () async {
      // Act
      final result = await useCase(-1);

      // Assert
      expect(
          result,
          equals(const Left(ValidationFailure(
            message: 'Invalid document ID',
          ))));
      verifyNever(() => mockRepository.getDocumentById(any()));
    });

    test('should return NetworkFailure when there is no internet connection',
        () async {
      // Arrange
      const failure = NetworkFailure(message: 'No internet connection');
      when(() => mockRepository.getDocumentById(any()))
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(1);

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.getDocumentById(1)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return ServerFailure when document is not found', () async {
      // Arrange
      const failure = ServerFailure(
        message: 'Document not found',
        statusCode: 404,
      );
      when(() => mockRepository.getDocumentById(any()))
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(999);

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.getDocumentById(999)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return CacheFailure when offline and document not cached',
        () async {
      // Arrange
      const failure = CacheFailure(message: 'Document not available offline');
      when(() => mockRepository.getDocumentById(any()))
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(1);

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.getDocumentById(1)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle large document IDs', () async {
      // Arrange
      const largeId = 999999999;
      when(() => mockRepository.getDocumentById(any()))
          .thenAnswer((_) async => const Right(testDocument));

      // Act
      final result = await useCase(largeId);

      // Assert
      expect(result, equals(const Right(testDocument)));
      verify(() => mockRepository.getDocumentById(largeId)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return ServerFailure when server returns internal error',
        () async {
      // Arrange
      const failure = ServerFailure(
        message: 'Internal server error',
        statusCode: 500,
      );
      when(() => mockRepository.getDocumentById(any()))
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(1);

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.getDocumentById(1)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return document with all properties populated', () async {
      // Arrange
      const detailedDocument = DocumentEntity(
        id: 1,
        title: 'Detailed Manual',
        description: 'Comprehensive manual with all details',
        type: DocumentType.manual,
        fileUrl: 'https://example.com/detailed_manual.pdf',
        fileName: 'detailed_manual.pdf',
        fileSize: 2048,
        createdAt: '2024-01-01T00:00:00Z',
        updatedAt: '2024-01-02T00:00:00Z',
        tags: ['manual', 'detailed', 'comprehensive'],
        categories: ['equipment', 'maintenance'],
        relatedModel: 'Model-X1000',
        keywords: 'manual, equipment, maintenance',
        uploadedBy: 123,
        isDownloaded: true,
        localPath: '/local/path/detailed_manual.pdf',
      );

      when(() => mockRepository.getDocumentById(any()))
          .thenAnswer((_) async => const Right(detailedDocument));

      // Act
      final result = await useCase(1);

      // Assert
      expect(result, equals(const Right(detailedDocument)));
      verify(() => mockRepository.getDocumentById(1)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
