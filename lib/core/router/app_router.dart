import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../features/auth/data/datasources/auth_local_datasource.dart';
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
          page: MainNavigationRoute.page,
          path: '/main',
          // guards: [AuthGuard], // TODO: Fix guard implementation
          children: [
            AutoRoute(
              page: DashboardRoute.page,
              path: '/dashboard',
              initial: true,
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
          // guards: [AuthGuard], // TODO: Fix guard implementation
        ),
        AutoRoute(
          page: DocumentViewerRoute.page,
          path: '/document/:documentId',
          // guards: [AuthGuard], // TODO: Fix guard implementation
        ),
      ];
}

@injectable
@AutoRouteGuard()
class AuthGuard extends AutoRouteGuard {
  final AuthLocalDataSource _localDataSource;

  AuthGuard(this._localDataSource);

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final accessToken = await _localDataSource.getAccessToken();
    final user = await _localDataSource.getUser();

    if (accessToken != null && user != null) {
      // User is authenticated, allow navigation
      resolver.next();
    } else {
      // User is not authenticated, redirect to login
      router.navigateNamed('/login');
    }
  }
}

// Placeholder route pages - these will be implemented in later tasks
@RoutePage()
class MainNavigationPage extends StatelessWidget {
  const MainNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Main Navigation - To be implemented'),
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
        child: Text('Dashboard - To be implemented'),
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
        child: Text('Work Orders - To be implemented'),
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
        child: Text('Calendar - To be implemented'),
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
        child: Text('Documents - To be implemented'),
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
        child: Text('Parts - To be implemented'),
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
        child: Text('Profile - To be implemented'),
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
        child: Text('Work Order Details: $workOrderId - To be implemented'),
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
        child: Text('Document Viewer: $documentId - To be implemented'),
      ),
    );
  }
}
