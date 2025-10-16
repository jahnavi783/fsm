import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/config/app_config.dart';
import 'core/di/injection.dart';
import 'core/router/app_router.dart';
import 'core/services/alice_service.dart';
import 'core/services/error_boundary_service.dart';
import 'core/theme/theme.dart';
import 'core/widgets/error_boundary_widget.dart';
import 'core/widgets/optimized_splash_screen.dart';
import 'features/auth/presentation/blocs/auth/auth_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // late final PerformanceService _performanceService;
  late final ErrorBoundaryService _errorBoundaryService;

  @override
  void initState() {
    super.initState();
    // _performanceService = getIt<PerformanceService>();
    _errorBoundaryService = getIt<ErrorBoundaryService>();

    // Initialize error boundary
    _errorBoundaryService.initialize();

    // Start monitoring frame performance
    // _performanceService.monitorFramePerformance();

    // Start app startup timer
    // _performanceService.startTimer('app_startup');
  }

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();

    return ErrorBoundaryWidget(
      onError: (error, stackTrace) {
        _errorBoundaryService.reportError(
          error,
          stackTrace,
          context: 'MyApp root widget',
        );
      },
      child: FutureBuilder<AuthBloc>(
        future: getIt.getAsync<AuthBloc>(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            // Enhanced loading screen with branding
            return MaterialApp(
              title: AppConfig.appName,
              debugShowCheckedModeBanner: AppConfig.isDebug,
              home: const OptimizedSplashScreen(
                message: 'Initializing app...',
              ),
            );
          }

          if (snapshot.hasError) {
            return MaterialApp(
              title: AppConfig.appName,
              debugShowCheckedModeBanner: AppConfig.isDebug,
              home: Scaffold(
                body: DefaultErrorWidget(
                  error: snapshot.error!,
                  title: 'App Initialization Error',
                  message:
                      'Failed to initialize the application. Please restart the app.',
                  onRetry: () {
                    // Trigger app restart
                    setState(() {});
                  },
                ),
              ),
            );
          }

          final authBloc = snapshot.data!;

          // End startup timer
          // _performanceService.endTimer('app_startup');

          return BlocProvider.value(
            value: authBloc,
            child: ScreenUtilInit(
              // Design size from Figma/design specs (iPhone 11 Pro dimensions)
              designSize: const Size(375, 812),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return MaterialApp.router(
                  title: AppConfig.appName,
                  debugShowCheckedModeBanner: AppConfig.isDebug,
                  routerConfig: appRouter.config(),
                  theme: AppTheme.lightTheme,
                  darkTheme: AppTheme.darkTheme,
                  themeMode: ThemeMode.light,
                  builder: (context, child) {
                    // Initialize Alice for debug builds (works with auto_route)
                    if (AppConfig.isDebug) {
                      try {
                        final aliceService = getIt<AliceService>();
                        // Alice will overlay on the current navigator automatically
                        debugPrint('Alice service initialized and ready for HTTP inspection');
                      } catch (e) {
                        debugPrint('Alice service not available: $e');
                      }
                    }

                    // Wrap entire app in error boundary and performance monitoring
                    return ErrorBoundaryWidget(
                      onError: (error, stackTrace) {
                        _errorBoundaryService.reportError(
                          error,
                          stackTrace,
                          context: 'App navigation',
                        );
                      },
                      child: child ?? const SizedBox.shrink(),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
