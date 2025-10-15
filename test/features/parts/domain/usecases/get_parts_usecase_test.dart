import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/parts/domain/entities/part_entity.dart';
import 'package:fsm/features/parts/domain/repositories/i_parts_repository.dart';
import 'package:fsm/features/parts/domain/usecases/get_parts_usecase.dart';

class MockPartsRepository extends Mock implements IPartsRepository {}

void main() {
  group('GetPartsUseCase', () {
    late GetPartsUseCase useCase;
    late MockPartsRepository mockRepository;

    final testParts = [
      const PartEntity(
        partNumber: 'P001',
        partName: 'Hydraulic Pump',
        category: 'Hydraulics',
        quantityAvailable: 15,
        unitPrice: 299.99,
        status: PartStatus.active,
      ),
      const PartEntity(
        partNumber: 'P002',
        partName: 'Air Filter',
        category: 'Filters',
        quantityAvailable: 5,
        unitPrice: 29.99,
        status: PartStatus.active,
      ),
      const PartEntity(
        partNumber: 'P003',
        partName: 'Oil Seal',
        category: 'Seals',
        quantityAvailable: 0,
        unitPrice: 15.99,
        status: PartStatus.backordered,
      ),
    ];

    setUp(() {
      mockRepository = MockPartsRepository();
      useCase = GetPartsUseCase(mockRepository);
    });

    test('should return list of parts when repository call is successful',
        () async {
      // Arrange
      when(() => mockRepository.getParts(
            category: any(named: 'category'),
            status: any(named: 'status'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => Right(testParts));

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(Right(testParts)));
      verify(() => mockRepository.getParts(
            category: null,
            status: null,
            searchQuery: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return NetworkFailure when there is no internet connection',
        () async {
      // Arrange
      const failure = NetworkFailure(message: 'No internet connection');
      when(() => mockRepository.getParts(
            category: any(named: 'category'),
            status: any(named: 'status'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.getParts(
            category: null,
            status: null,
            searchQuery: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return ServerFailure when server returns error', () async {
      // Arrange
      const failure = ServerFailure(
        message: 'Internal server error',
        statusCode: 500,
      );
      when(() => mockRepository.getParts(
            category: any(named: 'category'),
            status: any(named: 'status'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.getParts(
            category: null,
            status: null,
            searchQuery: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return CacheFailure when offline and no cached data',
        () async {
      // Arrange
      const failure = CacheFailure(message: 'No cached parts available');
      when(() => mockRepository.getParts(
            category: any(named: 'category'),
            status: any(named: 'status'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.getParts(
            category: null,
            status: null,
            searchQuery: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle filtering by category', () async {
      // Arrange
      final filteredParts = [testParts.first];
      when(() => mockRepository.getParts(
            category: any(named: 'category'),
            status: any(named: 'status'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => Right(filteredParts));

      // Act
      final result = await useCase(category: 'Hydraulics');

      // Assert
      expect(result, equals(Right(filteredParts)));
      verify(() => mockRepository.getParts(
            category: 'Hydraulics',
            status: null,
            searchQuery: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle filtering by status', () async {
      // Arrange
      final activeParts =
          testParts.where((p) => p.status == PartStatus.active).toList();
      when(() => mockRepository.getParts(
            category: any(named: 'category'),
            status: any(named: 'status'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => Right(activeParts));

      // Act
      final result = await useCase(status: PartStatus.active);

      // Assert
      expect(result, equals(Right(activeParts)));
      verify(() => mockRepository.getParts(
            category: null,
            status: PartStatus.active,
            searchQuery: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle search query', () async {
      // Arrange
      final searchResults = [testParts.first];
      when(() => mockRepository.getParts(
            category: any(named: 'category'),
            status: any(named: 'status'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => Right(searchResults));

      // Act
      final result = await useCase(searchQuery: 'pump');

      // Assert
      expect(result, equals(Right(searchResults)));
      verify(() => mockRepository.getParts(
            category: null,
            status: null,
            searchQuery: 'pump',
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle multiple filters simultaneously', () async {
      // Arrange
      final filteredParts = [testParts.first];
      when(() => mockRepository.getParts(
            category: any(named: 'category'),
            status: any(named: 'status'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => Right(filteredParts));

      // Act
      final result = await useCase(
        category: 'Hydraulics',
        status: PartStatus.active,
        searchQuery: 'pump',
      );

      // Assert
      expect(result, equals(Right(filteredParts)));
      verify(() => mockRepository.getParts(
            category: 'Hydraulics',
            status: PartStatus.active,
            searchQuery: 'pump',
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return empty list when no parts found', () async {
      // Arrange
      when(() => mockRepository.getParts(
            category: any(named: 'category'),
            status: any(named: 'status'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => const Right([]));

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Right([])));
      verify(() => mockRepository.getParts(
            category: null,
            status: null,
            searchQuery: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle discontinued parts filter', () async {
      // Arrange
      const discontinuedPart = PartEntity(
        partNumber: 'P999',
        partName: 'Old Component',
        category: 'Legacy',
        quantityAvailable: 2,
        unitPrice: 99.99,
        status: PartStatus.discontinued,
      );
      when(() => mockRepository.getParts(
            category: any(named: 'category'),
            status: any(named: 'status'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => const Right([discontinuedPart]));

      // Act
      final result = await useCase(status: PartStatus.discontinued);

      // Assert
      expect(result, equals(const Right([discontinuedPart])));
      verify(() => mockRepository.getParts(
            category: null,
            status: PartStatus.discontinued,
            searchQuery: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle inactive parts filter', () async {
      // Arrange
      const inactivePart = PartEntity(
        partNumber: 'P888',
        partName: 'Inactive Component',
        category: 'Misc',
        quantityAvailable: 0,
        unitPrice: 49.99,
        status: PartStatus.inactive,
      );
      when(() => mockRepository.getParts(
            category: any(named: 'category'),
            status: any(named: 'status'),
            searchQuery: any(named: 'searchQuery'),
          )).thenAnswer((_) async => const Right([inactivePart]));

      // Act
      final result = await useCase(status: PartStatus.inactive);

      // Assert
      expect(result, equals(const Right([inactivePart])));
      verify(() => mockRepository.getParts(
            category: null,
            status: PartStatus.inactive,
            searchQuery: null,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
