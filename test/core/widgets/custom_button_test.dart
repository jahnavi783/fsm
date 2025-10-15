import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../lib/core/widgets/custom_button.dart';
import '../../helpers/test_helpers.dart';

void main() {
  group('CustomButton Widget Tests', () {
    bool onPressedCalled = false;

    setUp(() {
      onPressedCalled = false;
    });

    Widget createCustomButton({
      String text = 'Test Button',
      VoidCallback? onPressed,
      bool isLoading = false,
      bool isEnabled = true,
      Color? backgroundColor,
      Color? textColor,
      IconData? icon,
      double? width,
      double? height,
    }) {
      return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return TestHelpers.createTestWidget(
            CustomButton(
              text: text,
              onPressed: onPressed ?? (() => onPressedCalled = true),
              isLoading: isLoading,
              isEnabled: isEnabled,
              backgroundColor: backgroundColor,
              textColor: textColor,
              icon: icon,
              width: width,
              height: height,
            ),
          );
        },
      );
    }

    testWidgets('should render button with text', (tester) async {
      await tester.pumpWidget(createCustomButton());

      expect(find.byType(CustomButton), findsOneWidget);
      expect(find.text('Test Button'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('should call onPressed when tapped', (tester) async {
      await tester.pumpWidget(createCustomButton());

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(onPressedCalled, isTrue);
    });

    testWidgets('should not call onPressed when disabled', (tester) async {
      await tester.pumpWidget(createCustomButton(
        isEnabled: false,
      ));

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(onPressedCalled, isFalse);
    });

    testWidgets('should show loading indicator when isLoading is true',
        (tester) async {
      await tester.pumpWidget(createCustomButton(isLoading: true));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Test Button'), findsOneWidget);
    });

    testWidgets('should not call onPressed when loading', (tester) async {
      await tester.pumpWidget(createCustomButton(isLoading: true));

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(onPressedCalled, isFalse);
    });

    testWidgets('should show icon when provided', (tester) async {
      await tester.pumpWidget(createCustomButton(icon: Icons.add));

      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.text('Test Button'), findsOneWidget);
    });

    testWidgets('should prioritize loading over icon', (tester) async {
      await tester.pumpWidget(createCustomButton(
        icon: Icons.add,
        isLoading: true,
      ));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byIcon(Icons.add), findsNothing);
    });

    testWidgets('should apply custom width and height', (tester) async {
      await tester.pumpWidget(createCustomButton(
        width: 200,
        height: 60,
      ));

      final sizedBox = tester.widget<SizedBox>(
        find.descendant(
          of: find.byType(CustomButton),
          matching: find.byType(SizedBox),
        ),
      );

      expect(sizedBox.width, equals(200));
    });

    testWidgets('should apply custom colors', (tester) async {
      await tester.pumpWidget(createCustomButton(
        backgroundColor: Colors.red,
        textColor: Colors.white,
      ));

      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      final backgroundColor = button.style!.backgroundColor!.resolve({});
      final foregroundColor = button.style!.foregroundColor!.resolve({});

      expect(backgroundColor, equals(Colors.red));
      expect(foregroundColor, equals(Colors.white));
    });

    testWidgets('should have proper default styling', (tester) async {
      await tester.pumpWidget(createCustomButton());

      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.style, isNotNull);
      expect(button.style!.shape, isA<MaterialStateProperty>());
    });

    testWidgets('should be responsive to screen size', (tester) async {
      // Test with different screen sizes
      await tester.binding
          .setSurfaceSize(const Size(375, 812)); // iPhone 11 Pro
      await tester.pumpWidget(createCustomButton());
      await tester.pumpAndSettle();

      expect(find.byType(CustomButton), findsOneWidget);

      // Test with tablet size
      await tester.binding.setSurfaceSize(const Size(768, 1024)); // iPad
      await tester.pumpWidget(createCustomButton());
      await tester.pumpAndSettle();

      expect(find.byType(CustomButton), findsOneWidget);

      // Reset to default size
      await tester.binding.setSurfaceSize(const Size(800, 600));
    });

    testWidgets('should handle null onPressed gracefully', (tester) async {
      await tester.pumpWidget(createCustomButton(onPressed: null));

      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.onPressed, isNull);
    });

    testWidgets('should have proper text styling', (tester) async {
      await tester.pumpWidget(createCustomButton());

      final text = tester.widget<Text>(find.text('Test Button'));
      expect(text.style, isNotNull);
      expect(text.style!.fontWeight, equals(FontWeight.w600));
    });

    testWidgets('should maintain proper spacing with icon', (tester) async {
      await tester.pumpWidget(createCustomButton(icon: Icons.add));

      expect(find.byType(SizedBox), findsAtLeastNWidgets(1));
    });

    testWidgets('should maintain proper spacing with loading indicator',
        (tester) async {
      await tester.pumpWidget(createCustomButton(isLoading: true));

      expect(find.byType(SizedBox), findsAtLeastNWidgets(1));
    });
  });

  group('CustomButton.primary Constructor Tests', () {
    testWidgets('should create primary button', (tester) async {
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return TestHelpers.createTestWidget(
              const CustomButton.primary(text: 'Primary Button'),
            );
          },
        ),
      );

      expect(find.text('Primary Button'), findsOneWidget);
      expect(find.byType(CustomButton), findsOneWidget);
    });
  });

  group('CustomButton.secondary Constructor Tests', () {
    testWidgets('should create secondary button', (tester) async {
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return TestHelpers.createTestWidget(
              const CustomButton.secondary(text: 'Secondary Button'),
            );
          },
        ),
      );

      expect(find.text('Secondary Button'), findsOneWidget);
      expect(find.byType(CustomButton), findsOneWidget);
    });
  });

  group('CustomButton.outline Constructor Tests', () {
    testWidgets('should create outline button', (tester) async {
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return TestHelpers.createTestWidget(
              const CustomButton.outline(text: 'Outline Button'),
            );
          },
        ),
      );

      expect(find.text('Outline Button'), findsOneWidget);
      expect(find.byType(CustomButton), findsOneWidget);

      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      final shape = button.style!.shape!.resolve({}) as RoundedRectangleBorder;
      expect(shape.side, isNot(equals(BorderSide.none)));
    });
  });

  group('CustomIconButton Widget Tests', () {
    bool onPressedCalled = false;

    setUp(() {
      onPressedCalled = false;
    });

    Widget createCustomIconButton({
      IconData icon = Icons.add,
      VoidCallback? onPressed,
      bool isLoading = false,
      bool isEnabled = true,
      Color? backgroundColor,
      Color? iconColor,
      double? size,
      String? tooltip,
    }) {
      return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return TestHelpers.createTestWidget(
            CustomIconButton(
              icon: icon,
              onPressed: onPressed ?? (() => onPressedCalled = true),
              isLoading: isLoading,
              isEnabled: isEnabled,
              backgroundColor: backgroundColor,
              iconColor: iconColor,
              size: size,
              tooltip: tooltip,
            ),
          );
        },
      );
    }

    testWidgets('should render icon button', (tester) async {
      await tester.pumpWidget(createCustomIconButton());

      expect(find.byType(CustomIconButton), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('should call onPressed when tapped', (tester) async {
      await tester.pumpWidget(createCustomIconButton());

      await tester.tap(find.byType(CustomIconButton));
      await tester.pumpAndSettle();

      expect(onPressedCalled, isTrue);
    });

    testWidgets('should show loading indicator when isLoading is true',
        (tester) async {
      await tester.pumpWidget(createCustomIconButton(isLoading: true));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byIcon(Icons.add), findsNothing);
    });

    testWidgets('should show tooltip when provided', (tester) async {
      await tester.pumpWidget(createCustomIconButton(tooltip: 'Add Item'));

      expect(find.byType(Tooltip), findsOneWidget);

      final tooltip = tester.widget<Tooltip>(find.byType(Tooltip));
      expect(tooltip.message, equals('Add Item'));
    });

    testWidgets('should apply custom size', (tester) async {
      await tester.pumpWidget(createCustomIconButton(size: 60));

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(CustomIconButton),
          matching: find.byType(Container),
        ),
      );

      expect(container.constraints!.maxWidth, equals(60));
      expect(container.constraints!.maxHeight, equals(60));
    });

    testWidgets('should apply custom colors', (tester) async {
      await tester.pumpWidget(createCustomIconButton(
        backgroundColor: Colors.blue,
        iconColor: Colors.white,
      ));

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(CustomIconButton),
          matching: find.byType(Material),
        ),
      );

      expect(material.color, equals(Colors.blue));

      final icon = tester.widget<Icon>(find.byIcon(Icons.add));
      expect(icon.color, equals(Colors.white));
    });

    testWidgets('should have circular shape', (tester) async {
      await tester.pumpWidget(createCustomIconButton());

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(CustomIconButton),
          matching: find.byType(Material),
        ),
      );

      expect(material.borderRadius, isA<BorderRadius>());
    });

    testWidgets('should not call onPressed when disabled', (tester) async {
      await tester.pumpWidget(createCustomIconButton(isEnabled: false));

      await tester.tap(find.byType(CustomIconButton));
      await tester.pumpAndSettle();

      expect(onPressedCalled, isFalse);
    });

    testWidgets('should not call onPressed when loading', (tester) async {
      await tester.pumpWidget(createCustomIconButton(isLoading: true));

      await tester.tap(find.byType(CustomIconButton));
      await tester.pumpAndSettle();

      expect(onPressedCalled, isFalse);
    });
  });
}
