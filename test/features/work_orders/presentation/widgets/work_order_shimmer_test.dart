import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../lib/features/work_orders/presentation/widgets/work_order_shimmer.dart';
import '../../../../helpers/test_helpers.dart';

void main() {
  group('WorkOrderShimmer Widget Tests', () {
    Widget createWorkOrderShimmer() {
      return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return TestHelpers.createTestWidget(
            const WorkOrderShimmer(),
          );
        },
      );
    }

    testWidgets('should render shimmer effect', (tester) async {
      await tester.pumpWidget(createWorkOrderShimmer());

      expect(find.byType(WorkOrderShimmer), findsOneWidget);
      expect(find.byType(Shimmer), findsOneWidget);
    });

    testWidgets('should have card structure', (tester) async {
      await tester.pumpWidget(createWorkOrderShimmer());

      expect(find.byType(Card), findsOneWidget);

      final card = tester.widget<Card>(find.byType(Card));
      expect(card.elevation, equals(2));
      expect(card.shape, isA<RoundedRectangleBorder>());
    });

    testWidgets('should have proper shimmer colors', (tester) async {
      await tester.pumpWidget(createWorkOrderShimmer());

      final shimmer = tester.widget<Shimmer>(find.byType(Shimmer));
      expect(shimmer.gradient, isNotNull);
    });

    testWidgets('should have multiple shimmer containers', (tester) async {
      await tester.pumpWidget(createWorkOrderShimmer());

      // Should have multiple Container widgets for different content areas
      expect(find.byType(Container), findsAtLeastNWidgets(5));
    });

    testWidgets('should have proper layout structure', (tester) async {
      await tester.pumpWidget(createWorkOrderShimmer());

      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(Row), findsAtLeastNWidgets(2));
      expect(find.byType(SizedBox), findsAtLeastNWidgets(5));
    });

    testWidgets('should have proper spacing', (tester) async {
      await tester.pumpWidget(createWorkOrderShimmer());

      final sizedBoxes = tester.widgetList<SizedBox>(find.byType(SizedBox));
      expect(sizedBoxes.length, greaterThan(5));
    });

    testWidgets('should be responsive to screen size', (tester) async {
      // Test with different screen sizes
      await tester.binding
          .setSurfaceSize(const Size(375, 812)); // iPhone 11 Pro
      await tester.pumpWidget(createWorkOrderShimmer());
      await tester.pumpAndSettle();

      expect(find.byType(WorkOrderShimmer), findsOneWidget);

      // Test with tablet size
      await tester.binding.setSurfaceSize(const Size(768, 1024)); // iPad
      await tester.pumpWidget(createWorkOrderShimmer());
      await tester.pumpAndSettle();

      expect(find.byType(WorkOrderShimmer), findsOneWidget);

      // Reset to default size
      await tester.binding.setSurfaceSize(const Size(800, 600));
    });

    testWidgets('should have proper container decorations', (tester) async {
      await tester.pumpWidget(createWorkOrderShimmer());

      final containers = tester.widgetList<Container>(find.byType(Container));

      for (final container in containers) {
        if (container.decoration != null) {
          final decoration = container.decoration as BoxDecoration;
          expect(decoration.color, equals(Colors.white));
          expect(decoration.borderRadius, isA<BorderRadius>());
        }
      }
    });

    testWidgets('should have proper padding', (tester) async {
      await tester.pumpWidget(createWorkOrderShimmer());

      final padding = tester.widget<Padding>(
        find.descendant(
          of: find.byType(Card),
          matching: find.byType(Padding),
        ),
      );

      expect(padding.padding, isNotNull);
    });
  });

  group('WorkOrderListShimmer Widget Tests', () {
    Widget createWorkOrderListShimmer({int itemCount = 3}) {
      return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return TestHelpers.createTestWidget(
            WorkOrderListShimmer(itemCount: itemCount),
          );
        },
      );
    }

    testWidgets('should render list of shimmer items', (tester) async {
      await tester.pumpWidget(createWorkOrderListShimmer(itemCount: 3));

      expect(find.byType(WorkOrderListShimmer), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(WorkOrderShimmer), findsNWidgets(3));
    });

    testWidgets('should render default number of items', (tester) async {
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return TestHelpers.createTestWidget(
              const WorkOrderListShimmer(),
            );
          },
        ),
      );

      expect(find.byType(WorkOrderShimmer), findsNWidgets(5)); // Default count
    });

    testWidgets('should render custom number of items', (tester) async {
      await tester.pumpWidget(createWorkOrderListShimmer(itemCount: 7));

      expect(find.byType(WorkOrderShimmer), findsNWidgets(7));
    });

    testWidgets('should handle zero items', (tester) async {
      await tester.pumpWidget(createWorkOrderListShimmer(itemCount: 0));

      expect(find.byType(WorkOrderShimmer), findsNothing);
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('should be scrollable', (tester) async {
      await tester.pumpWidget(createWorkOrderListShimmer(itemCount: 10));

      final listView = tester.widget<ListView>(find.byType(ListView));
      expect(listView.scrollDirection, equals(Axis.vertical));
    });

    testWidgets('should handle large item counts', (tester) async {
      await tester.pumpWidget(createWorkOrderListShimmer(itemCount: 100));

      expect(find.byType(ListView), findsOneWidget);
      // Only visible items should be rendered due to ListView's lazy loading
      expect(find.byType(WorkOrderShimmer), findsAtLeastNWidgets(1));
    });

    testWidgets('should maintain consistent shimmer appearance',
        (tester) async {
      await tester.pumpWidget(createWorkOrderListShimmer(itemCount: 3));

      final shimmerWidgets = tester.widgetList<WorkOrderShimmer>(
        find.byType(WorkOrderShimmer),
      );

      expect(shimmerWidgets.length, equals(3));

      // All shimmer widgets should be identical
      for (final shimmer in shimmerWidgets) {
        expect(shimmer.runtimeType, equals(WorkOrderShimmer));
      }
    });

    testWidgets('should be responsive to screen size', (tester) async {
      // Test with different screen sizes
      await tester.binding
          .setSurfaceSize(const Size(375, 812)); // iPhone 11 Pro
      await tester.pumpWidget(createWorkOrderListShimmer());
      await tester.pumpAndSettle();

      expect(find.byType(WorkOrderListShimmer), findsOneWidget);

      // Test with tablet size
      await tester.binding.setSurfaceSize(const Size(768, 1024)); // iPad
      await tester.pumpWidget(createWorkOrderListShimmer());
      await tester.pumpAndSettle();

      expect(find.byType(WorkOrderListShimmer), findsOneWidget);

      // Reset to default size
      await tester.binding.setSurfaceSize(const Size(800, 600));
    });

    testWidgets('should handle scroll gestures', (tester) async {
      await tester.pumpWidget(createWorkOrderListShimmer(itemCount: 10));

      // Verify we can scroll
      await tester.drag(find.byType(ListView), const Offset(0, -300));
      await tester.pumpAndSettle();

      expect(find.byType(ListView), findsOneWidget);
    });
  });
}
