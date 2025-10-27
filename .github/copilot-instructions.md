## Copilot project instructions — FSM Flutter app

Context: Flutter/Dart mobile app (SDK 3.6+) for Field Service Management. Clean Architecture with feature-first modules, heavy code generation, type-safe routing, DI, offline-first caching. See `CLAUDE.md` for deep technical background; this file is your quick operator manual.

Architecture and patterns
- Layers per feature: `features/<feature>/{data,domain,presentation}` with shared infra in `lib/core/**`.
- DI via Injectable + GetIt. Entry: `lib/core/di/injection.dart` with environments `dev|staging|prod` (see `lib/core/config/*`). Use `@injectable`, `@module` providers, `@singleton`.
- Routing via Auto Route v10. Pages use `@RoutePage()`. Router config in `lib/core/router/app_router.dart` with generated `app_router.gr.dart`. Use `pushPath()` not deprecated `pushNamed()`.
- Networking: `Dio` configured in `core/network/dio_client.dart` with `AuthInterceptor` (JWT attach, 401 auto-refresh). APIs via Retrofit interfaces in feature `data/api/*`.
- Data flow: Repository pattern returning Either/Failure types. DTOs in `data/models`, map to domain entities in `domain/entities`.
- Offline-first: Hive boxes in `core/storage/hive_service.dart` and box names in `core/constants/hive_boxes.dart`.
- UI: BLoC for state; ScreenUtil is mandatory for all sizes: use `.w`, `.h`, `.sp`, `.r`. Initialize in `main_common.dart`.

Product scope and roadmap (.kiro)
- Specs live under `.kiro/specs/fsm-mobile-app/{requirements.md,design.md,tasks.md}`; treat them as source of truth for flows/acceptance criteria.
- Feature maturity: Auth, Work Orders, Documents are in place; Parts, Calendar, Profile are planned next (see tasks 6–9). Prefer extending existing features before starting new modules unless explicitly requested.
- Critical flows: JWT login with auto-refresh; work order lifecycle (start/pause/resume/complete) REQUIRES GPS capture; offline-first usage with later sync; document viewing and offline downloads.
- Offline rules: when offline, load cached data (Hive), queue updates; on reconnect, sync pending; server wins on conflicts; warn if cache staleness >24h.
- Performance constraints: target <3s startup on standard devices; show loaders for slow APIs and allow cancellation; keep memory growth reasonable; use shimmer for loading states.

Build, run, and environments
- Default entry exports dev: `lib/main.dart -> main_dev.dart`. Environment switching via separate mains: `main_dev.dart`, `main_staging.dart`, `main_prod.dart` calling `mainCommon(Environment.*)` after `AppConfig.setEnvironment(...)`.
- Convenience scripts: `scripts/run_*.sh` and `scripts/build_*.sh` use flavors and targets.
  - Run dev: `flutter run --flavor dev --target lib/main_dev.dart` or `./scripts/run_dev.sh`
  - Run staging: `flutter run --flavor staging --target lib/main_staging.dart` or `./scripts/run_staging.sh`
  - Run prod: `flutter run --flavor prod --target lib/main_prod.dart --release` or `./scripts/run_prod.sh`
  - Build dev APK: `flutter build apk --flavor dev --target lib/main_dev.dart` or `./scripts/build_android_dev.sh`

Code generation workflow (critical)
- Keep a generator running during dev: `dart run build_runner watch --delete-conflicting-outputs`.
- Regenerate after changing: `@freezed` models, `@injectable` classes/modules, `@RestApi()` clients, `@RoutePage()` pages, Hive types, or assets config.
- Generated DI lives in `lib/core/di/injection.config.dart`; router in `lib/core/router/app_router.gr.dart`; Retrofit `.g.dart` per client.

Routing conventions
- Declare routes in `AppRouter.routes`. Use guards via `@AutoRouteGuard()` (see `AuthGuard` in `core/router/app_router.dart`). Annotate pages with `@RoutePage()` and path params with `@PathParam`.
- Navigate via `context.router.push(const DashboardRoute())`, `router.navigatePath('/login')`.

Networking conventions
- All non-auth requests carry `Authorization: Bearer <token>`; 401 triggers refresh in `AuthInterceptor` using `AuthLocalDataSource`. Don’t duplicate token logic in features.
- Use Retrofit clients under `features/*/data/api/` and return typed responses; map to domain in repositories.

Storage and auth
- Tokens and user are persisted in Hive `auth_box` via `AuthLocalDataSource`. Use its API: `saveTokens`, `getAccessToken`, `getUser`, `clearAuthData`.
- Box names and typeIds are centralized in `core/constants/hive_boxes.dart`.

UI and responsiveness
- ScreenUtil is enforced. Never use raw numbers for sizes. Example: `padding: EdgeInsets.all(16.w)`, `fontSize: 14.sp`, `borderRadius: 8.r`.
- Use `AppDimensions` constants when available: `paddingMedium`, `radiusSmall`, `buttonHeight`, etc.
- Use `AppColors` for all colors, never hardcode: `color: AppColors.primary`, `backgroundColor: AppColors.surface`.
- Flutter 3.6+ API: Use `.withValues(alpha: 0.5)` NOT deprecated `.withOpacity(0.5)`.
- Example pages and widgets live under `features/*/presentation/**`.

Critical coding patterns
- Async safety: Always check `if (!mounted) return;` before using `context` after async gaps (await calls).
- Logging: Use `LoggingService.instance.debug/info/warning/error()` instead of `print()` in production code.
- Navigation: Use `context.router.pushPath('/path')` or type-safe routes like `context.router.push(DashboardRoute())`. Avoid deprecated `pushNamed()`.
- Color opacity: Modern API is `color.withValues(alpha: 0.5)` not `color.withOpacity(0.5)`.
- Repository DI: Always annotate repository implementations with `@Injectable(as: IRepositoryInterface)` for clean abstraction.

Testing and linting
- Tests run with `flutter test`. Widget tests follow BLoC injection via `BlocProvider.value`.
- Lints: `analysis_options.yaml` extends `flutter_lints`. Prefer ScreenUtil in all UI.

Where to look for examples
- Router and guards: `lib/core/router/app_router.dart`.
- DI and network: `lib/core/di/injection.dart`, `lib/core/network/dio_client.dart`, `lib/core/network/auth_interceptor.dart`.
- Feature pattern: `lib/features/work_orders/**` with Retrofit client, BLoC, and UI page `presentation/pages/work_order_details_page.dart`.
- Env config: `lib/core/config/*`.
- FSM component library: `lib/core/widgets/` - use prefixed components (FSMCard, FSMAppBar, FSMActionButton) for consistency.
- Theme and dimensions: `lib/core/theme/app_colors.dart`, `lib/core/theme/app_dimensions.dart` - reference these for all styling.

Gotchas
- If DI types aren't found or routes fail to build, re-run build_runner. Ensure `Environment.*` string matches Injectable environment names.
- Location is required before work order state transitions; BLoC emits `locationError` otherwise (see work order details page).
- If assets generation is configured via `flutter_gen`, prefer build_runner integration; outputs may be under `lib/gen` or `lib/build_gen` per `build.yaml`.
- Asset generator may be disabled in dev_dependencies; if so, keep `build_runner watch` running and reference assets directly until re-enabled.
- Use modern Flutter 3.6+ APIs: `.withValues(alpha: ...)` not `.withOpacity(...)`, `pushPath()` not `pushNamed()`.
- Always add `if (!mounted) return;` check after async operations before using BuildContext.
- Never use `print()` in code - use `LoggingService` with appropriate severity level and tag.

Quick start for new code
- Create feature folders; define `@freezed` entities/DTOs; add Retrofit API; implement repository; wire DI annotations; add BLoC/events/states; add `@RoutePage()` UI; register route; run build_runner; use ScreenUtil everywhere.
