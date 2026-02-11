// import 'dart:async';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import 'app.dart';
// import 'core/config/app_config.dart';
// import 'core/config/environment_resolver.dart' as env;
// import 'core/di/injection.dart';
// import 'core/services/error_boundary_service.dart';
// import 'features/work_orders/data/services/background_sync_service.dart';
//
// /// Main entry point for the FSM Flutter app
// /// Simplified initialization with only critical components
// void main() {
//   runZonedGuarded(
//     () async {
//       // Initialize Flutter bindings
//       WidgetsFlutterBinding.ensureInitialized();
//
//       // Set device orientations
//       await SystemChrome.setPreferredOrientations([
//         DeviceOrientation.portraitUp,
//         DeviceOrientation.portraitDown,
//       ]);
//
//       // Initialize environment and configuration
//       env.Environment.initialize();
//       AppConfig.setEnvironment(env.Environment.current);
//
//       // Initialize dependency injection
//       // All @preResolve dependencies (HiveService, AppRouter) are initialized here
//       await configureDependencies(env.Environment.name);
//
//       // Initialize error boundary service
//       getIt<ErrorBoundaryService>().initialize();
//       // Initialize dependency injection
//       await configureDependencies(env.Environment.name);
//
// // Initialize offline sync background service
//       final dio = getIt<Dio>();
//       await OfflineSyncService.instance.init(dio);
//
//       // Run the app
//       runApp(const MyApp());
//     },
//     (error, stackTrace) {
//       // Handle uncaught errors
//       debugPrint('Uncaught error: $error');
//
//       // Report to error service if available
//       try {
//         getIt<ErrorBoundaryService>().reportError(
//           error,
//           stackTrace,
//           context: 'Uncaught zone error',
//         );
//       } catch (_) {
//         // Error service not available
//       }
//     },
//   );
// }
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'core/config/app_config.dart';
import 'core/config/environment_resolver.dart' as env;
import 'core/di/injection.dart';
import 'core/services/error_boundary_service.dart';
import 'features/work_orders/data/services/background_sync_service.dart';
import 'features/work_orders/data/services/local_user_store.dart';

/// Main entry point for the FSM Flutter app
void main() {
  runZonedGuarded(
    () async {
      // Mandatory Flutter bindings init
      WidgetsFlutterBinding.ensureInitialized();

      // Lock orientation to portrait
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      // Resolve environment + app config
      env.Environment.initialize();
      AppConfig.setEnvironment(env.Environment.current);

      // Configure DI ONCE (includes offline sync init)
      await configureDependencies(env.Environment.name);

      // Initialize error boundary service
      getIt<ErrorBoundaryService>().initialize();
      // Initialize offline sync background service
      final dio = getIt<Dio>();
      final userStore = getIt<LocalUserStore>();
      await OfflineSyncService.instance.init(dio, userStore);

      // Start app
      runApp(const MyApp());
    },
    (error, stackTrace) {
      // Fallback error handling
      debugPrint('Uncaught error: $error');

      try {
        getIt<ErrorBoundaryService>().reportError(
          error,
          stackTrace,
          context: 'Uncaught zone error',
        );
      } catch (_) {
        // Error service not available – ignore
      }
    },
  );
}
