import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fsm/app.dart';
import 'package:fsm/features/work_orders/domain/entities/location_entity.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';
import 'package:injectable/injectable.dart';

import 'app_router.gr.dart';
import 'guards/auth_guard.dart';

@AutoRouterConfig()
@preResolve
@singleton
class AppRouter extends RootStackRouter {
  final AuthGuard authGuard;

  AppRouter._(this.authGuard);

  @FactoryMethod()
  static Future<AppRouter> create(AuthGuard authGuard) async {
    final router = AppRouter._(authGuard);
    // Pre-warm router configuration if needed
    return router;
  }

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
            // Work Orders tab with nested routes
            AutoRoute(
              page: DashboardRoute.page,
              path: 'work-orders',
              initial: true,
              children: [
                AutoRoute(
                  page: WorkOrderDetailsRoute.page,
                  path: ':workOrderId',
                ),
                AutoRoute(
                  page: WorkOrderStartRoute.page,
                  path: ':workOrderId/start',
                ),
                AutoRoute(
                  page: WorkOrderCompleteRoute.page,
                  path: ':workOrderId/complete',
                ),
              ],
            ),
            AutoRoute(
              page: CalendarRoute.page,
              path: 'calendar',
            ),
            // Documents tab with nested routes
            AutoRoute(
              page: DocumentsRoute.page,
              path: 'documents',
              children: [
                AutoRoute(
                  page: DocumentViewerRoute.page,
                  path: ':documentId',
                ),
              ],
            ),
            // Parts tab with nested routes
            AutoRoute(
              page: PartsRoute.page,
              path: 'parts',
              children: [
                AutoRoute(
                  page: PartDetailsRoute.page,
                  path: ':partNumber',
                ),
              ],
            ),
            AutoRoute(
              page: ProfileRoute.page,
              path: 'profile',
            ),
          ],
        ),

        // Standalone routes with deep linking support (protected)
        // These provide direct deep link access outside of tab navigation
        AutoRoute(
          page: WorkOrderDetailsRoute.page,
          path: '/work-orders/:workOrderId',
          guards: [authGuard],
        ),
        AutoRoute(
          page: WorkOrderStartRoute.page,
          path: '/work-orders/:workOrderId/start',
          guards: [authGuard],
        ),
        AutoRoute(
          page: WorkOrderCompleteRoute.page,
          path: '/work-orders/:workOrderId/complete',
          guards: [authGuard],
        ),
        AutoRoute(
          page: DocumentViewerRoute.page,
          path: '/documents/:documentId',
          guards: [authGuard],
        ),
        AutoRoute(
          page: PartDetailsRoute.page,
          path: '/parts/:partNumber',
          guards: [authGuard],
        ),
        AutoRoute(
          page: ChatbotRoute.page,
          path: '/chatbot',
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

  /// Navigate to work order completion page
  Future<void> navigateToWorkOrderComplete({
    required int workOrderId,
    WorkOrderEntity? workOrder,
    LocationEntity? currentLocation,
  }) {
    return push(WorkOrderCompleteRoute(
      workOrderId: workOrderId,
      workOrder: workOrder,
      currentLocation: currentLocation,
    ));
  }

  /// Navigate to document viewer with deep linking support
  Future<void> navigateToDocument(String documentId) {
    return push(DocumentViewerRoute(documentId: documentId));
  }

  /// Navigate to part details with deep linking support
  /// Note: partNumber is used as the path parameter for deep linking
  Future<void> navigateToPart(String partNumber) {
    return push(PartDetailsRoute(partNumber: partNumber));
  }

  /// Navigate to chatbot/AI assistant page
  Future<void> navigateToChatbot() {
    return push(const ChatbotRoute());
  }

  /// Navigate to main app after authentication (replaces entire stack)
  /// This prevents back navigation to splash/login screens
  Future<void> navigateToMainApp() {
    return replaceAll([const MainNavigationRoute()]);
  }

  /// Navigate to login and clear stack
  Future<void> navigateToLogin() {
    return replaceAll([const LoginRoute()]);
  }
}
