# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

FSM (Field Service Management) is a Flutter mobile application built with Clean Architecture principles, using feature-based modularization. The app manages field service operations including work orders, documents, parts inventory, calendar scheduling, and technician profiles.

**Version**: 2.0.5+5
**Flutter**: 3.35.6
**Dart**: 3.9.2

## Core Architecture

### Clean Architecture Layers

The codebase follows Clean Architecture with strict separation of concerns:

1. **Domain Layer** (`domain/`): Business logic and entities
   - `entities/`: Pure domain models (immutable)
   - `repositories/`: Abstract repository interfaces (prefixed with `i_`)
   - `usecases/`: Single-responsibility business operations

2. **Data Layer** (`data/`): External data handling
   - `models/`: DTOs for API responses and Hive storage
   - `datasources/`: Remote (API) and local (Hive) data sources
   - `repositories/`: Concrete implementations of domain repositories
   - `api/`: Retrofit API clients

3. **Presentation Layer** (`presentation/`): UI and state management
   - `blocs/`: BLoC state management (using flutter_bloc)
   - `pages/`: Screen widgets with `@RoutePage()` annotation
   - `widgets/`: Reusable UI components
   - `forms/`: Reactive form definitions (using reactive_forms)

### Feature Organization

Features are self-contained modules under `lib/features/`:
- `auth/`: Authentication and token management
- `work_orders/`: Work order management (core feature)
- `documents/`: Document viewing and management
- `parts/`: Parts inventory and stock management
- `calendar/`: Schedule and route optimization
- `profile/`: User profile and preferences
- `chat/`: AI chatbot assistance
- `permission/`: Permission handling abstraction
- `main_navigation/`: Bottom navigation controller
- `debug/`: Developer tools and debugging

### Core Infrastructure (`lib/core/`)

- **Dependency Injection**: `injectable` + `get_it` with environment-based configuration
  - Module files: `*_module.dart` for feature-specific DI
  - Main config: `lib/core/di/injection.dart`
- **Routing**: `auto_route` with type-safe navigation
  - Router definition: `lib/core/router/app_router.dart`
  - Generated routes: `app_router.gr.dart` (auto-generated)
  - Guards: `guards/auth_guard.dart` for protected routes
- **State Management**: BLoC pattern with `flutter_bloc` and `rxdart`
- **Network**: Retrofit + Dio with custom interceptors
  - Auth interceptor handles token refresh automatically
  - Retry logic with smart exponential backoff
  - Alice HTTP inspector for debugging (debug builds only)
- **Local Storage**: Hive CE for offline-first architecture
  - Service: `lib/core/storage/hive_service.dart`
  - Box names: `lib/core/constants/hive_boxes.dart`
  - All models require `@HiveType()` and `@HiveField()` annotations

### Environment Configuration

The app uses Flutter flavors with compile-time configuration:

- **Development**: `dev` flavor with debug logging and ngrok endpoint
- **Staging**: `staging` flavor with staging server
- **Production**: `prod` flavor with production server

Configuration files:
- `lib/core/config/app_config_dev.dart`
- `lib/core/config/app_config_staging.dart`
- `lib/core/config/app_config_prod.dart`

Environment is set via `--dart-define FLUTTER_FLAVOR=<env>` at build time.

## Common Development Commands

### Running the App

```bash
# Run in development (default)
flutter run

# Run with specific flavor
flutter run --dart-define FLUTTER_FLAVOR=dev
flutter run --dart-define FLUTTER_FLAVOR=staging
flutter run --dart-define FLUTTER_FLAVOR=prod

# Run on specific device
flutter run -d <device-id>
```

### Code Generation

The project relies heavily on code generation. **Always run code generation after modifying:**
- Freezed models (`@freezed`)
- JSON serialization (`@JsonSerializable`)
- Hive models (`@HiveType`)
- Injectable modules (`@injectable`, `@module`)
- Retrofit API clients (`@RestApi`)
- AutoRoute routes (`@RoutePage`)

```bash
# Run all code generators (watch mode for development)
dart run build_runner watch --delete-conflicting-outputs

# One-time generation
dart run build_runner build --delete-conflicting-outputs

# Clean build (use when build_runner gets stuck)
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs
```

### Linting and Analysis

```bash
# Run static analysis
dart analyze

# Fix auto-fixable issues
dart fix --apply

# Check specific file
dart analyze lib/path/to/file.dart
```

### Testing

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/path/to/test_file.dart

# Run tests with coverage
flutter test --coverage

# Run integration tests
flutter test integration_test/
```

### Dependencies

```bash
# Get dependencies
flutter pub get

# Update dependencies
flutter pub upgrade

# Check for outdated packages
flutter pub outdated
```

## Key Architectural Patterns

### Dependency Injection with Injectable

All services, repositories, and BLoCs are registered via `@injectable` decorators:

- `@singleton`: Single instance across app lifetime (e.g., `AuthBloc`, `HiveService`)
- `@lazySingleton`: Created on first use, then reused
- `@injectable`: New instance per injection
- `@preResolve`: Async initialization required (e.g., `HiveService`)
- `@module`: Abstract class for third-party dependencies (e.g., `Dio`)

Environment-specific registration:
```dart
@Injectable(as: IAuthRepository, env: [Environment.dev])
@Injectable(as: IAuthRepository, env: [Environment.staging, Environment.prod])
```

### BLoC State Management

All features use BLoC pattern:
- Events in `*_event.dart` with freezed unions
- States in `*_state.dart` with freezed unions
- BLoC in `*_bloc.dart` extending `Bloc<Event, State>`
- BLoCs are singletons to maintain state across navigation

Example event handling:
```dart
on<SomeEvent>((event, emit) async {
  emit(state.copyWith(status: Status.loading));
  // Business logic via use cases
  emit(state.copyWith(status: Status.success));
});
```

### Navigation with AutoRoute

- All pages must be annotated with `@RoutePage()`
- Navigation uses type-safe route objects from `app_router.gr.dart`
- Router extensions provide semantic navigation helpers
- Deep linking supported via standalone routes

Example navigation:
```dart
// Using extension method
context.router.navigateToWorkOrder(workOrderId);

// Direct route push
context.router.push(WorkOrderDetailsRoute(workOrderId: id));
```

### Data Models Pattern

The codebase uses three model types per feature:

1. **Entity** (Domain): Pure business models, immutable with `@freezed`
2. **DTO** (Data): API response models with `@JsonSerializable`
3. **Hive Model** (Data): Local storage models with `@HiveType`

Mappers convert between layers (typically in datasources or repositories).

### Offline-First with Hive

- All feature data is cached in Hive for offline access
- Box names are centralized in `lib/core/constants/hive_boxes.dart`
- Type IDs for adapters defined in same file
- HiveService provides typed box access: `getTypedBox<T>(boxName)`
- Repositories implement cache-first or network-first strategies

### Error Handling

- Use `Either<Failure, Success>` from `either_dart` in repositories
- ErrorBoundaryService captures and logs unhandled errors
- BLoCs emit error states, never throw exceptions
- Network errors handled by RetryInterceptor

### Forms with Reactive Forms

Work order completion and other complex forms use `reactive_forms`:
- Form definitions in `presentation/forms/`
- Custom validators in form definitions
- Form state managed independently of BLoC

## Important Implementation Details

### Auth Flow
1. Tokens stored in Hive via `HiveService`
2. `AuthInterceptor` adds access token to all requests
3. On 401, interceptor attempts token refresh
4. On refresh failure, user is logged out and redirected to login
5. `AuthGuard` protects routes, checks auth state from `AuthBloc`

### Work Order Lifecycle
1. Fetched from API and cached in Hive
2. Local-first display from Hive
3. Completion data cached separately in `workOrderCompletionCache` box
4. Multi-step completion form with signature, parts, and photos
5. Offline completion supported with sync on reconnection

### Alice HTTP Inspector
- Debug builds show floating orange button for network inspection
- Automatically captures all Dio requests/responses
- Access via button tap or shake gesture (Android)
- Interceptor added in `app.dart` after DI initialization

### Screen Utilities
- All dimensions use `flutter_screenutil` for responsive sizing
- Design size: 375x812 (iPhone 11 Pro)
- Use `.w`, `.h`, `.sp`, `.r` extensions for scalable UI

## Common Gotchas

1. **After modifying models**: Always run `build_runner` to regenerate `.g.dart` and `.freezed.dart` files
2. **After adding routes**: Run `build_runner` to update `app_router.gr.dart`
3. **After adding dependencies**: Run `flutter pub get` then regenerate with `build_runner`
4. **Hive type IDs**: Must be unique across entire app; check `hive_boxes.dart` before adding new adapters
5. **BLoC memory**: BLoCs are singletons; be careful with state management across navigation
6. **FormData retry**: Requests with `FormData` cannot be retried; handled in `RetryInterceptor`
7. **Ngrok header**: Development uses ngrok; special header added in Dio config to bypass browser warning
8. **ScreenUtil initialization**: Must be initialized in `MaterialApp` builder; already configured in `app.dart`

## Code Style and Conventions

- Use `freezed` for immutable data classes
- Prefix interface names with `I` (e.g., `IAuthRepository`)
- Use `final` for all class fields unless mutability is required
- BLoC events and states use freezed unions for type safety
- Async methods always return `Future<T>`, never bare `T`
- Repository methods return `Future<Either<Failure, T>>`
- Use relative imports within features, absolute for cross-feature
- File names are snake_case, class names are PascalCase
- Use bunjs to run scripts
- Use Javascript with bun instead of Python