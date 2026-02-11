import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/documents/domain/repositories/i_document_repository.dart';
import 'package:fsm/features/documents/domain/usecases/get_document_categories_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_document_categories_usecase_test.mocks.dart';

@GenerateMocks([IDocumentRepository])
void main() {
  late GetDocumentCategoriesUseCase useCase;
  late MockIDocumentRepository mockRepository;

  setUpAll(() {
    provideDummy<Either<Failure, List<String>>>(const Right([]));
  });

  setUp(() {
    mockRepository = MockIDocumentRepository();
    useCase = GetDocumentCategoriesUseCase(mockRepository);
  });

  final tCategories = ['Category 1', 'Category 2'];

  test('should get document categories from the repository', () async {
    // Arrange
    when(mockRepository.getDocumentCategories())
        .thenAnswer((_) async => Right(tCategories));

    // Act
    final result = await useCase();

    // Assert
    expect(result, Right(tCategories));
    verify(mockRepository.getDocumentCategories()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return failure when repository returns failure', () async {
    // Arrange
    const tFailure = ServerFailure(message: 'Server Error');
    when(mockRepository.getDocumentCategories())
        .thenAnswer((_) async => const Left(tFailure));

    // Act
    final result = await useCase();

    // Assert
    expect(result, const Left(tFailure));
    verify(mockRepository.getDocumentCategories()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
