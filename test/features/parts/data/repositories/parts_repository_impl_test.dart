import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/core/network/network_info.dart';
import 'package:fsm/features/parts/data/datasources/parts_local_datasource.dart';
import 'package:fsm/features/parts/data/datasources/parts_remote_datasource.dart';
import 'package:fsm/features/parts/data/models/part_dto.dart';
import 'package:fsm/features/parts/data/models/part_hive_model.dart';
import 'package:fsm/features/parts/data/repositories/parts_repository_impl.dart';
import 'package:fsm/features/parts/domain/entities/part_entity.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'parts_repository_impl_test.mocks.dart';

@GenerateMocks([
  PartsRemoteDataSource,
  PartsLocalDataSource,
  NetworkInfo,
])
void main() {
  late PartsRepositoryImpl repository;
  late MockPartsRemoteDataSource mockRemoteDataSource;
  late MockPartsLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUpAll(() {
    provideDummy<Either<Failure, List<PartEntity>>>(const Right([]));
    provideDummy<Either<Failure, PartEntity>>(const Right(PartEntity(
      partNumber: '',
      partName: '',
      category: '',
      quantityAvailable: 0,
      unitPrice: 0.0,
      status: PartStatus.active,
    )));
  });

  setUp(() {
    mockRemoteDataSource = MockPartsRemoteDataSource();
    mockLocalDataSource = MockPartsLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = PartsRepositoryImpl(
      mockRemoteDataSource,
      mockLocalDataSource,
      mockNetworkInfo,
    );

    // Default: online
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
  });

  const tPartDto = PartDto(
    partNumber: '123',
    partName: 'Test Part',
    category: 'Test',
    quantityAvailable: 11, // Not low stock (threshold is <= 10)
    unitPrice: 100.0,
    status: 'active',
  );

  const tLowStockPartDto = PartDto(
    partNumber: '456',
    partName: 'Low Stock Part',
    category: 'Test',
    quantityAvailable: 5,
    unitPrice: 50.0,
    status: 'active',
  );

  final tPartEntity = tPartDto.toEntity();
  final tPartsResponse = PartsResponse(parts: [tPartDto]);
  final tPartHiveModel = PartHiveModel(
    partNumber: tPartEntity.partNumber,
    partName: tPartEntity.partName,
    category: tPartEntity.category,
    quantityAvailable: tPartEntity.quantityAvailable,
    unitPrice: tPartEntity.unitPrice,
    status: tPartEntity.status.index,
    cachedAt: DateTime(2025, 1, 1),
  );

  group('getParts', () {
    test('should return parts from remote when online', () async {
      // Arrange
      when(mockRemoteDataSource.getParts())
          .thenAnswer((_) async => tPartsResponse);
      when(mockLocalDataSource.cacheParts(any))
          .thenAnswer((_) async => Future.value());

      // Act
      final result = await repository.getParts();

      // Assert
      expect(result.isRight, true);
      verify(mockRemoteDataSource.getParts()).called(1);
      verify(mockLocalDataSource.cacheParts(any)).called(1);
    });

    test('should return cached parts when offline', () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      when(mockLocalDataSource.getCachedParts(
        category: anyNamed('category'),
        status: anyNamed('status'),
        searchQuery: anyNamed('searchQuery'),
      )).thenAnswer((_) async => [tPartHiveModel]);

      // Act
      final result = await repository.getParts();

      // Assert
      expect(result.isRight, true);
      expect(result.getRight(), [tPartEntity]);
      verifyNever(mockRemoteDataSource.getParts());
    });

    test('should return CacheFailure when offline and no cached data',
        () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      when(mockLocalDataSource.getCachedParts(
        category: anyNamed('category'),
        status: anyNamed('status'),
        searchQuery: anyNamed('searchQuery'),
      )).thenAnswer((_) async => []);

      // Act
      final result = await repository.getParts();

      // Assert
      expect(result.isLeft, true);
      expect(result.getLeft(), isA<CacheFailure>());
    });
  });

  group('checkPartAvailability', () {
    test('should return part from remote when online', () async {
      // Arrange
      const tQuery = '123';
      when(mockRemoteDataSource.checkPartAvailability(tQuery))
          .thenAnswer((_) async => tPartDto);
      when(mockLocalDataSource.getCachedParts()).thenAnswer((_) async => []);
      when(mockLocalDataSource.cacheParts(any))
          .thenAnswer((_) async => Future.value());

      // Act
      final result = await repository.checkPartAvailability(tQuery);

      // Assert
      expect(result.isRight, true);
      expect(result.getRight(), tPartEntity);
    });

    test('should search in cache when offline', () async {
      // Arrange
      const tQuery = '123';
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      when(mockLocalDataSource.getCachedParts(searchQuery: tQuery))
          .thenAnswer((_) async => [tPartHiveModel]);

      // Act
      final result = await repository.checkPartAvailability(tQuery);

      // Assert
      expect(result.isRight, true);
      expect(result.getRight(), tPartEntity);
      verifyNever(mockRemoteDataSource.checkPartAvailability(any));
    });
  });

  group('getLowStockParts', () {
    test('should return low stock parts from remote when online', () async {
      // Arrange
      when(mockRemoteDataSource.getLowStockParts())
          .thenAnswer((_) async => [tLowStockPartDto]);

      // Act
      final result = await repository.getLowStockParts();

      // Assert
      expect(result.isRight, true);
      expect(result.getRight().length, 1);
      expect(result.getRight().first.partNumber, '456');
    });

    test('should filter cached parts when offline', () async {
      // Arrange
      final lowStockHive =
          tPartHiveModel.copyWith(partNumber: '456', quantityAvailable: 5);
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      when(mockLocalDataSource.getCachedParts())
          .thenAnswer((_) async => [tPartHiveModel, lowStockHive]);

      // Act
      final result = await repository.getLowStockParts();

      // Assert
      expect(result.isRight, true);
      expect(result.getRight().length, 1);
      expect(result.getRight().first.partNumber, '456');
    });
  });

  group('getPartCategories', () {
    test('should return categories from remote when online', () async {
      // Arrange
      when(mockRemoteDataSource.getPartCategories())
          .thenAnswer((_) async => ['Electronics', 'Test']);

      // Act
      final result = await repository.getPartCategories();

      // Assert
      expect(result.isRight, true);
      expect(result.getRight(), ['Electronics', 'Test']);
    });
  });

  group('error handling', () {
    test('should return ServerFailure on DioException when online', () async {
      // Arrange
      when(mockRemoteDataSource.getParts()).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/inventory'),
          type: DioExceptionType.badResponse,
          response: Response(
            requestOptions: RequestOptions(path: '/inventory'),
            statusCode: 500,
            data: {'message': 'Server error'},
          ),
        ),
      );

      // Act
      final result = await repository.getParts();

      // Assert
      expect(result.isLeft, true);
      expect(result.getLeft(), isA<ServerFailure>());
    });
  });
}

extension on Either {
  dynamic getRight() => (this as Right).value;
  dynamic getLeft() => (this as Left).value;
}
