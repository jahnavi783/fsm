import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'core/config/app_config.dart';
import 'core/config/environment_resolver.dart' as env;
import 'core/di/injection.dart';
import 'core/services/error_boundary_service.dart';

/// Main entry point for the FSM Flutter app
/// Simplified initialization with only critical components
void main() {
  runZonedGuarded(
    () async {
      // Initialize Flutter bindings
      WidgetsFlutterBinding.ensureInitialized();

      // Set device orientations
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      // Initialize environment and configuration
      env.Environment.initialize();
      AppConfig.setEnvironment(env.Environment.current);

      // Initialize dependency injection
      // All @preResolve dependencies (HiveService, AppRouter) are initialized here
      await configureDependencies(env.Environment.name);

      // Initialize error boundary service
      getIt<ErrorBoundaryService>().initialize();

      // Run the app
      runApp(const MyApp());
    },
    (error, stackTrace) {
      // Handle uncaught errors
      debugPrint('Uncaught error: $error');

      // Report to error service if available
      try {
        getIt<ErrorBoundaryService>().reportError(
          error,
          stackTrace,
          context: 'Uncaught zone error',
        );
      } catch (_) {
        // Error service not available
      }
    },
  );
}

