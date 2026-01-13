import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/documents/domain/entities/document_entity.dart';
import 'package:fsm/features/documents/domain/repositories/i_document_repository.dart';
import 'package:fsm/features/documents/domain/usecases/search_documents_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_documents_usecase_test.mocks.dart';

@GenerateMocks([IDocumentRepository])
void main() {
  late SearchDocumentsUseCase useCase;
  late MockIDocumentRepository mockRepository;

  setUpAll(() {
    provideDummy<Either<Failure, List<DocumentEntity>>>(const Right([]));
  });

  setUp(() {
    mockRepository = MockIDocumentRepository();
    useCase = SearchDocumentsUseCase(mockRepository);
  });

  final tDocuments = [
    DocumentEntity(
      id: '1',
      title: 'Search Result',
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

  const tQuery = 'Search';
  const tPage = 1;
  const tLimit = 10;

  test('should return search results from the repository', () async {
    // Arrange
    when(mockRepository.searchDocuments(
      query: anyNamed('query'),
      page: anyNamed('page'),
      limit: anyNamed('limit'),
      type: anyNamed('type'),
      category: anyNamed('category'),
    )).thenAnswer((_) async => Right(tDocuments));

    // Act
    final result = await useCase(query: tQuery, page: tPage, limit: tLimit);

    // Assert
    expect(result, Right(tDocuments));
    verify(mockRepository.searchDocuments(
      query: tQuery,
      page: tPage,
      limit: tLimit,
    )).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return failure when query is empty', () async {
    // Act
    final result = await useCase(query: '', page: tPage, limit: tLimit);

    // Assert
    expect(result.isLeft, true);
    expect(result.fold((l) => l, (r) => null), isA<ValidationFailure>());
    verifyZeroInteractions(mockRepository);
  });

  test('should return failure when repository returns failure', () async {
    // Arrange
    const tFailure = ServerFailure(message: 'Search Failed');
    when(mockRepository.searchDocuments(
      query: anyNamed('query'),
      page: anyNamed('page'),
      limit: anyNamed('limit'),
      type: anyNamed('type'),
      category: anyNamed('category'),
    )).thenAnswer((_) async => const Left(tFailure));

    // Act
    final result = await useCase(query: tQuery, page: tPage, limit: tLimit);

    // Assert
    expect(result, const Left(tFailure));
    verify(mockRepository.searchDocuments(
      query: tQuery,
      page: tPage,
      limit: tLimit,
    )).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
