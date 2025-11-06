import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/router/app_router.gr.dart';
import '../../../auth/presentation/blocs/auth/auth_bloc.dart';
import '../../../auth/presentation/blocs/auth/auth_state.dart';
import '../../../work_orders/presentation/blocs/work_order_action/work_order_action_bloc.dart';
import '../../../work_orders/presentation/blocs/work_orders_list/work_orders_list_bloc.dart';
import '../blocs/navigation/navigation_bloc.dart';
import '../blocs/navigation/navigation_event.dart';
import '../blocs/navigation/navigation_state.dart';

/// Main Navigation Page - FSM App Drawer-based Navigation
///
/// Features:
/// - Material 3 NavigationDrawer pattern (no bottom navigation)
/// - Nested AutoRouter for main content area
/// - Reactive drawer highlighting based on current route
/// - Proper back button handling with PopScope
/// - Authentication state monitoring
/// - BLoC integration for navigation state management
/// - Responsive layout support
///
/// Architecture:
/// - Uses NavigationBloc for state management
/// - Integrates with Auto Route for nested navigation
/// - FSMDrawer provides Material 3 navigation experience
/// - Main content area renders child routes via AutoRouter
/// - Proper integration with AuthBloc for logout handling
@RoutePage()
class MainNavigationPage extends StatelessWidget {
  const MainNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Navigation state management
        BlocProvider(
          create: (context) => getIt<NavigationBloc>(),
        ),
        // Work order management (required for main features)
        BlocProvider(
          create: (context) => getIt<WorkOrdersListBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<WorkOrderActionBloc>(),
        ),
      ],
      child: const _MainNavigationView(),
    );
  }
}

/// Internal view widget for main navigation
///
/// Following Auto Route best practices for nested routing with individual page Scaffolds:
/// - This is now just an AutoRouter wrapper (shell route)
/// - Each individual page handles its own Scaffold, AppBar, and Drawer
/// - NavigationBloc provides shared state across all pages
/// - Authentication handling remains centralized here
class _MainNavigationView extends StatelessWidget {
  const _MainNavigationView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<NavigationBloc, NavigationState>(
      listener: (context, state) {
        // Handle navigation state changes
        if (state is NavigationError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }

        // Handle navigation requests from BLoC
        if (state is NavigationRequested) {
          _handleNavigationRequest(context, state);
        }
      },
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          // Handle authentication state changes
          if (state is AuthUnauthenticated && context.mounted) {
            // User logged out: clear navigation stack and return to login
            try {
              context.router.replaceAll([LoginRoute()]);
            } catch (e) {
              // Log error but don't crash - user will see login screen on app restart
              debugPrint('Error navigating to login after logout: $e');
            }
          }
        },
        child: PopScope(
          // Handle back button behavior - always allow navigation back within app
          canPop: true,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) {
              // Update navigation state when popping
              final navigationBloc = context.read<NavigationBloc>();
              navigationBloc.add(const UpdateCurrentRoute('', ''));
            }
          },
          // ═══════════════════════════════════════════════════════════════
          // AUTO ROUTER - Renders individual pages with their own Scaffolds
          // ═══════════════════════════════════════════════════════════════
          child: AutoRouter(),
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════
  // HELPER METHODS
  // ═══════════════════════════════════════════════════════════════════════

  /// Handle navigation request from BLoC
  void _handleNavigationRequest(
      BuildContext context, NavigationRequested state) {
    final router = context.router;

    // Handle special navigation cases
    if (state.section == 'back') {
      router.maybePop();
      return;
    }

    // Navigate using auto_route's navigateToDrawerSection extension
    final section = _mapStringToDrawerSection(state.section);
    if (section != null) {
      router.navigateToDrawerSection(section);
    }
  }

  /// Map section string to DrawerSection enum
  DrawerSection? _mapStringToDrawerSection(String section) {
    switch (section.toLowerCase()) {
      case 'dashboard':
        return DrawerSection.dashboard;
      case 'work_orders':
      // case 'workorders':
      //   return DrawerSection.workOrders;
      case 'calendar':
        return DrawerSection.calendar;
      case 'documents':
        return DrawerSection.documents;
      case 'parts':
        return DrawerSection.parts;
      case 'profile':
        return DrawerSection.profile;
      case 'settings':
        return DrawerSection.settings;
      case 'chat':
        return DrawerSection.chat;
      default:
        return null;
    }
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// PLACEHOLDER WIDGETS - TODO: Implement actual widgets
// ═══════════════════════════════════════════════════════════════════════════

/// Placeholder search delegate
class FSMSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => query = '',
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, ''),
      );

  @override
  Widget buildResults(BuildContext context) => const Center(
        child: Text('Search results will be implemented here'),
      );

  @override
  Widget buildSuggestions(BuildContext context) => const Center(
        child: Text('Search suggestions will be implemented here'),
      );
}

/// Placeholder filter sheet
class FSMFilterSheet extends StatelessWidget {
  const FSMFilterSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Filter Options',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          const Text('Filter options will be implemented here'),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 8),
              FilledButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Apply'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
