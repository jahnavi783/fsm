import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:fsm/features/auth/presentation/widgets/gradient_elevated_button.dart';
import 'package:fsm/features/auth/presentation/widgets/loading_circles.dart';
import 'package:fsm/features/auth/presentation/widgets/login_form.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../golden_test_config.dart';

void main() {
  group('Auth Widgets Golden Tests', () {
    setUpAll(() async {
      await GoldenTestConfig.initialize();
    });

    testGoldens('GradientElevatedButton golden test', (tester) async {
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: GoldenTestConfig.phoneDevices)
        ..addScenario(
          widget: GoldenTestConfig.createTestWrapper(
            child: const Center(
              child: GradientElevatedButton(
                onPressed: null,
                text: 'Login',
              ),
            ),
          ),
          name: 'disabled_state',
        )
        ..addScenario(
          widget: GoldenTestConfig.createTestWrapper(
            child: Center(
              child: GradientElevatedButton(
                onPressed: () {},
                text: 'Login',
              ),
            ),
          ),
          name: 'enabled_state',
        )
        ..addScenario(
          widget: GoldenTestConfig.createTestWrapper(
            child: Center(
              child: GradientElevatedButton(
                onPressed: () {},
                text: 'Login',
                isLoading: true,
              ),
            ),
          ),
          name: 'loading_state',
        );

      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'gradient_elevated_button');
    });

    testGoldens('LoadingCircles golden test', (tester) async {
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: GoldenTestConfig.phoneDevices)
        ..addScenario(
          widget: GoldenTestConfig.createTestWrapper(
            child: const Center(
              child: LoadingCircles(),
            ),
          ),
          name: 'default_loading',
        )
        ..addScenario(
          widget: GoldenTestConfig.createTestWrapper(
            child: const Center(
              child: LoadingCircles(
                size: 60,
                color: Colors.blue,
              ),
            ),
          ),
          name: 'custom_size_color',
        );

      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'loading_circles');
    });

    testGoldens('LoginForm golden test', (tester) async {
      final form = FormGroup({
        'email': FormControl<String>(
          value: '',
          validators: [Validators.required, Validators.email],
        ),
        'password': FormControl<String>(
          value: '',
          validators: [Validators.required, Validators.minLength(6)],
        ),
      });

      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: GoldenTestConfig.phoneDevices)
        ..addScenario(
          widget: GoldenTestConfig.createTestWrapper(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ReactiveForm(
                formGroup: form,
                child: LoginForm(
                  formGroup: form,
                  onSubmit: () {},
                ),
              ),
            ),
          ),
          name: 'empty_form',
        );

      // Test with validation errors
      form.control('email').value = 'invalid-email';
      form.control('password').value = '123';
      form.markAllAsTouched();

      builder.addScenario(
        widget: GoldenTestConfig.createTestWrapper(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ReactiveForm(
              formGroup: form,
              child: LoginForm(
                formGroup: form,
                onSubmit: () {},
              ),
            ),
          ),
        ),
        name: 'validation_errors',
      );

      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'login_form');
    });
  });
}
