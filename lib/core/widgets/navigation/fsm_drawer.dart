import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/core/theme/app_dimensions.dart';
import 'package:fsm/core/theme/app_text_styles.dart';

/// FSMDrawer - Redesigned navigation drawer for FSM app (2025)
///
/// Features:
/// - Gradient header with profile information
/// - Quick actions section (Sync, Scan QR, Check In)
/// - Navigation section (Dashboard, Documents, Parts, Profile)
/// - Settings section
/// - Logout button
/// - Highlights current screen
/// - Smooth slide-in animation (handled by Drawer widget)
///
/// Usage:
/// ```dart
/// Scaffold(
///   drawer: FSMDrawer(
///     currentRoute: '/dashboard',
///     profileName: 'John Doe',
///     profileEmail: 'john.doe@example.com',
///     employeeId: 'EMP-12345',
///     profileImageUrl: 'https://...',
///     onNavigate: (route) => context.router.replaceNamed(route),
///     onSync: () => syncBloc.add(SyncRequested()),
///     onScanQR: () => qrScanner.scan(),
///     onCheckIn: () => checkInService.checkIn(),
///     onLogout: () => authBloc.add(LogoutRequested()),
///   ),
/// )
/// ```
class FSMDrawer extends StatelessWidget {
  /// Current active route (used to highlight current screen)
  final String currentRoute;

  /// User's full name
  final String profileName;

  /// User's email address
  final String profileEmail;

  /// User's employee ID
  final String employeeId;

  /// Optional profile image URL (uses placeholder if null)
  final String? profileImageUrl;

  /// Callback when navigation item is tapped
  final Function(String route) onNavigate;

  /// Callback for Sync Now quick action
  final VoidCallback? onSync;

  /// Callback for Scan QR Code quick action
  final VoidCallback? onScanQR;

  /// Callback for Check In quick action
  final VoidCallback? onCheckIn;

  /// Callback for logout
  final VoidCallback onLogout;

  const FSMDrawer({
    super.key,
    required this.currentRoute,
    required this.profileName,
    required this.profileEmail,
    required this.employeeId,
    this.profileImageUrl,
    required this.onNavigate,
    this.onSync,
    this.onScanQR,
    this.onCheckIn,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final drawerWidth = (screenWidth * 0.8).clamp(0, 300.0);

    return Drawer(
      width: drawerWidth.toDouble(),
      child: Column(
        children: [
          // Header Section with gradient
          _DrawerHeader(
            profileName: profileName,
            profileEmail: profileEmail,
            employeeId: employeeId,
            profileImageUrl: profileImageUrl,
          ),

          // Scrollable content
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // Quick Actions Section
                _SectionHeader(title: 'Quick Actions'),
                _QuickActionItem(
                  icon: Icons.sync,
                  label: 'Sync Now',
                  onTap: onSync,
                ),
                _QuickActionItem(
                  icon: Icons.qr_code_scanner,
                  label: 'Scan QR Code',
                  onTap: onScanQR,
                ),
                _QuickActionItem(
                  icon: Icons.location_on_outlined,
                  label: 'Check In',
                  onTap: onCheckIn,
                ),

                SizedBox(height: AppDimensions.paddingSmall),
                Divider(height: 1.h, thickness: 1.h),

                // Navigation Section
                _SectionHeader(title: 'Navigate'),
                _NavigationItem(
                  icon: Icons.dashboard_outlined,
                  label: 'Dashboard',
                  route: '/dashboard',
                  currentRoute: currentRoute,
                  onTap: () => onNavigate('/dashboard'),
                ),
                _NavigationItem(
                  icon: Icons.description_outlined,
                  label: 'Documents',
                  route: '/documents',
                  currentRoute: currentRoute,
                  onTap: () => onNavigate('/documents'),
                ),
                _NavigationItem(
                  icon: Icons.inventory_2_outlined,
                  label: 'Parts',
                  route: '/parts',
                  currentRoute: currentRoute,
                  onTap: () => onNavigate('/parts'),
                ),
                _NavigationItem(
                  icon: Icons.person_outline,
                  label: 'Profile',
                  route: '/profile',
                  currentRoute: currentRoute,
                  onTap: () => onNavigate('/profile'),
                ),

                SizedBox(height: AppDimensions.paddingSmall),
                Divider(height: 1.h, thickness: 1.h),

                // Settings Section
                _SectionHeader(title: 'Settings'),
                _SettingsItem(
                  icon: Icons.settings_outlined,
                  label: 'App Settings',
                  onTap: () => onNavigate('/settings'),
                ),
                _SettingsItem(
                  icon: Icons.notifications_outlined,
                  label: 'Notifications',
                  onTap: () => onNavigate('/settings/notifications'),
                ),
                _SettingsItem(
                  icon: Icons.language_outlined,
                  label: 'Language',
                  onTap: () => onNavigate('/settings/language'),
                ),
                _SettingsItem(
                  icon: Icons.info_outline,
                  label: 'About',
                  onTap: () => onNavigate('/settings/about'),
                ),

                SizedBox(height: AppDimensions.paddingLarge),
              ],
            ),
          ),

          // Logout Button (pinned to bottom)
          Divider(height: 1.h, thickness: 1.h),
          _LogoutButton(onTap: onLogout),
        ],
      ),
    );
  }
}

/// Drawer header with gradient background and profile information
class _DrawerHeader extends StatelessWidget {
  final String profileName;
  final String profileEmail;
  final String employeeId;
  final String? profileImageUrl;

  const _DrawerHeader({
    required this.profileName,
    required this.profileEmail,
    required this.employeeId,
    this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: AppColors.primaryGradient, // Teal to Green
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingMedium,
            vertical: AppDimensions.paddingLarge,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Photo
              Center(
                child: Container(
                  width: 80.w,
                  height: 80.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.white,
                      width: 3.w,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 40.r,
                    backgroundColor: AppColors.white,
                    backgroundImage: profileImageUrl != null
                        ? NetworkImage(profileImageUrl!)
                        : null,
                    child: profileImageUrl == null
                        ? Icon(
                            Icons.person,
                            size: 40.sp,
                            color: AppColors.primary,
                          )
                        : null,
                  ),
                ),
              ),

              SizedBox(height: AppDimensions.paddingMedium),

              // Name
              Center(
                child: Text(
                  profileName,
                  style: AppTextStyles.headlineSmall.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: AppDimensions.paddingXSmall),

              // Email
              Center(
                child: Text(
                  profileEmail,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.white.withValues(alpha: 0.9),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: AppDimensions.paddingXSmall),

              // Employee ID
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white.withValues(alpha: 0.2),
                    borderRadius:
                        BorderRadius.circular(AppDimensions.radiusXSmall),
                  ),
                  child: Text(
                    employeeId,
                    style: AppTextStyles.labelSmall.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Section header for drawer sections
class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppDimensions.paddingMedium,
        AppDimensions.paddingMedium,
        AppDimensions.paddingMedium,
        AppDimensions.paddingSmall,
      ),
      child: Text(
        title.toUpperCase(),
        style: AppTextStyles.labelSmall.copyWith(
          color: AppColors.textSecondary,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

/// Quick action item (Sync, Scan QR, Check In)
class _QuickActionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _QuickActionItem({
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: AppColors.secondary.withValues(alpha: 0.1), // Green accent
          borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
        ),
        child: Icon(
          icon,
          color: AppColors.secondary,
          size: AppDimensions.iconSmall,
        ),
      ),
      title: Text(
        label,
        style: AppTextStyles.bodyMedium.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: onTap,
      enabled: onTap != null,
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingMedium,
        vertical: AppDimensions.paddingXSmall,
      ),
    );
  }
}

/// Navigation item with highlight for current screen
class _NavigationItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String route;
  final String currentRoute;
  final VoidCallback onTap;

  const _NavigationItem({
    required this.icon,
    required this.label,
    required this.route,
    required this.currentRoute,
    required this.onTap,
  });

  bool get _isActive {
    // Match exact route or base route
    return currentRoute == route ||
        currentRoute.startsWith('$route/') ||
        (route == '/dashboard' && currentRoute == '/');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingSmall,
        vertical: 2.h,
      ),
      decoration: BoxDecoration(
        color: _isActive
            ? AppColors.primary.withValues(alpha: 0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: _isActive ? AppColors.primary : AppColors.textSecondary,
          size: AppDimensions.iconMedium,
        ),
        title: Text(
          label,
          style: AppTextStyles.bodyMedium.copyWith(
            color: _isActive ? AppColors.primary : AppColors.textPrimary,
            fontWeight: _isActive ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingMedium,
          vertical: AppDimensions.paddingXSmall,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
        ),
      ),
    );
  }
}

/// Settings item
class _SettingsItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _SettingsItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.textSecondary,
        size: AppDimensions.iconMedium,
      ),
      title: Text(
        label,
        style: AppTextStyles.bodyMedium,
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: AppColors.textSecondary,
        size: AppDimensions.iconSmall,
      ),
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingMedium,
        vertical: AppDimensions.paddingXSmall,
      ),
    );
  }
}

/// Logout button (red text, pinned to bottom)
class _LogoutButton extends StatelessWidget {
  final VoidCallback onTap;

  const _LogoutButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: ListTile(
        leading: Icon(
          Icons.logout,
          color: AppColors.error,
          size: AppDimensions.iconMedium,
        ),
        title: Text(
          'Logout',
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.error,
            fontWeight: FontWeight.w600,
          ),
        ),
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingMedium,
          vertical: AppDimensions.paddingSmall,
        ),
      ),
    );
  }
}
