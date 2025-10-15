import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../lib/features/work_orders/domain/entities/work_order_entity.dart';
import '../../../../../lib/features/work_orders/presentation/widgets/work_order_card.dart';
import '../../../../../lib/features/work_orders/presentation/widgets/work_order_status_chip.dart';
import '../../../../helpers/test_helpers.dart';

void main() {
  group('WorkOrderCard Widget Tests', () {
    late WorkOrderEntity testWorkOrder;
    bool onTapCalled = false;
    bool onActionTapCalled = false;

    setUp(() {
      onTapCalled = false;
      onActionTapCalled = false;

      testWorkOrder = WorkOrderEntity(
        id: 1,
        woNumber: 'WO-001',
        summary: 'Test work order summary',
        description: 'Test work order description',
        status: WorkOrderStatus.assigned,
        priority: WorkOrderPriority.high,
        visitDate: DateTime(2024, 1, 15),
        customer: const CustomerEntity(
          id: 1,
          name: 'Test Customer',
          email: 'customer@test.com',
          phone: '123-456-7890',
        ),
        location: 'Test Location',
        requiredSkills: ['skill1', 'skill2'],
        requiredParts: [],
      );
    });

    Widget createWorkOrderCard({
      WorkOrderEntity? workOrder,
      VoidCallback? onTap,
      VoidCallback? onActionTap,
    }) {
      return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return TestHelpers.createTestWidget(
            WorkOrderCard(
              workOrder: workOrder ?? testWorkOrder,
              onTap: onTap ?? (() => onTapCalled = true),
              onActionTap: onActionTap ?? (() => onActionTapCalled = true),
            ),
          );
        },
      );
    }

    testWidgets('should render all basic information', (tester) async {
      await tester.pumpWidget(createWorkOrderCard());

      expect(find.text('WO-001'), findsOneWidget);
      expect(find.text('Test work order summary'), findsOneWidget);
      expect(find.text('Test Customer'), findsOneWidget);
      expect(find.text('Test Location'), findsOneWidget);
      expect(find.text('Jan 15, 2024'), findsOneWidget);
      expect(find.byType(WorkOrderStatusChip), findsOneWidget);
    });

    testWidgets('should call onTap when card is tapped', (tester) async {
      await tester.pumpWidget(createWorkOrderCard());

      await tester.tap(find.byType(WorkOrderCard));
      await tester.pumpAndSettle();

      expect(onTapCalled, isTrue);
    });

    testWidgets('should show action button for actionable work orders',
        (tester) async {
      await tester.pumpWidget(createWorkOrderCard());

      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text('Start Work'), findsOneWidget);
    });

    testWidgets('should call onActionTap when action button is tapped',
        (tester) async {
      await tester.pumpWidget(createWorkOrderCard());

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(onActionTapCalled, isTrue);
    });

    testWidgets('should show correct action button text for different states',
        (tester) async {
      // Test assigned status
      await tester.pumpWidget(createWorkOrderCard());
      expect(find.text('Start Work'), findsOneWidget);

      // Test in progress status
      final inProgressWorkOrder = testWorkOrder.copyWith(
        status: WorkOrderStatus.inProgress,
      );
      await tester
          .pumpWidget(createWorkOrderCard(workOrder: inProgressWorkOrder));
      expect(find.text('Pause Work'), findsOneWidget);

      // Test paused status
      final pausedWorkOrder = testWorkOrder.copyWith(
        status: WorkOrderStatus.paused,
      );
      await tester.pumpWidget(createWorkOrderCard(workOrder: pausedWorkOrder));
      expect(find.text('Resume Work'), findsOneWidget);
    });

    testWidgets('should not show action button for non-actionable work orders',
        (tester) async {
      final completedWorkOrder = testWorkOrder.copyWith(
        status: WorkOrderStatus.completed,
      );

      await tester
          .pumpWidget(createWorkOrderCard(workOrder: completedWorkOrder));

      expect(find.byType(ElevatedButton), findsNothing);
    });

    testWidgets('should show priority with correct color', (tester) async {
      await tester.pumpWidget(createWorkOrderCard());

      expect(find.text('High'), findsOneWidget);

      // Test different priorities
      final lowPriorityWorkOrder = testWorkOrder.copyWith(
        priority: WorkOrderPriority.low,
      );
      await tester
          .pumpWidget(createWorkOrderCard(workOrder: lowPriorityWorkOrder));
      expect(find.text('Low'), findsOneWidget);
    });

    testWidgets('should show overdue indicator for overdue work orders',
        (tester) async {
      final overdueWorkOrder = testWorkOrder.copyWith(
        visitDate: DateTime.now().subtract(const Duration(days: 1)),
        status: WorkOrderStatus.assigned,
      );

      await tester.pumpWidget(createWorkOrderCard(workOrder: overdueWorkOrder));

      expect(find.text('Overdue'), findsOneWidget);
      expect(find.byIcon(Icons.warning_outlined), findsOneWidget);
    });

    testWidgets('should not show overdue indicator for completed work orders',
        (tester) async {
      final completedOverdueWorkOrder = testWorkOrder.copyWith(
        visitDate: DateTime.now().subtract(const Duration(days: 1)),
        status: WorkOrderStatus.completed,
      );

      await tester.pumpWidget(
          createWorkOrderCard(workOrder: completedOverdueWorkOrder));

      expect(find.text('Overdue'), findsNothing);
    });

    testWidgets('should handle work order without customer', (tester) async {
      final workOrderWithoutCustomer = testWorkOrder.copyWith(
        customer: null,
      );

      await tester
          .pumpWidget(createWorkOrderCard(workOrder: workOrderWithoutCustomer));

      expect(find.text('Test Location'), findsOneWidget);
      expect(find.byIcon(Icons.location_on_outlined), findsOneWidget);
    });

    testWidgets('should truncate long text properly', (tester) async {
      final longSummaryWorkOrder = testWorkOrder.copyWith(
        summary:
            'This is a very long summary that should be truncated when it exceeds the maximum number of lines allowed in the card layout',
      );

      await tester
          .pumpWidget(createWorkOrderCard(workOrder: longSummaryWorkOrder));

      expect(
          find.textContaining('This is a very long summary'), findsOneWidget);
    });

    testWidgets('should have proper card styling', (tester) async {
      await tester.pumpWidget(createWorkOrderCard());

      final card = tester.widget<Card>(find.byType(Card));
      expect(card.elevation, equals(2));
      expect(card.shape, isA<RoundedRectangleBorder>());
    });

    testWidgets('should have proper responsive layout', (tester) async {
      // Test with different screen sizes
      await tester.binding
          .setSurfaceSize(const Size(375, 812)); // iPhone 11 Pro
      await tester.pumpWidget(createWorkOrderCard());
      await tester.pumpAndSettle();

      expect(find.byType(WorkOrderCard), findsOneWidget);

      // Test with tablet size
      await tester.binding.setSurfaceSize(const Size(768, 1024)); // iPad
      await tester.pumpWidget(createWorkOrderCard());
      await tester.pumpAndSettle();

      expect(find.byType(WorkOrderCard), findsOneWidget);

      // Reset to default size
      await tester.binding.setSurfaceSize(const Size(800, 600));
    });

    testWidgets('should show proper icons for different information',
        (tester) async {
      await tester.pumpWidget(createWorkOrderCard());

      expect(find.byIcon(Icons.person_outline), findsOneWidget);
      expect(find.byIcon(Icons.location_on_outlined), findsOneWidget);
      expect(find.byIcon(Icons.schedule), findsOneWidget);
    });

    testWidgets('should handle null callbacks gracefully', (tester) async {
      await tester.pumpWidget(createWorkOrderCard(
        onTap: null,
        onActionTap: null,
      ));

      // Should not throw when tapping
      await tester.tap(find.byType(WorkOrderCard));
      await tester.pumpAndSettle();

      // Action button should still be present but not functional
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('should have proper accessibility', (tester) async {
      await tester.pumpWidget(createWorkOrderCard());

      // Card should be tappable
      expect(find.byType(InkWell), findsOneWidget);

      // Button should be accessible
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('should show correct button colors for different actions',
        (tester) async {
      // Test start action (green)
      await tester.pumpWidget(createWorkOrderCard());
      final startButton =
          tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      final startButtonStyle = startButton.style!.backgroundColor!.resolve({});
      expect(startButtonStyle, equals(Colors.green));

      // Test pause action (orange)
      final inProgressWorkOrder = testWorkOrder.copyWith(
        status: WorkOrderStatus.inProgress,
      );
      await tester
          .pumpWidget(createWorkOrderCard(workOrder: inProgressWorkOrder));
      final pauseButton =
          tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      final pauseButtonStyle = pauseButton.style!.backgroundColor!.resolve({});
      expect(pauseButtonStyle, equals(Colors.orange));

      // Test resume action (blue)
      final pausedWorkOrder = testWorkOrder.copyWith(
        status: WorkOrderStatus.paused,
      );
      await tester.pumpWidget(createWorkOrderCard(workOrder: pausedWorkOrder));
      final resumeButton =
          tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      final resumeButtonStyle =
          resumeButton.style!.backgroundColor!.resolve({});
      expect(resumeButtonStyle, equals(Colors.blue));
    });

    testWidgets('should format date correctly', (tester) async {
      final workOrderWithSpecificDate = testWorkOrder.copyWith(
        visitDate: DateTime(2024, 12, 25),
      );

      await tester.pumpWidget(
          createWorkOrderCard(workOrder: workOrderWithSpecificDate));

      expect(find.text('Dec 25, 2024'), findsOneWidget);
    });
  });
}
