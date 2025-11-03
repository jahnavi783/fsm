import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/widgets/fsm_app_bar.dart';
import '../../../auth/presentation/blocs/auth/auth_bloc.dart';
import '../../../auth/presentation/blocs/auth/auth_event.dart';
import '../../../auth/presentation/blocs/auth/auth_state.dart';
import '../blocs/profile/profile_bloc.dart';
import '../blocs/profile/profile_event.dart';
import '../blocs/profile/profile_state.dart';
import '../widgets/logout_confirmation_dialog.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_info_card.dart';
import '../widgets/settings_section.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ProfileBloc>()..add(const ProfileEvent.loadProfile()),
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  Future<void> _handleLogout(BuildContext context) async {
    final shouldLogout = await LogoutConfirmationDialog.show(context);
    if (shouldLogout == true && context.mounted) {
      // Use AuthBloc for logout instead of ProfileBloc
      // This ensures proper cleanup of auth state and navigation
      context.read<AuthBloc>().add(const AuthEvent.logout());
    }
  }

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
    // Trigger profile refresh
    context.read<ProfileBloc>().add(const ProfileEvent.loadProfile());

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Syncing profile data...')),
    );
  }

  /// Handle QR code scanning
  void _handleScanQR(BuildContext context) {
    // TODO: Implement QR scanning functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('QR Scanner feature coming soon!')),
    );
  }

  /// Handle location check-in
  void _handleCheckIn(BuildContext context) {
    // TODO: Implement location check-in functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Check-in feature coming soon!')),
    );
  }

  String _getLanguageDisplayName(String languageCode) {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'es':
        return 'Spanish';
      case 'fr':
        return 'French';
      default:
        return 'English';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        return Scaffold(
          backgroundColor: Colors.grey[50],
          appBar: FSMAppBar.gradient(
            title: 'Profile',
            centerTitle: true,
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
          body: BlocConsumer<ProfileBloc, ProfileState>(
            listener: (context, state) {
              state.whenOrNull(
                error: (message) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
                updated: (profile, preferences) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Profile updated successfully'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                preferencesUpdated: (profile, preferences) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Preferences updated successfully'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
              );
            },
            builder: (context, state) {
              return state.when(
                initial: () => const Center(child: CircularProgressIndicator()),
                loading: () => const Center(child: CircularProgressIndicator()),
                loaded: (profile, preferences) =>
                    _buildLoadedContent(context, profile, preferences),
                updating: () =>
                    const Center(child: CircularProgressIndicator()),
                updated: (profile, preferences) =>
                    _buildLoadedContent(context, profile, preferences),
                preferencesUpdated: (profile, preferences) =>
                    _buildLoadedContent(context, profile, preferences),
                accountDeleted: () => const Center(
                  child: Text('Account deleted. Redirecting...'),
                ),
                loggedOut: () => const Center(
                  child: Text('Logged out. Redirecting...'),
                ),
                error: (message) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 64.sp,
                        color: Colors.red,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'Error',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        message,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 16.h),
                      ElevatedButton(
                        onPressed: () {
                          context
                              .read<ProfileBloc>()
                              .add(const ProfileEvent.loadProfile());
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildLoadedContent(BuildContext context, profile, preferences) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Profile Header Card
          Container(
            margin: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                ProfileHeader(
                  profile: profile,
                  onEditPressed: () {
                    // TODO: Navigate to edit profile page
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Edit profile functionality coming soon'),
                      ),
                    );
                  },
                ),
                SizedBox(height: 16.h),
                ProfileInfoCard(profile: profile),
                SizedBox(height: 16.h),
              ],
            ),
          ),

          // Notification Settings
          SettingsSection(
            title: 'Notifications',
            items: [
              SettingsToggleItem(
                title: 'Push Notifications',
                subtitle: 'Receive notifications on your device',
                icon: Icons.notifications,
                value: preferences.pushNotificationsEnabled,
                onChanged: (value) {
                  final updatedPreferences = preferences.copyWith(
                    pushNotificationsEnabled: value,
                  );
                  context.read<ProfileBloc>().add(
                        ProfileEvent.updatePreferences(updatedPreferences),
                      );
                },
              ),
              SettingsToggleItem(
                title: 'Email Notifications',
                subtitle: 'Receive notifications via email',
                icon: Icons.email,
                value: preferences.emailNotificationsEnabled,
                onChanged: (value) {
                  final updatedPreferences = preferences.copyWith(
                    emailNotificationsEnabled: value,
                  );
                  context.read<ProfileBloc>().add(
                        ProfileEvent.updatePreferences(updatedPreferences),
                      );
                },
              ),
            ],
          ),

          SizedBox(height: 16.h),

          // App Settings
          SettingsSection(
            title: 'App Settings',
            items: [
              SettingsToggleItem(
                title: 'Location Tracking',
                subtitle: 'Allow app to track your location',
                icon: Icons.location_on,
                value: preferences.locationTrackingEnabled,
                onChanged: (value) {
                  final updatedPreferences = preferences.copyWith(
                    locationTrackingEnabled: value,
                  );
                  context.read<ProfileBloc>().add(
                        ProfileEvent.updatePreferences(updatedPreferences),
                      );
                },
              ),
              SettingsToggleItem(
                title: 'Dark Mode',
                subtitle: 'Use dark theme',
                icon: Icons.dark_mode,
                value: preferences.darkModeEnabled,
                onChanged: (value) {
                  final updatedPreferences = preferences.copyWith(
                    darkModeEnabled: value,
                  );
                  context.read<ProfileBloc>().add(
                        ProfileEvent.updatePreferences(updatedPreferences),
                      );
                },
              ),
              SettingsToggleItem(
                title: 'Offline Sync',
                subtitle: 'Sync data when offline',
                icon: Icons.sync,
                value: preferences.offlineSyncEnabled,
                onChanged: (value) {
                  final updatedPreferences = preferences.copyWith(
                    offlineSyncEnabled: value,
                  );
                  context.read<ProfileBloc>().add(
                        ProfileEvent.updatePreferences(updatedPreferences),
                      );
                },
              ),
              SettingsToggleItem(
                title: 'Auto Logout',
                subtitle: 'Automatically logout after inactivity',
                icon: Icons.timer,
                value: preferences.autoLogoutEnabled,
                onChanged: (value) {
                  final updatedPreferences = preferences.copyWith(
                    autoLogoutEnabled: value,
                  );
                  context.read<ProfileBloc>().add(
                        ProfileEvent.updatePreferences(updatedPreferences),
                      );
                },
              ),
            ],
          ),

          SizedBox(height: 16.h),

          // App Information
          SettingsSection(
            title: 'App Information',
            items: [
              SettingsInfoItem(
                title: 'Language',
                value: _getLanguageDisplayName(preferences.language),
                icon: Icons.language,
              ),
              SettingsInfoItem(
                title: 'Sync Interval',
                value: '${preferences.syncIntervalMinutes} minutes',
                icon: Icons.sync,
              ),
              SettingsInfoItem(
                title: 'Auto Logout Timer',
                value: '${preferences.autoLogoutMinutes} minutes',
                icon: Icons.timer,
              ),
            ],
          ),

          SizedBox(height: 16.h),

          // Account Actions
          SettingsSection(
            title: 'Account',
            items: [
              SettingsActionItem(
                title: 'Change Password',
                icon: Icons.lock,
                onTap: () {
                  // TODO: Navigate to change password page
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text('Change password functionality coming soon'),
                    ),
                  );
                },
              ),
              SettingsActionItem(
                title: 'Privacy Policy',
                icon: Icons.privacy_tip,
                onTap: () {
                  // TODO: Navigate to privacy policy page
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Privacy policy functionality coming soon'),
                    ),
                  );
                },
              ),
              SettingsActionItem(
                title: 'Terms of Service',
                icon: Icons.description,
                onTap: () {
                  // TODO: Navigate to terms of service page
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text('Terms of service functionality coming soon'),
                    ),
                  );
                },
              ),
              SettingsActionItem(
                title: 'Logout',
                icon: Icons.logout,
                iconColor: Colors.orange,
                textColor: Colors.orange,
                onTap: () => _handleLogout(context),
              ),
            ],
          ),

          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}
