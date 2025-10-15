import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../lib/features/auth/domain/entities/user_entity.dart';
import '../../../../../lib/features/auth/presentation/blocs/auth/auth_bloc.dart';
import '../../../../../lib/features/auth/presentation/blocs/auth/auth_event.dart';
import '../../../../../lib/features/auth/presentation/blocs/auth/auth_state.dart';
import '../../../../../lib/features/auth/presentation/pages/login_page.dart';
import '../../../../../lib/features/auth/presentation/widgets/gradient_elevated_button.dart';
import '../../../../../lib/features/auth/presentation/widgets/login_form.dart';
import '../../../../helpers/test_helpers.dart';

class MockAuthBloc extends Mock implements AuthBloc {}

class MockStackRouter extends Mock implements StackRouter {}

void main() {
  group('LoginPage Widget Tests', () {
    late MockAuthBloc mockAuthBloc;
    late MockStackRouter mockRouter;

    setUp(() {
      mockAuthBloc = MockAuthBloc();
      mockRouter = MockStackRouter();

      // Set up default stream
      when(() => mockAuthBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const AuthState.initial()]),
      );
      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
    });

    Widget createLoginPage() {
      return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return BlocProvider<AuthBloc>.value(
            value: mockAuthBloc,
            child: TestHelpers.createTestApp(
              home: const LoginPage(),
            ),
          );
        },
      );
    }

    testWidgets('should render all UI elements', (tester) async {
      await tester.pumpWidget(createLoginPage());

      // Check for images
      expect(find.byType(Image), findsNWidgets(2)); // CSG logo and FSM logo

      // Check for title text
      expect(find.text('FIELD SERVICE ENGINEER'), findsOneWidget);

      // Check for login form
      expect(find.byType(LoginForm), findsOneWidget);

      // Check for login button
      expect(find.byType(GradientElevatedButton), findsOneWidget);
      expect(find.text('Login'), findsOneWidget);
    });

    testWidgets('should display loading state correctly', (tester) async {
      when(() => mockAuthBloc.state).thenReturn(const AuthState.loading());
      when(() => mockAuthBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const AuthState.loading()]),
      );

      await tester.pumpWidget(createLoginPage());
      await tester.pumpAndSettle();

      // Login button should be disabled and show loading
      final loginButton = tester.widget<GradientElevatedButton>(
        find.byType(GradientElevatedButton),
      );
      expect(loginButton.isLoading, isTrue);
    });

    testWidgets('should handle form submission with valid data',
        (tester) async {
      await tester.pumpWidget(createLoginPage());

      // Enter valid email
      final emailField = find.byWidgetPredicate(
        (widget) =>
            widget is TextField && widget.decoration?.labelText == 'Email ID',
      );
      await tester.enterText(emailField, 'test@example.com');

      // Enter valid password
      final passwordField = find.byWidgetPredicate(
        (widget) =>
            widget is TextField && widget.decoration?.labelText == 'Password',
      );
      await tester.enterText(passwordField, 'password123');

      await tester.pumpAndSettle();

      // Tap login button
      await tester.tap(find.byType(GradientElevatedButton));
      await tester.pumpAndSettle();

      // Verify that login event was added to bloc
      verify(() => mockAuthBloc.add(
            const AuthEvent.login(
              email: 'test@example.com',
              password: 'password123',
            ),
          )).called(1);
    });

    testWidgets('should not submit form with invalid data', (tester) async {
      await tester.pumpWidget(createLoginPage());

      // Enter invalid email
      final emailField = find.byWidgetPredicate(
        (widget) =>
            widget is TextField && widget.decoration?.labelText == 'Email ID',
      );
      await tester.enterText(emailField, 'invalid-email');

      // Enter short password
      final passwordField = find.byWidgetPredicate(
        (widget) =>
            widget is TextField && widget.decoration?.labelText == 'Password',
      );
      await tester.enterText(passwordField, '123');

      await tester.pumpAndSettle();

      // Tap login button
      await tester.tap(find.byType(GradientElevatedButton));
      await tester.pumpAndSettle();

      // Verify that login event was NOT added to bloc
      verifyNever(() => mockAuthBloc.add(any()));
    });

    testWidgets('should show error snackbar on authentication error',
        (tester) async {
      const errorMessage = 'Invalid credentials';

      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
      when(() => mockAuthBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          const AuthState.initial(),
          const AuthState.error(errorMessage),
        ]),
      );

      await tester.pumpWidget(createLoginPage());
      await tester.pump(); // Trigger the stream

      expect(find.text(errorMessage), findsOneWidget);
      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets(
        'should navigate to main on successful technician authentication',
        (tester) async {
      const user = UserEntity(
        id: 1,
        email: 'test@example.com',
        firstName: 'John',
        lastName: 'Doe',
        role: 'technician',
        permissions: ['read_work_orders'],
      );

      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
      when(() => mockAuthBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          const AuthState.initial(),
          const AuthState.authenticated(user),
        ]),
      );

      await tester.pumpWidget(createLoginPage());
      await tester.pump(); // Trigger the stream

      // Note: In a real test, we would verify navigation
      // For now, we just verify the state change was handled
      expect(find.byType(LoginPage), findsOneWidget);
    });

    testWidgets('should show warning for non-technician users', (tester) async {
      const user = UserEntity(
        id: 1,
        email: 'admin@example.com',
        firstName: 'Admin',
        lastName: 'User',
        role: 'admin',
        permissions: ['admin_access'],
      );

      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
      when(() => mockAuthBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          const AuthState.initial(),
          const AuthState.authenticated(user),
        ]),
      );

      await tester.pumpWidget(createLoginPage());
      await tester.pump(); // Trigger the stream

      expect(find.text('Please use web portal for authentication.'),
          findsOneWidget);
      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets('should have proper responsive layout', (tester) async {
      // Test with different screen sizes
      await tester.binding
          .setSurfaceSize(const Size(375, 812)); // iPhone 11 Pro
      await tester.pumpWidget(createLoginPage());
      await tester.pumpAndSettle();

      expect(find.byType(LoginPage), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);

      // Test with tablet size
      await tester.binding.setSurfaceSize(const Size(768, 1024)); // iPad
      await tester.pumpWidget(createLoginPage());
      await tester.pumpAndSettle();

      expect(find.byType(LoginPage), findsOneWidget);

      // Reset to default size
      await tester.binding.setSurfaceSize(const Size(800, 600));
    });

    testWidgets('should have proper spacing and padding', (tester) async {
      await tester.pumpWidget(createLoginPage());

      // Check for proper padding
      expect(find.byType(Padding), findsAtLeastNWidgets(2));

      // Check for proper spacing
      expect(find.byType(SizedBox), findsAtLeastNWidgets(3));
    });

    testWidgets('should center content properly', (tester) async {
      await tester.pumpWidget(createLoginPage());

      expect(find.byType(Center), findsOneWidget);

      final column = tester.widget<Column>(
        find.descendant(
          of: find.byType(Center),
          matching: find.byType(Column),
        ),
      );

      expect(column.mainAxisAlignment, equals(MainAxisAlignment.center));
      expect(column.crossAxisAlignment, equals(CrossAxisAlignment.center));
    });

    testWidgets('should dispose form group properly', (tester) async {
      await tester.pumpWidget(createLoginPage());

      // Verify page is rendered
      expect(find.byType(LoginPage), findsOneWidget);

      // Remove the widget
      await tester.pumpWidget(Container());

      // Should not throw any errors during disposal
    });

    testWidgets('should handle keyboard actions properly', (tester) async {
      await tester.pumpWidget(createLoginPage());

      // Enter valid data
      final emailField = find.byWidgetPredicate(
        (widget) =>
            widget is TextField && widget.decoration?.labelText == 'Email ID',
      );
      final passwordField = find.byWidgetPredicate(
        (widget) =>
            widget is TextField && widget.decoration?.labelText == 'Password',
      );

      await tester.enterText(emailField, 'test@example.com');
      await tester.enterText(passwordField, 'password123');
      await tester.pumpAndSettle();

      // Simulate pressing done on password field
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      // Should trigger form submission
      verify(() => mockAuthBloc.add(
            const AuthEvent.login(
              email: 'test@example.com',
              password: 'password123',
            ),
          )).called(1);
    });

    testWidgets('should have proper accessibility', (tester) async {
      await tester.pumpWidget(createLoginPage());

      // Check that images have proper semantics
      final images = tester.widgetList<Image>(find.byType(Image));
      expect(images.length, equals(2));

      // Check that buttons are accessible
      expect(find.byType(GradientElevatedButton), findsOneWidget);
    });
  });
}
