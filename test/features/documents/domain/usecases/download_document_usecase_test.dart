import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/documents/domain/entities/document_entity.dart';
import 'package:fsm/features/documents/domain/repositories/i_document_repository.dart';
import 'package:fsm/features/documents/domain/usecases/download_document_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'download_document_usecase_test.mocks.dart';

@GenerateMocks([IDocumentRepository])
void main() {
  late DownloadDocumentUseCase useCase;
  late MockIDocumentRepository mockRepository;

  setUpAll(() {
    provideDummy<Either<Failure, String>>(const Right('path'));
  });

  setUp(() {
    mockRepository = MockIDocumentRepository();
    useCase = DownloadDocumentUseCase(mockRepository);
  });

  final tDocument = DocumentEntity(
    id: '1',
    title: 'Download Me',
    description: 'Description',
    type: DocumentType.manual,
    fileUrl: 'https://example.com/file.pdf',
    fileName: 'file.pdf',
    fileSize: 1024,
    createdAt: DateTime(2025, 1, 1),
    updatedAt: DateTime(2025, 1, 1),
    tags: ['test'],
    categories: ['test'],
  );

  test('should download document using repository', () async {
    // Arrange
    const tPath = '/local/path/file.pdf';
    when(mockRepository.downloadDocument(
      documentId: anyNamed('documentId'),
      fileUrl: anyNamed('fileUrl'),
      fileName: anyNamed('fileName'),
    )).thenAnswer((_) async => const Right(tPath));

    // Act
    final result = await useCase(document: tDocument);

    // Assert
    expect(result, const Right(tPath));
    verify(mockRepository.downloadDocument(
      documentId: tDocument.id,
      fileUrl: tDocument.fileUrl,
      fileName: tDocument.fileName,
    )).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return local path if already downloaded', () async {
    // Arrange
    final tDownloadedDoc = tDocument.copyWith(
      isDownloaded: true,
      localPath: '/already/downloaded/path.pdf',
    );

    // Act
    final result = await useCase(document: tDownloadedDoc);

    // Assert
    expect(result, Right(tDownloadedDoc.localPath!));
    verifyZeroInteractions(mockRepository);
  });

  test('should return failure when document has no URL', () async {
    // Arrange
    final tInvalidDoc = tDocument.copyWith(fileUrl: '');

    // Act
    final result = await useCase(document: tInvalidDoc);

    // Assert
    expect(result.isLeft, true);
    expect(result.fold((l) => l, (r) => null), isA<ValidationFailure>());
    verifyZeroInteractions(mockRepository);
  });

  test('should return failure when repository returns failure', () async {
    // Arrange
    const tFailure = ServerFailure(message: 'Download Failed');
    when(mockRepository.downloadDocument(
      documentId: anyNamed('documentId'),
      fileUrl: anyNamed('fileUrl'),
      fileName: anyNamed('fileName'),
    )).thenAnswer((_) async => const Left(tFailure));

    // Act
    final result = await useCase(document: tDocument);

    // Assert
    expect(result, const Left(tFailure));
    verify(mockRepository.downloadDocument(
      documentId: tDocument.id,
      fileUrl: tDocument.fileUrl,
      fileName: tDocument.fileName,
    )).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
