import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/core/constants/hive_boxes.dart';
import 'package:fsm/core/storage/hive_service.dart';
import 'package:fsm/features/parts/data/datasources/parts_local_datasource.dart';
import 'package:fsm/features/parts/data/models/part_hive_model.dart';
import 'package:fsm/features/parts/domain/entities/part_entity.dart';
import 'package:hive_ce/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'parts_local_datasource_test.mocks.dart';

// Fake Box implementation for reliable testing
class FakePartBox extends Fake implements Box<PartHiveModel> {
  final Map<dynamic, PartHiveModel> _data = {};

  @override
  Iterable<PartHiveModel> get values => _data.values;

  @override
  PartHiveModel? get(dynamic key, {PartHiveModel? defaultValue}) => _data[key];

  @override
  Future<void> put(dynamic key, PartHiveModel value) async {
    _data[key] = value;
  }

  @override
  Future<int> clear() async {
    final count = _data.length;
    _data.clear();
    return count;
  }

  @override
  Future<void> delete(dynamic key) async {
    _data.remove(key);
  }
}

@GenerateMocks([HiveService])
void main() {
  late PartsLocalDataSourceImpl dataSource;
  late MockHiveService mockHiveService;
  late FakePartBox fakeBox;

  setUp(() {
    mockHiveService = MockHiveService();
    fakeBox = FakePartBox();
    dataSource = PartsLocalDataSourceImpl(mockHiveService);

    when(mockHiveService.getTypedBox<PartHiveModel>(HiveBoxes.parts))
        .thenAnswer((_) async => fakeBox);
  });

  final tPartHiveModel = PartHiveModel(
    partNumber: '123',
    partName: 'Test Part',
    category: 'Test',
    quantityAvailable: 10,
    unitPrice: 100.0,
    status: 0,
    cachedAt: DateTime(2025, 1, 1),
  );

  group('cacheParts', () {
    test('should cache parts to Hive box', () async {
      // Act
      await dataSource.cacheParts([tPartHiveModel]);

      // Assert
      expect(fakeBox.get('123'), tPartHiveModel);
    });
  });

  group('getCachedParts', () {
    test('should return all cached parts when no filters', () async {
      // Arrange
      await fakeBox.put('123', tPartHiveModel);

      // Act
      final result = await dataSource.getCachedParts();

      // Assert
      expect(result.length, 1);
      expect(result.first, tPartHiveModel);
    });

    test('should filter parts by category', () async {
      // Arrange
      final part2 =
          tPartHiveModel.copyWith(partNumber: '456', category: 'Electronics');
      await fakeBox.put('123', tPartHiveModel);
      await fakeBox.put('456', part2);

      // Act
      final result = await dataSource.getCachedParts(category: 'Electronics');

      // Assert
      expect(result.length, 1);
      expect(result.first.partNumber, '456');
    });

    test('should filter parts by status', () async {
      // Arrange
      final inactivePart =
          tPartHiveModel.copyWith(partNumber: '456', status: 1);
      await fakeBox.put('123', tPartHiveModel);
      await fakeBox.put('456', inactivePart);

      // Act
      final result = await dataSource.getCachedParts(status: PartStatus.active);

      // Assert
      expect(result.length, 1);
      expect(result.first.partNumber, '123');
    });

    test('should filter parts by search query', () async {
      // Arrange
      final part2 =
          tPartHiveModel.copyWith(partNumber: '456', partName: 'Other');
      await fakeBox.put('123', tPartHiveModel);
      await fakeBox.put('456', part2);

      // Act
      final result = await dataSource.getCachedParts(searchQuery: 'Test');

      // Assert
      expect(result.length, 1);
      expect(result.first.partNumber, '123');
    });
  });

  group('getCachedPartByPartNumber', () {
    test('should return part by part number', () async {
      // Arrange
      await fakeBox.put('123', tPartHiveModel);

      // Act
      final result = await dataSource.getCachedPartByPartNumber('123');

      // Assert
      expect(result, tPartHiveModel);
    });

    test('should return null if part not found', () async {
      // Act
      final result = await dataSource.getCachedPartByPartNumber('999');

      // Assert
      expect(result, null);
    });
  });

  group('clearPartsCache', () {
    test('should clear all parts from Hive box', () async {
      // Arrange
      await fakeBox.put('123', tPartHiveModel);

      // Act
      await dataSource.clearPartsCache();

      // Assert
      expect(fakeBox.values.isEmpty, true);
    });
  });
}
