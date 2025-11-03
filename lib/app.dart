import 'package:alice/alice.dart';
import 'package:alice/model/alice_configuration.dart';
import 'package:alice_dio/alice_dio_adapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/blocs/connectivity/connectivity_bloc.dart';
import 'core/blocs/connectivity/connectivity_event.dart';
import 'core/blocs/sync/sync_bloc.dart';
import 'core/blocs/sync/sync_event.dart';
import 'core/config/app_config.dart';
import 'core/di/injection.dart';
import 'core/network/dio_client.dart';
import 'core/router/app_router.dart';
import 'core/router/observers/app_route_observer.dart';
import 'core/services/error_boundary_service.dart';
import 'core/theme/theme.dart';
import 'core/widgets/error_boundary/error_boundary_widget.dart';
import 'features/auth/presentation/blocs/auth/auth_bloc.dart';

GlobalKey<NavigatorState> GlobalNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // late final PerformanceService _performanceService;
  late final ErrorBoundaryService _errorBoundaryService;
  Alice? _alice;
  AliceDioAdapter? _aliceDioAdapter;

  @override
  void initState() {
    super.initState();
    // _performanceService = getIt<PerformanceService>();
    _errorBoundaryService = getIt<ErrorBoundaryService>();

    // Initialize Alice HTTP inspector for debug builds
    if (AppConfig.isDebug) {
      try {
        // Configure Alice HTTP Inspector
        _alice = Alice(
            configuration: AliceConfiguration(
                showNotification: true, navigatorKey: GlobalNavigatorKey));
        _aliceDioAdapter = AliceDioAdapter();

        // Configure Alice with the Dio adapter
        _alice!.addAdapter(_aliceDioAdapter!);

        // Add Alice Dio interceptor to Dio client
        final dio = getIt<DioClient>().dio;
        dio.interceptors.add(_aliceDioAdapter!);

        debugPrint('Alice HTTP Inspector initialized successfully');
        debugPrint(
            'Shake device or tap notification to open network inspector');
      } catch (e) {
        debugPrint('Failed to initialize Alice: $e');
      }
    }

    // Initialize error boundary
    _errorBoundaryService.initialize();

    // Start monitoring frame performance
    // _performanceService.monitorFramePerformance();

    // Start app startup timer
    // _performanceService.startTimer('app_startup');
  }

  /// Show Alice inspector manually (for debugging purposes)
  void _showAliceInspector() {
    if (_alice != null && AppConfig.isDebug) {
      _alice!.showInspector();
    }
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
      child: ScreenUtilInit(
        // Design size updated to Size(390, 844) per design system requirements
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        ensureScreenSize: true,
        builder: (context, child) {
          // Get BLoCs directly since they're now singletons
          final authBloc = getIt<AuthBloc>();
          final connectivityBloc = getIt<ConnectivityBloc>();
          final syncBloc = getIt<SyncBloc>();

          // Start connectivity and sync BLoCs
          connectivityBloc.add(const ConnectivityEvent.started());
          syncBloc.add(const SyncEvent.started());

          // End startup timer
          // _performanceService.endTimer('app_startup');

          return MultiBlocProvider(
            providers: [
              BlocProvider.value(value: authBloc),
              BlocProvider.value(value: connectivityBloc),
              BlocProvider.value(value: syncBloc),
            ],
            child: MaterialApp.router(
              title: AppConfig.appName,
              debugShowCheckedModeBanner: AppConfig.isDebug,
              routerConfig: appRouter.config(
                // Enable prefix matching for deep linking support
                // This allows Auto Route to build proper navigation stacks from deep links
                includePrefixMatches: true,
                // Navigation observers for tracking and debugging
                // Always return fresh instances per Auto Route best practices
                navigatorObservers: () => [
                  getIt<AppRouteObserver>(),
                ],
              ),
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: ThemeMode.light,
              builder: (context, child) {
                // Wrap entire app in error boundary and performance monitoring
                return ErrorBoundaryWidget(
                  onError: (error, stackTrace) {
                    _errorBoundaryService.reportError(
                      error,
                      stackTrace,
                      context: 'App navigation',
                    );
                  },
                  child: Stack(
                    children: [
                      child ?? const SizedBox.shrink(),
                      // Add Alice inspector button for debug builds without tooltip
                      if (AppConfig.isDebug && _alice != null)
                        Positioned(
                          bottom: 100.h,
                          right: 16.w,
                          child: Material(
                            borderRadius: BorderRadius.circular(28.r),
                            elevation: 6,
                            color: Colors.orange.withAlpha(200),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(28.r),
                              onTap: _showAliceInspector,
                              child: Container(
                                width: 56.w,
                                height: 56.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28.r),
                                ),
                                child: Icon(
                                  Icons.network_check,
                                  color: Colors.white,
                                  size: 24.w,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
