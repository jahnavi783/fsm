import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/parts/domain/entities/part_entity.dart';
import 'package:fsm/features/parts/domain/repositories/i_parts_repository.dart';
import 'package:fsm/features/parts/domain/usecases/get_low_stock_parts_usecase.dart';

class MockPartsRepository extends Mock implements IPartsRepository {}

void main() {
  group('GetLowStockPartsUseCase', () {
    late GetLowStockPartsUseCase useCase;
    late MockPartsRepository mockRepository;

    final testLowStockParts = [
      const PartEntity(
        partNumber: 'P001',
        partName: 'Air Filter',
        category: 'Filters',
        quantityAvailable: 5,
        unitPrice: 29.99,
        status: PartStatus.active,
      ),
      const PartEntity(
        partNumber: 'P002',
        partName: 'Oil Seal',
        category: 'Seals',
        quantityAvailable: 2,
        unitPrice: 15.99,
        status: PartStatus.active,
      ),
      const PartEntity(
        partNumber: 'P003',
        partName: 'Gasket',
        category: 'Seals',
        quantityAvailable: 0,
        unitPrice: 8.99,
        status: PartStatus.backordered,
      ),
    ];

    final testCriticalStockParts = [
      const PartEntity(
        partNumber: 'P003',
        partName: 'Gasket',
        category: 'Seals',
        quantityAvailable: 0,
        unitPrice: 8.99,
        status: PartStatus.backordered,
      ),
    ];

    setUp(() {
      mockRepository = MockPartsRepository();
      useCase = GetLowStockPartsUseCase(mockRepository);
    });

    test(
        'should return list of low stock parts when repository call is successful',
        () async {
      // Arrange
      when(() => mockRepository.getLowStockParts())
          .thenAnswer((_) async => Right(testLowStockParts));

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(Right(testLowStockParts)));
      verify(() => mockRepository.getLowStockParts()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return NetworkFailure when there is no internet connection',
        () async {
      // Arrange
      const failure = NetworkFailure(message: 'No internet connection');
      when(() => mockRepository.getLowStockParts())
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.getLowStockParts()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return ServerFailure when server returns error', () async {
      // Arrange
      const failure = ServerFailure(
        message: 'Internal server error',
        statusCode: 500,
      );
      when(() => mockRepository.getLowStockParts())
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.getLowStockParts()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return CacheFailure when offline and no cached data',
        () async {
      // Arrange
      const failure = CacheFailure(message: 'No cached parts available');
      when(() => mockRepository.getLowStockParts())
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.getLowStockParts()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return empty list when no low stock parts found', () async {
      // Arrange
      when(() => mockRepository.getLowStockParts())
          .thenAnswer((_) async => const Right([]));

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Right([])));
      verify(() => mockRepository.getLowStockParts()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    group('getLowStockCount', () {
      test('should return count of low stock parts when successful', () async {
        // Arrange
        when(() => mockRepository.getLowStockParts())
            .thenAnswer((_) async => Right(testLowStockParts));

        // Act
        final result = await useCase.getLowStockCount();

        // Assert
        expect(result, equals(const Right(3)));
        verify(() => mockRepository.getLowStockParts()).called(1);
        verifyNoMoreInteractions(mockRepository);
      });

      test('should return zero when no low stock parts found', () async {
        // Arrange
        when(() => mockRepository.getLowStockParts())
            .thenAnswer((_) async => const Right([]));

        // Act
        final result = await useCase.getLowStockCount();

        // Assert
        expect(result, equals(const Right(0)));
        verify(() => mockRepository.getLowStockParts()).called(1);
        verifyNoMoreInteractions(mockRepository);
      });

      test('should return failure when repository call fails', () async {
        // Arrange
        const failure = NetworkFailure(message: 'No internet connection');
        when(() => mockRepository.getLowStockParts())
            .thenAnswer((_) async => const Left(failure));

        // Act
        final result = await useCase.getLowStockCount();

        // Assert
        expect(result, equals(const Left(failure)));
        verify(() => mockRepository.getLowStockParts()).called(1);
        verifyNoMoreInteractions(mockRepository);
      });
    });

    group('getCriticalStockParts', () {
      test('should return only parts with zero quantity when successful',
          () async {
        // Arrange
        when(() => mockRepository.getLowStockParts())
            .thenAnswer((_) async => Right(testLowStockParts));

        // Act
        final result = await useCase.getCriticalStockParts();

        // Assert
        expect(result, equals(Right(testCriticalStockParts)));
        verify(() => mockRepository.getLowStockParts()).called(1);
        verifyNoMoreInteractions(mockRepository);
      });

      test('should return empty list when no critical stock parts found',
          () async {
        // Arrange
        final nonCriticalParts = [
          const PartEntity(
            partNumber: 'P001',
            partName: 'Air Filter',
            category: 'Filters',
            quantityAvailable: 5,
            unitPrice: 29.99,
            status: PartStatus.active,
          ),
        ];
        when(() => mockRepository.getLowStockParts())
            .thenAnswer((_) async => Right(nonCriticalParts));

        // Act
        final result = await useCase.getCriticalStockParts();

        // Assert
        expect(result, equals(const Right([])));
        verify(() => mockRepository.getLowStockParts()).called(1);
        verifyNoMoreInteractions(mockRepository);
      });

      test('should return failure when repository call fails', () async {
        // Arrange
        const failure = NetworkFailure(message: 'No internet connection');
        when(() => mockRepository.getLowStockParts())
            .thenAnswer((_) async => const Left(failure));

        // Act
        final result = await useCase.getCriticalStockParts();

        // Assert
        expect(result, equals(const Left(failure)));
        verify(() => mockRepository.getLowStockParts()).called(1);
        verifyNoMoreInteractions(mockRepository);
      });

      test('should handle multiple critical stock parts', () async {
        // Arrange
        final multipleCriticalParts = [
          const PartEntity(
            partNumber: 'P001',
            partName: 'Part 1',
            category: 'Category 1',
            quantityAvailable: 0,
            unitPrice: 10.0,
            status: PartStatus.backordered,
          ),
          const PartEntity(
            partNumber: 'P002',
            partName: 'Part 2',
            category: 'Category 2',
            quantityAvailable: 5,
            unitPrice: 20.0,
            status: PartStatus.active,
          ),
          const PartEntity(
            partNumber: 'P003',
            partName: 'Part 3',
            category: 'Category 3',
            quantityAvailable: 0,
            unitPrice: 30.0,
            status: PartStatus.backordered,
          ),
        ];

        final expectedCriticalParts = [
          multipleCriticalParts[0],
          multipleCriticalParts[2],
        ];

        when(() => mockRepository.getLowStockParts())
            .thenAnswer((_) async => Right(multipleCriticalParts));

        // Act
        final result = await useCase.getCriticalStockParts();

        // Assert
        expect(result, equals(Right(expectedCriticalParts)));
        verify(() => mockRepository.getLowStockParts()).called(1);
        verifyNoMoreInteractions(mockRepository);
      });
    });

    test('should handle parts with different statuses in low stock', () async {
      // Arrange
      final mixedStatusParts = [
        const PartEntity(
          partNumber: 'P001',
          partName: 'Active Low Stock',
          category: 'Category 1',
          quantityAvailable: 3,
          unitPrice: 10.0,
          status: PartStatus.active,
        ),
        const PartEntity(
          partNumber: 'P002',
          partName: 'Backordered Part',
          category: 'Category 2',
          quantityAvailable: 0,
          unitPrice: 20.0,
          status: PartStatus.backordered,
        ),
        const PartEntity(
          partNumber: 'P003',
          partName: 'Discontinued Low Stock',
          category: 'Category 3',
          quantityAvailable: 1,
          unitPrice: 30.0,
          status: PartStatus.discontinued,
        ),
      ];

      when(() => mockRepository.getLowStockParts())
          .thenAnswer((_) async => Right(mixedStatusParts));

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(Right(mixedStatusParts)));
      verify(() => mockRepository.getLowStockParts()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
