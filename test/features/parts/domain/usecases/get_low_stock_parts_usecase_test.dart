import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/parts/domain/entities/part_entity.dart';
import 'package:fsm/features/parts/domain/repositories/i_parts_repository.dart';
import 'package:fsm/features/parts/domain/usecases/get_low_stock_parts_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_low_stock_parts_usecase_test.mocks.dart';

@GenerateMocks([IPartsRepository])
void main() {
  late GetLowStockPartsUseCase useCase;
  late MockIPartsRepository mockRepository;

  setUpAll(() {
    provideDummy<Either<Failure, List<PartEntity>>>(const Right([]));
    provideDummy<Either<Failure, int>>(const Right(0));
  });

  setUp(() {
    mockRepository = MockIPartsRepository();
    useCase = GetLowStockPartsUseCase(mockRepository);
  });

  const tLowStockPart = PartEntity(
    partNumber: '123',
    partName: 'Low Stock Part',
    category: 'Test',
    quantityAvailable: 5,
    unitPrice: 100.0,
    status: PartStatus.active,
  );

  const tOutOfStockPart = PartEntity(
    partNumber: '456',
    partName: 'Out of Stock Part',
    category: 'Test',
    quantityAvailable: 0,
    unitPrice: 100.0,
    status: PartStatus.active,
  );

  final tLowStockParts = [tLowStockPart, tOutOfStockPart];

  group('GetLowStockPartsUseCase', () {
    test('should return list of low stock parts from repository', () async {
      // Arrange
      when(mockRepository.getLowStockParts())
          .thenAnswer((_) async => Right(tLowStockParts));

      // Act
      final result = await useCase();

      // Assert
      expect(result.isRight, true);
      result.fold(
        (failure) => fail('Should not be a failure'),
        (parts) {
          expect(parts, tLowStockParts);
          expect(parts.length, 2);
        },
      );
      verify(mockRepository.getLowStockParts()).called(1);
    });

    test('should return Failure when repository fails', () async {
      // Arrange
      const tFailure = ServerFailure(message: 'Server Error');
      when(mockRepository.getLowStockParts())
          .thenAnswer((_) async => const Left(tFailure));

      // Act
      final result = await useCase();

      // Assert
      expect(result.isLeft, true);
      result.fold(
        (failure) => expect(failure, tFailure),
        (parts) => fail('Should not be success'),
      );
    });
  });

  group('getLowStockCount', () {
    test('should return count of low stock parts', () async {
      // Arrange
      when(mockRepository.getLowStockParts())
          .thenAnswer((_) async => Right(tLowStockParts));

      // Act
      final result = await useCase.getLowStockCount();

      // Assert
      expect(result.isRight, true);
      result.fold(
        (failure) => fail('Should not be a failure'),
        (count) => expect(count, 2),
      );
    });
  });

  group('getCriticalStockParts', () {
    test('should return only parts with zero quantity', () async {
      // Arrange
      when(mockRepository.getLowStockParts())
          .thenAnswer((_) async => Right(tLowStockParts));

      // Act
      final result = await useCase.getCriticalStockParts();

      // Assert
      expect(result.isRight, true);
      result.fold(
        (failure) => fail('Should not be a failure'),
        (parts) {
          expect(parts.length, 1);
          expect(parts.first.quantityAvailable, 0);
        },
      );
    });
  });
}
