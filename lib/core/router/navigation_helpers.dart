import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'app_router.gr.dart';

class NavigationHelpers {
  NavigationHelpers._();

  /// Navigate to work order details with animation
  static Future<void> navigateToWorkOrder(
    BuildContext context,
    int workOrderId, {
    bool replace = false,
  }) async {
    final router = context.router;
    await router.push(
      WorkOrderDetailsRoute(workOrderId: workOrderId),
    );
  }

  /// Navigate to document viewer with animation
  static Future<void> navigateToDocument(
    BuildContext context,
    int documentId, {
    bool replace = false,
  }) async {
    final router = context.router;
    await router.push(
      DocumentViewerRoute(documentId: documentId),
    );
  }

  /// Navigate to part details with animation
  static Future<void> navigateToPart(
    BuildContext context,
    int partId, {
    bool replace = false,
  }) async {
    final router = context.router;
    await router.push(
      PartDetailsRoute(partId: partId),
    );
  }

  /// Navigate to main app after authentication
  static Future<void> navigateToMainApp(BuildContext context) async {
    await context.router.navigateNamed('/main');
  }

  /// Navigate to login and clear stack
  static Future<void> navigateToLogin(BuildContext context) async {
    await context.router.navigateNamed('/login');
  }

  /// Navigate to specific tab in main navigation
  static void navigateToTab(BuildContext context, int tabIndex) {
    final tabsRouter = AutoTabsRouter.of(context);
    tabsRouter.setActiveIndex(tabIndex);
  }

  /// Navigate to dashboard tab
  static void navigateToDashboard(BuildContext context) {
    navigateToTab(context, 0);
  }

  /// Navigate to calendar tab
  static void navigateToCalendar(BuildContext context) {
    navigateToTab(context, 1);
  }

  /// Navigate to documents tab
  static void navigateToDocuments(BuildContext context) {
    navigateToTab(context, 2);
  }

  /// Navigate to parts tab
  static void navigateToParts(BuildContext context) {
    navigateToTab(context, 3);
  }

  /// Navigate to profile tab
  static void navigateToProfile(BuildContext context) {
    navigateToTab(context, 4);
  }

  /// Show modal bottom sheet with navigation options
  static Future<void> showNavigationSheet(
    BuildContext context, {
    required List<NavigationOption> options,
  }) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => NavigationBottomSheet(options: options),
    );
  }

  /// Pop until reaching a specific route
  static void popUntilRoute(BuildContext context, String routeName) {
    context.router.popUntil((route) => route.settings.name == routeName);
  }

  /// Check if can pop
  static bool canPop(BuildContext context) {
    return context.router.canPop();
  }

  /// Pop with result
  static void popWithResult<T>(BuildContext context, [T? result]) {
    context.router.maybePop(result);
  }
}

class NavigationOption {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final Color? color;

  const NavigationOption({
    required this.title,
    required this.icon,
    required this.onTap,
    this.color,
  });
}

class NavigationBottomSheet extends StatelessWidget {
  final List<NavigationOption> options;

  const NavigationBottomSheet({
    super.key,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Options
            ...options.map((option) => ListTile(
                  leading: Icon(
                    option.icon,
                    color: option.color ?? theme.colorScheme.onSurface,
                  ),
                  title: Text(
                    option.title,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: option.color ?? theme.colorScheme.onSurface,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    option.onTap();
                  },
                )),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
