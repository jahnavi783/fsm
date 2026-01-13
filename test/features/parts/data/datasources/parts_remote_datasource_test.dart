import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/features/parts/data/api/parts_api_client.dart';
import 'package:fsm/features/parts/data/datasources/parts_remote_datasource.dart';
import 'package:fsm/features/parts/data/models/part_dto.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'parts_remote_datasource_test.mocks.dart';

@GenerateMocks([PartsApiClient])
void main() {
  late PartsRemoteDataSourceImpl dataSource;
  late MockPartsApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockPartsApiClient();
    dataSource = PartsRemoteDataSourceImpl(mockApiClient);
  });

  const tPartDto = PartDto(
    partNumber: '123',
    partName: 'Test Part',
    category: 'Test',
    quantityAvailable: 11,
    unitPrice: 100.0,
    status: 'active',
  );

  const tLowStockPart = PartDto(
    partNumber: '456',
    partName: 'Low Stock Part',
    category: 'Test',
    quantityAvailable: 5,
    unitPrice: 100.0,
    status: 'active',
  );

  final tPartsResponse = PartsResponse(parts: [tPartDto, tLowStockPart]);

  group('getParts', () {
    test('should return PartsResponse from API client', () async {
      // Arrange
      when(mockApiClient.getParts()).thenAnswer((_) async => tPartsResponse);

      // Act
      final result = await dataSource.getParts();

      // Assert
      expect(result, tPartsResponse);
      verify(mockApiClient.getParts()).called(1);
    });
  });

  group('checkPartAvailability', () {
    test('should return PartDto from API client', () async {
      // Arrange
      const tQuery = '123';
      when(mockApiClient.checkPartAvailability(query: tQuery))
          .thenAnswer((_) async => tPartDto);

      // Act
      final result = await dataSource.checkPartAvailability(tQuery);

      // Assert
      expect(result, tPartDto);
      verify(mockApiClient.checkPartAvailability(query: tQuery)).called(1);
    });
  });

  group('searchParts', () {
    test('should return list with single part when found', () async {
      // Arrange
      const tQuery = '123';
      when(mockApiClient.checkPartAvailability(query: tQuery))
          .thenAnswer((_) async => tPartDto);

      // Act
      final result = await dataSource.searchParts(query: tQuery);

      // Assert
      expect(result, [tPartDto]);
    });

    test('should return empty list when part not found', () async {
      // Arrange
      const tQuery = 'nonexistent';
      when(mockApiClient.checkPartAvailability(query: tQuery))
          .thenThrow(Exception('Not found'));

      // Act
      final result = await dataSource.searchParts(query: tQuery);

      // Assert
      expect(result, []);
    });
  });

  group('getLowStockParts', () {
    test('should return only low stock parts', () async {
      // Arrange
      when(mockApiClient.getParts()).thenAnswer((_) async => tPartsResponse);

      // Act
      final result = await dataSource.getLowStockParts();

      // Assert
      expect(result.length, 1);
      expect(result.first.partNumber, '456');
      expect(result.first.quantityAvailable, 5);
    });
  });

  group('getPartCategories', () {
    test('should return unique categories from parts', () async {
      // Arrange
      final partsWithCategories = PartsResponse(parts: [
        tPartDto,
        tPartDto.copyWith(category: 'Electronics'),
        tPartDto.copyWith(category: 'Test'),
      ]);
      when(mockApiClient.getParts())
          .thenAnswer((_) async => partsWithCategories);

      // Act
      final result = await dataSource.getPartCategories();

      // Assert
      expect(result.length, 2);
      expect(result.contains('Test'), true);
      expect(result.contains('Electronics'), true);
    });
  });
}
