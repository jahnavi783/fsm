import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/core/widgets/custom_button.dart';
import 'helpers/test_helpers.dart';

void main() {
  group('Basic Widget Tests', () {
    testWidgets('CustomButton should render and respond to taps',
        (tester) async {
      bool buttonTapped = false;

      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return TestHelpers.createTestWidget(
              CustomButton(
                text: 'Test Button',
                onPressed: () => buttonTapped = true,
              ),
            );
          },
        ),
      );

      expect(find.text('Test Button'), findsOneWidget);
      expect(find.byType(CustomButton), findsOneWidget);

      await tester.tap(find.byType(CustomButton));
      await tester.pumpAndSettle();

      expect(buttonTapped, isTrue);
    });

    testWidgets('CustomButton should show loading state', (tester) async {
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return TestHelpers.createTestWidget(
              const CustomButton(
                text: 'Loading Button',
                isLoading: true,
              ),
            );
          },
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Loading Button'), findsOneWidget);
    });

    testWidgets('CustomButton should be disabled when isEnabled is false',
        (tester) async {
      bool buttonTapped = false;

      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return TestHelpers.createTestWidget(
              CustomButton(
                text: 'Disabled Button',
                isEnabled: false,
                onPressed: () => buttonTapped = true,
              ),
            );
          },
        ),
      );

      await tester.tap(find.byType(CustomButton));
      await tester.pumpAndSettle();

      expect(buttonTapped, isFalse);
    });

    testWidgets('CustomButton should show icon when provided', (tester) async {
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return TestHelpers.createTestWidget(
              const CustomButton(
                text: 'Icon Button',
                icon: Icons.add,
              ),
            );
          },
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.text('Icon Button'), findsOneWidget);
    });

    testWidgets('CustomIconButton should render and respond to taps',
        (tester) async {
      bool buttonTapped = false;

      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return TestHelpers.createTestWidget(
              CustomIconButton(
                icon: Icons.favorite,
                onPressed: () => buttonTapped = true,
              ),
            );
          },
        ),
      );

      expect(find.byIcon(Icons.favorite), findsOneWidget);
      expect(find.byType(CustomIconButton), findsOneWidget);

      await tester.tap(find.byType(CustomIconButton));
      await tester.pumpAndSettle();

      expect(buttonTapped, isTrue);
    });

    testWidgets('CustomIconButton should show loading state', (tester) async {
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return TestHelpers.createTestWidget(
              const CustomIconButton(
                icon: Icons.save,
                isLoading: true,
              ),
            );
          },
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byIcon(Icons.save), findsNothing);
    });

    testWidgets('Widgets should be responsive to different screen sizes',
        (tester) async {
      // Test with iPhone size
      await tester.binding.setSurfaceSize(const Size(375, 812));

      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return TestHelpers.createTestWidget(
              const CustomButton(text: 'Responsive Button'),
            );
          },
        ),
      );

      expect(find.byType(CustomButton), findsOneWidget);

      // Test with tablet size
      await tester.binding.setSurfaceSize(const Size(768, 1024));

      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return TestHelpers.createTestWidget(
              const CustomButton(text: 'Responsive Button'),
            );
          },
        ),
      );

      expect(find.byType(CustomButton), findsOneWidget);

      // Reset to default
      await tester.binding.setSurfaceSize(const Size(800, 600));
    });

    testWidgets('Widgets should handle different states properly',
        (tester) async {
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return TestHelpers.createTestWidget(
              Column(
                children: [
                  const CustomButton(text: 'Normal Button'),
                  const CustomButton(text: 'Loading Button', isLoading: true),
                  const CustomButton(text: 'Disabled Button', isEnabled: false),
                  CustomButton(
                    text: 'Icon Button',
                    icon: Icons.star,
                    onPressed: () {},
                  ),
                ],
              ),
            );
          },
        ),
      );

      expect(find.byType(CustomButton), findsNWidgets(4));
      expect(find.text('Normal Button'), findsOneWidget);
      expect(find.text('Loading Button'), findsOneWidget);
      expect(find.text('Disabled Button'), findsOneWidget);
      expect(find.text('Icon Button'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byIcon(Icons.star), findsOneWidget);
    });

    testWidgets('Widgets should maintain proper styling', (tester) async {
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return TestHelpers.createTestWidget(
              const CustomButton(
                text: 'Styled Button',
                backgroundColor: Colors.blue,
                textColor: Colors.white,
              ),
            );
          },
        ),
      );

      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.style, isNotNull);

      final backgroundColor = button.style!.backgroundColor!.resolve({});
      final foregroundColor = button.style!.foregroundColor!.resolve({});

      expect(backgroundColor, equals(Colors.blue));
      expect(foregroundColor, equals(Colors.white));
    });
  });
}
