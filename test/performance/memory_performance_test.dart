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

  group('Memory Performance Tests', () {
    late MockWorkOrdersListBloc mockBloc;

    setUp(() {
      mockBloc = MockWorkOrdersListBloc();
    });

    testWidgets('Memory usage with large dataset', (tester) async {
      // Create a very large dataset to test memory handling
      final largeDataset = List.generate(1000, (index) {
        return WorkOrderEntity(
          id: index + 1,
          woNumber: 'WO-2024-${(index + 1).toString().padLeft(4, '0')}',
          summary: 'Work Order ${index + 1} - Memory Test with Long Summary Text',
          description: 'This is a detailed description for work order ${index + 1}. ' * 20, // Very long description
          status: WorkOrderStatus.values[index % WorkOrderStatus.values.length],
          priority: WorkOrderPriority.values[index % WorkOrderPriority.values.length],
          visitDate: DateTime.now().add(Duration(days: index)).toIso8601String(),
          customer: CustomerEntity(
            id: index + 1,
            name: 'Customer ${index + 1} with Very Long Company Name for Memory Testing',
            contactPerson: 'Contact Person ${index + 1}',
            phone: '+1-555-${(index + 1000).toString().padLeft(4, '0')}',
            email: 'very.long.email.address.for.memory.testing.contact${index + 1}@example.com',
          ),
          location: LocationEntity(
            id: index + 1,
            address: '${index + 1} Very Long Street Name for Memory Testing, Suite ${index + 1}',
            city: 'Test City with Very Long Name for Memory Testing',
            state: 'TS',
            zipCode: '${(10000 + index).toString()}',
            latitude: 40.7128 + (index * 0.001),
            longitude: -74.0060 + (index * 0.001),
          ),
          requiredSkills: List.generate(10, (i) => 'Skill${i + 1}ForMemoryTesting'),
          requiredParts: [],
        );
      });

      when(() => mockBloc.state).thenReturn(
        WorkOrdersListState.loaded(
          workOrders: largeDataset,
          hasReachedMax: true,
        ),
      );
      when(() => mockBloc.stream).thenAnswer((_) => const Stream.empty());

      final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

      await binding.watchPerformance(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider<WorkOrdersListBloc>.value(
              value: mockBloc,
              child: const DashboardPage(),
            ),
          ),
        );

        await tester.pumpAndSettle();

        // Scroll through the entire list to test memory management
        final listFinder = find.byType(ListView);
        
        // Scroll down through all items
        for (int i = 0; i < 50; i++) {
          await tester.drag(listFinder, const Offset(0, -500));
          await tester.pump(const Duration(milliseconds: 16)); // 60 FPS
        }

        // Scroll back up
        for (int i = 0; i < 50; i++) {
          await tester.drag(listFinder, const Offset(0, 500));
          await tester.pump(const Duration(milliseconds: 16));
        }

        await tester.pumpAndSettle();
      });

      print('Memory performance test with 1000 items completed');
    });

    testWidgets('Memory leak detection during navigation', (tester) async {
      final smallDataset = List.generate(10, (index) {
        return WorkOrderEntity(
          id: index + 1,
          woNumber: 'WO-2024-${(index + 1).toString().padLeft(3, '0')}',
          summary: 'Work Order ${index + 1}',
          description: 'Description for work order ${index + 1}',
          status: WorkOrderStatus.assigned,
          priority: WorkOrderPriority.medium,
          visitDate: DateTime.now().add(Duration(days: index)).toIso8601String(),
          customer: const CustomerEntity(
            id: 1,
            name: 'Test Customer',
            contactPerson: 'Test Contact',
            phone: '+1-555-0123',
            email: 'test@example.com',
          ),
          location: const LocationEntity(
            id: 1,
            address: '123 Test Street',
            city: 'Test City',
            state: 'TS',
            zipCode: '12345',
            latitude: 40.7128,
            longitude: -74.0060,
          ),
          requiredSkills: const ['Test Skill'],
          requiredParts: const [],
        );
      });

      when(() => mockBloc.state).thenReturn(
        WorkOrdersListState.loaded(
          workOrders: smallDataset,
          hasReachedMax: true,
        ),
      );
      when(() => mockBloc.stream).thenAnswer((_) => const Stream.empty());

      final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

      await binding.watchPerformance(() async {
        // Simulate multiple navigation cycles to detect memory leaks
        for (int cycle = 0; cycle < 10; cycle++) {
          await tester.pumpWidget(
            MaterialApp(
              home: BlocProvider<WorkOrdersListBloc>.value(
                value: mockBloc,
                child: const DashboardPage(),
              ),
            ),
          );

          await tester.pumpAndSettle();

          // Simulate user interaction
          final listFinder = find.byType(ListView);
          if (listFinder.evaluate().isNotEmpty) {
            await tester.drag(listFinder, const Offset(0, -200));
            await tester.pump();
          }

          // Navigate away (simulate page disposal)
          await tester.pumpWidget(
            const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text('Different Page'),
                ),
              ),
            ),
          );

          await tester.pumpAndSettle();
        }
      });

      print('Memory leak detection test completed (10 navigation cycles)');
    });

    testWidgets('Widget rebuild efficiency test', (tester) async {
      final dataset = List.generate(50, (index) {
        return WorkOrderEntity(
          id: index + 1,
          woNumber: 'WO-2024-${(index + 1).toString().padLeft(3, '0')}',
          summary: 'Work Order ${index + 1}',
          description: 'Description for work order ${index + 1}',
          status: WorkOrderStatus.assigned,
          priority: WorkOrderPriority.medium,
          visitDate: DateTime.now().add(Duration(days: index)).toIso8601String(),
          customer: const CustomerEntity(
            id: 1,
            name: 'Test Customer',
            contactPerson: 'Test Contact',
            phone: '+1-555-0123',
            email: 'test@example.com',
          ),
          location: const LocationEntity(
            id: 1,
            address: '123 Test Street',
            city: 'Test City',
            state: 'TS',
            zipCode: '12345',
            latitude: 40.7128,
            longitude: -74.0060,
          ),
          requiredSkills: const ['Test Skill'],
          requiredParts: const [],
        );
      });

      when(() => mockBloc.state).thenReturn(
        WorkOrdersListState.loaded(
          workOrders: dataset,
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

      final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

      // Test rapid state changes to measure rebuild efficiency
      await binding.watchPerformance(() async {
        for (int i = 0; i < 20; i++) {
          // Simulate state changes that trigger rebuilds
          when(() => mockBloc.state).thenReturn(
            WorkOrdersListState.loaded(
              workOrders: dataset.take(25 + (i % 25)).toList(),
              hasReachedMax: i % 2 == 0,
            ),
          );

          // Trigger a rebuild
          await tester.pump();
          
          // Small delay to simulate real-world state changes
          await tester.pump(const Duration(milliseconds: 50));
        }

        await tester.pumpAndSettle();
      });

      print('Widget rebuild efficiency test completed (20 state changes)');
    });

    testWidgets('Image loading memory management', (tester) async {
      // Test with work orders that have image attachments
      final workOrdersWithImages = List.generate(20, (index) {
        return WorkOrderEntity(
          id: index + 1,
          woNumber: 'WO-2024-${(index + 1).toString().padLeft(3, '0')}',
          summary: 'Work Order ${index + 1} with Images',
          description: 'Work order with multiple image attachments',
          status: WorkOrderStatus.assigned,
          priority: WorkOrderPriority.medium,
          visitDate: DateTime.now().add(Duration(days: index)).toIso8601String(),
          customer: const CustomerEntity(
            id: 1,
            name: 'Test Customer',
            contactPerson: 'Test Contact',
            phone: '+1-555-0123',
            email: 'test@example.com',
          ),
          location: const LocationEntity(
            id: 1,
            address: '123 Test Street',
            city: 'Test City',
            state: 'TS',
            zipCode: '12345',
            latitude: 40.7128,
            longitude: -74.0060,
          ),
          requiredSkills: const ['Test Skill'],
          requiredParts: const [],
          attachments: List.generate(5, (i) => 'https://example.com/image${index}_${i}.jpg'),
        );
      });

      when(() => mockBloc.state).thenReturn(
        WorkOrdersListState.loaded(
          workOrders: workOrdersWithImages,
          hasReachedMax: true,
        ),
      );
      when(() => mockBloc.stream).thenAnswer((_) => const Stream.empty());

      final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

      await binding.watchPerformance(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider<WorkOrdersListBloc>.value(
              value: mockBloc,
              child: const DashboardPage(),
            ),
          ),
        );

        await tester.pumpAndSettle();

        // Scroll through items with images to test image memory management
        final listFinder = find.byType(ListView);
        
        for (int i = 0; i < 10; i++) {
          await tester.drag(listFinder, const Offset(0, -300));
          await tester.pump(const Duration(milliseconds: 100));
        }

        // Scroll back to allow image disposal
        for (int i = 0; i < 10; i++) {
          await tester.drag(listFinder, const Offset(0, 300));
          await tester.pump(const Duration(milliseconds: 100));
        }

        await tester.pumpAndSettle();
      });

      print('Image loading memory management test completed');
    });
  });
}