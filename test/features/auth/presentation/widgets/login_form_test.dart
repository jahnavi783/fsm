import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../lib/features/auth/presentation/widgets/login_form.dart';
import '../../../../helpers/test_helpers.dart';

void main() {
  group('LoginForm Widget Tests', () {
    late FormGroup formGroup;
    bool onSubmitCalled = false;

    setUp(() {
      onSubmitCalled = false;
      formGroup = FormGroup({
        'email': FormControl<String>(
          validators: [
            Validators.required,
            Validators.email,
          ],
        ),
        'password': FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(6),
          ],
        ),
      });
    });

    tearDown(() {
      formGroup.dispose();
    });

    Widget createLoginForm({bool isLoading = false}) {
      return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return TestHelpers.createTestWidget(
            LoginForm(
              formGroup: formGroup,
              onSubmit: () => onSubmitCalled = true,
              isLoading: isLoading,
            ),
          );
        },
      );
    }

    testWidgets('should render email and password fields', (tester) async {
      await tester.pumpWidget(createLoginForm());

      expect(find.byType(ReactiveTextField<String>), findsNWidgets(2));
      expect(find.text('Enter Your Email'), findsOneWidget);
      expect(find.text('Email ID'), findsOneWidget);
      expect(find.text('Enter Your Password'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
    });

    testWidgets('should show password visibility toggle', (tester) async {
      await tester.pumpWidget(createLoginForm());

      expect(find.byIcon(Icons.visibility), findsOneWidget);
      expect(find.byIcon(Icons.visibility_off), findsNothing);
    });

    testWidgets('should toggle password visibility when icon is tapped',
        (tester) async {
      await tester.pumpWidget(createLoginForm());

      // Initially password should be hidden
      expect(find.byIcon(Icons.visibility), findsOneWidget);

      // Tap the visibility toggle
      await tester.tap(find.byIcon(Icons.visibility));
      await tester.pumpAndSettle();

      // Password should now be visible
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
      expect(find.byIcon(Icons.visibility), findsNothing);

      // Tap again to hide
      await tester.tap(find.byIcon(Icons.visibility_off));
      await tester.pumpAndSettle();

      // Password should be hidden again
      expect(find.byIcon(Icons.visibility), findsOneWidget);
      expect(find.byIcon(Icons.visibility_off), findsNothing);
    });

    testWidgets('should accept valid email input', (tester) async {
      await tester.pumpWidget(createLoginForm());

      final emailField = find.byWidgetPredicate(
        (widget) =>
            widget is ReactiveTextField<String> &&
            widget.formControlName == 'email',
      );

      await tester.enterText(emailField, 'test@example.com');
      await tester.pumpAndSettle();

      expect(formGroup.control('email').value, equals('test@example.com'));
      expect(formGroup.control('email').valid, isTrue);
    });

    testWidgets('should show email validation error for invalid email',
        (tester) async {
      await tester.pumpWidget(createLoginForm());

      final emailField = find.byWidgetPredicate(
        (widget) =>
            widget is ReactiveTextField<String> &&
            widget.formControlName == 'email',
      );

      await tester.enterText(emailField, 'invalid-email');
      await tester.pumpAndSettle();

      // Mark as touched to trigger validation display
      formGroup.control('email').markAsTouched();
      await tester.pumpAndSettle();

      expect(find.text('Please enter a valid email'), findsOneWidget);
    });

    testWidgets('should show email required validation error', (tester) async {
      await tester.pumpWidget(createLoginForm());

      final emailField = find.byWidgetPredicate(
        (widget) =>
            widget is ReactiveTextField<String> &&
            widget.formControlName == 'email',
      );

      await tester.enterText(emailField, '');
      await tester.pumpAndSettle();

      // Mark as touched to trigger validation display
      formGroup.control('email').markAsTouched();
      await tester.pumpAndSettle();

      expect(find.text('Email is required'), findsOneWidget);
    });

    testWidgets('should accept valid password input', (tester) async {
      await tester.pumpWidget(createLoginForm());

      final passwordField = find.byWidgetPredicate(
        (widget) =>
            widget is ReactiveTextField<String> &&
            widget.formControlName == 'password',
      );

      await tester.enterText(passwordField, 'password123');
      await tester.pumpAndSettle();

      expect(formGroup.control('password').value, equals('password123'));
      expect(formGroup.control('password').valid, isTrue);
    });

    testWidgets('should show password validation error for short password',
        (tester) async {
      await tester.pumpWidget(createLoginForm());

      final passwordField = find.byWidgetPredicate(
        (widget) =>
            widget is ReactiveTextField<String> &&
            widget.formControlName == 'password',
      );

      await tester.enterText(passwordField, '123');
      await tester.pumpAndSettle();

      // Mark as touched to trigger validation display
      formGroup.control('password').markAsTouched();
      await tester.pumpAndSettle();

      expect(
          find.text('Password must be at least 6 characters'), findsOneWidget);
    });

    testWidgets('should show password required validation error',
        (tester) async {
      await tester.pumpWidget(createLoginForm());

      final passwordField = find.byWidgetPredicate(
        (widget) =>
            widget is ReactiveTextField<String> &&
            widget.formControlName == 'password',
      );

      await tester.enterText(passwordField, '');
      await tester.pumpAndSettle();

      // Mark as touched to trigger validation display
      formGroup.control('password').markAsTouched();
      await tester.pumpAndSettle();

      expect(find.text('Password is required'), findsOneWidget);
    });

    testWidgets('should call onSubmit when password field is submitted',
        (tester) async {
      await tester.pumpWidget(createLoginForm());

      // Fill in valid data
      final emailField = find.byWidgetPredicate(
        (widget) =>
            widget is ReactiveTextField<String> &&
            widget.formControlName == 'email',
      );
      final passwordField = find.byWidgetPredicate(
        (widget) =>
            widget is ReactiveTextField<String> &&
            widget.formControlName == 'password',
      );

      await tester.enterText(emailField, 'test@example.com');
      await tester.enterText(passwordField, 'password123');
      await tester.pumpAndSettle();

      // Submit the password field
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      expect(onSubmitCalled, isTrue);
    });

    testWidgets('should have proper keyboard types and input actions',
        (tester) async {
      await tester.pumpWidget(createLoginForm());

      final emailField = tester.widget<ReactiveTextField<String>>(
        find.byWidgetPredicate(
          (widget) =>
              widget is ReactiveTextField<String> &&
              widget.formControlName == 'email',
        ),
      );

      final passwordField = tester.widget<ReactiveTextField<String>>(
        find.byWidgetPredicate(
          (widget) =>
              widget is ReactiveTextField<String> &&
              widget.formControlName == 'password',
        ),
      );

      expect(emailField.keyboardType, equals(TextInputType.emailAddress));
      expect(emailField.textInputAction, equals(TextInputAction.next));
      expect(passwordField.keyboardType, equals(TextInputType.text));
      expect(passwordField.textInputAction, equals(TextInputAction.done));
    });

    testWidgets('should have proper spacing between fields', (tester) async {
      await tester.pumpWidget(createLoginForm());

      final sizedBoxes = find.byType(SizedBox);
      expect(sizedBoxes,
          findsAtLeastNWidgets(3)); // At least 3 SizedBox widgets for spacing
    });

    testWidgets('should be wrapped in ReactiveForm', (tester) async {
      await tester.pumpWidget(createLoginForm());

      expect(find.byType(ReactiveForm), findsOneWidget);
    });
  });
}
