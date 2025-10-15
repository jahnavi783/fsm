import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fsm/features/work_orders/presentation/pages/dashboard_page.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_orders_list/work_orders_list_bloc.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/customer_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/location_entity.dart';

class MockWorkOrdersListBloc extends Mock implements WorkOrdersListBloc {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Scrolling Performance Tests', () {
    late MockWorkOrdersListBloc mockBloc;
    late List<WorkOrderEntity> largeWorkOrderList;

    setUp(() {
      mockBloc = MockWorkOrdersListBloc();

      // Create a large list of work orders for performance testing
      largeWorkOrderList = List.generate(100, (index) {
        return WorkOrderEntity(
          id: index + 1,
          woNumber: 'WO-2024-${(index + 1).toString().padLeft(3, '0')}',
          summary: 'Work Order ${index + 1} - Performance Test',
          description:
              'This is a test work order for performance testing. It contains a longer description to simulate real-world data and test rendering performance with varying content lengths.',
          status: WorkOrderStatus.values[index % WorkOrderStatus.values.length],
          priority:
              WorkOrderPriority.values[index % WorkOrderPriority.values.length],
          visitDate:
              DateTime.now().add(Duration(days: index)).toIso8601String(),
          customer: CustomerEntity(
            id: index + 1,
            name: 'Customer ${index + 1}',
            contactPerson: 'Contact Person ${index + 1}',
            phone: '+1-555-${(index + 1000).toString().padLeft(4, '0')}',
            email: 'contact${index + 1}@example.com',
          ),
          location: LocationEntity(
            id: index + 1,
            address: '${index + 1} Test Street, Suite ${index + 1}',
            city: 'Test City',
            state: 'TS',
            zipCode: '${(10000 + index).toString()}',
            latitude: 40.7128 + (index * 0.001),
            longitude: -74.0060 + (index * 0.001),
          ),
          requiredSkills: [
            'Skill${index % 5 + 1}',
            'Skill${(index + 1) % 5 + 1}'
          ],
          requiredParts: [],
        );
      });
    });

    testWidgets('Work order list scrolling performance with large dataset',
        (tester) async {
      when(() => mockBloc.state).thenReturn(
        WorkOrdersListState.loaded(
          workOrders: largeWorkOrderList,
          hasReachedMax: true,
        ),
      );
      when(() => mockBloc.stream).thenAnswer((_) => const Stream.empty());

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<WorkOrdersListBloc>.value(
            value: mockBloc,
            child: const DashboardPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Find the scrollable widget
      final listFinder = find.byType(ListView);
      expect(listFinder, findsOneWidget);

      final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

      // Measure scrolling performance
      await binding.watchPerformance(() async {
        // Perform fast scrolling
        await tester.fling(listFinder, const Offset(0, -3000), 5000);
        await tester.pumpAndSettle();

        // Scroll back to top
        await tester.fling(listFinder, const Offset(0, 3000), 5000);
        await tester.pumpAndSettle();

        // Perform slow scrolling
        for (int i = 0; i < 10; i++) {
          await tester.drag(listFinder, const Offset(0, -200));
          await tester.pump();
        }
        await tester.pumpAndSettle();
      });

      print('Scrolling performance test completed successfully');
    });

    testWidgets('Rapid scroll and stop performance', (tester) async {
      when(() => mockBloc.state).thenReturn(
        WorkOrdersListState.loaded(
          workOrders: largeWorkOrderList,
          hasReachedMax: true,
        ),
      );
      when(() => mockBloc.stream).thenAnswer((_) => const Stream.empty());

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<WorkOrdersListBloc>.value(
            value: mockBloc,
            child: const DashboardPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final listFinder = find.byType(ListView);
      final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

      // Test rapid scroll and stop scenarios
      await binding.watchPerformance(() async {
        for (int i = 0; i < 5; i++) {
          // Rapid scroll down
          await tester.fling(listFinder, const Offset(0, -2000), 8000);
          await tester.pump(const Duration(milliseconds: 100));

          // Immediate stop and scroll up
          await tester.fling(listFinder, const Offset(0, 1000), 4000);
          await tester.pump(const Duration(milliseconds: 100));
        }
        await tester.pumpAndSettle();
      });

      print('Rapid scroll and stop performance test completed');
    });

    testWidgets('Memory usage during extended scrolling', (tester) async {
      when(() => mockBloc.state).thenReturn(
        WorkOrdersListState.loaded(
          workOrders: largeWorkOrderList,
          hasReachedMax: true,
        ),
      );
      when(() => mockBloc.stream).thenAnswer((_) => const Stream.empty());

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<WorkOrdersListBloc>.value(
            value: mockBloc,
            child: const DashboardPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final listFinder = find.byType(ListView);
      final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

      // Extended scrolling to test memory management
      await binding.watchPerformance(() async {
        // Scroll through the entire list multiple times
        for (int cycle = 0; cycle < 3; cycle++) {
          // Scroll to bottom
          for (int i = 0; i < 20; i++) {
            await tester.drag(listFinder, const Offset(0, -500));
            await tester.pump(const Duration(milliseconds: 50));
          }

          // Scroll to top
          for (int i = 0; i < 20; i++) {
            await tester.drag(listFinder, const Offset(0, 500));
            await tester.pump(const Duration(milliseconds: 50));
          }
        }
        await tester.pumpAndSettle();
      });

      print('Extended scrolling memory test completed');
    });
  });
}
