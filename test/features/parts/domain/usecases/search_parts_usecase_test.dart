import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/parts/domain/entities/part_entity.dart';
import 'package:fsm/features/parts/domain/repositories/i_parts_repository.dart';
import 'package:fsm/features/parts/domain/usecases/search_parts_usecase.dart';

class MockPartsRepository extends Mock implements IPartsRepository {}

void main() {
  group('SearchPartsUseCase', () {
    late SearchPartsUseCase useCase;
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
        partName: 'Hydraulic Filter',
        category: 'Filters',
        quantityAvailable: 8,
        unitPrice: 45.99,
        status: PartStatus.active,
      ),
    ];

    setUp(() {
      mockRepository = MockPartsRepository();
      useCase = SearchPartsUseCase(mockRepository);
    });

    test('should return list of parts when search is successful', () async {
      // Arrange
      when(() => mockRepository.searchParts(
            query: any(named: 'query'),
          )).thenAnswer((_) async => Right(testParts));

      // Act
      final result = await useCase(query: 'hydraulic');

      // Assert
      expect(result, equals(Right(testParts)));
      verify(() => mockRepository.searchParts(
            query: 'hydraulic',
          )).called(1);
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
      verifyNever(() => mockRepository.searchParts(
            query: any(named: 'query'),
          ));
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
      verifyNever(() => mockRepository.searchParts(
            query: any(named: 'query'),
          ));
    });

    test('should trim whitespace from query before searching', () async {
      // Arrange
      when(() => mockRepository.searchParts(
            query: any(named: 'query'),
          )).thenAnswer((_) async => Right(testParts));

      // Act
      final result = await useCase(query: '  hydraulic  ');

      // Assert
      expect(result, equals(Right(testParts)));
      verify(() => mockRepository.searchParts(
            query: 'hydraulic',
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return NetworkFailure when there is no internet connection',
        () async {
      // Arrange
      const failure = NetworkFailure(message: 'No internet connection');
      when(() => mockRepository.searchParts(
            query: any(named: 'query'),
          )).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(query: 'hydraulic');

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.searchParts(
            query: 'hydraulic',
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return ServerFailure when server returns error', () async {
      // Arrange
      const failure = ServerFailure(
        message: 'Internal server error',
        statusCode: 500,
      );
      when(() => mockRepository.searchParts(
            query: any(named: 'query'),
          )).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(query: 'hydraulic');

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.searchParts(
            query: 'hydraulic',
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return CacheFailure when offline and no cached data',
        () async {
      // Arrange
      const failure = CacheFailure(message: 'No cached parts available');
      when(() => mockRepository.searchParts(
            query: any(named: 'query'),
          )).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(query: 'hydraulic');

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.searchParts(
            query: 'hydraulic',
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle search by part number', () async {
      // Arrange
      final partByNumber = [testParts.first];
      when(() => mockRepository.searchParts(
            query: any(named: 'query'),
          )).thenAnswer((_) async => Right(partByNumber));

      // Act
      final result = await useCase(query: 'P001');

      // Assert
      expect(result, equals(Right(partByNumber)));
      verify(() => mockRepository.searchParts(
            query: 'P001',
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle search by part name', () async {
      // Arrange
      final partByName = [testParts.first];
      when(() => mockRepository.searchParts(
            query: any(named: 'query'),
          )).thenAnswer((_) async => Right(partByName));

      // Act
      final result = await useCase(query: 'Pump');

      // Assert
      expect(result, equals(Right(partByName)));
      verify(() => mockRepository.searchParts(
            query: 'Pump',
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle partial matches', () async {
      // Arrange
      when(() => mockRepository.searchParts(
            query: any(named: 'query'),
          )).thenAnswer((_) async => Right(testParts));

      // Act
      final result = await useCase(query: 'hydr');

      // Assert
      expect(result, equals(Right(testParts)));
      verify(() => mockRepository.searchParts(
            query: 'hydr',
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle case insensitive search', () async {
      // Arrange
      when(() => mockRepository.searchParts(
            query: any(named: 'query'),
          )).thenAnswer((_) async => Right(testParts));

      // Act
      final result = await useCase(query: 'HYDRAULIC');

      // Assert
      expect(result, equals(Right(testParts)));
      verify(() => mockRepository.searchParts(
            query: 'HYDRAULIC',
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return empty list when no search results found', () async {
      // Arrange
      when(() => mockRepository.searchParts(
            query: any(named: 'query'),
          )).thenAnswer((_) async => const Right([]));

      // Act
      final result = await useCase(query: 'nonexistent');

      // Assert
      expect(result, equals(const Right([])));
      verify(() => mockRepository.searchParts(
            query: 'nonexistent',
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle search with special characters', () async {
      // Arrange
      when(() => mockRepository.searchParts(
            query: any(named: 'query'),
          )).thenAnswer((_) async => Right(testParts));

      // Act
      final result = await useCase(query: 'P-001');

      // Assert
      expect(result, equals(Right(testParts)));
      verify(() => mockRepository.searchParts(
            query: 'P-001',
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle search with numbers', () async {
      // Arrange
      when(() => mockRepository.searchParts(
            query: any(named: 'query'),
          )).thenAnswer((_) async => Right(testParts));

      // Act
      final result = await useCase(query: '001');

      // Assert
      expect(result, equals(Right(testParts)));
      verify(() => mockRepository.searchParts(
            query: '001',
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle long search queries', () async {
      // Arrange
      const longQuery =
          'hydraulic pump filter component for heavy machinery equipment';
      when(() => mockRepository.searchParts(
            query: any(named: 'query'),
          )).thenAnswer((_) async => Right(testParts));

      // Act
      final result = await useCase(query: longQuery);

      // Assert
      expect(result, equals(Right(testParts)));
      verify(() => mockRepository.searchParts(
            query: longQuery,
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle single character search', () async {
      // Arrange
      when(() => mockRepository.searchParts(
            query: any(named: 'query'),
          )).thenAnswer((_) async => Right(testParts));

      // Act
      final result = await useCase(query: 'P');

      // Assert
      expect(result, equals(Right(testParts)));
      verify(() => mockRepository.searchParts(
            query: 'P',
          )).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
