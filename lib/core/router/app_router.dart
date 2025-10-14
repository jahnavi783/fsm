import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import '../../features/auth/data/datasources/auth_local_datasource.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
@singleton
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
          children: [
            AutoRoute(
              page: DashboardRoute.page,
              path: 'dashboard',
              initial: true,
            ),
            AutoRoute(
              page: CalendarRoute.page,
              path: 'calendar',
            ),
            AutoRoute(
              page: DocumentsRoute.page,
              path: 'documents',
            ),
            AutoRoute(
              page: PartsRoute.page,
              path: 'parts',
            ),
            AutoRoute(
              page: ProfileRoute.page,
              path: 'profile',
            ),
          ],
        ),

        // Detail routes with deep linking support
        AutoRoute(
          page: WorkOrderDetailsRoute.page,
          path: '/work-order/:workOrderId',
        ),
        AutoRoute(
          page: DocumentViewerRoute.page,
          path: '/document/:documentId',
        ),
        AutoRoute(
          page: PartDetailsRoute.page,
          path: '/part/:partId',
        ),

        // Debug routes (only available in debug mode)
        AutoRoute(
          page: DeveloperOptionsRoute.page,
          path: '/developer-options',
        ),
      ];
}

@injectable
class AuthGuard extends AutoRouteGuard {
  final AuthLocalDataSource _localDataSource;

  AuthGuard(this._localDataSource);

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    try {
      final accessToken = await _localDataSource.getAccessToken();
      final user = await _localDataSource.getUser();

      if (accessToken != null && user != null) {
        // User is authenticated, allow navigation
        resolver.next();
      } else {
        // User is not authenticated, redirect to login
        router.navigateNamed('/login');
      }
    } catch (e) {
      // Error checking authentication, redirect to login
      router.navigateNamed('/login');
    }
  }
}

// Navigation helpers and extensions
extension AppRouterExtension on StackRouter {
  /// Navigate to work order details with deep linking support
  Future<void> navigateToWorkOrder(int workOrderId) {
    return push(WorkOrderDetailsRoute(workOrderId: workOrderId));
  }

  /// Navigate to document viewer with deep linking support
  Future<void> navigateToDocument(int documentId) {
    return push(DocumentViewerRoute(documentId: documentId));
  }

  /// Navigate to part details with deep linking support
  Future<void> navigateToPart(int partId) {
    return push(PartDetailsRoute(partId: partId));
  }

  /// Navigate to main app after authentication
  Future<void> navigateToMainApp() {
    return navigateNamed('/main');
  }

  /// Navigate to login and clear stack
  Future<void> navigateToLogin() {
    return navigateNamed('/login');
  }
}
