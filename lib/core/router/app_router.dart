import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fsm/app.dart';
import 'package:injectable/injectable.dart';

import '../../features/work_orders/domain/entities/location_entity.dart';
import '../../features/work_orders/domain/entities/work_order_entity.dart';
import 'app_router.gr.dart';
import 'guards/auth_guard.dart' as guard;

@AutoRouterConfig(
  replaceInRouteName: 'Page|Screen,Route',
)
@preResolve
@singleton
class AppRouter extends RootStackRouter {
  final guard.AuthGuard authGuard;

  AppRouter._(this.authGuard);

  @FactoryMethod()
  static Future<AppRouter> create(guard.AuthGuard authGuard) async {
    final router = AppRouter._(authGuard);
    return router;
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalNavigatorKey;

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRouteGuard> get guards => [];

  @override
  List<AutoRoute> get routes => [
        // ───────────────── AUTH FLOW ─────────────────

        AutoRoute(
          page: SplashRoute.page,
          path: '/',
          initial: true,
        ),
        AutoRoute(
          page: LoginRoute.page,
          path: '/login',
        ),

        // ──────────────── MAIN APP (/app …) ────────────────

        AutoRoute(
          page: MainNavigationRoute.page,
          path: '/app',
          guards: [authGuard],
          children: [
            // Primary sections (drawer targets)
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
            AutoRoute(
              page: SettingsRoute.page,
              path: 'settings',
            ),
            AutoRoute(
              page: ChatbotRoute.page,
              path: 'chat',
            ),

            // Detail / deep-linkable screens – still under /app
            // Full paths:
            //  /app/work-orders/:workOrderId
            //  /app/work-orders/:workOrderId/start
            //  /app/work-orders/:workOrderId/complete
            //  /app/documents/:documentId
            //  /app/parts/:partNumber
            AutoRoute(
              page: WorkOrderDetailsRoute.page,
              path: 'work-orders/:workOrderId',
              guards: [authGuard],
            ),
            AutoRoute(
              page: WorkOrderStartRoute.page,
              path: 'work-orders/:workOrderId/start',
              guards: [authGuard],
            ),
            AutoRoute(
              page: WorkOrderCompleteRoute.page,
              path: 'work-orders/:workOrderId/complete',
              guards: [authGuard],
            ),
            AutoRoute(
              page: DocumentViewerRoute.page,
              path: 'documents/:documentId',
              guards: [authGuard],
            ),
            AutoRoute(
              page: PartDetailsRoute.page,
              path: 'parts/:partNumber',
              guards: [authGuard],
            ),
          ],
        ),

        // ──────────────── DEBUG / DEV ────────────────

        AutoRoute(
          page: DeveloperOptionsRoute.page,
          path: '/developer-options',
        ),

        // ──────────────── FALLBACK ────────────────

        RedirectRoute(
          path: '*',
          redirectTo: '/',
        ),
      ];
}

// ─────────────────────────────────────────────────────────────
// NAVIGATION HELPERS
// ─────────────────────────────────────────────────────────────

extension AppRouterExtension on StackRouter {
  // ---------- Work orders ----------

  Future<void> navigateToWorkOrder(int workOrderId) {
    // /app/work-orders/:workOrderId
    return push(WorkOrderDetailsRoute(workOrderId: workOrderId));
  }

  Future<void> navigateToWorkOrderStart(int workOrderId) {
    return push(WorkOrderStartRoute(workOrderId: workOrderId));
  }

  Future<void> navigateToWorkOrderComplete({
    required int workOrderId,
    WorkOrderEntity? workOrder,
    LocationEntity? currentLocation,
  }) {
    return push(
      WorkOrderCompleteRoute(
        workOrderId: workOrderId,
        workOrder: workOrder,
        currentLocation: currentLocation,
      ),
    );
  }

  // ---------- Documents / parts ----------

  Future<void> navigateToDocument(String documentId) {
    // /app/documents/:documentId
    return push(DocumentViewerRoute(documentId: documentId));
  }

  Future<void> navigateToPart(String partNumber) {
    // /app/parts/:partNumber
    return push(PartDetailsRoute(partNumber: partNumber));
  }

  // ---------- Auth boundaries ----------

  /// Use ONLY after successful login.
  /// Clears splash/login so back does not return there.
  Future<void> navigateToMainApp() {
    return replaceAll([const MainNavigationRoute()]);
  }

  /// Use for logout / auth failure.
  Future<void> navigateToLogin() {
    return replaceAll([LoginRoute()]);
  }

  // ---------- Drawer navigation (non-destructive) ----------

  Future<void> navigateToDrawerSection(DrawerSection section) {
    switch (section) {
      case DrawerSection.dashboard:
        return navigateNamed('/app/dashboard');
      case DrawerSection.calendar:
        return navigateNamed('/app/calendar');
      case DrawerSection.documents:
        return navigateNamed('/app/documents');
      case DrawerSection.parts:
        return navigateNamed('/app/parts');
      case DrawerSection.profile:
        return navigateNamed('/app/profile');
      case DrawerSection.settings:
        return navigateNamed('/app/settings');
      case DrawerSection.chat:
        return navigateNamed('/app/chat');
    }
  }

  String get currentRoutePath => current.path;

  bool isCurrentSection(DrawerSection section) {
    final path = currentRoutePath;
    switch (section) {
      case DrawerSection.dashboard:
        return path.contains('/dashboard') || path.contains('/work-orders');
      case DrawerSection.calendar:
        return path.contains('/calendar');
      case DrawerSection.documents:
        return path.contains('/documents');
      case DrawerSection.parts:
        return path.contains('/parts');
      case DrawerSection.profile:
        return path.contains('/profile');
      case DrawerSection.settings:
        return path.contains('/settings');
      case DrawerSection.chat:
        return path.contains('/chat');
    }
  }
}

Future<void> navigateNamedTo(String s) async {}

// Drawer sections

enum DrawerSection {
  dashboard,
  calendar,
  documents,
  parts,
  profile,
  settings,
  chat,
}

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
