# Production-Ready Flutter App Architecture Setup

## Complete Guide: BLoC + Auto Route + Injectable + Error Handling

This guide documents production-ready patterns for initializing and structuring a Flutter application using best practices from the FSM app and industry-standard libraries.

---

## Table of Contents

1. [App Initialization Flow](#app-initialization-flow)
2. [Dependency Injection Setup](#dependency-injection-setup)
3. [Router Configuration](#router-configuration)
4. [BLoC Architecture](#bloc-architecture)
5. [Global Error Handling](#global-error-handling)
6. [Screen Util & Responsive Design](#screen-util--responsive-design)
7. [Production App Structure](#production-app-structure)

---

## 1. App Initialization Flow

### main.dart - Production Pattern

```dart
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:path_provider/path_provider.dart';

import 'core/di/injection.dart';
import 'core/blocs/app_bloc_observer.dart';
import 'core/error/error_boundary.dart';
import 'app.dart';

Future<void> main() async {
  // 1. Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Initialize error handling FIRST
  await ErrorBoundary.initialize();

  // 3. Run app in error zone
  runZonedGuarded(
    () async {
      // 4. Initialize local storage (Hive)
      if (!kIsWeb) {
        final appDocumentDir = await getApplicationDocumentsDirectory();
        Hive.init(appDocumentDir.path);
      } else {
        Hive.init(''); // Web storage
      }

      // 5. Setup BLoC observer for logging/debugging
      Bloc.observer = AppBlocObserver();

      // 6. Initialize dependency injection
      await configureDependencies();

      // 7. Run the app
      runApp(const App());
    },
    (error, stack) {
      // Global error handler for uncaught errors
      ErrorBoundary.recordError(error, stack, fatal: true);
    },
  );
}
```

### Key Principles

1. **Initialize in Order**: Binding → Error Handling → Storage → DI → App
2. **Use runZonedGuarded**: Catch all uncaught errors
3. **Await Async Operations**: Ensure services are ready before running app
4. **Platform-Specific Init**: Handle web vs mobile differences

---

## 2. Dependency Injection Setup

### Injectable Configuration

#### injection.dart

```dart
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async {
  // Initialize with environment
  await getIt.init(environment: Environment.prod);
  
  // Pre-resolve async dependencies
  await getIt.allReady();
}
```

#### Environment-Based Registration

```dart
// Development environment
@dev
@injectable
class DevApiClient implements ApiClient {
  @override
  String get baseUrl => 'https://dev-api.example.com';
}

// Production environment
@prod
@injectable
class ProdApiClient implements ApiClient {
  @override
  String get baseUrl => 'https://api.example.com';
}
```

#### Module Configuration

```dart
@module
abstract class AppModule {
  // Pre-resolve async dependencies
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  // Provide third-party dependencies
  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) => Dio(
    BaseOptions(
      baseUrl: url,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  // Named dependencies
  @Named('BaseUrl')
  String get baseUrl => AppConfig.baseUrl;

  // Dispose logic
  @Singleton(dispose: disposeDio)
  Dio get httpClient => Dio();
}

// Dispose function
void disposeDio(Dio dio) {
  dio.close();
}
```

#### Router as Singleton

```dart
@AutoRouterConfig()
@preResolve
@singleton
class AppRouter extends RootStackRouter {
  final AuthGuard authGuard;

  AppRouter._(this.authGuard);

  @FactoryMethod()
  static Future<AppRouter> create(AuthGuard authGuard) async {
    final router = AppRouter._(authGuard);
    // Pre-warm router if needed
    return router;
  }

  @override
  List<AutoRoute> get routes => [
    // Routes here
  ];
}
```

---

## 3. Router Configuration

### Production Router Setup

```dart
@AutoRouterConfig(
  replaceInRouteName: 'Page|Screen,Route',
)
@preResolve
@singleton
class AppRouter extends RootStackRouter {
  final AuthGuard authGuard;

  AppRouter._(this.authGuard);

  @FactoryMethod()
  static Future<AppRouter> create(AuthGuard authGuard) async {
    return AppRouter._(authGuard);
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalNavigatorKey;

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    // Splash & Auth
    AutoRoute(
      page: SplashRoute.page,
      path: '/',
      initial: true,
    ),
    AutoRoute(
      page: LoginRoute.page,
      path: '/login',
    ),

    // Main App (Protected)
    AutoRoute(
      page: MainNavigationRoute.page,
      path: '/app',
      guards: [authGuard],
      children: [
        AutoRoute(
          page: DashboardRoute.page,
          path: 'dashboard', // NO leading slash for children
          initial: true,
        ),
        // More child routes...
      ],
    ),

    // Deep links
    AutoRoute(
      page: WorkOrderDetailsRoute.page,
      path: '/work-orders/:workOrderId',
      guards: [authGuard],
    ),

    // Fallback
    RedirectRoute(
      path: '*',
      redirectTo: '/',
    ),
  ];
}
```

### Auth Guard Implementation

```dart
@injectable
class AuthGuard extends AutoRouteGuard {
  final AuthBloc _authBloc;

  AuthGuard(this._authBloc);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final isAuthenticated = _authBloc.state is AuthAuthenticated;

    if (isAuthenticated || 
        resolver.routeName == LoginRoute.name ||
        resolver.routeName == SplashRoute.name) {
      resolver.next();
    } else {
      resolver.redirectUntil(
        const LoginRoute(),
        (route) => route.name == LoginRoute.name,
      );
    }
  }
}
```

---

## 4. BLoC Architecture

### App-Level BLoC Observer

```dart
class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    debugPrint('🟢 BLoC Created: ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      debugPrint('🔄 BLoC Change: ${bloc.runtimeType}');
      debugPrint('Current: ${change.currentState}');
      debugPrint('Next: ${change.nextState}');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    debugPrint('❌ BLoC Error: ${bloc.runtimeType}');
    debugPrint('Error: $error');
    
    // Report to error tracking service
    ErrorBoundary.recordError(error, stackTrace, context: {
      'bloc': bloc.runtimeType.toString(),
    });
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    debugPrint('🔴 BLoC Closed: ${bloc.runtimeType}');
  }
}
```

### BLoC Registration Pattern

```dart
// Injectable registration
@injectable
class WorkOrdersListBloc extends Bloc<WorkOrdersListEvent, WorkOrdersListState> {
  final GetWorkOrdersUseCase _getWorkOrders;

  WorkOrdersListBloc(this._getWorkOrders) : super(const WorkOrdersListInitial()) {
    on<LoadWorkOrders>(_onLoadWorkOrders);
  }

  Future<void> _onLoadWorkOrders(
    LoadWorkOrders event,
    Emitter<WorkOrdersListState> emit,
  ) async {
    emit(const WorkOrdersListLoading());
    
    try {
      final result = await _getWorkOrders();
      
      result.fold(
        (failure) => emit(WorkOrdersListError(failure.message)),
        (workOrders) => emit(WorkOrdersListLoaded(workOrders)),
      );
    } catch (e, stackTrace) {
      // Error is automatically caught by BlocObserver.onError
      addError(e, stackTrace);
      emit(WorkOrdersListError('An unexpected error occurred'));
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    // BLoC-specific error handling
    debugPrint('WorkOrdersListBloc Error: $error');
  }
}
```

### Providing BLoCs in App

```dart
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            // App-level BLoCs (singleton-like)
            BlocProvider(
              create: (_) => getIt<AuthBloc>()..add(const AuthCheckStatus()),
            ),
            BlocProvider(
              create: (_) => getIt<ThemeBloc>()..add(const LoadTheme()),
            ),
          ],
          child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return MaterialApp.router(
                title: 'FSM App',
                theme: state.themeData,
                routerConfig: getIt<AppRouter>().config(
                  reevaluateListenable: context.read<AuthBloc>(),
                ),
                builder: (context, child) {
                  return ErrorBoundaryWidget(child: child!);
                },
              );
            },
          ),
        );
      },
    );
  }
}
```

---

## 5. Global Error Handling

### Error Boundary Implementation

```dart
class ErrorBoundary {
  static late final ErrorHandler _errorHandler;

  static Future<void> initialize() async {
    _errorHandler = ErrorHandler();
    
    // Flutter framework errors
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      recordError(
        details.exception,
        details.stack ?? StackTrace.current,
        context: {'flutter_error': details.context.toString()},
      );
    };

    // Platform dispatcher errors
    PlatformDispatcher.instance.onError = (error, stack) {
      recordError(error, stack, fatal: true);
      return true;
    };
  }

  static void recordError(
    Object error,
    StackTrace stackTrace, {
    Map<String, dynamic>? context,
    bool fatal = false,
  }) {
    _errorHandler.logError(error, stackTrace, context: context);
    
    if (kDebugMode) {
      debugPrint('═══ ERROR ${fatal ? '(FATAL)' : ''} ═══');
      debugPrint('$error');
      debugPrint('Stack trace:');
      debugPrint('$stackTrace');
      if (context != null) {
        debugPrint('Context: $context');
      }
      debugPrint('═══════════════════════════');
    }

    // Send to crash analytics (Firebase Crashlytics, Sentry, etc.)
    if (!kDebugMode) {
      // FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: fatal);
    }
  }
}

/// Error Boundary Widget for catching widget errors
class ErrorBoundaryWidget extends StatefulWidget {
  final Widget child;

  const ErrorBoundaryWidget({super.key, required this.child});

  @override
  State<ErrorBoundaryWidget> createState() => _ErrorBoundaryWidgetState();
}

class _ErrorBoundaryWidgetState extends State<ErrorBoundaryWidget> {
  Object? _error;

  @override
  void initState() {
    super.initState();
    FlutterError.onError = (details) {
      if (mounted) {
        setState(() {
          _error = details.exception;
        });
      }
      ErrorBoundary.recordError(details.exception, details.stack ?? StackTrace.current);
    };
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return Material(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.red),
                const SizedBox(height: 16),
                const Text(
                  'Something went wrong',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  kDebugMode ? _error.toString() : 'Please restart the app',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _error = null;
                    });
                  },
                  child: const Text('Try Again'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return widget.child;
  }
}
```

---

## 6. Screen Util & Responsive Design

### Setup in main App

```dart
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // Design size from Figma/design specs
      designSize: const Size(375, 812),
      
      // Adapt text size based on system settings
      minTextAdapt: true,
      
      // Support for split-screen mode
      splitScreenMode: true,
      
      // Use size (better performance)
      useInheritedMediaQuery: true,
      
      builder: (context, child) {
        return MaterialApp.router(
          // App configuration
          routerConfig: getIt<AppRouter>().config(),
          
          // Theme with responsive design tokens
          theme: ThemeData(
            textTheme: TextTheme(
              headlineLarge: TextStyle(fontSize: 32.sp),
              bodyLarge: TextStyle(fontSize: 16.sp),
            ),
          ),
        );
      },
    );
  }
}
```

### Usage in Widgets

```dart
class ResponsiveCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,           // Responsive width
      height: 200.h,          // Responsive height
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 12.h,
      ),
      child: Column(
        children: [
          Text(
            'Responsive Text',
            style: TextStyle(fontSize: 18.sp),
          ),
          SizedBox(height: 16.h),
          // More widgets...
        ],
      ),
    );
  }
}
```

---

## 7. Production App Structure

### Complete App.dart Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/injection.dart';
import 'core/router/app_router.dart';
import 'core/error/error_boundary.dart';
import 'features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'features/theme/presentation/blocs/theme/theme_bloc.dart';

/// Global navigator key for context-free navigation
final GlobalKey<NavigatorState> GlobalNavigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            // Auth BLoC - Required for AuthGuard
            BlocProvider(
              create: (_) => getIt<AuthBloc>()..add(const AuthCheckStatus()),
            ),
            
            // Theme BLoC
            BlocProvider(
              create: (_) => getIt<ThemeBloc>()..add(const LoadTheme()),
            ),
            
            // Add other app-level BLoCs here
          ],
          child: const _AppView(),
        );
      },
    );
  }
}

class _AppView extends StatelessWidget {
  const _AppView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return MaterialApp.router(
          title: 'FSM App',
          debugShowCheckedModeBanner: false,
          
          // Theme
          theme: themeState.lightTheme,
          darkTheme: themeState.darkTheme,
          themeMode: themeState.themeMode,
          
          // Router
          routerConfig: getIt<AppRouter>().config(
            // Re-evaluate guards when auth changes
            reevaluateListenable: context.read<AuthBloc>(),
          ),
          
          // Error Boundary & Builder
          builder: (context, child) {
            // Set text scale factor constraints
            final mediaQuery = MediaQuery.of(context);
            final constrained = mediaQuery.copyWith(
              textScaler: TextScaler.linear(
                mediaQuery.textScaleFactor.clamp(0.8, 1.3),
              ),
            );
            
            return MediaQuery(
              data: constrained,
              child: ErrorBoundaryWidget(
                child: child ?? const SizedBox.shrink(),
              ),
            );
          },
          
          // Locale
          localizationsDelegates: const [
            // Add your localizations here
          ],
          supportedLocales: const [
            Locale('en', 'US'),
          ],
        );
      },
    );
  }
}
```

---

## Best Practices Summary

### ✅ DO

1. **Initialize services in order**: Binding → Error → Storage → DI → App
2. **Use runZonedGuarded**: Catch all uncaught errors
3. **Await async DI**: Use `@preResolve` and `await getIt.allReady()`
4. **Use BlocObserver**: Log all BLoC events globally
5. **Implement ErrorBoundary**: Catch and report all errors
6. **Use ScreenUtil**: Make UI responsive across all devices
7. **Keep router clean**: Use guards, redirects, and proper child paths
8. **Dispose properly**: Use `@disposeMethod` or `dispose` parameter
9. **Use environments**: Different configs for dev/staging/prod
10. **Pre-warm critical services**: Load heavy services during splash

### ❌ DON'T

1. **Don't skip error handling**: Always wrap async operations
2. **Don't use GetIt directly in widgets**: Use BlocProvider/RepositoryProvider
3. **Don't forget to close BLoCs**: Always close when disposing
4. **Don't use leading slashes on child routes**: Auto Route requirement
5. **Don't register same type twice**: Use `instanceName` if needed
6. **Don't block main thread**: Move heavy init to isolates
7. **Don't ignore allReady**: Wait for async singletons
8. **Don't hardcode sizes**: Use ScreenUtil for responsive design
9. **Don't create duplicate routes**: Each route name must be unique
10. **Don't forget platform differences**: Handle web vs mobile

---

## Performance Optimization

### 1. Lazy Loading

```dart
// Lazy singleton - created only when first accessed
@lazySingleton
class HeavyService {
  HeavyService() {
    _initialize();
  }

  void _initialize() {
    // Heavy initialization
  }
}
```

### 2. Async Pre-Resolution

```dart
@module
abstract class AppModule {
  @preResolve
  Future<Database> get database async {
    final db = await openDatabase('app.db');
    await db.execute('CREATE TABLE IF NOT EXISTS...');
    return db;
  }
}
```

### 3. Scoped Dependencies

```dart
// Only loaded in specific feature scope
@Injectable(scope: 'feature_name')
class FeatureService {}

// Initialize scope when needed
await getIt.initFeatureNameScope();
```

---

## Monitoring & Debugging

### Development Tools

```dart
if (kDebugMode) {
  // Alice HTTP Inspector
  getIt.registerSingleton(Alice(
    showNotification: true,
    showInspectorOnShake: true,
  ));
  
  // Performance overlay
  MaterialApp.router(
    showPerformanceOverlay: true,
  );
}
```

### Production Analytics

```dart
// Firebase Analytics
@module
abstract class AnalyticsModule {
  @lazySingleton
  FirebaseAnalytics get analytics => FirebaseAnalytics.instance;
  
  @lazySingleton
  FirebaseAnalyticsObserver get observer => 
    FirebaseAnalyticsObserver(analytics: getIt<FirebaseAnalytics>());
}
```

---

## Testing Setup

### Mock Dependencies

```dart
@injectable
@test
class MockApiClient implements ApiClient {
  @override
  Future<Response> get(String path) async {
    return Response(data: {'mock': 'data'});
  }
}

// In tests
void main() {
  setUp(() async {
    await configureDependencies(environment: Environment.test);
  });
  
  test('should work with mock', () async {
    final service = getIt<ApiService>();
    // Test with mocked ApiClient
  });
}
```

---

## Conclusion

This architecture provides:

- ✅ **Production-ready initialization**
- ✅ **Comprehensive error handling**
- ✅ **Type-safe routing**
- ✅ **Clean dependency injection**
- ✅ **Responsive UI**
- ✅ **Testable code**
- ✅ **Performant startup**

Follow these patterns for a robust, scalable Flutter application!
