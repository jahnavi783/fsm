import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsm/core/widgets/fsm_app_bar.dart';
import 'package:fsm/core/widgets/states/fsm_empty_state.dart';
import 'package:fsm/core/widgets/navigation/fsm_drawer.dart';
import '../../../auth/presentation/blocs/auth/auth_bloc.dart';
import '../../../auth/presentation/blocs/auth/auth_state.dart';
import '../../../auth/presentation/blocs/auth/auth_event.dart';
import '../../../../core/router/app_router.dart';

/// CalendarPage - Coming Soon Placeholder (Redesign 2025)
///
/// Displays a "Coming Soon" message for the calendar feature.
/// The calendar feature is planned for a future release.
///
/// Features:
/// - Simple FSMAppBar with "Calendar" title
/// - FSMEmptyState with calendar icon
/// - "Coming Soon" title and description
/// - Clean, minimal design
@RoutePage()
class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        final user = authState is AuthAuthenticated ? authState.user : null;

        return Scaffold(
          appBar: FSMAppBar.gradient(
            title: 'Calendar',
            actions: [
              FSMAppBarAction.search(
                onPressed: () {
                  // TODO: Implement search navigation when SearchRoute is available
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Search coming soon')),
                  );
                },
              ),
            ],
          ),

          // ═══════════════════════════════════════════════════════════
          // DRAWER - FSM Navigation Drawer
          // ═══════════════════════════════════════════════════════════
          drawer: FSMDrawer(
            currentRoute: '/app/calendar',
            profileName: user?.fullName ?? 'FSM Technician',
            profileEmail: user?.email ?? 'technician@fsm.app',
            employeeId: user?.id.toString() ?? 'EMP-001',
            profileImageUrl: null,
            onNavigate: (section) => _navigateToSection(context, section),
            onSync: () => _handleSync(context),
            onScanQR: () => _handleScanQR(context),
            onCheckIn: () => _handleCheckIn(context),
            onLogout: () => _handleLogout(context),
          ),

          body: const FSMEmptyState(
            icon: Icons.calendar_today,
            title: 'Coming Soon',
            description: 'Calendar feature is currently under development. '
                'This feature will be available in a future update.',
          ),
        );
      },
    );
  }

  // ═══════════════════════════════════════════════════════════════════════
  // NAVIGATION & DRAWER ACTION HELPERS
  // ═══════════════════════════════════════════════════════════════════════

  /// Navigate to drawer section using Auto Route extensions
  void _navigateToSection(BuildContext context, String section) {
    final router = context.router;
    final drawerSection = _mapStringToDrawerSection(section);

    if (drawerSection != null) {
      router.navigateToDrawerSection(drawerSection);
    }
  }

  /// Map section string to DrawerSection enum
  DrawerSection? _mapStringToDrawerSection(String section) {
    switch (section.toLowerCase()) {
      case 'dashboard':
        return DrawerSection.dashboard;
      case 'work_orders':
      case 'workorders':
        return DrawerSection.workOrders;
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

  /// Handle sync action
  void _handleSync(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Syncing data...')),
    );
  }

  /// Handle QR code scanning
  void _handleScanQR(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('QR Scanner feature coming soon!')),
    );
  }

  /// Handle location check-in
  void _handleCheckIn(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Check-in feature coming soon!')),
    );
  }

  /// Handle user logout
  void _handleLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.read<AuthBloc>().add(const AuthEvent.logout());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
