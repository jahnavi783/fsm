import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/features/parts/domain/entities/part_entity.dart';
import 'package:fsm/features/parts/domain/repositories/i_parts_repository.dart';
import 'package:fsm/features/parts/domain/usecases/get_low_stock_parts_usecase.dart';
import 'package:fsm/features/parts/domain/usecases/get_parts_usecase.dart';
import 'package:fsm/features/parts/domain/usecases/search_parts_usecase.dart';
import 'package:fsm/features/parts/presentation/blocs/parts/parts_bloc.dart';
import 'package:fsm/features/parts/presentation/blocs/parts/parts_event.dart';
import 'package:fsm/features/parts/presentation/blocs/parts/parts_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'parts_bloc_test.mocks.dart';

@GenerateMocks([
  GetPartsUseCase,
  SearchPartsUseCase,
  GetLowStockPartsUseCase,
  IPartsRepository,
])
void main() {
  late PartsBloc bloc;
  late MockGetPartsUseCase mockGetPartsUseCase;
  late MockSearchPartsUseCase mockSearchPartsUseCase;
  late MockGetLowStockPartsUseCase mockGetLowStockPartsUseCase;
  late MockIPartsRepository mockRepository;

  setUpAll(() {
    provideDummy<Either<Failure, List<PartEntity>>>(const Right([]));
    provideDummy<Either<Failure, List<String>>>(const Right([]));
  });

  setUp(() {
    mockGetPartsUseCase = MockGetPartsUseCase();
    mockSearchPartsUseCase = MockSearchPartsUseCase();
    mockGetLowStockPartsUseCase = MockGetLowStockPartsUseCase();
    mockRepository = MockIPartsRepository();

    bloc = PartsBloc(
      mockGetPartsUseCase,
      mockSearchPartsUseCase,
      mockGetLowStockPartsUseCase,
      mockRepository,
    );
  });

  tearDown(() {
    bloc.close();
  });

  const tPartEntity = PartEntity(
    partNumber: '123',
    partName: 'Test Part',
    category: 'Test',
    quantityAvailable: 10,
    unitPrice: 100.0,
    status: PartStatus.active,
  );

  final tPartsList = [tPartEntity];

  group('PartsBloc', () {
    test('initial state should be PartsState.initial', () {
      expect(bloc.state.status, PartsStatus.initial);
    });

    blocTest<PartsBloc, PartsState>(
      'emits [loading, success] when LoadParts is added and succeeds',
      build: () {
        when(mockGetPartsUseCase(
          category: null,
          status: null,
          searchQuery: null,
        )).thenAnswer((_) async => Right(tPartsList));
        return bloc;
      },
      act: (bloc) => bloc.add(const PartsEvent.loadParts()),
      expect: () => [
        const PartsState(status: PartsStatus.loading),
        PartsState(
          status: PartsStatus.success,
          parts: tPartsList,
        ),
      ],
      verify: (_) {
        verify(mockGetPartsUseCase(
          category: null,
          status: null,
          searchQuery: null,
        )).called(1);
      },
    );

    blocTest<PartsBloc, PartsState>(
      'emits [loading, failure] when LoadParts fails',
      build: () {
        when(mockGetPartsUseCase(
          category: null,
          status: null,
          searchQuery: null,
        )).thenAnswer((_) async => const Left(ServerFailure(message: 'Error')));
        return bloc;
      },
      act: (bloc) => bloc.add(const PartsEvent.loadParts()),
      expect: () => [
        const PartsState(status: PartsStatus.loading),
        const PartsState(
          status: PartsStatus.failure,
          errorMessage: 'Error',
        ),
      ],
    );

    blocTest<PartsBloc, PartsState>(
      'emits [success] when RefreshParts is added',
      build: () {
        when(mockGetPartsUseCase(
          category: null,
          status: null,
          searchQuery: null,
        )).thenAnswer((_) async => Right(tPartsList));
        return bloc;
      },
      act: (bloc) => bloc.add(const PartsEvent.refreshParts()),
      // Note: refresh emits state part=[] then adds event loadParts which emits loading->success
      // The implementation details of _onRefreshParts emits parts=[] immediately.
      expect: () => [
        // From _onRefreshParts
        const PartsState(parts: []),
        // From _onLoadParts
        const PartsState(parts: [], status: PartsStatus.loading),
        PartsState(parts: tPartsList, status: PartsStatus.success),
      ],
    );

    blocTest<PartsBloc, PartsState>(
      'emits [isSearching=true, success] when SearchParts is added',
      build: () {
        when(mockSearchPartsUseCase(query: 'query'))
            .thenAnswer((_) async => Right(tPartsList));
        return bloc;
      },
      act: (bloc) => bloc.add(const PartsEvent.searchParts(query: 'query')),
      expect: () => [
        const PartsState(isSearching: true, searchQuery: 'query'),
        // Then search completes
        PartsState(
          isSearching: false,
          searchQuery: 'query',
          status: PartsStatus.success,
          parts: tPartsList,
        ),
      ],
    );

    blocTest<PartsBloc, PartsState>(
      'emits correct state when FilterByCategory is added',
      build: () {
        when(mockGetPartsUseCase(
          category: 'cat',
          status: null,
          searchQuery: null,
        )).thenAnswer((_) async => Right(tPartsList));
        return bloc;
      },
      act: (bloc) => bloc.add(const PartsEvent.filterByCategory('cat')),
      expect: () => [
        const PartsState(selectedCategory: 'cat', parts: []),
        const PartsState(
            selectedCategory: 'cat', parts: [], status: PartsStatus.loading),
        PartsState(
            selectedCategory: 'cat',
            parts: tPartsList,
            status: PartsStatus.success),
      ],
    );

    blocTest<PartsBloc, PartsState>(
      'emits [categories] when LoadPartCategories is added',
      build: () {
        when(mockRepository.getPartCategories())
            .thenAnswer((_) async => const Right(['Cat1', 'Cat2']));
        return bloc;
      },
      act: (bloc) => bloc.add(const PartsEvent.loadPartCategories()),
      expect: () => [
        const PartsState(categories: ['Cat1', 'Cat2']),
      ],
    );

    blocTest<PartsBloc, PartsState>(
      'emits [lowStockParts] when LoadLowStockParts is added',
      build: () {
        when(mockGetLowStockPartsUseCase())
            .thenAnswer((_) async => Right(tPartsList));
        return bloc;
      },
      act: (bloc) => bloc.add(const PartsEvent.loadLowStockParts()),
      expect: () => [
        PartsState(lowStockParts: tPartsList),
      ],
    );
  });
}
