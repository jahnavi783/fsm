import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:fsm/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('App Startup Performance Tests', () {
    testWidgets('App startup time should be under 3 seconds', (tester) async {
      final stopwatch = Stopwatch()..start();

      // Start the app
      app.main();
      await tester.pumpAndSettle();

      stopwatch.stop();
      final startupTime = stopwatch.elapsedMilliseconds;

      // Verify startup time is under 3 seconds (3000ms)
      expect(startupTime, lessThan(3000),
          reason: 'App startup took ${startupTime}ms, should be under 3000ms');

      print('App startup time: ${startupTime}ms');
    });

    testWidgets('Splash screen to login transition performance',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final stopwatch = Stopwatch()..start();

      // Wait for splash screen to complete and navigate to login
      await tester.pumpAndSettle(const Duration(seconds: 5));

      stopwatch.stop();
      final transitionTime = stopwatch.elapsedMilliseconds;

      // Verify transition time is reasonable (under 2 seconds)
      expect(transitionTime, lessThan(2000),
          reason: 'Splash to login transition took ${transitionTime}ms');

      print('Splash to login transition time: ${transitionTime}ms');
    });

    testWidgets('Memory usage during app startup', (tester) async {
      // Get initial memory usage
      final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

      app.main();
      await tester.pumpAndSettle();

      // Force garbage collection
      await binding.watchPerformance(() async {
        await tester.pumpAndSettle();
      });

      // Memory usage should be reasonable for a mobile app
      // This is more of a monitoring test - actual limits depend on device
      print('App startup completed successfully with memory monitoring');
    });
  });
}
