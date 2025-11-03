# CLAUDE.md

tools:
 use context7, useFetch , Refer to @pubspec.yaml
This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

FSM (Field Service Management) is a Flutter mobile application built with Clean Architecture principles, using feature-based modularization. The app manages field service operations including work orders, documents, parts inventory, calendar scheduling, and technician profiles.

**Version**: 2.0.5+5
**Flutter**: 3.35.6
**Dart**: 3.9.2

## 📚 Important: Context Files and Custom Agents

This project has comprehensive context files and specialized agents to help you work effectively:

### Context Files (READ THESE FIRST!)
- **`.github/FSM_ARCHITECTURE.md`** - Complete architecture guide
- **`.github/FSM_CODING_STANDARDS.md`** - Coding conventions and standards
- **`.github/FSM_FEATURE_GUIDE.md`** - Step-by-step feature implementation
- **`.github/FSM_CONTEXT_SUMMARY.md`** - Overview of all context and agents
- **`lib/core/theme/README.md`** - Theme system documentation

### Custom Agents (USE THESE FOR SPECIALIZED TASKS!)
- **Clean Architecture Expert** - Feature implementation, architecture patterns
- **UI/Theme Expert** - UI components, Material Design 3, FSM theme system
- **BLoC Expert** - State management, BLoC pattern
- **API Integration Expert** - Network layer, Retrofit, Dio
- **Testing Expert** - Unit, widget, BLoC, and integration tests

**👉 Before starting any task, read the relevant context file and consider delegating to the appropriate agent!**

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
- Refer to @.kiro/specs/flutter-design-system-refactor/ and update @.kiro/specs/flutter-design-system-refactor/tasks.md as you proceed

---

# Design System Refactor - Implementation Plan

**Last Updated**: January 2025
**Status**: In Progress
**Approach**: Big Bang (complete refactor with breaking changes)
**CI Enforcement**: Strict (no hardcoded styling violations allowed)

## Overview

Complete refactor of the presentation layer to eliminate **1065+ hardcoded styling violations**, consolidate **68 widget files**, and enforce a scalable design system with strict CI checks.

### Current State Analysis
- **Pages exceeding 300 lines**: 3 (dashboard_page.dart: 650 lines, work_order_details_page.dart: 642 lines, documents_page.dart: 468 lines)
- **Colors.* violations**: 378 occurrences across 60 files
- **Raw EdgeInsets violations**: 138 occurrences across 55 files
- **Hardcoded SizedBox violations**: 365 occurrences across 59 files
- **Direct .w/.h/.sp usage**: 184+ occurrences across 10+ files
- **Duplicate widgets**: Multiple (custom_button.dart vs fsm_button.dart, root-level vs organized widgets)

### Key Changes
1. **DesignTokens class** replaces app_dimensions.dart with const base values
2. **FSMThemeExtension** converted from Map-based to strongly-typed properties
3. **AppTheme** configuration updated to use DesignTokens and inline typography
4. **ScreenUtil designSize** changed from Size(375, 812) → Size(390, 844)
5. **All widgets** refactored to use DesignTokens instead of hardcoded values
6. **CI/CD checks** added to enforce zero violations

---

## Phase 1: Foundation Layer (CRITICAL - Build First)

### 1.1 Create DesignTokens Class

**File**: `lib/core/theme/design_tokens.dart` (NEW)

**Purpose**: Centralized const design values following 8pt grid system

**Structure**:
```dart
class DesignTokens {
  DesignTokens._();

  // Spacing scale (8pt grid)
  static const double space0 = 0;
  static const double space1 = 4;
  static const double space2 = 8;
  static const double space3 = 12;
  static const double space4 = 16;
  static const double space6 = 24;
  static const double space8 = 32;
  static const double space12 = 48;

  // Icon sizes
  static const double iconXs = 16;
  static const double iconSm = 20;
  static const double iconMd = 24;
  static const double iconLg = 32;

  // Border radius
  static const double radiusSm = 4;
  static const double radiusMd = 8;
  static const double radiusLg = 12;
  static const double radiusFull = 9999;

  // Component heights
  static const double buttonHeightSm = 32;
  static const double buttonHeightMd = 48;
  static const double buttonHeightLg = 56;

  // Typography scale
  static const double fontSize10 = 10;
  static const double fontSize12 = 12;
  static const double fontSize14 = 14;
  static const double fontSize16 = 16;
  static const double fontSize18 = 18;
  static const double fontSize24 = 24;

  // Responsive helpers
  static REdgeInsets get paddingAllSmall => REdgeInsets.all(space2);
  static REdgeInsets get paddingAllMedium => REdgeInsets.all(space4);

  static Widget verticalSpace(double height) => RSizedBox(height: height);
  static Widget horizontalSpace(double width) => RSizedBox(width: width);

  static const verticalSpaceSmall = RSizedBox(height: space2);
  static const verticalSpaceMedium = RSizedBox(height: space4);
  static const verticalSpaceLarge = RSizedBox(height: space6);
}
```

**Replaces**: `lib/core/theme/app_dimensions.dart`

---

### 1.2 Refactor FSMThemeExtension to Strongly-Typed

**File**: `lib/core/theme/extensions/fsm_theme_extension.dart` (MAJOR CHANGES)

**Remove** Map-based properties:
```dart
// DELETE these:
final Map<String, Color> statusColors;
final Map<String, Color> priorityColors;
```

**Add** explicit strongly-typed properties:
```dart
class FSMThemeExtension extends ThemeExtension<FSMThemeExtension> {
  // Work order priorities
  final Color workOrderUrgent;
  final Color workOrderHigh;
  final Color workOrderMedium;
  final Color workOrderLow;

  // Status colors
  final Color statusPending;
  final Color statusInProgress;
  final Color statusCompleted;
  final Color statusCancelled;
  final Color statusOverdue;

  // Action colors
  final Color actionStart;
  final Color actionPause;
  final Color actionComplete;
  final Color actionCancel;

  // Sync states
  final Color syncOffline;
  final Color syncSyncing;
  final Color syncSynced;
  final Color syncFailed;

  // Component colors
  final Color workOrderCardBackground;
  final Color searchBarBackground;
  final Color chipBackground;
  final Color fabBackground;

  const FSMThemeExtension({
    required this.workOrderUrgent,
    // ... all other colors
  });

  @override
  ThemeExtension<FSMThemeExtension> lerp(
    ThemeExtension<FSMThemeExtension>? other,
    double t,
  ) {
    if (other is! FSMThemeExtension) return this;
    return FSMThemeExtension(
      workOrderUrgent: Color.lerp(workOrderUrgent, other.workOrderUrgent, t)!,
      // ... lerp all colors
    );
  }
}

// Extension for convenient access
extension FSMThemeExtensionAccessor on BuildContext {
  FSMThemeExtension get fsmTheme {
    final extension = Theme.of(this).extension<FSMThemeExtension>();
    assert(extension != null, 'FSMThemeExtension not found in theme');
    return extension!;
  }
}
```

---

### 1.3 Refactor AppTheme Configuration

**File**: `lib/core/theme/app_theme.dart` (MODERATE CHANGES)

**Changes**:
1. Replace all `AppDimensions` references → `DesignTokens`
2. Replace `AppTextStyles` with inline `_createTextTheme()` method
3. Configure typography using `DesignTokens` + `.sp` extensions
4. Update component themes to use DesignTokens
5. Use REdgeInsets for all EdgeInsets

**Example**:
```dart
class AppTheme {
  static TextTheme _createTextTheme() {
    return TextTheme(
      displayLarge: TextStyle(
        fontSize: DesignTokens.fontSize48.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontSize: DesignTokens.fontSize14.sp,
        fontWeight: FontWeight.w400,
      ),
      // ... all text styles
    );
  }

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(0, DesignTokens.buttonHeightMd.h),
        padding: REdgeInsets.symmetric(
          horizontal: DesignTokens.space4,
          vertical: DesignTokens.space3,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
        ),
      ),
    );
  }

  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    colorScheme: _lightColorScheme,
    textTheme: _createTextTheme(),
    extensions: const <ThemeExtension<dynamic>>[
      FSMThemeExtension.light,
    ],
    elevatedButtonTheme: _elevatedButtonTheme,
    // ... all component themes
  );
}
```

---

### 1.4 Update App Configuration

**File**: `lib/app.dart`

**Change**:
```dart
// OLD
ScreenUtilInit(
  designSize: const Size(375, 812), // ❌

// NEW
ScreenUtilInit(
  designSize: const Size(390, 844), // ✅
```

---

## Phase 2: Widget Library Consolidation (68 Widgets)

### 2.1 Consolidate Button Implementations

**Action**: Merge `custom_button.dart` (235 lines) into `buttons/fsm_button.dart`

**Implementation**:
```dart
class FsmButton extends StatelessWidget {
  const FsmButton({
    super.key, // Always include
    required this.text,
    this.onPressed,
    this.variant = FsmButtonVariant.filled,
    this.size = FsmButtonSize.medium,
    this.icon,
    this.isLoading = false,
  });

  final String text;
  final VoidCallback? onPressed;
  final FsmButtonVariant variant;
  final FsmButtonSize size;
  final IconData? icon;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final height = switch (size) {
      FsmButtonSize.small => DesignTokens.buttonHeightSm.h,
      FsmButtonSize.medium => DesignTokens.buttonHeightMd.h,
      FsmButtonSize.large => DesignTokens.buttonHeightLg.h,
    };

    return SizedBox(
      height: height,
      child: switch (variant) {
        FsmButtonVariant.filled => FilledButton(
          onPressed: isLoading ? null : onPressed,
          child: _buildContent(),
        ),
        FsmButtonVariant.outlined => OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          child: _buildContent(),
        ),
        FsmButtonVariant.text => TextButton(
          onPressed: isLoading ? null : onPressed,
          child: _buildContent(),
        ),
      },
    );
  }

  Widget _buildContent() {
    if (isLoading) {
      return SizedBox(
        height: DesignTokens.iconSm.h,
        width: DesignTokens.iconSm.w,
        child: CircularProgressIndicator(strokeWidth: 2.w),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: DesignTokens.iconSm.sp),
          DesignTokens.horizontalSpace(DesignTokens.space2),
          Text(text),
        ],
      );
    }

    return Text(text);
  }
}
```

**Delete**: `lib/core/widgets/custom_button.dart` after migration

---

### 2.2 Merge Duplicate Widget Files

**Duplicates to merge** (keep organized versions):
- `fsm_card.dart` (root) → `cards/fsm_card.dart` ✅
- `fsm_empty_state.dart` (root) → `states/fsm_empty_state.dart` ✅
- Error handler widgets
- Connectivity indicator widgets

---

### 2.3 Refactor All 68 Widgets to Use DesignTokens

**Pattern to apply universally**:

**❌ BEFORE**:
```dart
Container(
  height: 48.h,
  padding: EdgeInsets.all(16.w),
  margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(8.r),
  ),
  child: Text('Hello', style: TextStyle(fontSize: 14.sp)),
)
```

**✅ AFTER**:
```dart
Container(
  height: DesignTokens.buttonHeightMd.h,
  padding: REdgeInsets.all(DesignTokens.space4),
  margin: REdgeInsets.symmetric(
    horizontal: DesignTokens.space3,
    vertical: DesignTokens.space2,
  ),
  decoration: BoxDecoration(
    color: Theme.of(context).colorScheme.primary,
    borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
  ),
  child: Text('Hello', style: Theme.of(context).textTheme.bodyMedium),
)
```

**Widget categories** (68 files total):
- Buttons (5 files)
- Cards (4 files)
- Lists (6 files)
- Inputs (8 files)
- Navigation (7 files)
- States (5 files)
- Layout (10 files)
- Feedback (9 files)
- Media (6 files)
- Connectivity (8 files)

---

## Phase 3: Page Migration

### 3.1 High Priority: Work Orders Feature

**Files to refactor**:

1. **dashboard_page.dart** (650 lines → <300)
   - Extract: FilterBar, StatsCards, WorkOrderList, FAB
   - Move to: `work_orders/presentation/widgets/dashboard/`

2. **work_order_details_page.dart** (642 lines → <300)
   - Extract: HeaderSection, StatusTimeline, PartsSection, ActionsBar
   - Move to: `work_orders/presentation/widgets/details/`

3. **work_order_card.dart**
   - Fix hardcoded values at lines 56, 63, 75, 80
   - Replace with DesignTokens and theme references

---

### 3.2 High Priority: Documents & Parts Features

**documents_page.dart** (468 lines → <300)
- Extract: DocumentFilters, DocumentGrid, UploadFAB

**parts pages**: Apply same patterns

---

### 3.3 Systematic Violation Fixes (1065+ occurrences)

**Search and replace patterns**:
- `Colors.white` → `theme.colorScheme.surface`
- `Colors.grey` → `theme.colorScheme.surfaceContainerHighest`
- `EdgeInsets.all(16)` → `REdgeInsets.all(DesignTokens.space4)`
- `SizedBox(height: 8)` → `DesignTokens.verticalSpaceSmall`
- `16.w` → `DesignTokens.space4.w`

---

## Phase 4: CI/CD Enforcement

### 4.1 Create Design System Checks Workflow

**File**: `.github/workflows/design_system_checks.yml` (NEW)

**Checks**:
1. **Colors violation**: Regex for `Colors.(red|blue|green|grey|white|black|...)`
2. **EdgeInsets violation**: Regex for `EdgeInsets.(all|only|symmetric|fromLTRB)\(`
3. **SizedBox violation**: Regex for `SizedBox\((width|height):\s*[\d.]+`
4. **Page line count**: Files matching `*_page.dart` > 300 lines

**Behavior**: Fail build on any violations (strict enforcement)

---

## Phase 5: Cleanup & Documentation

### 5.1 Delete Deprecated Files (Breaking Changes)

**Remove**:
- `lib/core/theme/app_dimensions.dart` → DesignTokens
- `lib/core/theme/app_text_styles.dart` → AppTheme._createTextTheme()
- `lib/core/theme/app_colors.dart` → FSMThemeExtension
- `lib/core/widgets/custom_button.dart` → FsmButton

---

### 5.2 Create Migration Documentation

**File**: `MIGRATION.md` (NEW)

**Contents**:
- Before/after examples for common patterns
- Component replacement guide
- Theme access patterns
- Common pitfalls (ScreenUtil timing, const constructors)

---

### 5.3 Update Barrel Files

**File**: `lib/core/widgets/widgets.dart`

- Remove exports for deleted widgets
- Add exports for new organized widgets
- Ensure single canonical export per component

---

## Validation & Testing

### Build & Test Commands

Run after each phase:

```bash
# 1. Code generation
dart run build_runner build --delete-conflicting-outputs

# 2. Static analysis
dart analyze

# 3. Run tests
flutter test

# 4. Manual testing
flutter run --dart-define FLUTTER_FLAVOR=dev

# 5. CI validation
# Push to PR and verify workflow passes
```

### Critical Path Testing Checklist

- [ ] Dashboard loads without errors
- [ ] Work order details displays correctly
- [ ] Theme switching (light/dark) works
- [ ] All button variants render properly
- [ ] Spacing/dimensions look consistent
- [ ] No ScreenUtil crashes on cold start

---

## Success Criteria

✅ **Zero CI violations** - Workflow passes with no hardcoded styling
✅ **All pages <300 lines** - Dashboard, details, documents under limit
✅ **Single source of truth** - DesignTokens for spacing, FSMThemeExtension for colors
✅ **No crashes** - App runs without ScreenUtil timing errors
✅ **Consistent UI** - All screens use design tokens, spacing feels uniform

---

## Estimated Timeline

**Big bang approach**: 2-3 weeks intensive work

- Phase 1 (Foundation): 3-4 days
- Phase 2 (Widgets): 4-5 days
- Phase 3 (Pages): 6-8 days
- Phase 4 (CI): 1 day
- Phase 5 (Cleanup): 1-2 days

**Note**: Requires focused, uninterrupted development time and team coordination to avoid merge conflicts.

---

## Common Migration Patterns

### Pattern 1: Hardcoded Colors → Theme

```dart
// ❌ BEFORE
Container(color: Colors.blue, child: Text('Hello', style: TextStyle(color: Colors.white)))

// ✅ AFTER
Container(
  color: Theme.of(context).colorScheme.primary,
  child: Text('Hello', style: Theme.of(context).textTheme.bodyLarge?.copyWith(
    color: Theme.of(context).colorScheme.onPrimary,
  )),
)
```

### Pattern 2: Raw EdgeInsets → REdgeInsets

```dart
// ❌ BEFORE
Padding(padding: EdgeInsets.all(16), child: Text('Hello'))

// ✅ AFTER
Padding(padding: REdgeInsets.all(DesignTokens.space4), child: Text('Hello'))
```

### Pattern 3: Direct .w/.h → DesignTokens

```dart
// ❌ BEFORE
SizedBox(height: 8.h, width: 16.w)

// ✅ AFTER
DesignTokens.verticalSpaceSmall  // or RSizedBox(height: DesignTokens.space2)
```

### Pattern 4: Domain Colors

```dart
// ❌ BEFORE
Container(color: AppColors.statusPending)

// ✅ AFTER
Container(color: context.fsmTheme.statusPending)
```

---

## References

- Spec documents: `.kiro/specs/flutter-design-system-refactor/`
- Tasks tracking: `.kiro/specs/flutter-design-system-refactor/tasks.md`
- Requirements: `.kiro/specs/flutter-design-system-refactor/requirements.md`
- Design details: `.kiro/specs/flutter-design-system-refactor/design.md`
- use fetch and context7 to fetch flutter offical docs on this
- Don't hard code anything in UI and Use Theme.of(context) for colours, dimensions and typographt etc
- Do't hardcode colours, fontsizes, spacing and dimensions, use ThemeData instead using BuildContext
- Always use Widegts from @lib/core/widgets/ in Presentation layer Widgets, and Make Sure Widgets are Resuable and are Class Widgets moslty. use context 7 to fetch best practices for doingo this