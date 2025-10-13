import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    // Splash route
    AutoRoute(
      page: SplashRoute.page,
      path: '/',
      initial: true,
    ),
    
    // Auth routes
    AutoRoute(
      page: LoginRoute.page,
      path: '/login',
    ),
    
    // Main app routes with auth guard
    AutoRoute(
      page: MainNavigationWrapperRoute.page,
      path: '/main',
      // guards: [AuthGuard], // TODO: Implement auth guard
      children: [
        AutoRoute(
          page: DashboardRoute.page,
          path: '/dashboard',
        ),
        AutoRoute(
          page: WorkOrdersRoute.page,
          path: '/work-orders',
        ),
        AutoRoute(
          page: CalendarRoute.page,
          path: '/calendar',
        ),
        AutoRoute(
          page: DocumentsRoute.page,
          path: '/documents',
        ),
        AutoRoute(
          page: PartsRoute.page,
          path: '/parts',
        ),
        AutoRoute(
          page: ProfileRoute.page,
          path: '/profile',
        ),
      ],
    ),
    
    // Detail routes
    AutoRoute(
      page: WorkOrderDetailsRoute.page,
      path: '/work-order/:workOrderId',
      // guards: [AuthGuard], // TODO: Implement auth guard
    ),
    AutoRoute(
      page: DocumentViewerRoute.page,
      path: '/document/:documentId',
      // guards: [AuthGuard], // TODO: Implement auth guard
    ),
  ];
}

@AutoRouteGuard()
class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // TODO: Implement auth check logic
    // For now, allow all navigation
    resolver.next();
  }
}

// Placeholder route pages - these will be implemented in later tasks
@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Login Page'),
      ),
    );
  }
}

@RoutePage()
class MainNavigationWrapperPage extends StatelessWidget {
  const MainNavigationWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Main Navigation'),
      ),
    );
  }
}

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Dashboard'),
      ),
    );
  }
}

@RoutePage()
class WorkOrdersPage extends StatelessWidget {
  const WorkOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Work Orders'),
      ),
    );
  }
}

@RoutePage()
class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Calendar'),
      ),
    );
  }
}

@RoutePage()
class DocumentsPage extends StatelessWidget {
  const DocumentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Documents'),
      ),
    );
  }
}

@RoutePage()
class PartsPage extends StatelessWidget {
  const PartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Parts'),
      ),
    );
  }
}

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Profile'),
      ),
    );
  }
}

@RoutePage()
class WorkOrderDetailsPage extends StatelessWidget {
  final String workOrderId;
  
  const WorkOrderDetailsPage({
    super.key,
    @pathParam required this.workOrderId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Work Order Details: $workOrderId'),
      ),
    );
  }
}

@RoutePage()
class DocumentViewerPage extends StatelessWidget {
  final String documentId;
  
  const DocumentViewerPage({
    super.key,
    @pathParam required this.documentId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Document Viewer: $documentId'),
      ),
    );
  }
}