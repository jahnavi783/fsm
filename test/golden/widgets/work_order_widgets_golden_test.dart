import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_card.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_status_chip.dart';
import 'package:fsm/features/work_orders/presentation/widgets/work_order_shimmer.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/customer_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/location_entity.dart';

import '../golden_test_config.dart';

void main() {
  group('Work Order Widgets Golden Tests', () {
    setUpAll(() async {
      await GoldenTestConfig.initialize();
    });

    late WorkOrderEntity mockWorkOrder;

    setUp(() {
      mockWorkOrder = WorkOrderEntity(
        id: 1,
        woNumber: 'WO-2024-001',
        srId: 1,
        summary: 'HVAC System Maintenance',
        problemDescription:
            'Routine maintenance and inspection of HVAC system including filter replacement and system diagnostics.',
        status: WorkOrderStatus.assigned,
        priority: WorkOrderPriority.medium,
        visitDate: DateTime.parse('2024-01-15T09:00:00Z'),
        location: '123 Business Ave, Suite 100, New York, NY 10001',
        durationDays: 1,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        customer: const CustomerEntity(
          id: 1,
          name: 'ABC Corporation',
          contactPerson: 'John Smith',
          phone: '+1-555-0123',
          email: 'john.smith@abc.com',
        ),
        locationDetails: const LocationEntity(
          id: 1,
          address: '123 Business Ave, Suite 100',
          city: 'New York',
          state: 'NY',
          zipCode: '10001',
          latitude: 40.7128,
          longitude: -74.0060,
        ),
        requiredSkills: const ['HVAC', 'Electrical'],
        requiredParts: const [],
      );
    });

    testGoldens('WorkOrderCard golden test', (tester) async {
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: GoldenTestConfig.phoneDevices)
        ..addScenario(
          widget: GoldenTestConfig.createTestWrapper(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: WorkOrderCard(
                workOrder: mockWorkOrder,
                onTap: () {},
              ),
            ),
          ),
          name: 'assigned_status',
        )
        ..addScenario(
          widget: GoldenTestConfig.createTestWrapper(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: WorkOrderCard(
                workOrder: mockWorkOrder.copyWith(
                  status: WorkOrderStatus.inProgress,
                ),
                onTap: () {},
              ),
            ),
          ),
          name: 'in_progress_status',
        )
        ..addScenario(
          widget: GoldenTestConfig.createTestWrapper(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: WorkOrderCard(
                workOrder: mockWorkOrder.copyWith(
                  status: WorkOrderStatus.completed,
                  priority: WorkOrderPriority.high,
                ),
                onTap: () {},
              ),
            ),
          ),
          name: 'completed_high_priority',
        );

      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'work_order_card');
    });

    testGoldens('WorkOrderStatusChip golden test', (tester) async {
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: GoldenTestConfig.phoneDevices)
        ..addScenario(
          widget: GoldenTestConfig.createTestWrapper(
            child: const Center(
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  WorkOrderStatusChip(status: WorkOrderStatus.assigned),
                  WorkOrderStatusChip(status: WorkOrderStatus.inProgress),
                  WorkOrderStatusChip(status: WorkOrderStatus.paused),
                  WorkOrderStatusChip(status: WorkOrderStatus.completed),
                  WorkOrderStatusChip(status: WorkOrderStatus.cancelled),
                  WorkOrderStatusChip(status: WorkOrderStatus.rejected),
                ],
              ),
            ),
          ),
          name: 'all_statuses',
        );

      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'work_order_status_chip');
    });

    testGoldens('WorkOrderShimmer golden test', (tester) async {
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: GoldenTestConfig.phoneDevices)
        ..addScenario(
          widget: GoldenTestConfig.createTestWrapper(
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  WorkOrderShimmer(),
                  SizedBox(height: 16),
                  WorkOrderShimmer(),
                  SizedBox(height: 16),
                  WorkOrderShimmer(),
                ],
              ),
            ),
          ),
          name: 'shimmer_loading',
        );

      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'work_order_shimmer');
    });
  });
}
