import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fsm/core/error/failures.dart';
import 'package:fsm/core/network/network_info.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/domain/repositories/i_work_order_repository.dart';
import 'package:fsm/features/work_orders/domain/usecases/get_work_orders_usecase.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_orders_list/work_orders_list_bloc.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_orders_list/work_orders_list_event.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_orders_list/work_orders_list_state.dart';

// Mock classes
class MockGetWorkOrdersUseCase extends Mock implements GetWorkOrdersUseCase {}

class MockWorkOrderRepository extends Mock implements IWorkOrderRepository {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

// Fake classes for mocktail fallback values
class FakeGetWorkOrdersParams extends Fake implements GetWorkOrdersParams {}

void main() {
  group('WorkOrdersListBloc', () {
    late WorkOrdersListBloc bloc;
    late MockGetWorkOrdersUseCase mockGetWorkOrdersUseCase;
    late MockWorkOrderRepository mockRepository;
    late MockNetworkInfo mockNetworkInfo;

    final testWorkOrder1 = WorkOrderEntity(
      id: 1,
      woNumber: 'WO-001',
      srId: 1,
      summary: 'Test Work Order 1',
      problemDescription: 'Test problem description',
      priority: WorkOrderPriority.high,
      visitDate: DateTime.parse('2024-01-15T10:00:00Z'),
      location: 'Test Location 1',
      status: WorkOrderStatus.assigned,
      durationDays: 1,
      createdAt: DateTime.parse('2024-01-10T10:00:00Z'),
      updatedAt: DateTime.parse('2024-01-10T10:00:00Z'),
    );

    final testWorkOrders = [testWorkOrder1];

    setUpAll(() {
      // Register fallback values for mocktail
      registerFallbackValue(FakeGetWorkOrdersParams());
    });

    setUp(() {
      mockGetWorkOrdersUseCase = MockGetWorkOrdersUseCase();
      mockRepository = MockWorkOrderRepository();
      mockNetworkInfo = MockNetworkInfo();
      bloc = WorkOrdersListBloc(
        mockGetWorkOrdersUseCase,
        mockRepository,
        mockNetworkInfo,
      );
    });

    tearDown(() {
      bloc.close();
    });

    test('initial state should be WorkOrdersListInitial', () {
      expect(bloc.state, equals(const WorkOrdersListState.initial()));
    });

    group('LoadWorkOrders', () {
      blocTest<WorkOrdersListBloc, WorkOrdersListState>(
        'emits [loading, loaded] when load work orders succeeds',
        build: () {
          when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          when(() => mockGetWorkOrdersUseCase(any())).thenAnswer(
            (_) async => Right(testWorkOrders),
          );
          when(() => mockRepository.getCachedWorkOrders()).thenAnswer(
            (_) async => const Right([]),
          );
          return bloc;
        },
        act: (bloc) => bloc.add(const WorkOrdersListEvent.loadWorkOrders()),
        expect: () => [
          const WorkOrdersListState.loading(),
          WorkOrdersListState.loaded(
            workOrders: testWorkOrders,
            currentPage: 1,
            hasReachedMax: true, // Since we have 1 item < 20 limit
            isOffline: false,
            hasPendingSync: false,
          ),
        ],
        verify: (_) {
          verify(() => mockNetworkInfo.isConnected).called(1);
          verify(() => mockGetWorkOrdersUseCase(any())).called(1);
        },
      );

      blocTest<WorkOrdersListBloc, WorkOrdersListState>(
        'emits [loading, error] when load work orders fails',
        build: () {
          const failure = NetworkFailure(message: 'No internet connection');
          when(() => mockNetworkInfo.isConnected)
              .thenAnswer((_) async => false);
          when(() => mockGetWorkOrdersUseCase(any())).thenAnswer(
            (_) async => const Left(failure),
          );
          return bloc;
        },
        act: (bloc) => bloc.add(const WorkOrdersListEvent.loadWorkOrders()),
        expect: () => [
          const WorkOrdersListState.loading(),
          const WorkOrdersListState.error(
            failure: NetworkFailure(message: 'No internet connection'),
            workOrders: [],
            isOffline: true,
          ),
        ],
        verify: (_) {
          verify(() => mockNetworkInfo.isConnected).called(1);
          verify(() => mockGetWorkOrdersUseCase(any())).called(1);
        },
      );
    });
  });
}
