import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fsm/features/work_orders/presentation/pages/dashboard_page.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_orders_list/work_orders_list_bloc.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/customer_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/location_entity.dart';

import '../golden_test_config.dart';

class MockWorkOrdersListBloc extends Mock implements WorkOrdersListBloc {}

void main() {
  group('Dashboard Page Golden Tests', () {
    late MockWorkOrdersListBloc mockWorkOrdersListBloc;
    late List<WorkOrderEntity> mockWorkOrders;

    setUpAll(() async {
      await GoldenTestConfig.initialize();
    });

    setUp(() {
      mockWorkOrdersListBloc = MockWorkOrdersListBloc();

      mockWorkOrders = [
        const WorkOrderEntity(
          id: 1,
          woNumber: 'WO-2024-001',
          summary: 'HVAC System Maintenance',
          description: 'Routine maintenance and inspection of HVAC system.',
          status: WorkOrderStatus.assigned,
          priority: WorkOrderPriority.high,
          visitDate: '2024-01-15T09:00:00Z',
          customer: CustomerEntity(
            id: 1,
            name: 'ABC Corporation',
            contactPerson: 'John Smith',
            phone: '+1-555-0123',
            email: 'john.smith@abc.com',
          ),
          location: LocationEntity(
            id: 1,
            address: '123 Business Ave, Suite 100',
            city: 'New York',
            state: 'NY',
            zipCode: '10001',
            latitude: 40.7128,
            longitude: -74.0060,
          ),
          requiredSkills: ['HVAC', 'Electrical'],
          requiredParts: [],
        ),
        const WorkOrderEntity(
          id: 2,
          woNumber: 'WO-2024-002',
          summary: 'Plumbing Repair',
          description: 'Fix leaking pipes in the basement.',
          status: WorkOrderStatus.inProgress,
          priority: WorkOrderPriority.medium,
          visitDate: '2024-01-15T14:00:00Z',
          customer: CustomerEntity(
            id: 2,
            name: 'XYZ Industries',
            contactPerson: 'Jane Doe',
            phone: '+1-555-0456',
            email: 'jane.doe@xyz.com',
          ),
          location: LocationEntity(
            id: 2,
            address: '456 Industrial Blvd',
            city: 'Brooklyn',
            state: 'NY',
            zipCode: '11201',
            latitude: 40.6892,
            longitude: -73.9442,
          ),
          requiredSkills: ['Plumbing'],
          requiredParts: [],
        ),
      ];
    });

    testGoldens('DashboardPage golden test', (tester) async {
      // Test loading state
      when(() => mockWorkOrdersListBloc.state).thenReturn(
        const WorkOrdersListState.loading(),
      );
      when(() => mockWorkOrdersListBloc.stream).thenAnswer(
        (_) => const Stream.empty(),
      );

      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: GoldenTestConfig.testDevices)
        ..addScenario(
          widget: BlocProvider<WorkOrdersListBloc>.value(
            value: mockWorkOrdersListBloc,
            child: GoldenTestConfig.createNavigationTestWrapper(
              child: const DashboardPage(),
            ),
          ),
          name: 'loading_state',
        );

      // Test loaded state with work orders
      when(() => mockWorkOrdersListBloc.state).thenReturn(
        WorkOrdersListState.loaded(
          workOrders: mockWorkOrders,
          hasReachedMax: false,
        ),
      );
      builder.addScenario(
        widget: BlocProvider<WorkOrdersListBloc>.value(
          value: mockWorkOrdersListBloc,
          child: GoldenTestConfig.createNavigationTestWrapper(
            child: const DashboardPage(),
          ),
        ),
        name: 'loaded_with_work_orders',
      );

      // Test empty state
      when(() => mockWorkOrdersListBloc.state).thenReturn(
        const WorkOrdersListState.loaded(
          workOrders: [],
          hasReachedMax: true,
        ),
      );
      builder.addScenario(
        widget: BlocProvider<WorkOrdersListBloc>.value(
          value: mockWorkOrdersListBloc,
          child: GoldenTestConfig.createNavigationTestWrapper(
            child: const DashboardPage(),
          ),
        ),
        name: 'empty_state',
      );

      // Test error state
      when(() => mockWorkOrdersListBloc.state).thenReturn(
        const WorkOrdersListState.error('Failed to load work orders'),
      );
      builder.addScenario(
        widget: BlocProvider<WorkOrdersListBloc>.value(
          value: mockWorkOrdersListBloc,
          child: GoldenTestConfig.createNavigationTestWrapper(
            child: const DashboardPage(),
          ),
        ),
        name: 'error_state',
      );

      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'dashboard_page');
    });
  });
}
