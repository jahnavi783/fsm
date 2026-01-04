// import 'package:either_dart/either.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:fsm/core/error/failures.dart';
// import 'package:fsm/core/network/network_info.dart';
// import 'package:fsm/features/auth/domain/repositories/i_auth_repository.dart';
// import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
// import 'package:fsm/features/work_orders/domain/entities/work_orders_data.dart';
// import 'package:fsm/features/work_orders/domain/repositories/i_work_order_repository.dart';
// import 'package:fsm/features/work_orders/domain/usecases/get_work_orders_usecase.dart';
// import 'package:fsm/features/work_orders/presentation/blocs/work_orders_list/work_orders_list_bloc.dart';
// import 'package:fsm/features/work_orders/presentation/blocs/work_orders_list/work_orders_list_event.dart';
// import 'package:fsm/features/work_orders/presentation/blocs/work_orders_list/work_orders_list_state.dart';
// import 'package:mockito/mockito.dart';
//
// // Mock classes
// class MockGetWorkOrdersUseCase extends Mock implements GetWorkOrdersUseCase {}
//
// class MockIWorkOrderRepository extends Mock implements IWorkOrderRepository {}
//
// class MockIAuthRepository extends Mock implements IAuthRepository {}
//
// class MockNetworkInfo extends Mock implements NetworkInfo {}
//
// void main() {
//   late WorkOrdersListBloc workOrdersListBloc;
//   late MockGetWorkOrdersUseCase mockGetWorkOrdersUseCase;
//   late MockIWorkOrderRepository mockRepository;
//   late MockIAuthRepository mockAuthRepository;
//   late MockNetworkInfo mockNetworkInfo;
//
//   // Test data
//   late WorkOrderEntity testWorkOrder1;
//   late WorkOrderEntity testWorkOrder2;
//   late WorkOrdersData testWorkOrdersData;
//
//   setUp(() {
//     mockGetWorkOrdersUseCase = MockGetWorkOrdersUseCase();
//     mockRepository = MockIWorkOrderRepository();
//     mockAuthRepository = MockIAuthRepository();
//     mockNetworkInfo = MockNetworkInfo();
//
//     workOrdersListBloc = WorkOrdersListBloc(
//       mockGetWorkOrdersUseCase,
//       mockRepository,
//       mockAuthRepository,
//       mockNetworkInfo,
//     );
//
//     // Initialize test data
//     testWorkOrder1 = WorkOrderEntity(
//       id: 1,
//       woNumber: 'WO-001',
//       srId: 100,
//       summary: 'Fix broken pump',
//       problemDescription: 'Pump is not working',
//       priority: WorkOrderPriority.high,
//       visitDate: DateTime(2025, 1, 15),
//       location: 'Building A',
//       status: WorkOrderStatus.assigned,
//       durationDays: 1,
//       durationHours: 8.0,
//       createdAt: DateTime(2025, 1, 10),
//       updatedAt: DateTime(2025, 1, 10),
//       serviceRequestNumber: 'SR-000000000100',
//     );
//
//     testWorkOrder2 = WorkOrderEntity(
//       id: 2,
//       woNumber: 'WO-002',
//       srId: 101,
//       summary: 'Install new valve',
//       problemDescription: 'Need new valve installation',
//       priority: WorkOrderPriority.medium,
//       visitDate: DateTime(2025, 1, 16),
//       location: 'Building B',
//       status: WorkOrderStatus.created,
//       durationDays: 2,
//       durationHours: 16.0,
//       createdAt: DateTime(2025, 1, 11),
//       updatedAt: DateTime(2025, 1, 11),
//       serviceRequestNumber: 'SR-000000000101',
//     );
//
//     testWorkOrdersData = WorkOrdersData(
//       workOrders: [testWorkOrder1],
//       unassignedWorkOrders: [testWorkOrder2],
//       total: 2,
//       page: 1,
//       pages: 1,
//       unassignedCount: 1,
//     );
//   });
//
//   tearDown(() {
//     workOrdersListBloc.close();
//   });
//
//   // ============================================================================
//   // LOAD WORK ORDERS - BASIC TESTS
//   // ============================================================================
//   group('WorkOrdersListBloc - Load Work Orders', () {
//     test('initial state is WorkOrdersListState.initial()', () {
//       expect(
//         workOrdersListBloc.state.maybeWhen(
//           initial: () => true,
//           orElse: () => false,
//         ),
//         true,
//       );
//     });
//
//     test('emits [loading, loaded] when fetching work orders succeeds',
//         () async {
//       // Arrange
//       when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
//       when(mockGetWorkOrdersUseCase(any))
//           .thenAnswer((_) async => Right(testWorkOrdersData));
//
//       // Act & Assert
//       await expectLater(
//         workOrdersListBloc.stream,
//         emitsInOrder([
//           isA<WorkOrdersListState>(),
//           isA<WorkOrdersListState>().having(
//             (state) => state.maybeWhen(
//               loaded: (workOrders, unassigned, _, __, ___, ____, _____, ______,
//                       _______, ________, _________) =>
//                   workOrders.isNotEmpty && unassigned.isNotEmpty,
//               orElse: () => false,
//             ),
//             'contains work orders',
//             true,
//           ),
//         ]),
//       );
//
//       workOrdersListBloc.add(
//         const WorkOrdersListEvent.loadWorkOrders(
//           page: 1,
//           limit: 20,
//           isRefresh: false,
//         ),
//       );
//     });
//
//     test('emits [loading, error] when fetching work orders fails', () async {
//       // Arrange
//       const testFailure = ServerFailure(message: 'Server error');
//       when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
//       when(mockGetWorkOrdersUseCase(any))
//           .thenAnswer((_) async => const Left(testFailure));
//
//       // Act & Assert
//       await expectLater(
//         workOrdersListBloc.stream,
//         emitsInOrder([
//           isA<WorkOrdersListState>(),
//           isA<WorkOrdersListState>().having(
//             (state) => state.maybeWhen(
//               error: (failure, _, __) => failure == testFailure,
//               orElse: () => false,
//             ),
//             'error state',
//             true,
//           ),
//         ]),
//       );
//
//       workOrdersListBloc.add(
//         const WorkOrdersListEvent.loadWorkOrders(
//           page: 1,
//           limit: 20,
//           isRefresh: false,
//         ),
//       );
//     });
//
//     test('passes correct parameters to usecase', () async {
//       // Arrange
//       when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
//       when(mockGetWorkOrdersUseCase(any))
//           .thenAnswer((_) async => Right(testWorkOrdersData));
//
//       // Act
//       workOrdersListBloc.add(
//         WorkOrdersListEvent.loadWorkOrders(
//           page: 2,
//           limit: 50,
//           status: WorkOrderStatus.inProgress,
//           priority: WorkOrderPriority.high,
//           searchQuery: 'pump',
//           isRefresh: false,
//         ),
//       );
//
//       await Future.delayed(const Duration(milliseconds: 100));
//
//       // Assert
//       verify(mockGetWorkOrdersUseCase(argThat(
//         isA<GetWorkOrdersParams>()
//             .having((p) => p.page, 'page', 2)
//             .having((p) => p.limit, 'limit', 50)
//             .having((p) => p.status, 'status', WorkOrderStatus.inProgress)
//             .having((p) => p.priority, 'priority', WorkOrderPriority.high)
//             .having((p) => p.searchQuery, 'searchQuery', 'pump'),
//       ))).called(greaterThan(0));
//     });
//
//     test('maintains offline indicator in error state', () async {
//       // Arrange
//       when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
//       const testFailure = CacheFailure(message: 'No cache');
//       when(mockGetWorkOrdersUseCase(any))
//           .thenAnswer((_) async => const Left(testFailure));
//
//       // Act
//       workOrdersListBloc.add(
//         const WorkOrdersListEvent.loadWorkOrders(
//           page: 1,
//           limit: 20,
//           isRefresh: false,
//         ),
//       );
//
//       await Future.delayed(const Duration(milliseconds: 100));
//
//       // Assert
//       expect(
//         workOrdersListBloc.state.maybeWhen(
//           error: (_, __, isOffline) => isOffline == true,
//           orElse: () => false,
//         ),
//         true,
//       );
//     });
//   });
//
//   // ============================================================================
//   // FILTERS & SEARCH
//   // ============================================================================
//   group('WorkOrdersListBloc - Filters & Search', () {
//     test('apply status filter correctly', () async {
//       // Arrange
//       when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
//       when(mockGetWorkOrdersUseCase(any))
//           .thenAnswer((_) async => Right(testWorkOrdersData));
//
//       // Act
//       workOrdersListBloc.add(
//         WorkOrdersListEvent.filterByStatus(WorkOrderStatus.assigned),
//       );
//
//       await Future.delayed(const Duration(milliseconds: 100));
//
//       // Assert
//       verify(mockGetWorkOrdersUseCase(argThat(
//         isA<GetWorkOrdersParams>()
//             .having((p) => p.status, 'status', WorkOrderStatus.assigned),
//       ))).called(greaterThan(0));
//     });
//
//     test('apply priority filter correctly', () async {
//       // Arrange
//       when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
//       when(mockGetWorkOrdersUseCase(any))
//           .thenAnswer((_) async => Right(testWorkOrdersData));
//
//       // Act
//       workOrdersListBloc.add(
//         WorkOrdersListEvent.filterByPriority(WorkOrderPriority.high),
//       );
//
//       await Future.delayed(const Duration(milliseconds: 100));
//
//       // Assert
//       verify(mockGetWorkOrdersUseCase(argThat(
//         isA<GetWorkOrdersParams>()
//             .having((p) => p.priority, 'priority', WorkOrderPriority.high),
//       ))).called(greaterThan(0));
//     });
//
//     test('apply search query correctly', () async {
//       // Arrange
//       when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
//       when(mockGetWorkOrdersUseCase(any))
//           .thenAnswer((_) async => Right(testWorkOrdersData));
//
//       // Act
//       workOrdersListBloc.add(
//         const WorkOrdersListEvent.searchWorkOrders('pump'),
//       );
//
//       await Future.delayed(const Duration(milliseconds: 100));
//
//       // Assert
//       verify(mockGetWorkOrdersUseCase(argThat(
//         isA<GetWorkOrdersParams>()
//             .having((p) => p.searchQuery, 'searchQuery', 'pump'),
//       ))).called(greaterThan(0));
//     });
//
//     test('clear filters resets all filters to null', () async {
//       // Arrange
//       when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
//       when(mockGetWorkOrdersUseCase(any))
//           .thenAnswer((_) async => Right(testWorkOrdersData));
//
//       // Act
//       workOrdersListBloc.add(const WorkOrdersListEvent.clearFilters());
//
//       await Future.delayed(const Duration(milliseconds: 100));
//
//       // Assert
//       verify(mockGetWorkOrdersUseCase(argThat(
//         isA<GetWorkOrdersParams>()
//             .having((p) => p.status, 'status', null)
//             .having((p) => p.priority, 'priority', null)
//             .having((p) => p.searchQuery, 'searchQuery', null),
//       ))).called(greaterThan(0));
//     });
//   });
//
//   // ============================================================================
//   // REFRESH TESTS
//   // ============================================================================
//   group('WorkOrdersListBloc - Refresh', () {
//     test('refresh resets to page 1', () async {
//       // Arrange - Load initial data
//       when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
//       when(mockGetWorkOrdersUseCase(any))
//           .thenAnswer((_) async => Right(testWorkOrdersData));
//
//       workOrdersListBloc.add(
//         const WorkOrdersListEvent.loadWorkOrders(
//           page: 1,
//           limit: 20,
//           isRefresh: false,
//         ),
//       );
//
//       await Future.delayed(const Duration(milliseconds: 100));
//
//       // Act
//       workOrdersListBloc.add(const WorkOrdersListEvent.refreshWorkOrders());
//
//       await Future.delayed(const Duration(milliseconds: 100));
//
//       // Assert - Should be called with page 1
//       verify(mockGetWorkOrdersUseCase(argThat(
//         isA<GetWorkOrdersParams>().having((p) => p.page, 'page', 1),
//       ))).called(greaterThan(1));
//     });
//
//     test('refresh preserves applied filters', () async {
//       // Arrange
//       when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
//       when(mockGetWorkOrdersUseCase(any))
//           .thenAnswer((_) async => Right(testWorkOrdersData));
//
//       workOrdersListBloc.add(
//         WorkOrdersListEvent.loadWorkOrders(
//           page: 1,
//           limit: 20,
//           status: WorkOrderStatus.assigned,
//           priority: WorkOrderPriority.high,
//           searchQuery: 'pump',
//           isRefresh: false,
//         ),
//       );
//
//       await Future.delayed(const Duration(milliseconds: 100));
//
//       // Act
//       workOrdersListBloc.add(const WorkOrdersListEvent.refreshWorkOrders());
//
//       await Future.delayed(const Duration(milliseconds: 100));
//
//       // Assert
//       final lastCall = verify(mockGetWorkOrdersUseCase(captureAny))
//           .captured
//           .last as GetWorkOrdersParams;
//
//       expect(lastCall.status, WorkOrderStatus.assigned);
//       expect(lastCall.priority, WorkOrderPriority.high);
//       expect(lastCall.searchQuery, 'pump');
//     });
//   });
//
//   // ============================================================================
//   // LOAD MORE TESTS
//   // ============================================================================
//   group('WorkOrdersListBloc - Load More', () {
//     test('load more increments page number', () async {
//       // Arrange - Load page 1
//       when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
//       when(mockGetWorkOrdersUseCase(any))
//           .thenAnswer((_) async => Right(testWorkOrdersData));
//
//       workOrdersListBloc.add(
//         const WorkOrdersListEvent.loadWorkOrders(
//           page: 1,
//           limit: 20,
//           isRefresh: false,
//         ),
//       );
//
//       await Future.delayed(const Duration(milliseconds: 100));
//
//       // Arrange - Setup page 2
//       final page2Data = WorkOrdersData(
//         workOrders: [testWorkOrder1],
//         unassignedWorkOrders: [],
//         total: 2,
//         page: 2,
//         pages: 2,
//         unassignedCount: 0,
//       );
//
//       when(mockGetWorkOrdersUseCase(any))
//           .thenAnswer((_) async => Right(page2Data));
//
//       // Act
//       workOrdersListBloc.add(const WorkOrdersListEvent.loadMoreWorkOrders());
//
//       await Future.delayed(const Duration(milliseconds: 100));
//
//       // Assert
//       expect(
//         workOrdersListBloc.state.maybeWhen(
//           loaded: (_, __, ___, currentPage, ____, _____, ______, _______,
//                   ________, _________, __________) =>
//               currentPage == 2,
//           orElse: () => false,
//         ),
//         true,
//       );
//     });
//   });
//
//   // ============================================================================
//   // ASSIGN WORK ORDER TESTS
//   // ============================================================================
//   group('WorkOrdersListBloc - Assign Work Order', () {
//     test('assign work order to self successfully', () async {
//       // Arrange - Initial load
//       when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
//       when(mockGetWorkOrdersUseCase(any))
//           .thenAnswer((_) async => Right(testWorkOrdersData));
//
//       workOrdersListBloc.add(
//         const WorkOrdersListEvent.loadWorkOrders(
//           page: 1,
//           limit: 20,
//           isRefresh: false,
//         ),
//       );
//
//       await Future.delayed(const Duration(milliseconds: 100));
//
//       // Arrange - Mock auth and assign
//       final mockUser = _MockUser(id: 5);
//       when(mockAuthRepository.getCurrentUser())
//           .thenAnswer((_) async => Right(mockUser));
//
//       final assignedWorkOrder = testWorkOrder2.copyWith(
//         status: WorkOrderStatus.assigned,
//         assignedTo: 5,
//       );
//
//       when(mockRepository.assignWorkOrder(
//         workOrderId: 2,
//         technicianId: 5,
//       )).thenAnswer((_) async => Right(assignedWorkOrder));
//
//       // Act
//       workOrdersListBloc.add(
//         const WorkOrdersListEvent.assignWorkOrderToSelf(2),
//       );
//
//       await Future.delayed(const Duration(milliseconds: 200));
//
//       // Assert
//       verify(mockRepository.assignWorkOrder(
//         workOrderId: 2,
//         technicianId: 5,
//       )).called(1);
//     });
//
//     test('handle getCurrentUser failure during assignment', () async {
//       // Arrange
//       when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
//       when(mockGetWorkOrdersUseCase(any))
//           .thenAnswer((_) async => Right(testWorkOrdersData));
//
//       workOrdersListBloc.add(
//         const WorkOrdersListEvent.loadWorkOrders(
//           page: 1,
//           limit: 20,
//           isRefresh: false,
//         ),
//       );
//
//       await Future.delayed(const Duration(milliseconds: 100));
//
//       const testFailure = ServerFailure(message: 'Auth failed');
//       when(mockAuthRepository.getCurrentUser())
//           .thenAnswer((_) async => const Left(testFailure));
//
//       // Act
//       workOrdersListBloc.add(
//         const WorkOrdersListEvent.assignWorkOrderToSelf(2),
//       );
//
//       await Future.delayed(const Duration(milliseconds: 200));
//
//       // Assert
//       expect(
//         workOrdersListBloc.state.maybeWhen(
//           error: (failure, _, __) => failure == testFailure,
//           orElse: () => false,
//         ),
//         true,
//       );
//     });
//   });
//
//   // ============================================================================
//   // OFFLINE BEHAVIOR TESTS
//   // ============================================================================
//   group('WorkOrdersListBloc - Offline Behavior', () {
//     test('indicate offline mode in error state', () async {
//       // Arrange
//       when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
//       const testFailure = CacheFailure(message: 'No cache');
//       when(mockGetWorkOrdersUseCase(any))
//           .thenAnswer((_) async => const Left(testFailure));
//
//       // Act
//       workOrdersListBloc.add(
//         const WorkOrdersListEvent.loadWorkOrders(
//           page: 1,
//           limit: 20,
//           isRefresh: false,
//         ),
//       );
//
//       await Future.delayed(const Duration(milliseconds: 100));
//
//       // Assert
//       expect(
//         workOrdersListBloc.state.maybeWhen(
//           error: (_, __, isOffline) => isOffline,
//           orElse: () => false,
//         ),
//         true,
//       );
//     });
//   });
// }
//
// // ============================================================================
// // MOCK CLASSES & HELPERS
// // ============================================================================
//
// class _MockUser {
//   final int id;
//   final String email;
//   final String firstName;
//
//   _MockUser({
//     required this.id,
//     this.email = 'test@example.com',
//     this.firstName = 'Test',
//   });
// }
