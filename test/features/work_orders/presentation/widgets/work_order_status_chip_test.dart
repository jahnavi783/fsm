import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../lib/features/work_orders/domain/entities/work_order_entity.dart';
import '../../../../../lib/features/work_orders/presentation/widgets/work_order_status_chip.dart';
import '../../../../helpers/test_helpers.dart';

void main() {
  group('WorkOrderStatusChip Widget Tests', () {
    Widget createStatusChip(WorkOrderStatus status) {
      return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return TestHelpers.createTestWidget(
            WorkOrderStatusChip(status: status),
          );
        },
      );
    }

    testWidgets('should render assigned status correctly', (tester) async {
      await tester.pumpWidget(createStatusChip(WorkOrderStatus.assigned));

      expect(find.text('Assigned'), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('should render in progress status correctly', (tester) async {
      await tester.pumpWidget(createStatusChip(WorkOrderStatus.inProgress));

      expect(find.text('In Progress'), findsOneWidget);
    });

    testWidgets('should render paused status correctly', (tester) async {
      await tester.pumpWidget(createStatusChip(WorkOrderStatus.paused));

      expect(find.text('Paused'), findsOneWidget);
    });

    testWidgets('should render completed status correctly', (tester) async {
      await tester.pumpWidget(createStatusChip(WorkOrderStatus.completed));

      expect(find.text('Completed'), findsOneWidget);
    });

    testWidgets('should render cancelled status correctly', (tester) async {
      await tester.pumpWidget(createStatusChip(WorkOrderStatus.cancelled));

      expect(find.text('Cancelled'), findsOneWidget);
    });

    testWidgets('should render rejected status correctly', (tester) async {
      await tester.pumpWidget(createStatusChip(WorkOrderStatus.rejected));

      expect(find.text('Rejected'), findsOneWidget);
    });

    testWidgets('should have proper styling for assigned status',
        (tester) async {
      await tester.pumpWidget(createStatusChip(WorkOrderStatus.assigned));

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;

      expect(decoration.borderRadius, isA<BorderRadius>());
      expect(decoration.color, isNotNull);
    });

    testWidgets('should have different colors for different statuses',
        (tester) async {
      // Test assigned status
      await tester.pumpWidget(createStatusChip(WorkOrderStatus.assigned));
      final assignedContainer =
          tester.widget<Container>(find.byType(Container));
      final assignedDecoration = assignedContainer.decoration as BoxDecoration;
      final assignedColor = assignedDecoration.color;

      // Test in progress status
      await tester.pumpWidget(createStatusChip(WorkOrderStatus.inProgress));
      final inProgressContainer =
          tester.widget<Container>(find.byType(Container));
      final inProgressDecoration =
          inProgressContainer.decoration as BoxDecoration;
      final inProgressColor = inProgressDecoration.color;

      // Colors should be different
      expect(assignedColor, isNot(equals(inProgressColor)));
    });

    testWidgets('should have proper text styling', (tester) async {
      await tester.pumpWidget(createStatusChip(WorkOrderStatus.assigned));

      final text = tester.widget<Text>(find.text('Assigned'));
      expect(text.style, isNotNull);
      expect(text.style!.fontWeight, equals(FontWeight.w600));
    });

    testWidgets('should have proper padding', (tester) async {
      await tester.pumpWidget(createStatusChip(WorkOrderStatus.assigned));

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.padding, isNotNull);
    });

    testWidgets('should be responsive to screen size', (tester) async {
      // Test with different screen sizes
      await tester.binding
          .setSurfaceSize(const Size(375, 812)); // iPhone 11 Pro
      await tester.pumpWidget(createStatusChip(WorkOrderStatus.assigned));
      await tester.pumpAndSettle();

      expect(find.byType(WorkOrderStatusChip), findsOneWidget);

      // Test with tablet size
      await tester.binding.setSurfaceSize(const Size(768, 1024)); // iPad
      await tester.pumpWidget(createStatusChip(WorkOrderStatus.assigned));
      await tester.pumpAndSettle();

      expect(find.byType(WorkOrderStatusChip), findsOneWidget);

      // Reset to default size
      await tester.binding.setSurfaceSize(const Size(800, 600));
    });

    testWidgets('should have proper border radius', (tester) async {
      await tester.pumpWidget(createStatusChip(WorkOrderStatus.assigned));

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;

      expect(decoration.borderRadius, isA<BorderRadius>());
    });

    testWidgets('should handle all status enum values', (tester) async {
      for (final status in WorkOrderStatus.values) {
        await tester.pumpWidget(createStatusChip(status));

        // Should render without errors
        expect(find.byType(WorkOrderStatusChip), findsOneWidget);
        expect(find.byType(Text), findsOneWidget);

        // Should have proper display name
        final text = tester.widget<Text>(find.byType(Text));
        expect(text.data, isNotNull);
        expect(text.data!.isNotEmpty, isTrue);
      }
    });

    testWidgets('should have consistent sizing across different statuses',
        (tester) async {
      Size? previousSize;

      for (final status in WorkOrderStatus.values) {
        await tester.pumpWidget(createStatusChip(status));

        final container = tester.widget<Container>(find.byType(Container));
        final currentSize = Size(
          container.constraints?.maxWidth ?? 0,
          container.constraints?.maxHeight ?? 0,
        );

        if (previousSize != null) {
          // Height should be consistent (allowing for some variation due to text)
          expect(
              (currentSize.height - previousSize.height).abs(), lessThan(10));
        }

        previousSize = currentSize;
      }
    });

    testWidgets('should have proper text color contrast', (tester) async {
      await tester.pumpWidget(createStatusChip(WorkOrderStatus.assigned));

      final text = tester.widget<Text>(find.text('Assigned'));
      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;

      // Text should have a color
      expect(text.style!.color, isNotNull);

      // Background should have a color
      expect(decoration.color, isNotNull);

      // Colors should be different for contrast
      expect(text.style!.color, isNot(equals(decoration.color)));
    });

    testWidgets('should maintain aspect ratio', (tester) async {
      await tester.pumpWidget(createStatusChip(WorkOrderStatus.assigned));

      final container = tester.widget<Container>(find.byType(Container));

      // Should have reasonable dimensions
      expect(container.padding, isNotNull);

      final renderBox = tester.renderObject<RenderBox>(find.byType(Container));
      final size = renderBox.size;

      // Width should be greater than height for a chip
      expect(size.width, greaterThan(size.height));
    });

    testWidgets('should handle text overflow properly', (tester) async {
      // Test with a very narrow screen to force text constraints
      await tester.binding.setSurfaceSize(const Size(200, 600));

      await tester.pumpWidget(createStatusChip(WorkOrderStatus.inProgress));

      // Should render without overflow errors
      expect(find.byType(WorkOrderStatusChip), findsOneWidget);
      expect(tester.takeException(), isNull);

      // Reset to default size
      await tester.binding.setSurfaceSize(const Size(800, 600));
    });
  });
}
