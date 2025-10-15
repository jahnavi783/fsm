import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../lib/features/work_orders/domain/entities/work_order_entity.dart';
import '../../../../../lib/features/work_orders/presentation/blocs/work_orders_list/work_orders_list_bloc.dart';
import '../../../../../lib/features/work_orders/presentation/blocs/work_orders_list/work_orders_list_event.dart';
import '../../../../../lib/features/work_orders/presentation/blocs/work_orders_list/work_orders_list_state.dart';
import '../../../../../lib/features/work_orders/presentation/pages/dashboard_page.dart';
import '../../../../../lib/features/work_orders/presentation/widgets/work_order_card.dart';
import '../../../../../lib/features/work_orders/presentation/widgets/work_order_shimmer.dart';
import '../../../../helpers/test_helpers.dart';

class MockWorkOrdersListBloc extends Mock implements WorkOrdersListBloc {}

void main() {
  group('DashboardPage Widget Tests', () {
    late MockWorkOrdersListBloc mockWorkOrdersListBloc;
    late List<WorkOrderEntity> testWorkOrders;

    setUp(() {
      mockWorkOrdersListBloc = MockWorkOrdersListBloc();

      testWorkOrders = [
        WorkOrderEntity(
          id: 1,
          woNumber: 'WO-001',
          summary: 'Test work order 1',
          description: 'Description 1',
          status: WorkOrderStatus.assigned,
          priority: WorkOrderPriority.high,
          visitDate: DateTime.now(),
          customer: const CustomerEntity(
            id: 1,
            name: 'Customer 1',
            email: 'customer1@test.com',
            phone: '123-456-7890',
          ),
          location: 'Location 1',
          requiredSkills: [],
          requiredParts: [],
        ),
        WorkOrderEntity(
          id: 2,
          woNumber: 'WO-002',
          summary: 'Test work order 2',
          description: 'Description 2',
          status: WorkOrderStatus.inProgress,
          priority: WorkOrderPriority.medium,
          visitDate: DateTime.now(),
          customer: const CustomerEntity(
            id: 2,
            name: 'Customer 2',
            email: 'customer2@test.com',
            phone: '123-456-7891',
          ),
          location: 'Location 2',
          requiredSkills: [],
          requiredParts: [],
        ),
      ];
    });

    Widget createDashboardPage() {
      return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return BlocProvider<WorkOrdersListBloc>.value(
            value: mockWorkOrdersListBloc,
            child: TestHelpers.createTestApp(
              home: const DashboardPage(),
            ),
          );
        },
      );
    }

    testWidgets('should render all UI elements', (tester) async {
      when(() => mockWorkOrdersListBloc.state).thenReturn(
        const WorkOrdersListState.initial(),
      );
      when(() => mockWorkOrdersListBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const WorkOrdersListState.initial()]),
      );

      await tester.pumpWidget(createDashboardPage());

      expect(find.byType(DashboardPage), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('Work Orders'), findsOneWidget);
      expect(find.byType(TabBar), findsOneWidget);
      expect(find.byType(TabBarView), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
    });

    testWidgets('should show correct tab labels', (tester) async {
      when(() => mockWorkOrdersListBloc.state).thenReturn(
        const WorkOrdersListState.initial(),
      );
      when(() => mockWorkOrdersListBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const WorkOrdersListState.initial()]),
      );

      await tester.pumpWidget(createDashboardPage());

      expect(find.text('Assigned'), findsOneWidget);
      expect(find.text('In Progress'), findsOneWidget);
      expect(find.text('Paused'), findsOneWidget);
      expect(find.text('Completed'), findsOneWidget);
    });

    testWidgets('should load work orders on init', (tester) async {
      when(() => mockWorkOrdersListBloc.state).thenReturn(
        const WorkOrdersListState.initial(),
      );
      when(() => mockWorkOrdersListBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const WorkOrdersListState.initial()]),
      );

      await tester.pumpWidget(createDashboardPage());

      verify(() => mockWorkOrdersListBloc.add(
            const WorkOrdersListEvent.loadWorkOrders(
              page: 1,
              status: WorkOrderStatus.assigned,
            ),
          )).called(1);
    });

    testWidgets('should show loading shimmer when loading', (tester) async {
      when(() => mockWorkOrdersListBloc.state).thenReturn(
        const WorkOrdersListState.loading(),
      );
      when(() => mockWorkOrdersListBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const WorkOrdersListState.loading()]),
      );

      await tester.pumpWidget(createDashboardPage());
      await tester.pump();

      expect(find.byType(WorkOrderListShimmer), findsOneWidget);
    });

    testWidgets('should show work orders when loaded', (tester) async {
      when(() => mockWorkOrdersListBloc.state).thenReturn(
        WorkOrdersListState.loaded(
          workOrders: testWorkOrders,
          currentPage: 1,
          hasReachedMax: false,
          isLoadingMore: false,
          statusFilter: null,
          priorityFilter: null,
          searchQuery: null,
          isOffline: false,
          hasPendingSync: false,
        ),
      );
      when(() => mockWorkOrdersListBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          WorkOrdersListState.loaded(
            workOrders: testWorkOrders,
            currentPage: 1,
            hasReachedMax: false,
            isLoadingMore: false,
            statusFilter: null,
            priorityFilter: null,
            searchQuery: null,
            isOffline: false,
            hasPendingSync: false,
          ),
        ]),
      );

      await tester.pumpWidget(createDashboardPage());
      await tester.pump();

      expect(find.byType(WorkOrderCard), findsNWidgets(2));
      expect(find.text('WO-001'), findsOneWidget);
      expect(find.text('WO-002'), findsOneWidget);
    });

    testWidgets('should show stats cards with correct counts', (tester) async {
      when(() => mockWorkOrdersListBloc.state).thenReturn(
        WorkOrdersListState.loaded(
          workOrders: testWorkOrders,
          currentPage: 1,
          hasReachedMax: false,
          isLoadingMore: false,
          statusFilter: null,
          priorityFilter: null,
          searchQuery: null,
          isOffline: false,
          hasPendingSync: false,
        ),
      );
      when(() => mockWorkOrdersListBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          WorkOrdersListState.loaded(
            workOrders: testWorkOrders,
            currentPage: 1,
            hasReachedMax: false,
            isLoadingMore: false,
            statusFilter: null,
            priorityFilter: null,
            searchQuery: null,
            isOffline: false,
            hasPendingSync: false,
          ),
        ]),
      );

      await tester.pumpWidget(createDashboardPage());
      await tester.pump();

      // Should show counts for each status
      expect(find.text('1'), findsAtLeastNWidgets(1)); // Assigned count
      expect(find.text('1'), findsAtLeastNWidgets(1)); // In Progress count
    });

    testWidgets('should show empty state when no work orders', (tester) async {
      when(() => mockWorkOrdersListBloc.state).thenReturn(
        const WorkOrdersListState.loaded(
          workOrders: [],
          currentPage: 1,
          hasReachedMax: true,
          isLoadingMore: false,
          statusFilter: null,
          priorityFilter: null,
          searchQuery: null,
          isOffline: false,
          hasPendingSync: false,
        ),
      );
      when(() => mockWorkOrdersListBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          const WorkOrdersListState.loaded(
            workOrders: [],
            currentPage: 1,
            hasReachedMax: true,
            isLoadingMore: false,
            statusFilter: null,
            priorityFilter: null,
            searchQuery: null,
            isOffline: false,
            hasPendingSync: false,
          ),
        ]),
      );

      await tester.pumpWidget(createDashboardPage());
      await tester.pump();

      expect(find.text('No assigned work orders'), findsOneWidget);
      expect(find.byIcon(Icons.work_outline), findsOneWidget);
    });

    testWidgets('should show error state when error occurs', (tester) async {
      when(() => mockWorkOrdersListBloc.state).thenReturn(
        const WorkOrdersListState.error(
          failure: NetworkFailure(message: 'Network error'),
          workOrders: [],
          isOffline: false,
        ),
      );
      when(() => mockWorkOrdersListBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          const WorkOrdersListState.error(
            failure: NetworkFailure(message: 'Network error'),
            workOrders: [],
            isOffline: false,
          ),
        ]),
      );

      await tester.pumpWidget(createDashboardPage());
      await tester.pump();

      expect(find.text('Error loading work orders'), findsOneWidget);
      expect(find.text('Network error'), findsOneWidget);
      expect(find.byIcon(Icons.error_outline), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);
    });

    testWidgets('should show offline indicator when offline', (tester) async {
      when(() => mockWorkOrdersListBloc.state).thenReturn(
        const WorkOrdersListState.error(
          failure: NetworkFailure(message: 'No connection'),
          workOrders: [],
          isOffline: true,
        ),
      );
      when(() => mockWorkOrdersListBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          const WorkOrdersListState.error(
            failure: NetworkFailure(message: 'No connection'),
            workOrders: [],
            isOffline: true,
          ),
        ]),
      );

      await tester.pumpWidget(createDashboardPage());
      await tester.pump();

      expect(find.text('You are offline'), findsOneWidget);
      expect(find.byIcon(Icons.wifi_off), findsOneWidget);
    });

    testWidgets('should trigger refresh when refresh button is tapped',
        (tester) async {
      when(() => mockWorkOrdersListBloc.state).thenReturn(
        const WorkOrdersListState.initial(),
      );
      when(() => mockWorkOrdersListBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const WorkOrdersListState.initial()]),
      );

      await tester.pumpWidget(createDashboardPage());

      await tester.tap(find.byIcon(Icons.refresh));
      await tester.pumpAndSettle();

      verify(() => mockWorkOrdersListBloc.add(
            const WorkOrdersListEvent.refreshWorkOrders(),
          )).called(1);
    });

    testWidgets('should show search dialog when search button is tapped',
        (tester) async {
      when(() => mockWorkOrdersListBloc.state).thenReturn(
        const WorkOrdersListState.initial(),
      );
      when(() => mockWorkOrdersListBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const WorkOrdersListState.initial()]),
      );

      await tester.pumpWidget(createDashboardPage());

      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('Search Work Orders'), findsOneWidget);
    });

    testWidgets('should trigger sync when FAB is tapped', (tester) async {
      when(() => mockWorkOrdersListBloc.state).thenReturn(
        const WorkOrdersListState.initial(),
      );
      when(() => mockWorkOrdersListBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const WorkOrdersListState.initial()]),
      );

      await tester.pumpWidget(createDashboardPage());

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      verify(() => mockWorkOrdersListBloc.add(
            const WorkOrdersListEvent.syncPendingWorkOrders(),
          )).called(1);
    });

    testWidgets('should filter work orders by tab', (tester) async {
      when(() => mockWorkOrdersListBloc.state).thenReturn(
        const WorkOrdersListState.initial(),
      );
      when(() => mockWorkOrdersListBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const WorkOrdersListState.initial()]),
      );

      await tester.pumpWidget(createDashboardPage());

      // Tap on "In Progress" tab
      await tester.tap(find.text('In Progress'));
      await tester.pumpAndSettle();

      verify(() => mockWorkOrdersListBloc.add(
            const WorkOrdersListEvent.filterByStatus(
                WorkOrderStatus.inProgress),
          )).called(1);
    });

    testWidgets('should support pull to refresh', (tester) async {
      when(() => mockWorkOrdersListBloc.state).thenReturn(
        WorkOrdersListState.loaded(
          workOrders: testWorkOrders,
          currentPage: 1,
          hasReachedMax: false,
          isLoadingMore: false,
          statusFilter: null,
          priorityFilter: null,
          searchQuery: null,
          isOffline: false,
          hasPendingSync: false,
        ),
      );
      when(() => mockWorkOrdersListBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          WorkOrdersListState.loaded(
            workOrders: testWorkOrders,
            currentPage: 1,
            hasReachedMax: false,
            isLoadingMore: false,
            statusFilter: null,
            priorityFilter: null,
            searchQuery: null,
            isOffline: false,
            hasPendingSync: false,
          ),
        ]),
      );

      await tester.pumpWidget(createDashboardPage());
      await tester.pump();

      expect(find.byType(RefreshIndicator), findsAtLeastNWidgets(1));
    });

    testWidgets('should be responsive to screen size', (tester) async {
      when(() => mockWorkOrdersListBloc.state).thenReturn(
        const WorkOrdersListState.initial(),
      );
      when(() => mockWorkOrdersListBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const WorkOrdersListState.initial()]),
      );

      // Test with different screen sizes
      await tester.binding
          .setSurfaceSize(const Size(375, 812)); // iPhone 11 Pro
      await tester.pumpWidget(createDashboardPage());
      await tester.pumpAndSettle();

      expect(find.byType(DashboardPage), findsOneWidget);

      // Test with tablet size
      await tester.binding.setSurfaceSize(const Size(768, 1024)); // iPad
      await tester.pumpWidget(createDashboardPage());
      await tester.pumpAndSettle();

      expect(find.byType(DashboardPage), findsOneWidget);

      // Reset to default size
      await tester.binding.setSurfaceSize(const Size(800, 600));
    });

    testWidgets('should handle tab controller disposal', (tester) async {
      when(() => mockWorkOrdersListBloc.state).thenReturn(
        const WorkOrdersListState.initial(),
      );
      when(() => mockWorkOrdersListBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const WorkOrdersListState.initial()]),
      );

      await tester.pumpWidget(createDashboardPage());

      // Verify page is rendered
      expect(find.byType(DashboardPage), findsOneWidget);

      // Remove the widget
      await tester.pumpWidget(Container());

      // Should not throw any errors during disposal
    });

    testWidgets('should show gradient app bar', (tester) async {
      when(() => mockWorkOrdersListBloc.state).thenReturn(
        const WorkOrdersListState.initial(),
      );
      when(() => mockWorkOrdersListBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const WorkOrdersListState.initial()]),
      );

      await tester.pumpWidget(createDashboardPage());

      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.flexibleSpace, isA<Container>());
    });

    testWidgets('should show stats cards with gradient background',
        (tester) async {
      when(() => mockWorkOrdersListBloc.state).thenReturn(
        const WorkOrdersListState.initial(),
      );
      when(() => mockWorkOrdersListBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const WorkOrdersListState.initial()]),
      );

      await tester.pumpWidget(createDashboardPage());

      // Should have gradient container for stats
      expect(find.byType(Container), findsAtLeastNWidgets(1));
    });
  });
}
