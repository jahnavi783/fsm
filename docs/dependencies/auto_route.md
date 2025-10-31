# Auto Route Documentation (v10.2.0+)

**Source**: Context7 Documentation from `/milad-akarie/auto_route_library`
**Fetched**: 2025-01-31
**Package**: auto_route ^10.2.0

---

## Table of Contents

1. [Overview](#overview)
2. [Installation](#installation)
3. [Basic Setup](#basic-setup)
4. [Core Concepts](#core-concepts)
5. [Navigation Methods](#navigation-methods)
6. [Advanced Features](#advanced-features)
   - [Route Guards](#route-guards)
   - [Nested Routes](#nested-routes)
   - [Tab Navigation](#tab-navigation)
   - [Deep Linking](#deep-linking)
   - [Declarative Navigation](#declarative-navigation)
7. [Configuration](#configuration)
8. [Best Practices](#best-practices)

---

## Overview

Auto Route is a Flutter navigation package that simplifies route setup through code generation, enabling:

- **Strongly-typed navigation** with compile-time safety
- **Code generation** for routes and navigation logic
- **Deep linking** support out of the box
- **Route guards** for authentication and authorization
- **Nested routing** for complex navigation flows
- **Tab navigation** with state preservation
- **Declarative routing** based on app state

---

## Installation

### 1. Add Dependencies

```yaml
dependencies:
  auto_route: [latest-version]

dev_dependencies:
  auto_route_generator: [latest-version]
  build_runner: [latest-version]
```

### 2. Run Code Generation

```bash
# One-time generation
dart run build_runner build

# Watch mode (recommended during development)
dart run build_runner watch
```

---

## Basic Setup

### 1. Annotate Your Pages

```dart
import 'package:auto_route/auto_route.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
```

### 2. Define Router Configuration

```dart
import 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart'; // Generated file

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {

  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: BookDetailsRoute.page, path: '/books/:id'),
  ];

  @override
  List<AutoRouteGuard> get guards => [
    // Optional: Add global guards
  ];
}
```

### 3. Integrate with MaterialApp

```dart
class App extends StatelessWidget {
  // Initialize router outside build method
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
    );
  }
}
```

---

## Core Concepts

### Route Definition

Routes are defined using `AutoRoute` with various configuration options:

```dart
AutoRoute(
  page: BookDetailsRoute.page,
  path: '/books/:id',              // Optional: Custom path
  guards: [AuthGuard()],           // Optional: Route-specific guards
  children: [/* nested routes */], // Optional: Child routes
)
```

### Generated PageRouteInfo

For each `@RoutePage()`, AutoRoute generates a `PageRouteInfo`:

```dart
class BookDetailsRoute extends PageRouteInfo<BookDetailsRouteArgs> {
  BookDetailsRoute({
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
    BookDetailsRoute.name,
    args: BookDetailsRouteArgs(id: id),
    initialChildren: children,
  );

  static const String name = 'BookDetailsRoute';
  static const PageInfo page = PageInfo(name, builder: ...);
}
```

### Route Naming Convention

Use `replaceInRouteName` to automatically rename routes:

```dart
@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  // HomeScreen becomes HomeRoute
  // BookDetailsPage becomes BookDetailsRoute
}
```

---

## Navigation Methods

### Basic Navigation

```dart
// Get router from context
final router = context.router;
// Or
final router = AutoRouter.of(context);

// Push new route
router.push(BookDetailsRoute(id: 1));

// Push using path
router.pushPath('/books/1');

// Replace current route
router.replace(BookDetailsRoute(id: 1));

// Navigate (push or update if exists)
router.navigate(BookDetailsRoute(id: 1));
```

### Stack Manipulation

```dart
// Pop current route
context.router.pop();

// Pop top-most route
context.router.popTop();

// Maybe pop (respects WillPopScope)
context.router.maybePop();

// Pop until condition
context.router.popUntil((route) => route.settings.name == 'HomeRoute');

// Pop until route name
context.router.popUntilRouteWithName('HomeRoute');

// Pop until root
context.router.popUntilRoot();

// Push multiple routes
router.pushAll([
  BooksListRoute(),
  BookDetailsRoute(id: 1),
]);

// Replace entire stack
router.replaceAll([
  HomeRoute(),
  BooksListRoute(),
]);
```

### Context Extensions

```dart
// Convenience methods
context.pushRoute(BookDetailsRoute(id: 1));
context.replaceRoute(BookDetailsRoute(id: 1));
context.navigateTo(BookDetailsRoute(id: 1));
context.navigateToPath('/books/1');
context.back();
context.pop();
context.maybePop();
```

### Named Route Navigation

```dart
// By route name
router.push(NamedRoute('BookDetailsRoute', params: {'id': 1}));

// By path
router.pushPath('/books/1');
router.replacePath('/books/1');
router.navigatePath('/books/1');
```

---

## Advanced Features

### Route Guards

Route guards control access to routes based on conditions.

#### 1. Define a Guard

```dart
class AuthGuard extends AutoRouteGuard {

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (authenticated) {
      // Allow navigation
      resolver.next(true);
    } else {
      // Redirect to login
      resolver.redirectUntil(
        LoginRoute(
          onResult: (didLogin) {
            // Resume or abort navigation
            resolver.next(didLogin);
          },
        ),
      );
    }
  }
}
```

#### 2. Apply Guard Globally

```dart
@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  late final List<AutoRouteGuard> guards = [
    AuthGuard(),
    // Or use simple guard
    AutoRouteGuard.simple((resolver, router) {
      if (isAuthenticated || resolver.routeName == LoginRoute.name) {
        resolver.next();
      } else {
        resolver.redirectUntil(
          LoginRoute(onResult: (didLogin) => resolver.next(didLogin)),
        );
      }
    }),
  ];
}
```

#### 3. Apply Guard to Specific Route

```dart
AutoRoute(
  page: ProfileRoute.page,
  guards: [AuthGuard()],
)
```

#### 4. Re-evaluate Guards on State Change

```dart
class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void login() {
    _isLoggedIn = true;
    notifyListeners(); // Triggers guard re-evaluation
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}

// In MaterialApp.router
MaterialApp.router(
  routerConfig: _appRouter.config(
    reevaluateListenable: authProvider,
  ),
);
```

#### 5. Loading Indicator with ActiveGuardObserver

```dart
class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    final guardObserver = context.router.activeGuardObserver;

    guardObserver.addListener(() {
      setState(() {
        isLoading = guardObserver.guardInProgress;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CircularProgressIndicator()
        : YourContent();
  }
}
```

---

### Nested Routes

#### Define Nested Routes

```dart
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: '/dashboard',
      page: DashboardRoute.page,
      children: [
        AutoRoute(path: 'users', page: UsersRoute.page),
        AutoRoute(path: 'posts', page: PostsRoute.page),
        AutoRoute(path: 'settings', page: SettingsRoute.page),
      ],
    ),
  ];
}
```

#### Render Nested Routes

```dart
@RoutePage()
class DashboardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            NavLink(label: 'Users', destination: const UsersRoute()),
            NavLink(label: 'Posts', destination: const PostsRoute()),
            NavLink(label: 'Settings', destination: const SettingsRoute()),
          ],
        ),
        Expanded(
          // Nested routes rendered here
          child: AutoRouter(),
        ),
      ],
    );
  }
}
```

#### Set Initial Nested Route

```dart
AutoRoute(
  path: '/dashboard',
  page: DashboardRoute.page,
  children: [
    RedirectRoute(path: '', redirectTo: 'users'),
    AutoRoute(path: 'users', page: UsersRoute.page),
    AutoRoute(path: 'posts', page: PostsRoute.page),
  ],
)
```

---

### Tab Navigation

#### Using AutoTabsRouter

```dart
@RoutePage()
class DashboardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        UsersRoute(),
        PostsRoute(),
        SettingsRoute(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: const [
              BottomNavigationBarItem(label: 'Users', icon: Icon(Icons.people)),
              BottomNavigationBarItem(label: 'Posts', icon: Icon(Icons.article)),
              BottomNavigationBarItem(label: 'Settings', icon: Icon(Icons.settings)),
            ],
          ),
        );
      },
    );
  }
}
```

#### Using AutoTabsRouter.tabBar

```dart
@RoutePage()
class DashboardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: const [
        BooksTab(),
        ProfileTab(),
        SettingsTab(),
      ],
      builder: (context, child, controller) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(context.topRoute.name),
            bottom: TabBar(
              controller: controller,
              tabs: const [
                Tab(text: 'Books', icon: Icon(Icons.book)),
                Tab(text: 'Profile', icon: Icon(Icons.person)),
                Tab(text: 'Settings', icon: Icon(Icons.settings)),
              ],
            ),
          ),
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: const [
              BottomNavigationBarItem(label: 'Books', icon: Icon(Icons.book)),
              BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
              BottomNavigationBarItem(label: 'Settings', icon: Icon(Icons.settings)),
            ],
          ),
        );
      },
    );
  }
}
```

#### Simplified with AutoTabsScaffold

```dart
@RoutePage()
class DashboardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        UsersRoute(),
        PostsRoute(),
        SettingsRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(label: 'Users', icon: Icon(Icons.people)),
            BottomNavigationBarItem(label: 'Posts', icon: Icon(Icons.article)),
            BottomNavigationBarItem(label: 'Settings', icon: Icon(Icons.settings)),
          ],
        );
      },
    );
  }
}
```

---

### Deep Linking

#### Basic Deep Link Transformer

Strip prefixes from incoming deep links:

```dart
MaterialApp.router(
  routerConfig: _appRouter.config(
    deepLinkTransformer: (uri) {
      if (uri.path.startsWith('/prefix')) {
        return SynchronousFuture(
          uri.replace(path: uri.path.replaceFirst('/prefix', '')),
        );
      }
      return SynchronousFuture(uri);
    },
  ),
);
```

#### Using Built-in Prefix Stripper

```dart
MaterialApp.router(
  routerConfig: _appRouter.config(
    deepLinkTransformer: DeepLink.prefixStripper('prefix'),
  ),
);
```

#### Deep Link Builder for Validation

```dart
MaterialApp.router(
  routerConfig: _appRouter.config(
    deepLinkBuilder: (deepLink) {
      if (deepLink.path.startsWith('/products')) {
        // Allow this deep link
        return deepLink;
      } else {
        // Redirect to default
        return DeepLink.defaultPath;
        // Or: DeepLink.path('/')
        // Or: DeepLink([HomeRoute()])
      }
    },
  ),
);
```

---

### Declarative Navigation

Define routes based on application state:

```dart
@RoutePage()
class MyPage extends StatelessWidget {
  final Book? selectedBook;

  @override
  Widget build(BuildContext context) {
    return AutoRouter.declarative(
      routes: (handler) => [
        BookListRoute(),
        if (selectedBook != null)
          BookDetailsRoute(id: selectedBook!.id),
      ],
    );
  }
}
```

---

## Configuration

### Build Configuration (build.yaml)

```yaml
targets:
  $default:
    builders:
      # For @RoutePage annotations
      auto_route_generator:auto_route_generator:
        options:
          enable_cached_builds: true
        generate_for:
          - lib/ui/**_screen.dart

      # For @AutoRouterConfig annotations
      auto_route_generator:auto_router_generator:
        options:
          enable_cached_builds: true
          ignore_fore_file:
            - custom_lint_rule_1
            - custom_lint_rule_2
        generate_for:
          - lib/ui/router.dart
```

### Wildcard Routes

Handle unknown routes with wildcards:

```dart
// Global 404 handler
AutoRoute(
  path: '*',
  page: NotFoundRoute.page,
)

// With prefix
AutoRoute(
  path: '/profile/*',
  page: ProfileRoute.page,
)

// Redirect unknown routes
RedirectRoute(
  path: '*',
  redirectTo: '/',
)
```

### Custom Route Transitions

```dart
CustomRoute(
  page: LoginRoute.page,
  transitionsBuilder: TransitionsBuilders.slideBottom,
  durationInMilliseconds: 400,
)
```

### Empty Shell Routes

```dart
// Using helper
const BooksTab = EmptyShellRoute('BooksTab');
context.push(BooksTab());

// By extending AutoRouter
@RoutePage()
class MyShellPage extends AutoRouter {
  const MyShellPage({super.key});
}
```

---

## Best Practices

### 1. Initialize Router Outside Build

```dart
// ✅ GOOD
class App extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
    );
  }
}

// ❌ BAD
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter(); // Creates new instance on every rebuild
    return MaterialApp.router(
      routerConfig: appRouter.config(),
    );
  }
}
```

### 2. Use Dependency Injection for Global Access

```dart
// Setup with get_it
void main() {
  getIt.registerSingleton<AppRouter>(AppRouter());
  runApp(MyApp());
}

// Access anywhere
getIt<AppRouter>().push(SomeRoute());
```

### 3. Use Route Observers

```dart
class MyObserver extends AutoRouterObserver {

  @override
  void didPush(Route route, Route? previousRoute) {
    print('New route pushed: ${route.settings.name}');
  }

  // Only for tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    print('Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    print('Tab route re-visited: ${route.name}');
  }
}

// Add to router config
MaterialApp.router(
  routerConfig: _appRouter.config(
    navigatorObservers: () => [MyObserver()],
  ),
);
```

### 4. Simplify Route Awareness with Mixin

```dart
class BooksListPage extends State<BookListPage>
    with AutoRouteAwareStateMixin<BookListPage> {

  // Only for tab pages
  @override
  void didInitTabRoute(TabPageRoute? previousRoute) {
    // Tab was first visited
  }

  @override
  void didChangeTabRoute(TabPageRoute previousRoute) {
    // Tab was re-visited
  }

  // Only for stack pages
  @override
  void didPopNext() {
    // This page became visible after pop
  }

  @override
  void didPushNext() {
    // New page was pushed on top
  }
}
```

### 5. Path Parameter Inheritance

```dart
// Parent route with parameter
AutoRoute(
  path: '/product/:id',
  page: ProductRoute.page,
  children: [
    // Child inherits :id parameter
    AutoRoute(path: 'review', page: ProductReviewRoute.page),
  ],
)

// Access in child: /product/123/review
```

### 6. Use LeanBuilder for Faster Builds

```yaml
dev_dependencies:
  auto_route_generator: <latest-version>
  lean_builder: <latest-version>
```

---

## Migration Notes

### From v5 to v6

1. **Router Configuration**:
   - Replace `@MaterialAutoRouter`, `@CupertinoAutoRouter`, etc. with `@AutoRouterConfig()`
   - Move routes list from annotation to `routes` getter

2. **Route Definition**:
   - Add `@RoutePage()` annotation to all routable widgets
   - Routes now use `PageInfo` objects instead of `Type`

3. **Guards**:
   - Pass guards as instances instead of types

### From v8 to v9

1. **Global Guards**:
   - Override `guards` property instead of implementing `AutoRouteGuard`

2. **Modules**:
   - `AutoRouterConfig.module` is deprecated
   - Use normal router config and merge routes

---

## References

- **Official Repository**: https://github.com/milad-akarie/auto_route_library
- **Package**: https://pub.dev/packages/auto_route
- **Current Version**: 10.2.0+

---

**Generated from Context7 Documentation** | 2025-01-31
