import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

/// Injectable DI Configuration with Advanced Features:
///
/// **Key Improvements:**
/// 1. **@preResolve** - Used for async dependencies (HiveService, AppRouter)
///    - Ensures dependencies are fully initialized before app starts
///    - Prevents race conditions and async access issues
///
/// 2. **@module** - Organizes third-party and complex dependencies
///    - NetworkModule: Dio configuration with interceptors
///    - ConnectivityModule: Connectivity+ instance
///    - API Modules: Retrofit clients for each feature
///    - PermissionModule: Permission repository setup
///
/// 3. **@FactoryMethod** - Custom initialization logic
///    - HiveService.create(): Async Hive initialization
///    - AppRouter.create(): Pre-warm router configuration
///
/// 4. **@lazySingleton** - Lazy initialization for API clients
///    - API clients created only when first accessed
///    - Reduces startup time and memory usage
///
/// 5. **@singleton** - Eager singletons for critical services
///    - HiveService, AuthBloc, ConnectivityBloc, SyncBloc
///    - Services needed immediately at startup
///
/// **Dependency Resolution Order:**
/// 1. Sync singletons (LoggingService, ErrorBoundaryService)
/// 2. Async pre-resolved (HiveService with @preResolve)
/// 3. Modules instantiated (NetworkModule, AuthModule, etc.)
/// 4. Factories registered (repositories, use cases, blocs)
/// 5. Async pre-resolved (AppRouter with @preResolve)
///
/// **Best Practices Applied:**
/// - All async dependencies use @preResolve + @FactoryMethod
/// - API clients use @lazySingleton in @module
/// - Repository interfaces use Injectable(as: Interface)
/// - BLoCs use @singleton for app-wide or @injectable for scoped
@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies(String environment) async {
  await getIt.init(environment: environment);
}

// Environment constants
abstract class Environment {
  static const String dev = 'dev';
  static const String staging = 'staging';
  static const String prod = 'prod';
}
