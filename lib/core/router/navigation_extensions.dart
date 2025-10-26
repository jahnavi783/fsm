import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'app_router.gr.dart';
import 'navigation_helpers.dart';

extension NavigationExtensions on BuildContext {
  /// Get the router instance
  StackRouter get router => AutoRouter.of(this);

  /// Navigate to work order details
  Future<void> navigateToWorkOrder(int workOrderId, {bool replace = false}) {
    return NavigationHelpers.navigateToWorkOrder(this, workOrderId,
        replace: replace);
  }

  /// Navigate to document viewer
  Future<void> navigateToDocument(String documentId, {bool replace = false}) {
    return NavigationHelpers.navigateToDocument(this, documentId,
        replace: replace);
  }

  /// Navigate to part details
  Future<void> navigateToPart(int partId, {bool replace = false}) {
    return NavigationHelpers.navigateToPart(this, partId, replace: replace);
  }

  /// Navigate to main app
  Future<void> navigateToMainApp() {
    return NavigationHelpers.navigateToMain(this);
  }

  /// Navigate to login
  Future<void> navigateToLogin() {
    return NavigationHelpers.navigateToLogin(this);
  }

  /// Navigate to specific tab
  void navigateToTab(int tabIndex) {
    NavigationHelpers.navigateToTab(this, tabIndex);
  }

  /// Navigate to dashboard
  void navigateToDashboard() {
    NavigationHelpers.navigateToDashboard(this);
  }

  /// Navigate to calendar
  void navigateToCalendar() {
    NavigationHelpers.navigateToCalendar(this);
  }

  /// Navigate to documents
  void navigateToDocuments() {
    NavigationHelpers.navigateToDocuments(this);
  }

  /// Navigate to parts
  void navigateToParts() {
    NavigationHelpers.navigateToParts(this);
  }

  /// Navigate to profile
  void navigateToProfile() {
    NavigationHelpers.navigateToProfile(this);
  }

  /// Show navigation options sheet
  Future<void> showNavigationSheet({required List<NavigationOption> options}) {
    return NavigationHelpers.showNavigationSheet(this, options: options);
  }

  /// Pop until specific route
  void popUntilRoute(String routeName) {
    NavigationHelpers.popUntilRoute(this, routeName);
  }

  /// Check if can pop
  bool get canPop => NavigationHelpers.canPop(this);

  /// Pop with result
  void popWithResult<T>([T? result]) {
    NavigationHelpers.popWithResult(this, result);
  }
}

extension StackRouterExtensions on StackRouter {
  /// Navigate to work order details with deep linking support
  Future<void> navigateToWorkOrderDeepLink(int workOrderId) {
    return navigatePath('/work-order/$workOrderId');
  }

  /// Navigate to document viewer with deep linking support
  Future<void> navigateToDocumentDeepLink(int documentId) {
    return navigatePath('/document/$documentId');
  }

  /// Navigate to part details with deep linking support
  Future<void> navigateToPartDeepLink(int partId) {
    return navigatePath('/part/$partId');
  }

  /// Navigate to main app after authentication
  Future<void> navigateToMainAppDeepLink() {
    return navigatePath('/main');
  }

  /// Navigate to login and clear stack
  Future<void> navigateToLoginDeepLink() {
    return navigatePath('/login');
  }

  /// Navigate with custom transition
  Future<T?> pushWithTransition<T extends Object?>(
    PageRouteInfo route, {
    Duration? duration,
    Curve? curve,
  }) {
    return push<T>(route);
  }

  /// Replace current route with transition
  Future<T?> replaceWithTransition<T extends Object?>(
    PageRouteInfo route, {
    Duration? duration,
    Curve? curve,
  }) {
    return push(route);
  }
}

// Removed problematic extensions that don't work with AutoRoute 9.3.0

// Deep linking utilities
class DeepLinkHandler {
  static const String workOrderPrefix = '/work-order/';
  static const String documentPrefix = '/document/';
  static const String partPrefix = '/part/';

  /// Parse deep link and return appropriate route
  static PageRouteInfo? parseDeepLink(String link) {
    final uri = Uri.tryParse(link);
    if (uri == null) return null;

    final path = uri.path;

    if (path.startsWith(workOrderPrefix)) {
      final idStr = path.substring(workOrderPrefix.length);
      final id = int.tryParse(idStr);
      if (id != null) {
        return WorkOrderDetailsRoute(workOrderId: id);
      }
    } else if (path.startsWith(documentPrefix)) {
      final idStr = path.substring(documentPrefix.length);
      if (idStr != null) {
        return DocumentViewerRoute(documentId: idStr);
      }
    } else if (path.startsWith(partPrefix)) {
      final idStr = path.substring(partPrefix.length);
      final id = int.tryParse(idStr);
      if (id != null) {
        return PartDetailsRoute(partId: id);
      }
    }

    return null;
  }

  /// Generate deep link for work order
  static String generateWorkOrderLink(int workOrderId) {
    return '$workOrderPrefix$workOrderId';
  }

  /// Generate deep link for document
  static String generateDocumentLink(int documentId) {
    return '$documentPrefix$documentId';
  }

  /// Generate deep link for part
  static String generatePartLink(int partId) {
    return '$partPrefix$partId';
  }
}
