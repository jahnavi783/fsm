---
inclusion: always
---
---
inclusion: always
---

# Flutter FSM Project Guidelines

## Architecture Patterns

### Clean Architecture Structure
- Follow the established layered architecture: `core/`, `features/`
- Use BLoC pattern for state management with proper separation of concerns
- Implement dependency injection using `injectable` and `get_it`
- Use `auto_route` for navigation with proper route guards

### BLoC Best Practices
- Use `BlocBuilder` for UI rendering, `BlocListener` for side effects
- Implement `BlocSelector` and `context.select()` for fine-grained rebuilds
- Apply `buildWhen` conditions comparing specific state properties, not `runtimeType`
- Use `BlocBuildConditions` mixin for common patterns
- Maintain singleton BLoCs through dependency injection

## Design System & Theming

### Strict Theming Rules
- **NEVER** use direct `Colors.*` except `Colors.transparent`
- Access colors through `ThemeData.colorScheme` or `FSMThemeExtension`
- Use `theme.textTheme` for typography with responsive scaling
- Configure component themes for all Material widgets
- Implement both light and dark theme variants

### Responsive Design
- Use `flutter_screenutil` with design size `Size(390, 844)`
- Replace raw `EdgeInsets`/`SizedBox` with `REdgeInsets`/`RSizedBox`
- Access spacing through `AppDimensions` properties
- Ensure 48dp minimum touch targets for accessibility
- Support system `textScaleFactor` up to 200%

### Widget Organization
- Organize widgets in functional categories: `buttons/`, `inputs/`, `cards/`, `lists/`, `layout/`, `states/`, `navigation/`, `media/`
- Export all components through `widgets.dart` barrel file
- Eliminate duplicate implementations - one canonical component per type
- Keep page files under 300 lines by extracting complex UI to widgets

## Code Quality Standards

### Performance Optimization
- Use `const` constructors with `super.key` parameter
- Implement composition over inheritance for custom widgets
- Add `RepaintBoundary` to complex list items and cards
- Use method references instead of anonymous functions in build methods
- Implement `ListView.builder` for dynamic lists

### Code Generation
- Run build_runner with `--delete-conflicting-outputs` flag
- Follow generation order: freezed → json_serializable → hive_ce
- Use `hive_ce_generator` with proper type adapter configuration
- Configure `build.yaml` with freezed options: `map: true`, `copyWith: true`

## File Structure Conventions

### Import Organization
- Use barrel files for clean imports (`widgets.dart`, `blocs.dart`)
- Pages should only import shared UI via barrel files
- Group imports: Flutter SDK, packages, internal

### Naming Conventions
- Use snake_case for file names
- Use PascalCase for class names
- Use camelCase for variables and methods
- Prefix private members with underscore

## Development Workflow

### Testing Requirements
- Write golden tests for key pages (dashboard, work order details, documents)
- Include theme snapshot tests for light/dark variants
- Test BLoC optimization with buildWhen/listenWhen patterns
- Enforce import hygiene through lint rules

### Error Handling
- Use `Either<Failure, Success>` pattern for error handling
- Implement proper exception handling with custom exceptions
- Use `ErrorBoundaryWidget` for UI error boundaries
- Log errors through centralized logging service

## Network & Data

### API Integration
- Use `dio` with `retrofit` for API calls
- Implement proper interceptors for auth and logging
- Use Alice HTTP inspector in debug builds
- Handle network connectivity with `connectivity_plus`

### Local Storage
- Use `hive_ce` for local data persistence
- Implement proper cache management strategies
- Handle data synchronization between local and remote

## Security & Performance

### Security Practices
- Never commit sensitive data or API keys
- Use proper authentication interceptors
- Implement secure local storage practices

### Performance Monitoring
- Use performance services for monitoring
- Implement proper memory management
- Monitor frame performance in debug builds

- use contex7 and fetch MCP tools
- Always Fetch docs on libraies using context7 before using any library
- Use Best Practises and Production Ready Approach while developing
- Don't hardcode anything and try to have strict strong types in the codebase