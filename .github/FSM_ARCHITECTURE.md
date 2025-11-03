# FSM Architecture Guide

## System Overview

FSM (Field Service Management) is a Flutter mobile application built with Clean Architecture principles, featuring offline-first capabilities, real-time sync, and comprehensive field service operations management.

**Tech Stack:**
- Flutter 3.35.6 / Dart 3.9.2
- State Management: BLoC (flutter_bloc + rxdart)
- Dependency Injection: Injectable + GetIt
- Routing: AutoRoute
- Local Storage: Hive CE
- Network: Retrofit + Dio
- Design System: Material 3 + Custom FSM Theme

## Architecture Layers

### 1. Domain Layer (`lib/features/*/domain/`)
Pure business logic with zero dependencies on external frameworks.

**Structure:**
```
domain/
├── entities/          # Immutable business objects
├── repositories/      # Abstract interfaces (prefixed with `i_`)
└── usecases/         # Single-responsibility business operations
```

**Rules:**
- Entities must be immutable (use `@freezed` or final fields)
- Repository interfaces define contracts, not implementations
- Use cases should have single responsibility
- No framework dependencies (no Flutter, Dio, etc.)
- Use `Either<Failure, Success>` for error handling

**Example:**
```dart
// Entity
@freezed
class WorkOrder with _$WorkOrder {
  const factory WorkOrder({
    required String id,
    required String title,
    required WorkOrderStatus status,
    required DateTime createdAt,
  }) = _WorkOrder;
}

// Repository Interface
abstract class IWorkOrderRepository {
  Future<Either<Failure, List<WorkOrder>>> getWorkOrders();
  Future<Either<Failure, WorkOrder>> getWorkOrderById(String id);
}

// UseCase
class GetWorkOrders {
  final IWorkOrderRepository repository;
  
  GetWorkOrders(this.repository);
  
  Future<Either<Failure, List<WorkOrder>>> call() {
    return repository.getWorkOrders();
  }
}
```

### 2. Data Layer (`lib/features/*/data/`)
Handles external data sources and implements domain repository interfaces.

**Structure:**
```
data/
├── models/           # DTOs for API/Hive (with freezed + json_serializable)
├── datasources/      # Remote (API) and Local (Hive) data sources
├── repositories/     # Concrete repository implementations
└── api/             # Retrofit API clients
```

**Rules:**
- Models extend entities and add serialization
- DTOs use `@freezed` + `@JsonSerializable`
- Hive models use `@HiveType()` + `@HiveField()`
- Separate remote and local data sources
- Repository implementations handle data source orchestration
- Map DTOs to domain entities at repository boundary

**Example:**
```dart
// DTO Model
@freezed
class WorkOrderDto with _$WorkOrderDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory WorkOrderDto({
    required String id,
    required String title,
    required String status,
    required DateTime createdAt,
  }) = _WorkOrderDto;
  
  factory WorkOrderDto.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderDtoFromJson(json);
}

// Hive Model
@HiveType(typeId: 1)
class WorkOrderHiveModel extends HiveObject {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final String title;
  
  WorkOrderHiveModel({required this.id, required this.title});
}

// Repository Implementation
class WorkOrderRepositoryImpl implements IWorkOrderRepository {
  final WorkOrderRemoteDataSource remoteDataSource;
  final WorkOrderLocalDataSource localDataSource;
  
  @override
  Future<Either<Failure, List<WorkOrder>>> getWorkOrders() async {
    try {
      // Try remote first
      final dtos = await remoteDataSource.getWorkOrders();
      final entities = dtos.map((dto) => dto.toEntity()).toList();
      
      // Cache locally
      await localDataSource.cacheWorkOrders(entities);
      
      return Right(entities);
    } catch (e) {
      // Fallback to local cache
      final cached = await localDataSource.getWorkOrders();
      return Right(cached);
    }
  }
}
```

### 3. Presentation Layer (`lib/features/*/presentation/`)
UI components and state management.

**Structure:**
```
presentation/
├── blocs/           # BLoC state management
├── pages/           # Full screen widgets with @RoutePage()
├── widgets/         # Feature-specific reusable components
└── forms/           # Reactive form definitions
```

**Rules:**
- Pages must use `@RoutePage()` annotation
- Use BLoC for state management
- Separate UI from business logic
- Use `BlocBuilder`, `BlocListener`, `BlocConsumer`
- Forms use reactive_forms package
- Keep widgets small and focused

**Example:**
```dart
// BLoC
@injectable
class WorkOrderBloc extends Bloc<WorkOrderEvent, WorkOrderState> {
  final GetWorkOrders getWorkOrders;
  
  WorkOrderBloc(this.getWorkOrders) : super(WorkOrderInitial()) {
    on<LoadWorkOrders>(_onLoadWorkOrders);
  }
  
  Future<void> _onLoadWorkOrders(
    LoadWorkOrders event,
    Emitter<WorkOrderState> emit,
  ) async {
    emit(WorkOrderLoading());
    
    final result = await getWorkOrders();
    
    result.fold(
      (failure) => emit(WorkOrderError(failure.message)),
      (workOrders) => emit(WorkOrderLoaded(workOrders)),
    );
  }
}

// Page
@RoutePage()
class WorkOrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WorkOrderBloc>()
        ..add(LoadWorkOrders()),
      child: BlocBuilder<WorkOrderBloc, WorkOrderState>(
        builder: (context, state) {
          return state.when(
            initial: () => SizedBox(),
            loading: () => LoadingIndicator(),
            loaded: (orders) => WorkOrderList(orders: orders),
            error: (message) => ErrorView(message: message),
          );
        },
      ),
    );
  }
}
```

## Core Infrastructure

### Dependency Injection (`lib/core/di/`)
Uses Injectable + GetIt with environment-based configuration.

**Setup:**
```dart
@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();

// In main.dart
void main() async {
  configureDependencies();
  runApp(MyApp());
}
```

**Registration:**
- `@singleton` - Single instance for app lifetime
- `@lazySingleton` - Created on first access
- `@injectable` - New instance per request
- `@preResolve` - Async initialization

**Module Pattern:**
```dart
@module
abstract class NetworkModule {
  @lazySingleton
  Dio get dio => Dio()..interceptors.add(AuthInterceptor());
  
  @lazySingleton
  @Named('baseUrl')
  String get baseUrl => AppConfig.baseUrl;
}
```

### Routing (`lib/core/router/`)
AutoRoute with type-safe navigation and guards.

**Features:**
- Declarative routing with `@RoutePage()`
- Authentication guards
- Deep linking support
- Nested navigation
- Route observers

**Usage:**
```dart
// Navigate
context.router.push(WorkOrderDetailsRoute(id: '123'));

// Replace
context.router.replace(LoginRoute());

// Go back
context.router.pop();

// Deep link
/work-orders/123 -> WorkOrderDetailsRoute(id: '123')
```

### Theme System (`lib/core/theme/`)
Material 3 design system with FSM-specific extensions.

**Components:**
- `AppColors` - Brand, status, priority colors
- `AppDimensions` - Responsive sizing with ScreenUtil
- `AppTextStyles` - Typography scale
- `AppTheme` - Light/dark themes
- `FSMThemeExtension` - Custom extensions

**Usage:**
```dart
Container(
  padding: EdgeInsets.all(AppDimensions.paddingMedium),
  decoration: BoxDecoration(
    color: context.fsmTheme.workOrderCardBackground,
    borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
  ),
  child: Text(
    'Work Order',
    style: AppTextStyles.titleMedium,
  ),
)
```

### Network Layer (`lib/core/network/`)
Retrofit + Dio with interceptors and retry logic.

**Features:**
- Token-based authentication
- Automatic token refresh
- Smart retry with exponential backoff
- Offline detection
- Request/response logging (dev only)
- Alice HTTP inspector (dev only)

**Configuration:**
```dart
@module
abstract class NetworkModule {
  @lazySingleton
  Dio provideDio(AuthInterceptor authInterceptor) {
    return Dio()
      ..interceptors.addAll([
        authInterceptor,
        RetryInterceptor(dio: dio),
        if (AppConfig.isDebug) Alice().getDioInterceptor(),
      ]);
  }
}
```

### Storage Layer (`lib/core/storage/`)
Hive CE for offline-first architecture.

**Features:**
- Type-safe storage with code generation
- Lazy box loading for performance
- Automatic model registration
- Cache management utilities

**Usage:**
```dart
// Register types
@HiveType(typeId: 1)
class WorkOrderHiveModel extends HiveObject {
  @HiveField(0)
  final String id;
}

// Service
@singleton
class HiveService {
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(WorkOrderHiveModelAdapter());
    await Hive.openBox<WorkOrderHiveModel>(HiveBoxes.workOrders);
  }
  
  Box<T> getBox<T>(String name) => Hive.box<T>(name);
}
```

## Feature Organization

Each feature follows the same structure:

```
features/
└── feature_name/
    ├── data/
    │   ├── api/
    │   ├── datasources/
    │   ├── models/
    │   └── repositories/
    ├── domain/
    │   ├── entities/
    │   ├── repositories/
    │   └── usecases/
    └── presentation/
        ├── blocs/
        ├── forms/
        ├── pages/
        └── widgets/
```

## Code Generation

Required generators:
```bash
# Run all generators
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode
flutter pub run build_runner watch --delete-conflicting-outputs

# Clean build
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

**Generated files:**
- `*.g.dart` - JSON serialization, Hive adapters
- `*.freezed.dart` - Freezed data classes
- `*.config.dart` - Injectable configuration
- `*.gr.dart` - AutoRoute routes

## Testing Strategy

### Unit Tests
- Test domain entities, use cases, and business logic
- Mock repository interfaces
- Use `mocktail` or `mockito` for mocking

### Widget Tests
- Test individual widgets in isolation
- Use `golden_toolkit` for visual regression
- Mock BLoCs with `bloc_test`

### Integration Tests
- Test complete user flows
- Use real or stubbed data sources
- Test offline/online scenarios

## Best Practices

### 1. Immutability
✅ Use `@freezed` for all data classes
✅ Use `final` for all fields
✅ Never expose mutable state

### 2. Separation of Concerns
✅ Domain layer has no external dependencies
✅ Data layer depends only on domain
✅ Presentation layer uses BLoC pattern

### 3. Error Handling
✅ Use `Either<Failure, Success>` pattern
✅ Define custom failure types
✅ Handle errors at presentation layer

### 4. Dependency Injection
✅ Register all dependencies in modules
✅ Use appropriate scopes (@singleton, @injectable)
✅ Inject interfaces, not implementations

### 5. Code Generation
✅ Run generators after model changes
✅ Commit generated files to git
✅ Use consistent annotations

### 6. Responsive Design
✅ Use ScreenUtil for all dimensions
✅ Test on multiple screen sizes
✅ Support both orientations

### 7. Offline-First
✅ Cache data locally
✅ Sync on connectivity restore
✅ Show offline indicators

### 8. Performance
✅ Use lazy loading for lists
✅ Optimize images with cached_network_image
✅ Implement pagination
✅ Use const constructors where possible

## Common Patterns

### Repository Pattern
```dart
abstract class IRepository {
  Future<Either<Failure, Data>> getData();
}

class RepositoryImpl implements IRepository {
  final RemoteDataSource remote;
  final LocalDataSource local;
  
  @override
  Future<Either<Failure, Data>> getData() async {
    if (await networkInfo.isConnected) {
      try {
        final data = await remote.getData();
        await local.cache(data);
        return Right(data);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      final cached = await local.getCached();
      return Right(cached);
    }
  }
}
```

### BLoC Pattern
```dart
// Event
@freezed
class FeatureEvent with _$FeatureEvent {
  const factory FeatureEvent.load() = _Load;
  const factory FeatureEvent.refresh() = _Refresh;
}

// State
@freezed
class FeatureState with _$FeatureState {
  const factory FeatureState.initial() = _Initial;
  const factory FeatureState.loading() = _Loading;
  const factory FeatureState.loaded(Data data) = _Loaded;
  const factory FeatureState.error(String message) = _Error;
}

// BLoC
class FeatureBloc extends Bloc<FeatureEvent, FeatureState> {
  final UseCase useCase;
  
  FeatureBloc(this.useCase) : super(FeatureState.initial()) {
    on<_Load>(_onLoad);
  }
  
  Future<void> _onLoad(_Load event, Emitter<FeatureState> emit) async {
    emit(FeatureState.loading());
    final result = await useCase();
    result.fold(
      (failure) => emit(FeatureState.error(failure.message)),
      (data) => emit(FeatureState.loaded(data)),
    );
  }
}
```

### Form Pattern
```dart
class FeatureForm {
  late final FormGroup form;
  
  FeatureForm() {
    form = FormGroup({
      'field': FormControl<String>(
        validators: [Validators.required, Validators.email],
      ),
    });
  }
  
  void submit() {
    if (form.valid) {
      final value = form.value;
      // Process form
    }
  }
}
```

## Migration and Refactoring

When refactoring existing code:

1. **Start with domain layer** - Define entities and interfaces
2. **Implement data layer** - Create DTOs and repositories
3. **Update presentation** - Migrate to BLoC pattern
4. **Update DI** - Register new dependencies
5. **Update routes** - Add to router configuration
6. **Run generators** - Generate required code
7. **Test thoroughly** - Verify all flows work

## Environment Configuration

Three environments with separate configurations:

```dart
enum Environment { dev, staging, prod }

abstract class AppConfig {
  static Environment get environment => _resolveEnvironment();
  static String get baseUrl => _getBaseUrl();
  static bool get isDebug => environment == Environment.dev;
}
```

**Build commands:**
```bash
# Development
flutter run --dart-define FLUTTER_FLAVOR=dev

# Staging
flutter run --dart-define FLUTTER_FLAVOR=staging

# Production
flutter run --dart-define FLUTTER_FLAVOR=prod
```

## Troubleshooting

### Build Runner Issues
```bash
flutter pub run build_runner clean
flutter packages pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### Hive Issues
```bash
# Clear Hive boxes
await Hive.deleteBoxFromDisk(HiveBoxes.workOrders);

# Re-register adapters
Hive.registerAdapter(ModelAdapter());
```

### Navigation Issues
```bash
# Regenerate routes
flutter pub run build_runner build --delete-conflicting-outputs
```

### DI Issues
```bash
# Regenerate injection config
flutter pub run build_runner build --delete-conflicting-outputs

# Check registration
print(getIt.allReady());
```

## Resources

- **Flutter Docs**: https://docs.flutter.dev
- **Clean Architecture**: https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html
- **BLoC Pattern**: https://bloclibrary.dev
- **Injectable**: https://pub.dev/packages/injectable
- **AutoRoute**: https://pub.dev/packages/auto_route
- **Freezed**: https://pub.dev/packages/freezed
- **Hive**: https://docs.hivedb.dev
