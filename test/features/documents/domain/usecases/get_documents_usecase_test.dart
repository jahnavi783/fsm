import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/documents/domain/entities/document_entity.dart';
import 'package:fsm/features/documents/domain/repositories/i_document_repository.dart';
import 'package:fsm/features/documents/domain/usecases/get_documents_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_documents_usecase_test.mocks.dart';

@GenerateMocks([IDocumentRepository])
void main() {
  setUpAll(() {
    provideDummy<Either<Failure, List<DocumentEntity>>>(const Right([]));
  });

  late GetDocumentsUseCase useCase;
  late MockIDocumentRepository mockRepository;

  setUp(() {
    mockRepository = MockIDocumentRepository();
    useCase = GetDocumentsUseCase(mockRepository);
  });

  final tDocuments = [
    DocumentEntity(
      id: '1',
      title: 'Test Document',
      description: 'Description',
      type: DocumentType.manual,
      fileUrl: 'url',
      fileName: 'test.pdf',
      fileSize: 1024,
      createdAt: DateTime(2025, 1, 1),
      updatedAt: DateTime(2025, 1, 1),
      tags: ['test'],
      categories: ['test'],
    ),
  ];

  test('should get documents from the repository', () async {
    // Arrange
    const tPage = 1;
    const tLimit = 10;
    when(mockRepository.getDocuments(
      page: tPage,
      limit: tLimit,
      type: anyNamed('type'),
      category: anyNamed('category'),
      searchQuery: anyNamed('searchQuery'),
    )).thenAnswer((_) async => Right(tDocuments));

    // Act
    final result = await useCase(page: tPage, limit: tLimit);

    // Assert
    expect(result, Right(tDocuments));
    verify(mockRepository.getDocuments(
      page: tPage,
      limit: tLimit,
    )).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return failure when repository returns failure', () async {
    // Arrange
    const tPage = 1;
    const tLimit = 10;
    const tFailure = ServerFailure(message: 'Server Error');
    when(mockRepository.getDocuments(
      page: tPage,
      limit: tLimit,
      type: anyNamed('type'),
      category: anyNamed('category'),
      searchQuery: anyNamed('searchQuery'),
    )).thenAnswer((_) async => const Left(tFailure));

    // Act
    final result = await useCase(page: tPage, limit: tLimit);

    // Assert
    expect(result, const Left(tFailure));
    verify(mockRepository.getDocuments(
      page: tPage,
      limit: tLimit,
    )).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
