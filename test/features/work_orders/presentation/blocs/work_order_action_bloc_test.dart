import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/core/network/network_info.dart';
import 'package:fsm/core/services/location_service.dart';
import 'package:fsm/features/work_orders/data/services/local_user_store.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_grouped_images_entity.dart';
import 'package:fsm/features/work_orders/domain/usecases/complete_work_order_usecase.dart';
import 'package:fsm/features/work_orders/domain/usecases/get_work_order_details_usecase.dart';
import 'package:fsm/features/work_orders/domain/usecases/pause_work_order_usecase.dart';
import 'package:fsm/features/work_orders/domain/usecases/reject_work_order_usecase.dart';
import 'package:fsm/features/work_orders/domain/usecases/resume_work_order_usecase.dart';
import 'package:fsm/features/work_orders/domain/usecases/start_work_order_usecase.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_bloc.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_event.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_order_action/work_order_action_state.dart';
import 'package:location/location.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'work_order_action_bloc_test.mocks.dart';

@GenerateMocks([
  GetWorkOrderDetailsUseCase,
  StartWorkOrderUseCase,
  PauseWorkOrderUseCase,
  ResumeWorkOrderUseCase,
  CompleteWorkOrderUseCase,
  RejectWorkOrderUseCase,
  LocationService,
  NetworkInfo,
  LocalUserStore,
])
void main() {
  late WorkOrderActionBloc bloc;
  late MockGetWorkOrderDetailsUseCase mockGetDetails;
  late MockStartWorkOrderUseCase mockStart;
  late MockPauseWorkOrderUseCase mockPause;
  late MockResumeWorkOrderUseCase mockResume;
  late MockCompleteWorkOrderUseCase mockComplete;
  late MockRejectWorkOrderUseCase mockReject;
  late MockLocationService mockLocation;
  late MockNetworkInfo mockNetwork;
  late MockLocalUserStore mockUserStore;

  setUpAll(() {
    provideDummy<Either<Failure, WorkOrderDetailsResult>>(
      Right(WorkOrderDetailsResult(
        workOrder: WorkOrderEntity(
          id: 0,
          woNumber: '',
          srId: 0,
          summary: '',
          problemDescription: '',
          priority: WorkOrderPriority.low,
          visitDate: DateTime(2000),
          location: '',
          status: WorkOrderStatus.assigned,
          durationDays: 0,
          createdAt: DateTime(2000),
          updatedAt: DateTime(2000),
          images: [],
        ),
      )),
    );
    provideDummy<Either<Failure, WorkOrderEntity>>(
      Right(WorkOrderEntity(
        id: 0,
        woNumber: '',
        srId: 0,
        summary: '',
        problemDescription: '',
        priority: WorkOrderPriority.low,
        visitDate: DateTime(2000),
        location: '',
        status: WorkOrderStatus.assigned,
        durationDays: 0,
        createdAt: DateTime(2000),
        updatedAt: DateTime(2000),
        images: [],
      )),
    );
  });

  setUp(() {
    mockGetDetails = MockGetWorkOrderDetailsUseCase();
    mockStart = MockStartWorkOrderUseCase();
    mockPause = MockPauseWorkOrderUseCase();
    mockResume = MockResumeWorkOrderUseCase();
    mockComplete = MockCompleteWorkOrderUseCase();
    mockReject = MockRejectWorkOrderUseCase();
    mockLocation = MockLocationService();
    mockNetwork = MockNetworkInfo();
    mockUserStore = MockLocalUserStore();

    bloc = WorkOrderActionBloc(
      mockGetDetails,
      mockStart,
      mockPause,
      mockResume,
      mockComplete,
      mockReject,
      mockLocation,
      mockNetwork,
      mockUserStore,
    );
  });

  tearDown(() {
    bloc.close();
  });

  const tWorkOrderId = 1;
  final tWorkOrder = WorkOrderEntity(
    id: tWorkOrderId,
    woNumber: 'WO-123',
    srId: 101,
    serviceRequestNumber: 'SR-101',
    summary: 'Test',
    problemDescription: 'Desc',
    priority: WorkOrderPriority.medium,
    visitDate: DateTime(2025, 1, 1),
    location: 'Loc',
    status: WorkOrderStatus.assigned,
    durationDays: 1,
    createdAt: DateTime(2025, 1, 1),
    updatedAt: DateTime(2025, 1, 1),
  );

  final tDetailsResult = WorkOrderDetailsResult(
    workOrder: tWorkOrder,
    groupedImages:
        WorkOrderGroupedImagesEntity(workOrderId: 1, groupedImages: {}),
  );

  group('loadWorkOrder', () {
    test('initial state is initial', () {
      expect(bloc.state, const WorkOrderActionState.initial());
    });

    blocTest<WorkOrderActionBloc, WorkOrderActionState>(
      'emits [loading, loaded] when successful',
      build: () {
        when(mockNetwork.isConnected).thenAnswer((_) async => true);
        when(mockGetDetails(tWorkOrderId))
            .thenAnswer((_) async => Right(tDetailsResult));
        when(mockUserStore.getUserId()).thenAnswer((_) async => '101');
        return bloc;
      },
      act: (bloc) => bloc.add(WorkOrderActionEvent.loadWorkOrder(tWorkOrderId)),
      expect: () => [
        const WorkOrderActionState.loading(),
        isA<WorkOrderActionState>().having(
            (state) => state.maybeWhen(
                  loaded: (wo, _, __, offline, ___, ____, _____) =>
                      wo == tWorkOrder && !offline,
                  orElse: () => false,
                ),
            'loaded state',
            true),
      ],
    );

    blocTest<WorkOrderActionBloc, WorkOrderActionState>(
      'emits [loading, error] when failure',
      build: () {
        when(mockNetwork.isConnected).thenAnswer((_) async => true);
        when(mockGetDetails(tWorkOrderId)).thenAnswer(
            (_) async => const Left(ServerFailure(message: 'Error')));
        when(mockUserStore.getUserId()).thenAnswer((_) async => '101');
        return bloc;
      },
      act: (bloc) => bloc.add(WorkOrderActionEvent.loadWorkOrder(tWorkOrderId)),
      expect: () => [
        const WorkOrderActionState.loading(),
        isA<WorkOrderActionState>().having(
            (state) => state.maybeWhen(
                  error: (f, _, __) => f is ServerFailure,
                  orElse: () => false,
                ),
            'error state',
            true),
      ],
    );
  });

  group('startWorkOrder', () {
    const tLat = 10.0;
    const tLng = 20.0;

    // Helper to seed loaded state
    final loadedState = WorkOrderActionState.loaded(
      workOrder: tWorkOrder,
      isOffline: false,
      groupedImages: null,
    );

    blocTest<WorkOrderActionBloc, WorkOrderActionState>(
      'emits [actionInProgress, actionSuccess] when successful',
      build: () {
        when(mockStart(any)).thenAnswer((_) async => Right(tWorkOrder));
        return bloc;
      },
      seed: () => loadedState,
      act: (bloc) => bloc.add(WorkOrderActionEvent.startWorkOrder(
        workOrderId: tWorkOrderId,
        latitude: tLat,
        longitude: tLng,
        files: [],
      )),
      expect: () => [
        isA<WorkOrderActionState>().having(
            (s) => s.maybeWhen(
                actionInProgress: (_, type, __) => type == 'start',
                orElse: () => false),
            'progress',
            true),
        isA<WorkOrderActionState>().having(
            (s) => s.maybeWhen(
                actionSuccess: (wo, type, __, ___) =>
                    wo == tWorkOrder && type == 'start',
                orElse: () => false),
            'success',
            true),
      ],
    );

    blocTest<WorkOrderActionBloc, WorkOrderActionState>(
      'emits [actionInProgress, error] when failure',
      build: () {
        when(mockStart(any)).thenAnswer(
            (_) async => const Left(ServerFailure(message: 'Fail')));
        return bloc;
      },
      seed: () => loadedState,
      act: (bloc) => bloc.add(WorkOrderActionEvent.startWorkOrder(
        workOrderId: tWorkOrderId,
        latitude: tLat,
        longitude: tLng,
        files: [],
      )),
      expect: () => [
        isA<WorkOrderActionState>().having(
            (s) => s.maybeWhen(
                actionInProgress: (_, type, __) => type == 'start',
                orElse: () => false),
            'progress',
            true),
        isA<WorkOrderActionState>().having(
            (s) => s.maybeWhen(
                error: (f, _, __) => f is ServerFailure, orElse: () => false),
            'error',
            true),
      ],
    );
  });
}
