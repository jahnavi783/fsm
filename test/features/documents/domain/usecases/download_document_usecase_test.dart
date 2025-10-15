import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/documents/domain/entities/document_entity.dart';
import 'package:fsm/features/documents/domain/repositories/i_document_repository.dart';
import 'package:fsm/features/documents/domain/usecases/download_document_usecase.dart';

class MockDocumentRepository extends Mock implements IDocumentRepository {}

void main() {
  group('DownloadDocumentUseCase', () {
    late DownloadDocumentUseCase useCase;
    late MockDocumentRepository mockRepository;

    const testDocument = DocumentEntity(
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
    );

    const downloadedDocument = DocumentEntity(
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
      isDownloaded: true,
      localPath: '/local/path/manual.pdf',
    );

    const testLocalPath = '/local/path/manual.pdf';

    setUp(() {
      mockRepository = MockDocumentRepository();
      useCase = DownloadDocumentUseCase(mockRepository);
    });

    test('should return local path when download is successful', () async {
      // Arrange
      when(
        () => mockRepository.downloadDocument(
          documentId: any(named: 'documentId'),
          fileUrl: any(named: 'fileUrl'),
          fileName: any(named: 'fileName'),
        ),
      ).thenAnswer((_) async => const Right(testLocalPath));

      // Act
      final result = await useCase(document: testDocument);

      // Assert
      expect(result, equals(const Right(testLocalPath)));
      verify(
        () => mockRepository.downloadDocument(
          documentId: testDocument.id,
          fileUrl: testDocument.fileUrl,
          fileName: testDocument.fileName,
        ),
      ).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test(
      'should return ValidationFailure when document file URL is empty',
      () async {
        // Arrange
        const documentWithEmptyUrl = DocumentEntity(
          id: 1,
          title: 'Test Manual',
          description: 'Test manual description',
          type: DocumentType.manual,
          fileUrl: '',
          fileName: 'manual.pdf',
          fileSize: 1024,
          createdAt: '2024-01-01T00:00:00Z',
          updatedAt: '2024-01-01T00:00:00Z',
          tags: ['manual', 'test'],
          categories: ['equipment'],
        );

        // Act
        final result = await useCase(document: documentWithEmptyUrl);

        // Assert
        expect(
          result,
          equals(
            const Left(
              ValidationFailure(message: 'Document file URL is empty'),
            ),
          ),
        );
        verifyNever(
          () => mockRepository.downloadDocument(
            documentId: any(named: 'documentId'),
            fileUrl: any(named: 'fileUrl'),
            fileName: any(named: 'fileName'),
          ),
        );
      },
    );

    test(
      'should return ValidationFailure when document file name is empty',
      () async {
        // Arrange
        const documentWithEmptyFileName = DocumentEntity(
          id: 1,
          title: 'Test Manual',
          description: 'Test manual description',
          type: DocumentType.manual,
          fileUrl: 'https://example.com/manual.pdf',
          fileName: '',
          fileSize: 1024,
          createdAt: '2024-01-01T00:00:00Z',
          updatedAt: '2024-01-01T00:00:00Z',
          tags: ['manual', 'test'],
          categories: ['equipment'],
        );

        // Act
        final result = await useCase(document: documentWithEmptyFileName);

        // Assert
        expect(
          result,
          equals(
            const Left(
              ValidationFailure(message: 'Document file name is empty'),
            ),
          ),
        );
        verifyNever(
          () => mockRepository.downloadDocument(
            documentId: any(named: 'documentId'),
            fileUrl: any(named: 'fileUrl'),
            fileName: any(named: 'fileName'),
          ),
        );
      },
    );

    test(
      'should return existing local path when document is already downloaded',
      () async {
        // Act
        final result = await useCase(document: downloadedDocument);

        // Assert
        expect(result, equals(const Right('/local/path/manual.pdf')));
        verifyNever(
          () => mockRepository.downloadDocument(
            documentId: any(named: 'documentId'),
            fileUrl: any(named: 'fileUrl'),
            fileName: any(named: 'fileName'),
          ),
        );
      },
    );

    test(
      'should return NetworkFailure when there is no internet connection',
      () async {
        // Arrange
        const failure = NetworkFailure(message: 'No internet connection');
        when(
          () => mockRepository.downloadDocument(
            documentId: any(named: 'documentId'),
            fileUrl: any(named: 'fileUrl'),
            fileName: any(named: 'fileName'),
          ),
        ).thenAnswer((_) async => const Left(failure));

        // Act
        final result = await useCase(document: testDocument);

        // Assert
        expect(result, equals(const Left(failure)));
        verify(
          () => mockRepository.downloadDocument(
            documentId: testDocument.id,
            fileUrl: testDocument.fileUrl,
            fileName: testDocument.fileName,
          ),
        ).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );

    test('should return ServerFailure when server returns error', () async {
      // Arrange
      const failure = ServerFailure(message: 'File not found', statusCode: 404);
      when(
        () => mockRepository.downloadDocument(
          documentId: any(named: 'documentId'),
          fileUrl: any(named: 'fileUrl'),
          fileName: any(named: 'fileName'),
        ),
      ).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(document: testDocument);

      // Assert
      expect(result, equals(const Left(failure)));
      verify(
        () => mockRepository.downloadDocument(
          documentId: testDocument.id,
          fileUrl: testDocument.fileUrl,
          fileName: testDocument.fileName,
        ),
      ).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return CacheFailure when storage is full', () async {
      // Arrange
      const failure = CacheFailure(message: 'Insufficient storage space');
      when(
        () => mockRepository.downloadDocument(
          documentId: any(named: 'documentId'),
          fileUrl: any(named: 'fileUrl'),
          fileName: any(named: 'fileName'),
        ),
      ).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(document: testDocument);

      // Assert
      expect(result, equals(const Left(failure)));
      verify(
        () => mockRepository.downloadDocument(
          documentId: testDocument.id,
          fileUrl: testDocument.fileUrl,
          fileName: testDocument.fileName,
        ),
      ).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test(
      'should handle document with special characters in filename',
      () async {
        // Arrange
        const documentWithSpecialChars = DocumentEntity(
          id: 1,
          title: 'Test Manual',
          description: 'Test manual description',
          type: DocumentType.manual,
          fileUrl: 'https://example.com/manual%20with%20spaces.pdf',
          fileName: 'manual with spaces & symbols.pdf',
          fileSize: 1024,
          createdAt: '2024-01-01T00:00:00Z',
          updatedAt: '2024-01-01T00:00:00Z',
          tags: ['manual', 'test'],
          categories: ['equipment'],
        );

        when(
          () => mockRepository.downloadDocument(
            documentId: any(named: 'documentId'),
            fileUrl: any(named: 'fileUrl'),
            fileName: any(named: 'fileName'),
          ),
        ).thenAnswer((_) async => const Right(testLocalPath));

        // Act
        final result = await useCase(document: documentWithSpecialChars);

        // Assert
        expect(result, equals(const Right(testLocalPath)));
        verify(
          () => mockRepository.downloadDocument(
            documentId: documentWithSpecialChars.id,
            fileUrl: documentWithSpecialChars.fileUrl,
            fileName: documentWithSpecialChars.fileName,
          ),
        ).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );

    test('should handle large file downloads', () async {
      // Arrange
      const largeDocument = DocumentEntity(
        id: 1,
        title: 'Large Manual',
        description: 'Large manual description',
        type: DocumentType.manual,
        fileUrl: 'https://example.com/large_manual.pdf',
        fileName: 'large_manual.pdf',
        fileSize: 50 * 1024 * 1024, // 50MB
        createdAt: '2024-01-01T00:00:00Z',
        updatedAt: '2024-01-01T00:00:00Z',
        tags: ['manual', 'large'],
        categories: ['equipment'],
      );

      when(
        () => mockRepository.downloadDocument(
          documentId: any(named: 'documentId'),
          fileUrl: any(named: 'fileUrl'),
          fileName: any(named: 'fileName'),
        ),
      ).thenAnswer((_) async => const Right(testLocalPath));

      // Act
      final result = await useCase(document: largeDocument);

      // Assert
      expect(result, equals(const Right(testLocalPath)));
      verify(
        () => mockRepository.downloadDocument(
          documentId: largeDocument.id,
          fileUrl: largeDocument.fileUrl,
          fileName: largeDocument.fileName,
        ),
      ).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
