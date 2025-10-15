import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/parts/domain/entities/part_entity.dart';
import 'package:fsm/features/parts/domain/repositories/i_parts_repository.dart';
import 'package:fsm/features/parts/domain/usecases/get_low_stock_parts_usecase.dart';
import 'package:fsm/features/parts/domain/usecases/get_parts_usecase.dart';
import 'package:fsm/features/parts/domain/usecases/search_parts_usecase.dart';
import 'package:fsm/features/parts/presentation/blocs/parts/parts_bloc.dart';
import 'package:fsm/features/parts/presentation/blocs/parts/parts_event.dart';
import 'package:fsm/features/parts/presentation/blocs/parts/parts_state.dart';

// Mock classes
class MockGetPartsUseCase extends Mock implements GetPartsUseCase {}

class MockSearchPartsUseCase extends Mock implements SearchPartsUseCase {}

class MockGetLowStockPartsUseCase extends Mock
    implements GetLowStockPartsUseCase {}

class MockPartsRepository extends Mock implements IPartsRepository {}

void main() {
  group('PartsBloc', () {
    late PartsBloc partsBloc;
    late MockGetPartsUseCase mockGetPartsUseCase;
    late MockSearchPartsUseCase mockSearchPartsUseCase;
    late MockGetLowStockPartsUseCase mockGetLowStockPartsUseCase;
    late MockPartsRepository mockPartsRepository;

    // Test data
    const testParts = [
      PartEntity(
        partNumber: 'P001',
        partName: 'Hydraulic Pump',
        category: 'Hydraulics',
        quantityAvailable: 15,
        unitPrice: 299.99,
        status: PartStatus.active,
      ),
      PartEntity(
        partNumber: 'P002',
        partName: 'Air Filter',
        category: 'Filters',
        quantityAvailable: 5,
        unitPrice: 29.99,
        status: PartStatus.active,
      ),
    ];

    const testLowStockParts = [
      PartEntity(
        partNumber: 'P002',
        partName: 'Air Filter',
        category: 'Filters',
        quantityAvailable: 5,
        unitPrice: 29.99,
        status: PartStatus.active,
      ),
      PartEntity(
        partNumber: 'P003',
        partName: 'Oil Seal',
        category: 'Seals',
        quantityAvailable: 0,
        unitPrice: 15.99,
        status: PartStatus.backordered,
      ),
    ];

    const testCategories = ['Hydraulics', 'Filters', 'Seals'];
    const testFailure = NetworkFailure(message: 'Network error');

    setUp(() {
      mockGetPartsUseCase = MockGetPartsUseCase();
      mockSearchPartsUseCase = MockSearchPartsUseCase();
      mockGetLowStockPartsUseCase = MockGetLowStockPartsUseCase();
      mockPartsRepository = MockPartsRepository();

      partsBloc = PartsBloc(
        mockGetPartsUseCase,
        mockSearchPartsUseCase,
        mockGetLowStockPartsUseCase,
        mockPartsRepository,
      );
    });

    tearDown(() {
      partsBloc.close();
    });

    test('initial state should be PartsState with default values', () {
      expect(partsBloc.state, equals(const PartsState()));
    });

    group('LoadParts', () {
      blocTest<PartsBloc, PartsState>(
        'emits [loading, success] when load parts succeeds',
        build: () {
          when(() => mockGetPartsUseCase(
                category: any(named: 'category'),
                status: any(named: 'status'),
                searchQuery: any(named: 'searchQuery'),
              )).thenAnswer((_) async => const Right(testParts));
          return partsBloc;
        },
        act: (bloc) => bloc.add(const PartsEvent.loadParts()),
        expect: () => [
          const PartsState(status: PartsStatus.loading),
          const PartsState(
            status: PartsStatus.success,
            parts: testParts,
          ),
        ],
        verify: (_) {
          verify(() => mockGetPartsUseCase(
                category: null,
                status: null,
                searchQuery: null,
              )).called(1);
        },
      );

      blocTest<PartsBloc, PartsState>(
        'emits [loading, failure] when load parts fails',
        build: () {
          when(() => mockGetPartsUseCase(
                category: any(named: 'category'),
                status: any(named: 'status'),
                searchQuery: any(named: 'searchQuery'),
              )).thenAnswer((_) async => const Left(testFailure));
          return partsBloc;
        },
        act: (bloc) => bloc.add(const PartsEvent.loadParts()),
        expect: () => [
          const PartsState(status: PartsStatus.loading),
          const PartsState(
            status: PartsStatus.failure,
            errorMessage: 'Network error',
          ),
        ],
        verify: (_) {
          verify(() => mockGetPartsUseCase(
                category: null,
                status: null,
                searchQuery: null,
              )).called(1);
        },
      );

      blocTest<PartsBloc, PartsState>(
        'emits correct state when loading with filters',
        build: () {
          when(() => mockGetPartsUseCase(
                category: any(named: 'category'),
                status: any(named: 'status'),
                searchQuery: any(named: 'searchQuery'),
              )).thenAnswer((_) async => const Right(testParts));
          return partsBloc;
        },
        act: (bloc) => bloc.add(const PartsEvent.loadParts(
          category: 'Hydraulics',
          status: PartStatus.active,
          searchQuery: 'pump',
        )),
        expect: () => [
          const PartsState(status: PartsStatus.loading),
          const PartsState(
            status: PartsStatus.success,
            parts: testParts,
          ),
        ],
        verify: (_) {
          verify(() => mockGetPartsUseCase(
                category: 'Hydraulics',
                status: PartStatus.active,
                searchQuery: 'pump',
              )).called(1);
        },
      );
    });

    group('SearchParts', () {
      blocTest<PartsBloc, PartsState>(
        'emits [searching, success] when search succeeds',
        build: () {
          when(() => mockSearchPartsUseCase(
                query: any(named: 'query'),
              )).thenAnswer((_) async => const Right(testParts));
          return partsBloc;
        },
        act: (bloc) => bloc.add(const PartsEvent.searchParts(
          query: 'hydraulic',
        )),
        expect: () => [
          const PartsState(
            isSearching: true,
            searchQuery: 'hydraulic',
          ),
          const PartsState(
            isSearching: false,
            status: PartsStatus.success,
            parts: testParts,
            searchQuery: 'hydraulic',
          ),
        ],
        verify: (_) {
          verify(() => mockSearchPartsUseCase(
                query: 'hydraulic',
              )).called(1);
        },
      );

      blocTest<PartsBloc, PartsState>(
        'emits [searching, failure] when search fails',
        build: () {
          when(() => mockSearchPartsUseCase(
                query: any(named: 'query'),
              )).thenAnswer((_) async => const Left(testFailure));
          return partsBloc;
        },
        act: (bloc) => bloc.add(const PartsEvent.searchParts(
          query: 'hydraulic',
        )),
        expect: () => [
          const PartsState(
            isSearching: true,
            searchQuery: 'hydraulic',
          ),
          const PartsState(
            isSearching: false,
            status: PartsStatus.failure,
            errorMessage: 'Network error',
            searchQuery: 'hydraulic',
          ),
        ],
        verify: (_) {
          verify(() => mockSearchPartsUseCase(
                query: 'hydraulic',
              )).called(1);
        },
      );
    });

    group('ClearSearch', () {
      blocTest<PartsBloc, PartsState>(
        'clears search and triggers LoadParts',
        build: () {
          when(() => mockGetPartsUseCase(
                category: any(named: 'category'),
                status: any(named: 'status'),
                searchQuery: any(named: 'searchQuery'),
              )).thenAnswer((_) async => const Right(testParts));
          return partsBloc;
        },
        seed: () => const PartsState(
          searchQuery: 'hydraulic',
          isSearching: true,
        ),
        act: (bloc) => bloc.add(const PartsEvent.clearSearch()),
        expect: () => [
          const PartsState(
            searchQuery: null,
            isSearching: false,
          ),
          const PartsState(
            status: PartsStatus.loading,
            searchQuery: null,
            isSearching: false,
          ),
          const PartsState(
            status: PartsStatus.success,
            parts: testParts,
            searchQuery: null,
            isSearching: false,
          ),
        ],
        verify: (_) {
          verify(() => mockGetPartsUseCase(
                category: null,
                status: null,
                searchQuery: null,
              )).called(1);
        },
      );
    });

    group('FilterByCategory', () {
      blocTest<PartsBloc, PartsState>(
        'sets category filter and triggers LoadParts',
        build: () {
          when(() => mockGetPartsUseCase(
                category: any(named: 'category'),
                status: any(named: 'status'),
                searchQuery: any(named: 'searchQuery'),
              )).thenAnswer((_) async => const Right(testParts));
          return partsBloc;
        },
        act: (bloc) =>
            bloc.add(const PartsEvent.filterByCategory('Hydraulics')),
        expect: () => [
          const PartsState(
            selectedCategory: 'Hydraulics',
            parts: [],
          ),
          const PartsState(
            status: PartsStatus.loading,
            selectedCategory: 'Hydraulics',
            parts: [],
          ),
          const PartsState(
            status: PartsStatus.success,
            parts: testParts,
            selectedCategory: 'Hydraulics',
          ),
        ],
        verify: (_) {
          verify(() => mockGetPartsUseCase(
                category: 'Hydraulics',
                status: null,
                searchQuery: null,
              )).called(1);
        },
      );
    });

    group('FilterByStatus', () {
      blocTest<PartsBloc, PartsState>(
        'sets status filter and triggers LoadParts',
        build: () {
          when(() => mockGetPartsUseCase(
                category: any(named: 'category'),
                status: any(named: 'status'),
                searchQuery: any(named: 'searchQuery'),
              )).thenAnswer((_) async => const Right(testParts));
          return partsBloc;
        },
        act: (bloc) =>
            bloc.add(const PartsEvent.filterByStatus(PartStatus.active)),
        expect: () => [
          const PartsState(
            selectedStatus: PartStatus.active,
            parts: [],
          ),
          const PartsState(
            status: PartsStatus.loading,
            selectedStatus: PartStatus.active,
            parts: [],
          ),
          const PartsState(
            status: PartsStatus.success,
            parts: testParts,
            selectedStatus: PartStatus.active,
          ),
        ],
        verify: (_) {
          verify(() => mockGetPartsUseCase(
                category: null,
                status: PartStatus.active,
                searchQuery: null,
              )).called(1);
        },
      );
    });

    group('LoadLowStockParts', () {
      blocTest<PartsBloc, PartsState>(
        'updates low stock parts when successful',
        build: () {
          when(() => mockGetLowStockPartsUseCase())
              .thenAnswer((_) async => const Right(testLowStockParts));
          return partsBloc;
        },
        act: (bloc) => bloc.add(const PartsEvent.loadLowStockParts()),
        expect: () => [
          const PartsState(
            lowStockParts: testLowStockParts,
          ),
        ],
        verify: (_) {
          verify(() => mockGetLowStockPartsUseCase()).called(1);
        },
      );

      blocTest<PartsBloc, PartsState>(
        'emits error when load low stock parts fails',
        build: () {
          when(() => mockGetLowStockPartsUseCase())
              .thenAnswer((_) async => const Left(testFailure));
          return partsBloc;
        },
        act: (bloc) => bloc.add(const PartsEvent.loadLowStockParts()),
        expect: () => [
          const PartsState(
            errorMessage: 'Network error',
          ),
        ],
        verify: (_) {
          verify(() => mockGetLowStockPartsUseCase()).called(1);
        },
      );
    });

    group('LoadPartCategories', () {
      blocTest<PartsBloc, PartsState>(
        'updates categories when successful',
        build: () {
          when(() => mockPartsRepository.getPartCategories())
              .thenAnswer((_) async => const Right(testCategories));
          return partsBloc;
        },
        act: (bloc) => bloc.add(const PartsEvent.loadPartCategories()),
        expect: () => [
          const PartsState(
            categories: testCategories,
          ),
        ],
        verify: (_) {
          verify(() => mockPartsRepository.getPartCategories()).called(1);
        },
      );

      blocTest<PartsBloc, PartsState>(
        'emits error when load categories fails',
        build: () {
          when(() => mockPartsRepository.getPartCategories())
              .thenAnswer((_) async => const Left(testFailure));
          return partsBloc;
        },
        act: (bloc) => bloc.add(const PartsEvent.loadPartCategories()),
        expect: () => [
          const PartsState(
            errorMessage: 'Network error',
          ),
        ],
        verify: (_) {
          verify(() => mockPartsRepository.getPartCategories()).called(1);
        },
      );
    });

    group('RefreshParts', () {
      blocTest<PartsBloc, PartsState>(
        'clears parts and triggers LoadParts',
        build: () {
          when(() => mockGetPartsUseCase(
                category: any(named: 'category'),
                status: any(named: 'status'),
                searchQuery: any(named: 'searchQuery'),
              )).thenAnswer((_) async => const Right(testParts));
          return partsBloc;
        },
        seed: () => const PartsState(parts: testParts),
        act: (bloc) => bloc.add(const PartsEvent.refreshParts()),
        expect: () => [
          const PartsState(parts: []),
          const PartsState(
            status: PartsStatus.loading,
            parts: [],
          ),
          const PartsState(
            status: PartsStatus.success,
            parts: testParts,
          ),
        ],
        verify: (_) {
          verify(() => mockGetPartsUseCase(
                category: null,
                status: null,
                searchQuery: null,
              )).called(1);
        },
      );
    });

    group('LoadMoreParts', () {
      blocTest<PartsBloc, PartsState>(
        'loads more parts when not at max and not already loading',
        build: () {
          when(() => mockGetPartsUseCase(
                category: any(named: 'category'),
                status: any(named: 'status'),
                searchQuery: any(named: 'searchQuery'),
              )).thenAnswer((_) async => const Right([testParts.first]));
          return partsBloc;
        },
        seed: () => const PartsState(
          parts: testParts,
          currentPage: 1,
          hasReachedMax: false,
        ),
        act: (bloc) => bloc.add(const PartsEvent.loadMoreParts()),
        expect: () => [
          const PartsState(
            parts: testParts,
            currentPage: 1,
            hasReachedMax: false,
            isLoadingMore: true,
          ),
          PartsState(
            parts: [...testParts, testParts.first],
            currentPage: 2,
            hasReachedMax: false,
            isLoadingMore: false,
          ),
        ],
        verify: (_) {
          verify(() => mockGetPartsUseCase(
                category: null,
                status: null,
                searchQuery: null,
              )).called(1);
        },
      );

      blocTest<PartsBloc, PartsState>(
        'does not load more when hasReachedMax is true',
        build: () => partsBloc,
        seed: () => const PartsState(
          parts: testParts,
          hasReachedMax: true,
        ),
        act: (bloc) => bloc.add(const PartsEvent.loadMoreParts()),
        expect: () => [],
        verify: (_) {
          verifyNever(() => mockGetPartsUseCase(
                category: any(named: 'category'),
                status: any(named: 'status'),
                searchQuery: any(named: 'searchQuery'),
              ));
        },
      );

      blocTest<PartsBloc, PartsState>(
        'does not load more when already loading more',
        build: () => partsBloc,
        seed: () => const PartsState(
          parts: testParts,
          isLoadingMore: true,
        ),
        act: (bloc) => bloc.add(const PartsEvent.loadMoreParts()),
        expect: () => [],
        verify: (_) {
          verifyNever(() => mockGetPartsUseCase(
                category: any(named: 'category'),
                status: any(named: 'status'),
                searchQuery: any(named: 'searchQuery'),
              ));
        },
      );
    });

    group('LoadInventory', () {
      blocTest<PartsBloc, PartsState>(
        'emits loading then success with empty inventory',
        build: () => partsBloc,
        act: (bloc) => bloc.add(const PartsEvent.loadInventory()),
        expect: () => [
          const PartsState(status: PartsStatus.loading),
          const PartsState(
            status: PartsStatus.success,
            inventory: [],
          ),
        ],
      );
    });

    group('UpdateInventory', () {
      blocTest<PartsBloc, PartsState>(
        'emits updating then error for unimplemented functionality',
        build: () => partsBloc,
        act: (bloc) => bloc.add(const PartsEvent.updateInventory(
          partId: 1,
          quantityChange: 5,
          type: 'adjustment',
          reason: 'restock',
        )),
        expect: () => [
          const PartsState(
            isUpdatingInventory: true,
            selectedPartId: 1,
          ),
          const PartsState(
            isUpdatingInventory: false,
            selectedPartId: 1,
            errorMessage: 'Update inventory functionality not yet implemented',
          ),
        ],
      );
    });

    group('LoadInventoryHistory', () {
      blocTest<PartsBloc, PartsState>(
        'emits loading then success with empty history',
        build: () => partsBloc,
        act: (bloc) => bloc.add(const PartsEvent.loadInventoryHistory(
          partId: 1,
        )),
        expect: () => [
          const PartsState(
            status: PartsStatus.loading,
            selectedPartId: 1,
          ),
          const PartsState(
            status: PartsStatus.success,
            selectedPartId: 1,
            inventoryHistory: [],
          ),
        ],
      );
    });

    group('State extensions', () {
      test('isLoading returns true when status is loading', () {
        const state = PartsState(status: PartsStatus.loading);
        expect(state.isLoading, isTrue);
      });

      test('isSuccess returns true when status is success', () {
        const state = PartsState(status: PartsStatus.success);
        expect(state.isSuccess, isTrue);
      });

      test('isFailure returns true when status is failure', () {
        const state = PartsState(status: PartsStatus.failure);
        expect(state.isFailure, isTrue);
      });

      test('hasFilters returns true when filters are applied', () {
        const state = PartsState(selectedCategory: 'Hydraulics');
        expect(state.hasFilters, isTrue);
      });

      test('hasFilters returns false when no filters are applied', () {
        const state = PartsState();
        expect(state.hasFilters, isFalse);
      });

      test('lowStockCount returns correct count', () {
        const state = PartsState(lowStockParts: testLowStockParts);
        expect(state.lowStockCount, equals(2));
      });

      test('outOfStockCount returns correct count', () {
        const outOfStockParts = [
          PartEntity(
            partNumber: 'P001',
            partName: 'Part 1',
            category: 'Category 1',
            quantityAvailable: 0,
            unitPrice: 10.0,
            status: PartStatus.backordered,
          ),
          PartEntity(
            partNumber: 'P002',
            partName: 'Part 2',
            category: 'Category 2',
            quantityAvailable: 5,
            unitPrice: 20.0,
            status: PartStatus.active,
          ),
        ];
        final state = PartsState(parts: outOfStockParts);
        expect(state.outOfStockCount, equals(1));
      });

      test('totalInventoryValue returns correct sum', () {
        const state = PartsState(parts: testParts);
        final expectedValue =
            testParts.fold(0.0, (sum, part) => sum + part.totalValue);
        expect(state.totalInventoryValue, equals(expectedValue));
      });
    });
  });
}
