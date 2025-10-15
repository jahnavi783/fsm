import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/documents/domain/repositories/i_document_repository.dart';
import 'package:fsm/features/documents/domain/usecases/get_document_categories_usecase.dart';

class MockDocumentRepository extends Mock implements IDocumentRepository {}

void main() {
  group('GetDocumentCategoriesUseCase', () {
    late GetDocumentCategoriesUseCase useCase;
    late MockDocumentRepository mockRepository;

    const testCategories = [
      'Equipment',
      'Safety',
      'Maintenance',
      'Training',
      'Procedures',
    ];

    setUp(() {
      mockRepository = MockDocumentRepository();
      useCase = GetDocumentCategoriesUseCase(mockRepository);
    });

    test('should return list of categories when repository call is successful',
        () async {
      // Arrange
      when(() => mockRepository.getDocumentCategories())
          .thenAnswer((_) async => const Right(testCategories));

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Right(testCategories)));
      verify(() => mockRepository.getDocumentCategories()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return empty list when no categories are available', () async {
      // Arrange
      when(() => mockRepository.getDocumentCategories())
          .thenAnswer((_) async => const Right([]));

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Right([])));
      verify(() => mockRepository.getDocumentCategories()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return NetworkFailure when there is no internet connection',
        () async {
      // Arrange
      const failure = NetworkFailure(message: 'No internet connection');
      when(() => mockRepository.getDocumentCategories())
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.getDocumentCategories()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return ServerFailure when server returns error', () async {
      // Arrange
      const failure = ServerFailure(
        message: 'Internal server error',
        statusCode: 500,
      );
      when(() => mockRepository.getDocumentCategories())
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.getDocumentCategories()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return CacheFailure when offline and no cached categories',
        () async {
      // Arrange
      const failure = CacheFailure(message: 'No cached categories available');
      when(() => mockRepository.getDocumentCategories())
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository.getDocumentCategories()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle categories with special characters', () async {
      // Arrange
      const specialCategories = [
        'Equipment & Tools',
        'Safety (Critical)',
        'Maintenance - Routine',
        'Training/Certification',
        'Procedures & Guidelines',
      ];
      when(() => mockRepository.getDocumentCategories())
          .thenAnswer((_) async => const Right(specialCategories));

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Right(specialCategories)));
      verify(() => mockRepository.getDocumentCategories()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle large number of categories', () async {
      // Arrange
      final largeCategories = List.generate(100, (index) => 'Category $index');
      when(() => mockRepository.getDocumentCategories())
          .thenAnswer((_) async => Right(largeCategories));

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(Right(largeCategories)));
      verify(() => mockRepository.getDocumentCategories()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle categories with different cases', () async {
      // Arrange
      const mixedCaseCategories = [
        'EQUIPMENT',
        'safety',
        'Maintenance',
        'TRAINING',
        'procedures',
      ];
      when(() => mockRepository.getDocumentCategories())
          .thenAnswer((_) async => const Right(mixedCaseCategories));

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Right(mixedCaseCategories)));
      verify(() => mockRepository.getDocumentCategories()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle categories with unicode characters', () async {
      // Arrange
      const unicodeCategories = [
        'Équipement',
        'Sécurité',
        'Mantenimiento',
        'Ausbildung',
        '設備',
      ];
      when(() => mockRepository.getDocumentCategories())
          .thenAnswer((_) async => const Right(unicodeCategories));

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Right(unicodeCategories)));
      verify(() => mockRepository.getDocumentCategories()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
