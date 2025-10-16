import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'core/config/app_config.dart';
import 'core/config/environment_resolver.dart' as env;
import 'core/di/injection.dart';
import 'core/router/app_router.dart';
import 'core/services/error_boundary_service.dart';
import 'core/storage/hive_service.dart';
import 'features/auth/presentation/blocs/auth/auth_bloc.dart';

/// Main entry point for the FSM Flutter app
/// Uses industry-standard flavor-based configuration with performance monitoring
void main() async {
  // Start app initialization timer
  final stopwatch = Stopwatch()..start();

  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Set preferred orientations for mobile devices
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initialize environment based on build flavor
  env.Environment.initialize();

  // Set app configuration
  AppConfig.setEnvironment(env.Environment.current);

  // Initialize app services with error handling
  await _initializeAppWithErrorHandling();

  // Log startup time
  stopwatch.stop();
  developer.log(
    'App initialization completed in ${stopwatch.elapsedMilliseconds}ms',
    name: 'AppStartup',
  );

  // Run the app with error zone
  runZonedGuarded(
    () => runApp(const MyApp()),
    (error, stackTrace) {
      // Handle uncaught errors
      developer.log(
        'Uncaught error: $error',
        name: 'UncaughtError',
        error: error,
        stackTrace: stackTrace,
      );

      // Report to error boundary service if available
      try {
        final errorService = getIt<ErrorBoundaryService>();
        errorService.reportError(
          error,
          stackTrace,
          context: 'Uncaught zone error',
        );
      } catch (e) {
        // Error service not available, just log
        developer.log('Failed to report error: $e', name: 'ErrorReporting');
      }
    },
  );
}

/// Initialize app services and dependencies with comprehensive error handling
Future<void> _initializeAppWithErrorHandling() async {
  try {
    await _initializeApp();
  } catch (error, stackTrace) {
    // Log initialization errors
    developer.log(
      'App initialization error: $error',
      name: 'AppInitialization',
      error: error,
      stackTrace: stackTrace,
    );

    // In development, show detailed error
    if (env.Environment.isDevelopment) {
      debugPrint('=== APP INITIALIZATION ERROR ===');
      debugPrint('Error: $error');
      debugPrint('Stack trace: $stackTrace');
      debugPrint('================================');
    }

    // Re-throw to prevent app from starting in broken state
    rethrow;
  }
}

/// Initialize app services and dependencies
Future<void> _initializeApp() async {
  // Initialize local storage first (required by other services)
  await HiveService.create();

  // Configure dependency injection with current environment
  await configureDependencies(env.Environment.name);

  // Initialize performance monitoring
  // final performanceService = getIt<PerformanceService>();
  // performanceService.measureMemory('app_initialization');

  // Initialize error boundary service
  final errorBoundaryService = getIt<ErrorBoundaryService>();
  errorBoundaryService.initialize();

  // // Initialize memory management
  // final memoryService = getIt<MemoryManagementService>();
  // memoryService.initialize();

  // Pre-warm critical services
  await _prewarmServices();

  developer.log(
    'App services initialized successfully',
    name: 'AppInitialization',
  );
}

/// Pre-warm critical services to improve startup performance
Future<void> _prewarmServices() async {
  try {
    // Pre-initialize router
    getIt<AppRouter>();

    // Pre-warm auth bloc (async)
    unawaited(getIt.getAsync<AuthBloc>());

    developer.log('Services pre-warmed', name: 'ServicePrewarm');
  } catch (e) {
    developer.log('Service pre-warm failed: $e', name: 'ServicePrewarm');
    // Don't throw - pre-warming is optional
  }
}
