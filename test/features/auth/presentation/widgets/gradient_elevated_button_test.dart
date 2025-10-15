import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../lib/features/auth/presentation/widgets/gradient_elevated_button.dart';
import '../../../../helpers/test_helpers.dart';

void main() {
  group('GradientElevatedButton Widget Tests', () {
    bool onPressedCalled = false;

    setUp(() {
      onPressedCalled = false;
    });

    Widget createGradientButton({
      bool isLoading = false,
      VoidCallback? onPressed,
      Widget? child,
    }) {
      return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return TestHelpers.createTestWidget(
            GradientElevatedButton(
              onPressed: onPressed ?? (() => onPressedCalled = true),
              isLoading: isLoading,
              child: child ?? const Text('Test Button'),
            ),
          );
        },
      );
    }

    testWidgets('should render button with child widget', (tester) async {
      await tester.pumpWidget(createGradientButton(
        child: const Text('Login'),
      ));

      expect(find.byType(GradientElevatedButton), findsOneWidget);
      expect(find.text('Login'), findsOneWidget);
    });

    testWidgets('should call onPressed when tapped', (tester) async {
      await tester.pumpWidget(createGradientButton());

      await tester.tap(find.byType(GradientElevatedButton));
      await tester.pumpAndSettle();

      expect(onPressedCalled, isTrue);
    });

    testWidgets('should not call onPressed when disabled', (tester) async {
      await tester.pumpWidget(createGradientButton(onPressed: null));

      await tester.tap(find.byType(GradientElevatedButton));
      await tester.pumpAndSettle();

      expect(onPressedCalled, isFalse);
    });

    testWidgets('should show loading indicator when isLoading is true',
        (tester) async {
      await tester.pumpWidget(createGradientButton(isLoading: true));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Test Button'), findsNothing);
    });

    testWidgets('should not call onPressed when loading', (tester) async {
      await tester.pumpWidget(createGradientButton(isLoading: true));

      await tester.tap(find.byType(GradientElevatedButton));
      await tester.pumpAndSettle();

      expect(onPressedCalled, isFalse);
    });

    testWidgets('should have gradient decoration', (tester) async {
      await tester.pumpWidget(createGradientButton());

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(GradientElevatedButton),
          matching: find.byType(Container),
        ),
      );

      expect(container.decoration, isA<BoxDecoration>());
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.gradient, isA<LinearGradient>());
    });

    testWidgets('should have proper border radius', (tester) async {
      await tester.pumpWidget(createGradientButton());

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(GradientElevatedButton),
          matching: find.byType(Container),
        ),
      );

      final decoration = container.decoration as BoxDecoration;
      expect(decoration.borderRadius, isA<BorderRadius>());
    });

    testWidgets('should be responsive to screen size', (tester) async {
      // Test with different screen sizes
      await tester.binding
          .setSurfaceSize(const Size(375, 812)); // iPhone 11 Pro
      await tester.pumpWidget(createGradientButton());
      await tester.pumpAndSettle();

      expect(find.byType(GradientElevatedButton), findsOneWidget);

      // Test with tablet size
      await tester.binding.setSurfaceSize(const Size(768, 1024)); // iPad
      await tester.pumpWidget(createGradientButton());
      await tester.pumpAndSettle();

      expect(find.byType(GradientElevatedButton), findsOneWidget);

      // Reset to default size
      await tester.binding.setSurfaceSize(const Size(800, 600));
    });

    testWidgets('should have proper padding and sizing', (tester) async {
      await tester.pumpWidget(createGradientButton());

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(GradientElevatedButton),
          matching: find.byType(Container),
        ),
      );

      expect(container.padding, isNotNull);
    });

    testWidgets('should handle different child widgets', (tester) async {
      // Test with Icon child
      await tester.pumpWidget(createGradientButton(
        child: const Icon(Icons.login),
      ));

      expect(find.byIcon(Icons.login), findsOneWidget);

      // Test with Row child
      await tester.pumpWidget(createGradientButton(
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.login),
            SizedBox(width: 8),
            Text('Login'),
          ],
        ),
      ));

      expect(find.byIcon(Icons.login), findsOneWidget);
      expect(find.text('Login'), findsOneWidget);
    });

    testWidgets('should maintain state during loading transition',
        (tester) async {
      // Start with non-loading state
      await tester.pumpWidget(createGradientButton(isLoading: false));
      expect(find.text('Test Button'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);

      // Switch to loading state
      await tester.pumpWidget(createGradientButton(isLoading: true));
      await tester.pumpAndSettle();

      expect(find.text('Test Button'), findsNothing);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // Switch back to non-loading state
      await tester.pumpWidget(createGradientButton(isLoading: false));
      await tester.pumpAndSettle();

      expect(find.text('Test Button'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('should have proper accessibility properties', (tester) async {
      await tester.pumpWidget(createGradientButton());

      final button = tester.widget<GestureDetector>(
        find.descendant(
          of: find.byType(GradientElevatedButton),
          matching: find.byType(GestureDetector),
        ),
      );

      expect(button.onTap, isNotNull);
    });
  });
}
