import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../lib/features/auth/presentation/widgets/loading_circles.dart';
import '../../../../helpers/test_helpers.dart';

void main() {
  group('LoadingCircles Widget Tests', () {
    late AnimationController controller;

    setUp(() {
      // Create a test animation controller
      controller = AnimationController(
        vsync: const TestVSync(),
        duration: const Duration(milliseconds: 500),
      );
    });

    tearDown(() {
      controller.dispose();
    });

    Widget createLoadingCircles({AnimationController? animationController}) {
      return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return TestHelpers.createTestWidget(
            LoadingCircles(
              controller: animationController ?? controller,
            ),
          );
        },
      );
    }

    testWidgets('should render loading circle widget', (tester) async {
      await tester.pumpWidget(createLoadingCircles());

      expect(find.byType(LoadingCircles), findsOneWidget);
    });

    testWidgets('should have animated builder', (tester) async {
      await tester.pumpWidget(createLoadingCircles());

      expect(find.byType(AnimatedBuilder), findsOneWidget);
    });

    testWidgets('should have container with decoration', (tester) async {
      await tester.pumpWidget(createLoadingCircles());

      final container = find.descendant(
        of: find.byType(LoadingCircles),
        matching: find.byType(Container),
      );

      expect(container, findsOneWidget);

      final containerWidget = tester.widget<Container>(container);
      expect(containerWidget.decoration, isA<BoxDecoration>());
    });

    testWidgets('should have circular shape', (tester) async {
      await tester.pumpWidget(createLoadingCircles());

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(LoadingCircles),
          matching: find.byType(Container),
        ),
      );

      final decoration = container.decoration as BoxDecoration;
      expect(decoration.shape, equals(BoxShape.circle));
    });

    testWidgets('should animate when controller is running', (tester) async {
      await tester.pumpWidget(createLoadingCircles());

      // Start animation
      controller.repeat();
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byType(LoadingCircles), findsOneWidget);

      // Stop animation
      controller.stop();
    });

    testWidgets('should respond to controller changes', (tester) async {
      await tester.pumpWidget(createLoadingCircles());

      // Initial state
      expect(controller.value, equals(0.0));

      // Animate to different values
      controller.animateTo(0.5);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 250));

      expect(controller.value, greaterThan(0.0));
    });

    testWidgets('should have proper sizing', (tester) async {
      await tester.pumpWidget(createLoadingCircles());

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(LoadingCircles),
          matching: find.byType(Container),
        ),
      );

      expect(container.width, isNotNull);
      expect(container.height, isNotNull);
    });

    testWidgets('should be responsive to screen size', (tester) async {
      // Test with different screen sizes
      await tester.binding
          .setSurfaceSize(const Size(375, 812)); // iPhone 11 Pro
      await tester.pumpWidget(createLoadingCircles());
      await tester.pumpAndSettle();

      expect(find.byType(LoadingCircles), findsOneWidget);

      // Test with tablet size
      await tester.binding.setSurfaceSize(const Size(768, 1024)); // iPad
      await tester.pumpWidget(createLoadingCircles());
      await tester.pumpAndSettle();

      expect(find.byType(LoadingCircles), findsOneWidget);

      // Reset to default size
      await tester.binding.setSurfaceSize(const Size(800, 600));
    });

    testWidgets('should handle controller disposal gracefully', (tester) async {
      final testController = AnimationController(
        vsync: const TestVSync(),
        duration: const Duration(milliseconds: 500),
      );

      await tester.pumpWidget(createLoadingCircles(
        animationController: testController,
      ));

      expect(find.byType(LoadingCircles), findsOneWidget);

      // Dispose controller and rebuild
      testController.dispose();
      await tester.pumpWidget(Container()); // Empty widget

      // Should not throw any errors
    });

    testWidgets('should have proper margin/padding', (tester) async {
      await tester.pumpWidget(createLoadingCircles());

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(LoadingCircles),
          matching: find.byType(Container),
        ),
      );

      // Should have some margin for spacing between circles
      expect(container.margin, isNotNull);
    });

    testWidgets('should work with multiple instances', (tester) async {
      final controller1 = AnimationController(
        vsync: const TestVSync(),
        duration: const Duration(milliseconds: 250),
      );
      final controller2 = AnimationController(
        vsync: const TestVSync(),
        duration: const Duration(milliseconds: 375),
      );
      final controller3 = AnimationController(
        vsync: const TestVSync(),
        duration: const Duration(milliseconds: 500),
      );

      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return TestHelpers.createTestWidget(
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoadingCircles(controller: controller1),
                  LoadingCircles(controller: controller2),
                  LoadingCircles(controller: controller3),
                ],
              ),
            );
          },
        ),
      );

      expect(find.byType(LoadingCircles), findsNWidgets(3));

      // Cleanup
      controller1.dispose();
      controller2.dispose();
      controller3.dispose();
    });
  });
}

class TestVSync implements TickerProvider {
  const TestVSync();

  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}
