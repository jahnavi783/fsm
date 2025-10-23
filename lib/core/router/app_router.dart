import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fsm/app.dart';
import 'package:injectable/injectable.dart';

import 'app_router.gr.dart';
import 'guards/auth_guard.dart';

@AutoRouterConfig()
@singleton
class AppRouter extends RootStackRouter {
  final AuthGuard authGuard;

  AppRouter({required this.authGuard});

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalNavigatorKey;

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
          guards: [authGuard],
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

        // Detail routes with deep linking support (protected)
        AutoRoute(
          page: WorkOrderDetailsRoute.page,
          path: '/work-order/:workOrderId',
          guards: [authGuard],
        ),
        AutoRoute(
          page: WorkOrderStartRoute.page,
          path: '/work-order/:workOrderId/start',
          guards: [authGuard],
        ),
        AutoRoute(
          page: DocumentViewerRoute.page,
          path: '/document/:documentId',
          guards: [authGuard],
        ),
        AutoRoute(
          page: PartDetailsRoute.page,
          path: '/part/:partId',
          guards: [authGuard],
        ),

        // Debug routes (publicly accessible in debug mode)
        AutoRoute(
          page: DeveloperOptionsRoute.page,
          path: '/developer-options',
        ),
      ];
}

// Navigation helpers and extensions
extension AppRouterExtension on StackRouter {
  /// Navigate to work order details with deep linking support
  Future<void> navigateToWorkOrder(int workOrderId) {
    return push(WorkOrderDetailsRoute(workOrderId: workOrderId));
  }

  /// Navigate to work order start page with deep linking support
  Future<void> navigateToWorkOrderStart(int workOrderId) {
    return push(WorkOrderStartRoute(workOrderId: workOrderId));
  }

  /// Navigate to document viewer with deep linking support
  Future<void> navigateToDocument(int documentId) {
    return push(DocumentViewerRoute(documentId: documentId));
  }

  /// Navigate to part details with deep linking support
  Future<void> navigateToPart(int partId) {
    return push(PartDetailsRoute(partId: partId));
  }

  /// Navigate to main app after authentication (replaces current route)
  /// This prevents back navigation to splash/login screens
  Future<void> navigateToMainApp() {
    return replacePath('/main');
  }

  /// Navigate to login and clear stack
  Future<void> navigateToLogin() {
    return replacePath('/login');
  }
}
