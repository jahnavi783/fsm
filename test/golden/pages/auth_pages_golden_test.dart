import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fsm/features/auth/presentation/pages/login_page.dart';
import 'package:fsm/features/auth/presentation/pages/splash_page.dart';
import 'package:fsm/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:fsm/features/auth/domain/entities/user_entity.dart';

import '../golden_test_config.dart';

class MockAuthBloc extends Mock implements AuthBloc {}

void main() {
  group('Auth Pages Golden Tests', () {
    late MockAuthBloc mockAuthBloc;

    setUpAll(() async {
      await GoldenTestConfig.initialize();
    });

    setUp(() {
      mockAuthBloc = MockAuthBloc();
    });

    testGoldens('LoginPage golden test', (tester) async {
      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
      when(() => mockAuthBloc.stream).thenAnswer((_) => const Stream.empty());

      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: GoldenTestConfig.testDevices)
        ..addScenario(
          widget: BlocProvider<AuthBloc>.value(
            value: mockAuthBloc,
            child: GoldenTestConfig.createNavigationTestWrapper(
              child: const LoginPage(),
            ),
          ),
          name: 'initial_state',
        );

      // Test loading state
      when(() => mockAuthBloc.state).thenReturn(const AuthState.loading());
      builder.addScenario(
        widget: BlocProvider<AuthBloc>.value(
          value: mockAuthBloc,
          child: GoldenTestConfig.createNavigationTestWrapper(
            child: const LoginPage(),
          ),
        ),
        name: 'loading_state',
      );

      // Test error state
      when(() => mockAuthBloc.state).thenReturn(
        const AuthState.error('Invalid credentials'),
      );
      builder.addScenario(
        widget: BlocProvider<AuthBloc>.value(
          value: mockAuthBloc,
          child: GoldenTestConfig.createNavigationTestWrapper(
            child: const LoginPage(),
          ),
        ),
        name: 'error_state',
      );

      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'login_page');
    });

    testGoldens('SplashPage golden test', (tester) async {
      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
      when(() => mockAuthBloc.stream).thenAnswer((_) => const Stream.empty());

      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: GoldenTestConfig.testDevices)
        ..addScenario(
          widget: BlocProvider<AuthBloc>.value(
            value: mockAuthBloc,
            child: GoldenTestConfig.createNavigationTestWrapper(
              child: const SplashPage(),
            ),
          ),
          name: 'initial_loading',
        );

      // Test authenticated state
      when(() => mockAuthBloc.state).thenReturn(
        const AuthState.authenticated(
          UserEntity(
            id: 1,
            email: 'test@example.com',
            firstName: 'John',
            lastName: 'Doe',
            role: 'technician',
            permissions: ['work_orders', 'documents'],
          ),
        ),
      );
      builder.addScenario(
        widget: BlocProvider<AuthBloc>.value(
          value: mockAuthBloc,
          child: GoldenTestConfig.createNavigationTestWrapper(
            child: const SplashPage(),
          ),
        ),
        name: 'authenticated_state',
      );

      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'splash_page');
    });
  });
}
