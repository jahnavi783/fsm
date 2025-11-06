import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../core/widgets/fsm_app_bar.dart';
import '../../../../core/widgets/navigation/fsm_drawer.dart';
import '../../../auth/presentation/blocs/auth/auth_bloc.dart';
import '../../../auth/presentation/blocs/auth/auth_event.dart';
import '../../../auth/presentation/blocs/auth/auth_state.dart';
import '../../../profile/presentation/widgets/settings_section.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        final user = authState is AuthAuthenticated ? authState.user : null;

        return Scaffold(
          // ═══════════════════════════════════════════════════════════
          // DRAWER - FSM Navigation Drawer
          // ═══════════════════════════════════════════════════════════
          drawer: FSMDrawer(
            currentRoute: '/app/settings',
            profileName: user?.fullName ?? 'FSM Technician',
            profileEmail: user?.email ?? 'technician@fsm.app',
            employeeId: user?.id.toString() ?? 'EMP-001',
            profileImageUrl: null,
            onNavigate: (section) => _navigateToSection(context, section),
            onLogout: () => _handleLogout(context),
          ),
          backgroundColor: Colors.grey[50],
          appBar: FSMAppBar.gradient(
            title: 'Settings',
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.router.maybePop(),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: DesignTokens.space4.h),

                // App Settings Section
                SettingsSection(
                  title: 'App Settings',
                  items: [
                    SettingsActionItem(
                      title: 'Notifications',
                      subtitle: 'Manage notification preferences',
                      icon: Icons.notifications_outlined,
                      onTap: () {
                        // TODO: Add route after regenerating
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text('Notification settings coming soon')),
                        );
                      },
                    ),
                    SettingsActionItem(
                      title: 'Language',
                      subtitle: 'Change app language',
                      icon: Icons.language_outlined,
                      onTap: () {
                        // TODO: Add route after regenerating
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Language settings coming soon')),
                        );
                      },
                    ),
                    SettingsActionItem(
                      title: 'Theme',
                      subtitle: 'Light or dark mode',
                      icon: Icons.palette_outlined,
                      onTap: () {
                        // TODO: Implement theme settings
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Theme settings coming soon')),
                        );
                      },
                    ),
                  ],
                ),

                SizedBox(height: DesignTokens.space4.h),

                // Data & Privacy Section
                SettingsSection(
                  title: 'Data & Privacy',
                  items: [
                    SettingsActionItem(
                      title: 'Data Usage',
                      subtitle: 'Manage data sync and storage',
                      icon: Icons.data_usage_outlined,
                      onTap: () {
                        // TODO: Implement data settings
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Data settings coming soon')),
                        );
                      },
                    ),
                    SettingsActionItem(
                      title: 'Privacy',
                      subtitle: 'Location, permissions and privacy',
                      icon: Icons.privacy_tip_outlined,
                      onTap: () {
                        // TODO: Implement privacy settings
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Privacy settings coming soon')),
                        );
                      },
                    ),
                  ],
                ),

                SizedBox(height: DesignTokens.space4.h),

                // Support & Info Section
                SettingsSection(
                  title: 'Support & Info',
                  items: [
                    SettingsActionItem(
                      title: 'Help & Support',
                      subtitle: 'Get help and contact us',
                      icon: Icons.help_outline,
                      onTap: () {
                        // TODO: Implement help page
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Help page coming soon')),
                        );
                      },
                    ),
                    SettingsActionItem(
                      title: 'About',
                      subtitle: 'App version and info',
                      icon: Icons.info_outline,
                      onTap: () {
                        // TODO: Add route after regenerating
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('About page coming soon')),
                        );
                      },
                    ),
                  ],
                ),

                SizedBox(height: DesignTokens.space8.h),
              ],
            ),
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
