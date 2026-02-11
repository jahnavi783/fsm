import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/parts/domain/entities/part_entity.dart';
import 'package:fsm/features/parts/domain/repositories/i_parts_repository.dart';
import 'package:fsm/features/parts/domain/usecases/check_part_availability_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_parts_usecase_test.mocks.dart';

// No need to generate mocks again if we reuse, or we can generate separate file.
// For simplicity, let's assume we can reuse MockIPartsRepository from get_parts...
// But importing mocks from another test file is tricky. Better to generate here or share.
// I will generate it here to be safe and independent.
@GenerateMocks([IPartsRepository])
void main() {
  late CheckPartAvailabilityUseCase useCase;
  late MockIPartsRepository mockRepository;

  setUpAll(() {
    provideDummy<Either<Failure, PartEntity>>(
      const Right(PartEntity(
        partNumber: '',
        partName: '',
        category: '',
        quantityAvailable: 0,
        unitPrice: 0,
        status: PartStatus.active,
      )),
    );
  });

  setUp(() {
    mockRepository = MockIPartsRepository();
    useCase = CheckPartAvailabilityUseCase(mockRepository);
  });

  const tPartEntity = PartEntity(
    partNumber: '123',
    partName: 'Test Part',
    category: 'Test',
    quantityAvailable: 10,
    unitPrice: 100.0,
    status: PartStatus.active,
  );

  test('should return part when query is valid and exists', () async {
    // Arrange
    const tQuery = '123';
    when(mockRepository.checkPartAvailability(tQuery))
        .thenAnswer((_) async => const Right(tPartEntity));

    // Act
    final result = await useCase(query: tQuery);

    // Assert
    expect(result.isRight, true);
    verify(mockRepository.checkPartAvailability(tQuery));
  });

  test('should return ValidationFailure when query is empty', () async {
    // Act
    final result = await useCase(query: '');

    // Assert
    expect(result.isLeft, true);
    result.fold(
      (failure) => expect(failure, isA<ValidationFailure>()),
      (_) => fail('Should be failure'),
    );
    verifyZeroInteractions(mockRepository);
  });
}
