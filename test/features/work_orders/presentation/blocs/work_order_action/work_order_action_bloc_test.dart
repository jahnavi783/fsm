import 'dart:io';
import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:location/location.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fsm/core/error/failures.dart';
import 'package:fsm/core/network/network_info.dart';
import 'package:fsm/core/services/location_service.dart';
import 'package:fsm/features/work_orders/domain/entities/location_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/domain/usecases/complete_work_order_usecase.dart';
import 'package:fsm/features/work_orders/domain/usecases/get_work_order_details_usecase.dart';
import 'package:fsm/features/work_orders/domain/usecases/pause_work_order_usecase.dart';
import 'package:fsm/features/work_orders/domain/usecases/reject_work_order_usecase.dart';
import 'package:fsm/features/work_orders/domain/usecases/resume_work_order_usecase.dart';
import 'package:fsm/features/work_orders/domain/usecases/start_work_order_usecase.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_bloc.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_event.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_state.dart';

// Mock classes
class MockGetWorkOrderDetailsUseCase extends Mock
    implements GetWorkOrderDetailsUseCase {}

class MockStartWorkOrderUseCase extends Mock implements StartWorkOrderUseCase {}

class MockPauseWorkOrderUseCase extends Mock implements PauseWorkOrderUseCase {}

class MockResumeWorkOrderUseCase extends Mock
    implements ResumeWorkOrderUseCase {}

class MockCompleteWorkOrderUseCase extends Mock
    implements CompleteWorkOrderUseCase {}

class MockRejectWorkOrderUseCase extends Mock
    implements RejectWorkOrderUseCase {}

class MockLocationService extends Mock implements LocationService {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

// Fake classes for mocktail fallback values
class FakeStartWorkOrderParams extends Fake implements StartWorkOrderParams {}

class FakePauseWorkOrderParams extends Fake implements PauseWorkOrderParams {}

class FakeResumeWorkOrderParams extends Fake implements ResumeWorkOrderParams {}

class FakeCompleteWorkOrderParams extends Fake
    implements CompleteWorkOrderParams {}

class FakeRejectWorkOrderParams extends Fake implements RejectWorkOrderParams {}

class FakeFile extends Fake implements File {}

void main() {
  group('WorkOrderActionBloc', () {
    late WorkOrderActionBloc bloc;
    late MockGetWorkOrderDetailsUseCase mockGetWorkOrderDetailsUseCase;
    late MockStartWorkOrderUseCase mockStartWorkOrderUseCase;
    late MockPauseWorkOrderUseCase mockPauseWorkOrderUseCase;
    late MockResumeWorkOrderUseCase mockResumeWorkOrderUseCase;
    late MockCompleteWorkOrderUseCase mockCompleteWorkOrderUseCase;
    late MockRejectWorkOrderUseCase mockRejectWorkOrderUseCase;
    late MockLocationService mockLocationService;
    late MockNetworkInfo mockNetworkInfo;

    final testWorkOrder = WorkOrderEntity(
      id: 1,
      woNumber: 'WO-001',
      srId: 1,
      summary: 'Test Work Order',
      problemDescription: 'Test problem description',
      priority: WorkOrderPriority.high,
      visitDate: DateTime.parse('2024-01-15T10:00:00Z'),
      location: 'Test Location',
      status: WorkOrderStatus.assigned,
      durationDays: 1,
      createdAt: DateTime.parse('2024-01-10T10:00:00Z'),
      updatedAt: DateTime.parse('2024-01-10T10:00:00Z'),
    );

    final testStartedWorkOrder = testWorkOrder.copyWith(
      status: WorkOrderStatus.inProgress,
      startedAt: DateTime.parse('2024-01-15T09:00:00Z'),
    );

    final testLocationData = LocationData.fromMap({
      'latitude': 37.7749,
      'longitude': -122.4194,
      'accuracy': 5.0,
    });

    final testLocationEntity = LocationEntity(
      latitude: 37.7749,
      longitude: -122.4194,
      accuracy: 5.0,
      capturedAt: DateTime.now(),
    );

    setUpAll(() {
      // Register fallback values for mocktail
      registerFallbackValue(FakeStartWorkOrderParams());
      registerFallbackValue(FakePauseWorkOrderParams());
      registerFallbackValue(FakeResumeWorkOrderParams());
      registerFallbackValue(FakeCompleteWorkOrderParams());
      registerFallbackValue(FakeRejectWorkOrderParams());
      registerFallbackValue(FakeFile());
    });

    setUp(() {
      mockGetWorkOrderDetailsUseCase = MockGetWorkOrderDetailsUseCase();
      mockStartWorkOrderUseCase = MockStartWorkOrderUseCase();
      mockPauseWorkOrderUseCase = MockPauseWorkOrderUseCase();
      mockResumeWorkOrderUseCase = MockResumeWorkOrderUseCase();
      mockCompleteWorkOrderUseCase = MockCompleteWorkOrderUseCase();
      mockRejectWorkOrderUseCase = MockRejectWorkOrderUseCase();
      mockLocationService = MockLocationService();
      mockNetworkInfo = MockNetworkInfo();

      bloc = WorkOrderActionBloc(
        mockGetWorkOrderDetailsUseCase,
        mockStartWorkOrderUseCase,
        mockPauseWorkOrderUseCase,
        mockResumeWorkOrderUseCase,
        mockCompleteWorkOrderUseCase,
        mockRejectWorkOrderUseCase,
        mockLocationService,
        mockNetworkInfo,
      );
    });

    tearDown(() {
      bloc.close();
    });

    test('initial state should be WorkOrderActionInitial', () {
      expect(bloc.state, equals(const WorkOrderActionState.initial()));
    });

    group('LoadWorkOrder', () {
      blocTest<WorkOrderActionBloc, WorkOrderActionState>(
        'emits [loading, loaded] when load work order succeeds',
        build: () {
          when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          when(() => mockGetWorkOrderDetailsUseCase(any())).thenAnswer(
            (_) async => Right(testWorkOrder),
          );
          return bloc;
        },
        act: (bloc) => bloc.add(const WorkOrderActionEvent.loadWorkOrder(1)),
        expect: () => [
          const WorkOrderActionState.loading(),
          WorkOrderActionState.loaded(
            workOrder: testWorkOrder,
            isOffline: false,
          ),
        ],
        verify: (_) {
          verify(() => mockNetworkInfo.isConnected).called(1);
          verify(() => mockGetWorkOrderDetailsUseCase(1)).called(1);
        },
      );

      blocTest<WorkOrderActionBloc, WorkOrderActionState>(
        'emits [loading, error] when load work order fails',
        build: () {
          const failure = NetworkFailure(message: 'No internet connection');
          when(() => mockNetworkInfo.isConnected)
              .thenAnswer((_) async => false);
          when(() => mockGetWorkOrderDetailsUseCase(any())).thenAnswer(
            (_) async => const Left(failure),
          );
          return bloc;
        },
        act: (bloc) => bloc.add(const WorkOrderActionEvent.loadWorkOrder(1)),
        expect: () => [
          const WorkOrderActionState.loading(),
          const WorkOrderActionState.error(
            failure: NetworkFailure(message: 'No internet connection'),
            isOffline: true,
          ),
        ],
      );
    });

    group('StartWorkOrder', () {
      blocTest<WorkOrderActionBloc, WorkOrderActionState>(
        'emits [actionInProgress, actionSuccess] when start work order succeeds',
        build: () {
          when(() => mockStartWorkOrderUseCase(any())).thenAnswer(
            (_) async => Right(testStartedWorkOrder),
          );
          return bloc;
        },
        seed: () => WorkOrderActionState.loaded(workOrder: testWorkOrder),
        act: (bloc) => bloc.add(WorkOrderActionEvent.startWorkOrder(
          workOrderId: 1,
          latitude: 37.7749,
          longitude: -122.4194,
          files: const [],
          notes: 'Starting work',
        )),
        expect: () => [
          WorkOrderActionState.actionInProgress(
            workOrder: testWorkOrder,
            actionType: 'start',
          ),
          WorkOrderActionState.actionSuccess(
            workOrder: testStartedWorkOrder,
            actionType: 'start',
            message: 'Work order started successfully',
          ),
        ],
        verify: (_) {
          verify(() => mockStartWorkOrderUseCase(any())).called(1);
        },
      );

      blocTest<WorkOrderActionBloc, WorkOrderActionState>(
        'emits [actionInProgress, error] when start work order fails',
        build: () {
          const failure = LocationFailure(message: 'GPS not available');
          when(() => mockStartWorkOrderUseCase(any())).thenAnswer(
            (_) async => const Left(failure),
          );
          return bloc;
        },
        seed: () => WorkOrderActionState.loaded(workOrder: testWorkOrder),
        act: (bloc) => bloc.add(WorkOrderActionEvent.startWorkOrder(
          workOrderId: 1,
          latitude: 37.7749,
          longitude: -122.4194,
        )),
        expect: () => [
          WorkOrderActionState.actionInProgress(
            workOrder: testWorkOrder,
            actionType: 'start',
          ),
          WorkOrderActionState.error(
            failure: const LocationFailure(message: 'GPS not available'),
            workOrder: testWorkOrder,
          ),
        ],
      );
    });

    group('CaptureLocation', () {
      blocTest<WorkOrderActionBloc, WorkOrderActionState>(
        'emits states when capture location succeeds',
        build: () {
          when(() => mockLocationService.getCurrentLocation()).thenAnswer(
            (_) async => testLocationData,
          );
          return bloc;
        },
        seed: () => WorkOrderActionState.loaded(workOrder: testWorkOrder),
        act: (bloc) => bloc.add(const WorkOrderActionEvent.captureLocation()),
        skip: 2, // Skip the exact state comparison due to timestamp differences
        verify: (bloc) {
          verify(() => mockLocationService.getCurrentLocation()).called(1);
          // Verify the final state has the correct location data (excluding timestamp)
          final finalState = bloc.state;
          expect(finalState, isA<WorkOrderActionState>());
          finalState.maybeWhen(
            loaded: (workOrder, currentLocation, isLocationLoading, isOffline) {
              expect(workOrder, equals(testWorkOrder));
              expect(currentLocation?.latitude, equals(37.7749));
              expect(currentLocation?.longitude, equals(-122.4194));
              expect(currentLocation?.accuracy, equals(5.0));
              expect(isLocationLoading, equals(false));
            },
            orElse: () => fail('Expected loaded state'),
          );
        },
      );

      blocTest<WorkOrderActionBloc, WorkOrderActionState>(
        'emits [loaded with location loading, locationError] when capture fails',
        build: () {
          when(() => mockLocationService.getCurrentLocation()).thenThrow(
            Exception('Location service unavailable'),
          );
          return bloc;
        },
        seed: () => WorkOrderActionState.loaded(workOrder: testWorkOrder),
        act: (bloc) => bloc.add(const WorkOrderActionEvent.captureLocation()),
        expect: () => [
          WorkOrderActionState.loaded(
            workOrder: testWorkOrder,
            isLocationLoading: true,
          ),
          WorkOrderActionState.locationError(
            workOrder: testWorkOrder,
            message:
                'Failed to capture location: Exception: Location service unavailable',
          ),
        ],
      );
    });

    group('ClearError', () {
      blocTest<WorkOrderActionBloc, WorkOrderActionState>(
        'emits [loaded] when clearing error with work order',
        build: () => bloc,
        seed: () => WorkOrderActionState.error(
          failure: const NetworkFailure(message: 'Network error'),
          workOrder: testWorkOrder,
        ),
        act: (bloc) => bloc.add(const WorkOrderActionEvent.clearError()),
        expect: () => [
          WorkOrderActionState.loaded(workOrder: testWorkOrder),
        ],
      );

      blocTest<WorkOrderActionBloc, WorkOrderActionState>(
        'emits [loaded] when clearing location error',
        build: () => bloc,
        seed: () => WorkOrderActionState.locationError(
          workOrder: testWorkOrder,
          message: 'Location error',
        ),
        act: (bloc) => bloc.add(const WorkOrderActionEvent.clearError()),
        expect: () => [
          WorkOrderActionState.loaded(workOrder: testWorkOrder),
        ],
      );
    });
  });
}
