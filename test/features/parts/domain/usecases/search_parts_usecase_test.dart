import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/parts/domain/entities/part_entity.dart';
import 'package:fsm/features/parts/domain/repositories/i_parts_repository.dart';
import 'package:fsm/features/parts/domain/usecases/search_parts_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_parts_usecase_test.mocks.dart';

@GenerateMocks([IPartsRepository])
void main() {
  late SearchPartsUseCase useCase;
  late MockIPartsRepository mockRepository;

  setUpAll(() {
    provideDummy<Either<Failure, List<PartEntity>>>(const Right([]));
  });

  setUp(() {
    mockRepository = MockIPartsRepository();
    useCase = SearchPartsUseCase(mockRepository);
  });

  const tPartEntity = PartEntity(
    partNumber: '123',
    partName: 'Test Part',
    category: 'Test',
    quantityAvailable: 10,
    unitPrice: 100.0,
    status: PartStatus.active,
  );

  final tPartsList = [tPartEntity];

  test('should search parts from the repository', () async {
    // Arrange
    const tQuery = 'test';
    when(mockRepository.searchParts(query: tQuery))
        .thenAnswer((_) async => Right(tPartsList));

    // Act
    final result = await useCase(query: tQuery);

    // Assert
    expect(result.isRight, true);
    result.fold(
      (failure) => fail('Should not be a failure'),
      (parts) => expect(parts, tPartsList),
    );
    verify(mockRepository.searchParts(query: tQuery)).called(1);
  });

  test('should return Failure when repository fails', () async {
    // Arrange
    const tQuery = 'test';
    const tFailure = ServerFailure(message: 'Server Error');
    when(mockRepository.searchParts(query: tQuery))
        .thenAnswer((_) async => const Left(tFailure));

    // Act
    final result = await useCase(query: tQuery);

    // Assert
    expect(result.isLeft, true);
    result.fold(
      (failure) => expect(failure, tFailure),
      (parts) => fail('Should not be success'),
    );
  });
}
