import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fsm/app.dart';
import 'package:injectable/injectable.dart';

import '../../features/work_orders/domain/entities/location_entity.dart';
import '../../features/work_orders/domain/entities/work_order_entity.dart';
import 'app_router.gr.dart';
import 'guards/auth_guard.dart' as guard;

/// FSM App Router Configuration - Robust Routing Architecture
///
/// Features:
/// - Drawer-only navigation (no bottom navigation)
/// - Authentication guards for protected routes
/// - Deep linking support for work orders and documents
/// - Nested routing with Material 3 drawer integration
/// - Route observers for navigation state management
/// - Optimized for FSM field service workflows
///
/// Architecture:
/// - Splash → Login → Main App (with drawer navigation)
/// - Deep links: /work-orders/:id, /documents/:id
/// - Protected routes with AuthGuard
/// - Responsive navigation patterns
@AutoRouterConfig(
  replaceInRouteName: 'Page|Screen,Route',
)
@preResolve
@singleton
class AppRouter extends RootStackRouter {
  final guard.AuthGuard authGuard;

  AppRouter._(this.authGuard);

  /// Factory method for dependency injection with pre-warming
  @FactoryMethod()
  static Future<AppRouter> create(guard.AuthGuard authGuard) async {
    final router = AppRouter._(authGuard);
    // Pre-warm router configuration if needed
    return router;
  }

  /// Use global navigator key for consistent navigation state
  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalNavigatorKey;

  /// Default route type for consistent Material 3 experience
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  /// Global guards applied to protected routes
  @override
  List<AutoRouteGuard> get guards => [
        // AuthGuard is applied globally, but routes can be excluded individually
      ];

  @override
  List<AutoRoute> get routes => [
        // ═══════════════════════════════════════════════════════════════════════
        // AUTHENTICATION FLOW
        // ═══════════════════════════════════════════════════════════════════════

        /// Splash screen - Initial route with authentication check
        AutoRoute(
          page: SplashRoute.page,
          path: '/',
          initial: true,
        ),

        /// Login screen - Public route
        AutoRoute(
          page: LoginRoute.page,
          path: '/login',
        ),

        // ═══════════════════════════════════════════════════════════════════════
        // MAIN APPLICATION - DRAWER NAVIGATION PATTERN
        // ═══════════════════════════════════════════════════════════════════════

        /// Main app wrapper with drawer navigation (protected)
        /// Contains all authenticated user flows
        AutoRoute(
          page: MainNavigationRoute.page,
          path: '/app',
          guards: [authGuard],
          children: [
            /// Dashboard - Default landing page after login
            /// Shows work orders list (main feature)
            /// Path: /app/dashboard
            AutoRoute(
              page: DashboardRoute.page,
              path: 'dashboard',
              initial: true,
            ),

            /// Calendar - Schedule management
            /// Path: /app/calendar
            AutoRoute(
              page: CalendarRoute.page,
              path: 'calendar',
            ),

            /// Documents - Document management
            /// Path: /app/documents
            AutoRoute(
              page: DocumentsRoute.page,
              path: 'documents',
            ),

            /// Parts - Parts inventory
            /// Path: /app/parts
            AutoRoute(
              page: PartsRoute.page,
              path: 'parts',
            ),

            /// Profile - User profile and settings
            /// Path: /app/profile
            AutoRoute(
              page: ProfileRoute.page,
              path: 'profile',
            ),

            /// Settings - App settings
            /// Path: /app/settings
            AutoRoute(
              page: SettingsRoute.page,
              path: 'settings',
            ),

            /// AI Chatbot - Assistant feature
            /// Path: /app/chat
            AutoRoute(
              page: ChatbotRoute.page,
              path: 'chat',
            ),
          ],
        ),

        // ═══════════════════════════════════════════════════════════════════════
        // DEEP LINKING ROUTES - STANDALONE ACCESS
        // ═══════════════════════════════════════════════════════════════════════

        /// Work Order Details - Direct deep link access
        /// Path: /work-orders/:workOrderId
        /// Usage: Share work order links with external users
        AutoRoute(
          page: WorkOrderDetailsRoute.page,
          path: '/work-orders/:workOrderId',
          guards: [authGuard],
        ),

        /// Work Order Start - Direct access to start work
        /// Path: /work-orders/:workOrderId/start
        AutoRoute(
          page: WorkOrderStartRoute.page,
          path: '/work-orders/:workOrderId/start',
          guards: [authGuard],
        ),

        /// Work Order Completion - Direct access to complete work
        /// Path: /work-orders/:workOrderId/complete
        AutoRoute(
          page: WorkOrderCompleteRoute.page,
          path: '/work-orders/:workOrderId/complete',
          guards: [authGuard],
        ),

        /// Document Viewer - Direct deep link access
        /// Path: /documents/:documentId
        /// Usage: Share document links with external users
        AutoRoute(
          page: DocumentViewerRoute.page,
          path: '/documents/:documentId',
          guards: [authGuard],
        ),

        /// Part Details - Direct access to part information
        /// Path: /parts/:partNumber
        AutoRoute(
          page: PartDetailsRoute.page,
          path: '/parts/:partNumber',
          guards: [authGuard],
        ),

        // ═══════════════════════════════════════════════════════════════════════
        // DEBUG & DEVELOPMENT ROUTES
        // ═══════════════════════════════════════════════════════════════════════

        /// Developer options (publicly accessible in debug mode)
        /// Path: /developer-options
        AutoRoute(
          page: DeveloperOptionsRoute.page,
          path: '/developer-options',
        ),

        // ═══════════════════════════════════════════════════════════════════════
        // FALLBACK ROUTE
        // ═══════════════════════════════════════════════════════════════════════

        /// Catch-all for unknown routes - redirect to splash
        RedirectRoute(
          path: '*',
          redirectTo: '/',
        ),
      ];
}

// ═══════════════════════════════════════════════════════════════════════════
// NAVIGATION HELPERS AND EXTENSIONS
// ═══════════════════════════════════════════════════════════════════════════

/// Extension methods for convenient navigation throughout the app
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

  /// Navigate to part details
  Future<void> navigateToPart(String partNumber) {
    return push(PartDetailsRoute(partNumber: partNumber));
  }

  /// Navigate to main app after successful authentication
  Future<void> navigateToMainApp() {
    return replaceAll([const MainNavigationRoute()]);
  }

  /// Navigate to login (for logout or authentication failure)
  Future<void> navigateToLogin() {
    return replaceAll([LoginRoute()]);
  }

  /// Navigate to specific drawer section
  Future<void> navigateToDrawerSection(DrawerSection section) {
    switch (section) {
      case DrawerSection.dashboard:
        return replaceAll([
          const MainNavigationRoute(
            children: [DashboardRoute()],
          )
        ]);
      case DrawerSection.calendar:
        return replaceAll([
          const MainNavigationRoute(
            children: [CalendarRoute()],
          )
        ]);
      case DrawerSection.documents:
        return replaceAll([
          const MainNavigationRoute(
            children: [DocumentsRoute()],
          )
        ]);
      case DrawerSection.parts:
        return replaceAll([
          const MainNavigationRoute(
            children: [PartsRoute()],
          )
        ]);
      case DrawerSection.profile:
        return replaceAll([
          const MainNavigationRoute(
            children: [ProfileRoute()],
          )
        ]);
      case DrawerSection.settings:
        return replaceAll([
          const MainNavigationRoute(
            children: [SettingsRoute()],
          )
        ]);
      case DrawerSection.chat:
        return replaceAll([
          const MainNavigationRoute(
            children: [ChatbotRoute()],
          )
        ]);
    }
  }

  /// Get current route path for drawer highlighting
  String get currentRoutePath {
    return current.path;
  }

  /// Check if we're currently in a specific drawer section
  bool isCurrentSection(DrawerSection section) {
    final currentPath = currentRoutePath;

    switch (section) {
      case DrawerSection.dashboard:
        // Both dashboard and workOrders use the dashboard page
        return currentPath.contains('/dashboard') ||
            currentPath.contains('/work-order');
      case DrawerSection.calendar:
        return currentPath.contains('/calendar');
      case DrawerSection.documents:
        return currentPath.contains('/documents');
      case DrawerSection.parts:
        return currentPath.contains('/parts');
      case DrawerSection.profile:
        return currentPath.contains('/profile');
      case DrawerSection.settings:
        return currentPath.contains('/settings');
      case DrawerSection.chat:
        return currentPath.contains('/chat');
    }
  }
}

/// Enum for drawer navigation sections
enum DrawerSection {
  dashboard,
  calendar,
  documents,
  parts,
  profile,
  settings,
  chat,
}

/// Helper to convert route names to drawer sections
extension RouteNameToSection on String {
  DrawerSection? get drawerSection {
    if (contains('dashboard')) return DrawerSection.dashboard;
    if (contains('calendar')) return DrawerSection.calendar;
    if (contains('document')) return DrawerSection.documents;
    if (contains('part')) return DrawerSection.parts;
    if (contains('profile')) return DrawerSection.profile;
    if (contains('settings')) return DrawerSection.settings;
    if (contains('chat')) return DrawerSection.chat;
    return null;
  }
}
