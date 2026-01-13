import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/documents/domain/entities/document_entity.dart';
import 'package:fsm/features/documents/domain/repositories/i_document_repository.dart';
import 'package:fsm/features/documents/domain/usecases/get_document_by_id_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_document_by_id_usecase_test.mocks.dart';

@GenerateMocks([IDocumentRepository])
void main() {
  late GetDocumentByIdUseCase useCase;
  late MockIDocumentRepository mockRepository;

  final tDocument = DocumentEntity(
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
  );

  setUpAll(() {
    provideDummy<Either<Failure, DocumentEntity>>(Right(tDocument));
  });

  setUp(() {
    mockRepository = MockIDocumentRepository();
    useCase = GetDocumentByIdUseCase(mockRepository);
  });

  const tId = '1';

  test('should get document by id from the repository', () async {
    // Arrange
    when(mockRepository.getDocumentById(any))
        .thenAnswer((_) async => Right(tDocument));

    // Act
    final result = await useCase(tId);

    // Assert
    expect(result, Right(tDocument));
    verify(mockRepository.getDocumentById(tId)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return failure when id is empty', () async {
    // Act
    final result = await useCase('');

    // Assert
    expect(result.isLeft, true);
    expect(result.fold((l) => l, (r) => null), isA<ValidationFailure>());
    verifyZeroInteractions(mockRepository);
  });

  test('should return failure when repository returns failure', () async {
    // Arrange
    const tFailure = ServerFailure(message: 'Not Found');
    when(mockRepository.getDocumentById(any))
        .thenAnswer((_) async => const Left(tFailure));

    // Act
    final result = await useCase(tId);

    // Assert
    expect(result, const Left(tFailure));
    verify(mockRepository.getDocumentById(tId)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
