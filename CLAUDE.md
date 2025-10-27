# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Flutter-based Field Service Management (FSM) mobile application built with clean architecture principles. The app supports offline-first operation with JWT authentication, work order lifecycle management, document handling, and GPS-enabled field operations.

## Development Commands

### Running the App

```bash
# Development (default)
flutter run --flavor dev --target lib/main_dev.dart
# Or use convenience script:
./scripts/run_dev.sh

# Staging
flutter run --flavor staging --target lib/main_staging.dart
./scripts/run_staging.sh

# Production
flutter run --flavor prod --target lib/main_prod.dart --release
./scripts/run_prod.sh
```

### Code Generation

**Critical**: Keep build_runner watching during development:

```bash
# Watch mode (recommended during development)
dart run build_runner watch --delete-conflicting-outputs

# One-time generation
dart run build_runner build --delete-conflicting-outputs
```

Run code generation after modifying:
- `@freezed` models (DTOs, entities, states, events)
- `@injectable` classes or `@module` providers
- `@RestApi()` clients (Retrofit)
- `@RoutePage()` annotated pages
- Hive model types with `@HiveType`
- Assets (images, fonts, colors) when flutter_gen is enabled

Generated files locations:
- DI config: `lib/core/di/injection.config.dart`
- Router: `lib/core/router/app_router.gr.dart`
- Retrofit APIs: `*.g.dart` next to API client files
- Freezed models: `*.freezed.dart` and `*.g.dart` next to model files

### Testing

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/features/work_orders/data/repositories/work_order_repository_impl_test.dart

# Run with coverage
flutter test --coverage
```

### Linting & Analysis

```bash
# Analyze entire project
dart analyze
flutter analyze

# Fix auto-fixable issues
dart fix --apply
```

### Building

```bash
# Development build
flutter build apk --flavor dev --target lib/main_dev.dart
./scripts/build_android_dev.sh

# Staging build
flutter build apk --flavor staging --target lib/main_staging.dart
./scripts/build_android_staging.sh

# Production build
flutter build apk --flavor prod --target lib/main_prod.dart --release
./scripts/build_android_prod.sh
```

### API Testing

**Postman Collection**: Located in `postman/` directory for API testing:
- `FSM_Backend.postman_collection.json` - Complete API endpoint collection
- `FSM_Backend.postman_environment.json` - Environment variables (dev/staging/prod)

Import these files into Postman for manual API testing and debugging.

**MCP Integration**: The `.mcp.json` configures Postman MCP server for Claude Code integration, enabling direct API interactions during development.

## Architecture Overview

### Features

The application includes the following feature modules:

- **auth** - JWT authentication, login, token refresh, secure storage
- **work_orders** - Work order lifecycle management, status transitions, GPS tracking
- **documents** - Multi-file document viewer, PDF/image/video support, caching
- **calendar** - Work order scheduling and calendar view
- **parts** - Spare parts inventory management
- **profile** - User profile and settings management
- **chat** - Technical assistance and support chat
- **permission** - Permission handling abstraction (location, storage, camera)
- **main_navigation** - Bottom navigation and tab-based routing
- **debug** - Development debugging tools (dev/staging only)

### Clean Architecture Pattern

The codebase follows feature-first clean architecture with three layers per feature:

```
features/<feature>/
├── data/                          # Data layer (frameworks & drivers)
│   ├── api/                       # Retrofit API clients
│   ├── datasources/               # Remote & local data sources
│   │   ├── remote/                # API implementations
│   │   └── local/                 # Hive cache implementations
│   ├── models/                    # DTOs and Hive models
│   ├── repositories/              # Repository implementations
│   └── di/                        # Feature-specific DI modules
├── domain/                        # Business logic (pure Dart)
│   ├── entities/                  # Domain models (Freezed)
│   ├── repositories/              # Repository interfaces
│   └── usecases/                  # Business use cases
└── presentation/                  # UI layer
    ├── blocs/                     # BLoC state management
    ├── pages/                     # Full screen widgets
    └── widgets/                   # Feature-specific components
```

**Dependency direction**: Presentation → Domain ← Data (domain has no dependencies)

### Core Infrastructure

`lib/core/` contains shared functionality:

- `blocs/` - Global BLoCs (ConnectivityBloc, ErrorBloc, SyncBloc)
- `config/` - Environment configs (dev/staging/prod)
- `constants/` - App-wide constants (Hive box names, timeouts)
- `di/` - Dependency injection setup (Injectable + GetIt)
- `error/` - Error handling (Failure types, exceptions, handlers)
- `network/` - HTTP client, AuthInterceptor, NetworkInfo
- `router/` - Auto Route configuration and guards
- `services/` - Core services (logging, location, error boundary)
- `storage/` - Hive service and cache management
- `theme/` - Design system (colors, dimensions, typography, extensions)
- `utils/` - Extensions and helper functions
- `widgets/` - Shared UI components (FSM design system components)

### State Management (BLoC)

**Global BLoCs** (singletons in `core/blocs/`):
- `ConnectivityBloc` - Monitors real-time network connectivity
- `ErrorBloc` - Centralized error handling with retry logic
- `SyncBloc` - Coordinates offline data synchronization

**Feature BLoCs** follow pattern:
- Events: Freezed sealed unions (`@freezed`)
- States: Freezed with pattern matching (`.when()`, `.map()`)
- Registration: Factory scope via `@injectable`

### Dependency Injection

Using Injectable + GetIt with environment-based configuration:

```dart
// Initialize DI
await configureDependencies(Environment.dev); // or staging, prod

// Access dependencies
final repository = getIt<IWorkOrderRepository>();
```

**Key annotations**:
- `@singleton` - Single instance across app lifecycle
- `@factory` - New instance per injection
- `@module` - Group related dependencies
- `@injectable` - Auto-register class

### Networking

**Stack**: Dio → Retrofit → Repository

**Interceptors** (applied in order):
1. `AuthInterceptor` - Injects Bearer token, handles 401 refresh
2. `RetryInterceptor` - Exponential backoff retry logic
3. `PrettyDioLogger` - Debug logging (dev/staging only)

**API Client Pattern** (Retrofit):
```dart
@RestApi()
abstract class FeatureApiClient {
  factory FeatureApiClient(Dio dio, {String? baseUrl}) = _FeatureApiClient;

  @GET('/endpoint')
  Future<ResponseDto> getResource();
}
```

**Auth Flow**: AuthInterceptor automatically refreshes expired tokens on 401 responses and retries the original request.

### Offline-First Strategy

**Repository Pattern**:
1. Check network connectivity via `NetworkInfo`
2. If online: fetch from remote, cache result locally
3. If offline: return cached data from Hive
4. Track pending mutations for later sync when connectivity restored

**Sync Management**:
- Mark operations as pending sync when offline (`isPendingSync=true`)
- Store action type (`pendingAction: 'start'|'pause'|'complete'`)
- `SyncBloc` retries pending operations when connectivity restored
- Server wins on conflicts

### Routing

Auto Route v10 with code generation:

**Configuration**: `lib/core/router/app_router.dart`
**Generated**: `lib/core/router/app_router.gr.dart`

**Route Protection**: `AuthGuard` checks for valid token, redirects to login if unauthenticated

**Navigation**:
```dart
context.router.push(WorkOrderDetailsRoute(workOrderId: id));
context.router.replacePath('/login');
```

**Route Pattern**:
- Root: `/` - Splash screen
- Public: `/login`
- Protected: `/main` with nested tabs (dashboard, calendar, documents, parts, profile)
- Deep links: `/work-order/:workOrderId`

### Local Storage (Hive)

**Initialization**: `HiveService` singleton initialized at app startup

**Box Configuration**: `lib/core/constants/hive_boxes.dart` defines box names and type IDs

**Pattern**:
```dart
// Typed box access
final box = await hiveService.getTypedBox<WorkOrderHiveModel>(HiveBoxes.workOrders);
await box.put(workOrder.id, workOrder);
final cached = box.get(id);
```

**Hive Models**: Include sync metadata fields:
- `isPendingSync` - Marks for sync when offline
- `pendingAction` - Action to retry ('start', 'pause', 'complete')

**Critical**: TypeIds in `HiveBoxes` must remain stable across versions for migration.

### Data Flow Pattern

```
API Response (JSON)
    ↓ (Retrofit deserializes)
DTO (@freezed with @JsonSerializable)
    ↓ (extension method: .toEntity())
Domain Entity (@freezed, pure Dart)
    ↓ (passed to BLoC)
BLoC State (@freezed)
    ↓ (UI rebuilds)
Presentation Layer
```

**Reverse flow** (Entity → DTO):
```dart
entity.toDto()  // For POST/PUT requests
```

### Error Handling

**Three-tier system**:

1. **Exceptions** (thrown by data sources):
   - `ServerException`, `NetworkException`, `CacheException`

2. **Failures** (domain layer, Freezed unions):
   ```dart
   @freezed
   abstract class Failure {
     const factory Failure.server({String message, int? statusCode});
     const factory Failure.network({String message});
     const factory Failure.cache({String message});
     const factory Failure.validation({String message});
   }
   ```

3. **BLoC States** (UI layer):
   - Feature BLoCs emit error states with user-friendly messages
   - `ErrorBloc` provides global error handling

**Repository pattern**: Return `Either<Failure, T>` from either_dart package

### Environment Configuration

Three environments with separate entry points:

- **Dev**: `lib/main_dev.dart` - Debug logging, Alice HTTP inspector, ngrok support
- **Staging**: `lib/main_staging.dart` - Enhanced logging, full debug features
- **Prod**: `lib/main_prod.dart` - Minimal logging, no debug tools

**Configuration files**: `lib/core/config/app_config_{dev|staging|prod}.dart`

Each defines:
- API base URL
- Environment name
- Debug flags
- Feature toggles

## Important Conventions

### Theme and Styling

**Color Usage**: Always use `AppColors` constants instead of hardcoded colors:
```dart
// Correct
color: AppColors.primary
backgroundColor: AppColors.surface
textColor: AppColors.onSurface

// Incorrect
color: Color(0xFF116587)  // ❌ Don't hardcode colors
```

**Theme Extensions**: Access theme-specific styles via context:
```dart
final theme = Theme.of(context);
final fsmTheme = theme.extension<FSMThemeExtension>();

// Use theme colors and styles
final primaryColor = theme.colorScheme.primary;
final customSpacing = fsmTheme?.customSpacing;
```

### UI Responsiveness

**MANDATORY**: Use ScreenUtil for all dimensions via `AppDimensions`:

```dart
// Correct - Use AppDimensions constants
padding: EdgeInsets.all(AppDimensions.paddingMedium)
fontSize: 14.sp
height: AppDimensions.buttonHeight
borderRadius: BorderRadius.circular(AppDimensions.radiusSmall)

// Also acceptable - Direct ScreenUtil for custom values
padding: EdgeInsets.all(16.w)

// Incorrect
padding: EdgeInsets.all(16)  // ❌ Never use raw numbers
```

**AppDimensions provides**:
- Padding: `paddingXSmall` (4w) to `paddingXLarge` (32w)
- Margins: `marginXSmall` (4w) to `marginXLarge` (32w)
- Border Radius: `radiusXSmall` (4r) to `radiusCircular` (50r)
- Icon Sizes: `iconXSmall` (16sp) to `iconXLarge` (48sp)
- Heights: `buttonHeight`, `inputHeight`, `appBarHeight`, `listItemHeight`, etc.

Initialize ScreenUtil in `main_common.dart` before runApp.

### Work Order Lifecycle

**GPS requirement**: All work order state transitions (start/pause/complete) REQUIRE GPS coordinates:

```dart
// BLoC emits locationError if GPS unavailable
if (location == null) {
  emit(state.copyWith(locationError: 'Location required'));
  return;
}
```

**Flow**: Idle → Started → Paused ↔ Resumed → Completed

### Document Handling

**Multi-File Support**: Documents support multiple files with individual caching:
- Each document can have multiple files (PDFs, images, videos)
- Files are cached individually using `FileEntity` model
- Document viewer handles different file types (PDF, image, video)
- Uploader information is tracked for audit purposes

**File Types**:
- PDF: Viewed using Syncfusion PDF viewer
- Images: Displayed with PhotoView for zoom/pan
- Videos: Played using Chewie video player

### Design System Components

**FSM Component Library**: Use prefixed components from `lib/core/widgets/` for consistency:

**Cards**:
```dart
// Elevated card (default)
FSMCard(
  child: content,
  onTap: () {},
)

// Outlined card
FSMCard.outlined(
  child: content,
  borderColor: AppColors.primary,
)

// Flat card (no elevation/border)
FSMCard.flat(
  child: content,
)
```

**App Bars**:
```dart
FSMAppBar(
  title: 'Title',
  showBackButton: true,
  actions: [IconButton(...)],
)

// With tabs
FSMAppBar.withTabs(
  title: 'Title',
  tabs: ['Tab 1', 'Tab 2'],
)
```

**Action Buttons**:
```dart
FSMActionButton(
  label: 'Start',
  icon: Icons.play_arrow,
  onPressed: () {},
  variant: FSMActionButtonVariant.primary,
)
```

**Other Components**: `FSMBottomSheet`, `FSMEmptyState`, `FSMFilterChipGroup`, `FSMInfoRow`, `FSMListItem`, `FSMSearchBar`, `FSMSectionHeader`, `StatusBadge`, `OfflineBanner`

### Loading States

Use `shimmer` package for skeleton screens during data loading. Avoid generic spinners; prefer content-aware loading states.

### Permission Handling

Use `PermissionRepository` abstraction:
```dart
final status = await permissionRepository.requestLocationPermission();
```

Don't call `permission_handler` directly in features.

### Logging

Use `LoggingService` singleton:
```dart
LoggingService.instance.debug('Message', tag: 'FeatureName', data: {...});
LoggingService.instance.error('Error', tag: 'FeatureName', error: e, stackTrace: st);
```

Log levels: debug, info, warning, error, critical

## Common Patterns

### Creating a New Feature

1. Create feature folder structure: `features/<feature>/{data,domain,presentation}`
2. Define domain entities with `@freezed` in `domain/entities/`
3. Create repository interface in `domain/repositories/`
4. Implement DTOs with `@freezed` and `@JsonSerializable` in `data/models/`
5. Create Retrofit API client in `data/api/` with `@RestApi()`
6. Implement data sources (remote/local) in `data/datasources/`
7. Implement repository in `data/repositories/`
8. Create DI module in `data/di/` with `@module`
9. Add BLoC in `presentation/blocs/` with events/states
10. Create page with `@RoutePage()` in `presentation/pages/`
11. Register route in `lib/core/router/app_router.dart`
12. Run `dart run build_runner build --delete-conflicting-outputs`

### Adding a New API Endpoint

1. Add method to Retrofit client:
   ```dart
   @POST('/endpoint')
   Future<ResponseDto> createResource(@Body CreateRequestDto request);
   ```
2. Run build_runner to generate implementation
3. Create/update DTO if needed
4. Add method to data source interface and implementation
5. Add method to repository interface and implementation
6. Create use case if complex business logic required
7. Call from BLoC event handler

### Implementing Offline Support

1. Create Hive model in `data/models/` with `@HiveType`
2. Add box name and typeId to `HiveBoxes` constants
3. Register adapter in `HiveService._registerAdapters()`
4. Open box in `HiveService._init()`
5. Implement local data source with cache/retrieve/sync methods
6. In repository:
   - Check `NetworkInfo.isConnected`
   - If online: fetch remote → cache locally
   - If offline: return cached → mark for sync if mutation
7. Handle sync in `SyncBloc` when connectivity restored

### Testing BLoCs

```dart
blocTest<MyBloc, MyState>(
  'emits success state when operation succeeds',
  build: () {
    when(() => mockRepository.doSomething())
        .thenAnswer((_) async => Right(entity));
    return MyBloc(repository: mockRepository);
  },
  act: (bloc) => bloc.add(const DoSomethingEvent()),
  expect: () => [
    MyState.loading(),
    MyState.success(entity),
  ],
);
```

## Critical Files

- `lib/core/di/injection.dart` - DI configuration
- `lib/core/router/app_router.dart` - Route configuration
- `lib/core/network/dio_client.dart` - HTTP client setup
- `lib/core/network/auth_interceptor.dart` - JWT token management
- `lib/core/storage/hive_service.dart` - Local storage initialization
- `lib/core/constants/hive_boxes.dart` - Hive box names and type IDs
- `lib/core/config/app_config.dart` - Environment configuration
- `lib/core/theme/app_colors.dart` - Color constants (brand, semantic colors)
- `lib/core/theme/app_dimensions.dart` - Responsive dimension constants
- `lib/core/theme/extensions/fsm_theme_extension.dart` - Theme extensions
- `lib/main_common.dart` - Shared app initialization

## Troubleshooting

### Build Runner Issues

If DI types aren't found or routes fail:
```bash
# Clean generated files
flutter clean
dart run build_runner clean

# Regenerate
dart run build_runner build --delete-conflicting-outputs
```

### Hive Migration Errors

If Hive throws typeId errors:
- Never change existing typeIds in `HiveBoxes`
- Add new typeIds sequentially
- Consider migration strategy for breaking changes

### Auth Issues

If 401 errors persist:
- Check `AuthInterceptor` is registered in Dio client
- Verify token refresh endpoint returns valid tokens
- Check token storage in `auth_box`

### Location Errors

If work order transitions fail:
- Request location permission before operation
- Ensure location services enabled
- Check `LocationService` configuration

### Route Not Found

If route navigation fails:
- Verify `@RoutePage()` annotation on page
- Check route registered in `AppRouter.routes`
- Run build_runner to regenerate router
- Ensure import in app_router.dart

## Project Specifications

Additional project specifications and requirements are located in `.kiro/specs/fsm-mobile-app/`:
- `requirements.md` - Feature requirements and acceptance criteria
- `design.md` - UI/UX specifications
- `tasks.md` - Development task breakdown

Treat these files as source of truth for feature implementation and user flows.
