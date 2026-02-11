import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/parts/domain/entities/part_entity.dart';
import 'package:fsm/features/parts/domain/repositories/i_parts_repository.dart';
import 'package:fsm/features/parts/domain/usecases/get_parts_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_parts_usecase_test.mocks.dart';

@GenerateMocks([IPartsRepository])
void main() {
  late GetPartsUseCase useCase;
  late MockIPartsRepository mockRepository;

  setUpAll(() {
    provideDummy<Either<Failure, List<PartEntity>>>(
      const Right([]),
    );
  });

  setUp(() {
    mockRepository = MockIPartsRepository();
    useCase = GetPartsUseCase(mockRepository);
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

  test('should get list of parts from the repository', () async {
    // Arrange
    when(mockRepository.getParts(
      category: anyNamed('category'),
      status: anyNamed('status'),
      searchQuery: anyNamed('searchQuery'),
    )).thenAnswer((_) async => Right(tPartsList));

    // Act
    final result = await useCase();

    // Assert
    expect(result.isRight, true);
    result.fold(
      (failure) => fail('Should not be a failure'),
      (parts) => expect(parts, tPartsList),
    );
    verify(mockRepository.getParts(
      category: null,
      status: null,
      searchQuery: null,
    ));
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return Failure when repository fails', () async {
    // Arrange
    const tFailure = ServerFailure(message: 'Server Error');
    when(mockRepository.getParts(
      category: anyNamed('category'),
      status: anyNamed('status'),
      searchQuery: anyNamed('searchQuery'),
    )).thenAnswer((_) async => const Left(tFailure));

    // Act
    final result = await useCase();

    // Assert
    expect(result.isLeft, true);
    result.fold(
      (failure) => expect(failure, tFailure),
      (parts) => fail('Should not be success'),
    );
  });
}
