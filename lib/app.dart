import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/config/app_config.dart';
import 'core/di/injection.dart';
import 'core/router/app_router.dart';
import 'core/services/error_boundary_service.dart';
import 'core/services/performance_service.dart';
import 'core/widgets/error_boundary_widget.dart';
import 'core/widgets/optimized_splash_screen.dart';
import 'core/widgets/performance_monitor_widget.dart';
import 'features/auth/presentation/blocs/auth/auth_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final PerformanceService _performanceService;
  late final ErrorBoundaryService _errorBoundaryService;

  @override
  void initState() {
    super.initState();
    _performanceService = getIt<PerformanceService>();
    _errorBoundaryService = getIt<ErrorBoundaryService>();

    // Initialize error boundary
    _errorBoundaryService.initialize();

    // Start monitoring frame performance
    _performanceService.monitorFramePerformance();

    // Start app startup timer
    _performanceService.startTimer('app_startup');
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
          _performanceService.endTimer('app_startup');

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
                  theme: _buildAppTheme(),
                  builder: (context, child) {
                    // Wrap entire app in error boundary and performance monitoring
                    return PerformanceMonitorWidget(
                      child: ErrorBoundaryWidget(
                        onError: (error, stackTrace) {
                          _errorBoundaryService.reportError(
                            error,
                            stackTrace,
                            context: 'App navigation',
                          );
                        },
                        child: child ?? const SizedBox.shrink(),
                      ),
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

  ThemeData _buildAppTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        brightness: Brightness.light,
      ),
      useMaterial3: true,
      // Responsive text theme
      textTheme: TextTheme(
        displayLarge: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
        displaySmall: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        headlineLarge: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
        headlineMedium: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
        headlineSmall: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        titleLarge: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        titleMedium: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        titleSmall: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
        bodyLarge: TextStyle(fontSize: 16.sp),
        bodyMedium: TextStyle(fontSize: 14.sp),
        bodySmall: TextStyle(fontSize: 12.sp),
        labelLarge: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        labelMedium: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
        labelSmall: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
      ),
      // Enhanced button themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 48.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          elevation: 2,
        ),
      ),
      // Enhanced card theme
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      ),
      // Enhanced app bar theme
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }
}
