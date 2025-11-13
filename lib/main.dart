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
// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'app.dart';
// import 'core/config/app_config.dart';
// import 'core/config/environment_resolver.dart' as env;
// import 'core/di/injection.dart';
// import 'core/services/error_boundary_service.dart';
// // 🌟 GLOBAL BLOCS
// import 'features/auth/presentation/blocs/auth/auth_bloc.dart';
// import 'features/documents/presentation/blocs/documents/documents_bloc.dart';
// // Add more as needed:
// // import 'features/work_orders/presentation/blocs/work_orders/work_orders_bloc.dart';
// // import 'core/network/network_bloc.dart';
//
// void main() {
//   runZonedGuarded(() async {
//     // Initialize Flutter bindings
//     WidgetsFlutterBinding.ensureInitialized();
//
//     // Lock orientation
//     await SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//
//     // Setup environment
//     env.Environment.initialize();
//     AppConfig.setEnvironment(env.Environment.current);
//
//     // Setup dependency injection
//     await configureDependencies(env.Environment.name);
//
//     // Init error service
//     getIt<ErrorBoundaryService>().initialize();
//
//     // 🚀 RUN THE APP WITH GLOBAL BLOCS
//     runApp(
//       MultiBlocProvider(
//         providers: [
//           // GLOBAL AUTH STATE
//           BlocProvider<AuthBloc>(
//             create: (_) => getIt<AuthBloc>(),
//           ),
//
//           // DOCUMENTS BLOC (optional but recommended)
//           BlocProvider<DocumentsBloc>(
//             create: (_) => getIt<DocumentsBloc>(),
//           ),
//
//           // 👉 Add all other global blocs here:
//           // BlocProvider<WorkOrdersBloc>(
//           //   create: (_) => getIt<WorkOrdersBloc>(),
//           // ),
//           // BlocProvider<NetworkBloc>(
//           //   create: (_) => getIt<NetworkBloc>(),
//           // ),
//         ],
//         child: const MyApp(),
//       ),
//     );
//   }, (error, stackTrace) {
//     debugPrint('Uncaught error: $error');
//
//     try {
//       getIt<ErrorBoundaryService>().reportError(
//         error,
//         stackTrace,
//         context: 'Uncaught zone error',
//       );
//     } catch (_) {}
//   });
// }
