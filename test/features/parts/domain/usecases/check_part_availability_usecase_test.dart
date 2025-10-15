import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/parts/domain/entities/part_entity.dart';
import 'package:fsm/features/parts/domain/repositories/i_parts_repository.dart';
import 'package:fsm/features/parts/domain/usecases/check_part_availability_usecase.dart';

class MockPartsRepository extends Mock implements IPartsRepository {}

void main() {
  group('CheckPartAvailabilityUseCase', () {
    late CheckPartAvailabilityUseCase useCase;
    late MockPartsRepository mockRepository;

    const testPart = PartEntity(
      partNumber: 'P001',
      partName: 'Hydraulic Pump',
      category: 'Hydraulics',
      quantityAvailable: 15,
      unitPrice: 299.99,
      status: PartStatus.active,
    );

    const outOfStockPart = PartEntity(
      partNumber: 'P002',
      partName: 'Air Filter',
      category: 'Filters',
      quantityAvailable: 0,
      unitPrice: 29.99,
      status: PartStatus.backordered,
    );

    setUp(() {
      mockRepository = MockPartsRepository();
      useCase = CheckPartAvailabilityUseCase(mockRepository);
    });

    test('should return part when availability check is successful', () async {
      // Arrange
      when(() => mockRepository.checkPartAvailability(any()))
          .thenAnswer((_) async => const Right(testPart));

      // Act
      final result = await useCase(query: 'P001');

      // Assert
      expect(result, equals(const Right(testPart)));
      verify(() => mockRepository.checkPartAvailability('P001')).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return ValidationFailure when query is empty', () async {
      // Act
      final result = await useCase(query: '');

      // Assert
      expect(
          result,
          equals(const Left(ValidationFailure(
            message: 'Search query cannot be empty',
          ))));
      verifyNever(() => mockRepository.checkPartAvailability(any()));
    });

    test('should return ValidationFailure when query is only whitespace',
        () async {
      // Act
      final result = await useCase(query: '   ');

      // Assert
      expect(
          result,
          equals(const Left(ValidationFailure(
            message: 'Search query cannot be empty',
          ))));
      verifyNever(() => mockRepository.checkPartAvailability(any()));
    });

    test('should trim whitespace from query before checking availability',
        () async {
      // Arrange
      when(() => mockRepository.checkPartAvailability(any()))
          .thenAnswer((_) async => const Right(testPart));

      // Act
      final result = await useCase(query: '  P001  ');

      // Assert
      expect(result, equals(const Right(testPart)));
      verify(() => mockRepository.checkPartAvailability('P001')).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return NetworkFailure when there is no internet connection',
        () async {
      // Arrange
      const failure = NetworkFailure(message: 'No internet connection');
      when(() => mockRepository.checkPartAvailability(any()))
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(query: 'P001');

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.checkPartAvailability('P001')).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return ServerFailure when part is not found', () async {
      // Arrange
      const failure = ServerFailure(
        message: 'Part not found',
        statusCode: 404,
      );
      when(() => mockRepository.checkPartAvailability(any()))
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(query: 'NONEXISTENT');

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.checkPartAvailability('NONEXISTENT'))
          .called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return CacheFailure when offline and part not cached',
        () async {
      // Arrange
      const failure = CacheFailure(message: 'Part not available offline');
      when(() => mockRepository.checkPartAvailability(any()))
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(query: 'P001');

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.checkPartAvailability('P001')).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle search by part number', () async {
      // Arrange
      when(() => mockRepository.checkPartAvailability(any()))
          .thenAnswer((_) async => const Right(testPart));

      // Act
      final result = await useCase(query: 'P001');

      // Assert
      expect(result, equals(const Right(testPart)));
      verify(() => mockRepository.checkPartAvailability('P001')).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle search by part name', () async {
      // Arrange
      when(() => mockRepository.checkPartAvailability(any()))
          .thenAnswer((_) async => const Right(testPart));

      // Act
      final result = await useCase(query: 'Hydraulic Pump');

      // Assert
      expect(result, equals(const Right(testPart)));
      verify(() => mockRepository.checkPartAvailability('Hydraulic Pump'))
          .called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return out of stock part when found but unavailable',
        () async {
      // Arrange
      when(() => mockRepository.checkPartAvailability(any()))
          .thenAnswer((_) async => const Right(outOfStockPart));

      // Act
      final result = await useCase(query: 'P002');

      // Assert
      expect(result, equals(const Right(outOfStockPart)));
      verify(() => mockRepository.checkPartAvailability('P002')).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle case insensitive search', () async {
      // Arrange
      when(() => mockRepository.checkPartAvailability(any()))
          .thenAnswer((_) async => const Right(testPart));

      // Act
      final result = await useCase(query: 'p001');

      // Assert
      expect(result, equals(const Right(testPart)));
      verify(() => mockRepository.checkPartAvailability('p001')).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle search with special characters', () async {
      // Arrange
      when(() => mockRepository.checkPartAvailability(any()))
          .thenAnswer((_) async => const Right(testPart));

      // Act
      final result = await useCase(query: 'P-001');

      // Assert
      expect(result, equals(const Right(testPart)));
      verify(() => mockRepository.checkPartAvailability('P-001')).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle partial part number search', () async {
      // Arrange
      when(() => mockRepository.checkPartAvailability(any()))
          .thenAnswer((_) async => const Right(testPart));

      // Act
      final result = await useCase(query: '001');

      // Assert
      expect(result, equals(const Right(testPart)));
      verify(() => mockRepository.checkPartAvailability('001')).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle discontinued part availability check', () async {
      // Arrange
      const discontinuedPart = PartEntity(
        partNumber: 'P999',
        partName: 'Old Component',
        category: 'Legacy',
        quantityAvailable: 2,
        unitPrice: 99.99,
        status: PartStatus.discontinued,
      );
      when(() => mockRepository.checkPartAvailability(any()))
          .thenAnswer((_) async => const Right(discontinuedPart));

      // Act
      final result = await useCase(query: 'P999');

      // Assert
      expect(result, equals(const Right(discontinuedPart)));
      verify(() => mockRepository.checkPartAvailability('P999')).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle inactive part availability check', () async {
      // Arrange
      const inactivePart = PartEntity(
        partNumber: 'P888',
        partName: 'Inactive Component',
        category: 'Misc',
        quantityAvailable: 0,
        unitPrice: 49.99,
        status: PartStatus.inactive,
      );
      when(() => mockRepository.checkPartAvailability(any()))
          .thenAnswer((_) async => const Right(inactivePart));

      // Act
      final result = await useCase(query: 'P888');

      // Assert
      expect(result, equals(const Right(inactivePart)));
      verify(() => mockRepository.checkPartAvailability('P888')).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return ServerFailure when server returns internal error',
        () async {
      // Arrange
      const failure = ServerFailure(
        message: 'Internal server error',
        statusCode: 500,
      );
      when(() => mockRepository.checkPartAvailability(any()))
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(query: 'P001');

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.checkPartAvailability('P001')).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
