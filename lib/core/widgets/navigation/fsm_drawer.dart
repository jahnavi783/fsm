import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';

/// FSMDrawer - Enhanced Material 3 navigation drawer for FSM app
///
/// Features:
/// - Material 3 design with adaptive theming
/// - Auto Route integration for type-safe navigation
/// - Gradient header with user profile information
/// - Quick actions section (Sync, Scan QR, Check In)
/// - Smart navigation section highlighting based on current route
/// - Settings section with nested navigation
/// - Logout functionality with confirmation
/// - Responsive drawer sizing and smooth animations
/// - Route-aware highlighting for active navigation sections
/// - Support for deep linking and external navigation
///
/// Auto Route Integration:
/// - Automatically highlights current route section
/// - Handles nested route navigation (work orders, documents)
/// - Provides type-safe navigation callbacks
/// - Supports both drawer section navigation and direct route navigation
/// - Integrates with NavigationBloc for state management
///
/// Usage:
/// ```dart
/// Scaffold(
///   drawer: FSMDrawer(
///     currentRoute: '/app/dashboard',
///     profileName: 'John Technician',
///     profileEmail: 'john.tech@fsm.app',
///     employeeId: 'FSM-001',
///     profileImageUrl: 'https://example.com/avatar.jpg',
///     onNavigate: (section) => navigationBloc.add(NavigateToSection(section)),
///     onSync: () => syncService.performSync(),
///     onScanQR: () => qrScanner.launch(),
///     onCheckIn: () => locationService.checkIn(),
///     onLogout: () => authBloc.add(LogoutRequested()),
///   ),
/// )
/// ```
class FSMDrawer extends StatelessWidget {
  /// Current active route path (used for intelligent highlighting)
  /// Example: '/app/work-orders', '/app/documents/123'
  final String currentRoute;

  /// User's full display name
  final String profileName;

  /// User's email address for identification
  final String profileEmail;

  /// User's unique employee identifier
  final String employeeId;

  /// Optional profile image URL (uses default avatar if null)
  final String? profileImageUrl;

  /// Callback when drawer navigation section is selected
  /// Parameter is the section identifier (dashboard, work_orders, etc.)
  final Function(String section) onNavigate;

  /// Callback for Sync Now quick action
  final VoidCallback? onSync;

  /// Callback for Scan QR Code quick action
  final VoidCallback? onScanQR;

  /// Callback for location Check In quick action
  final VoidCallback? onCheckIn;

  /// Callback for user logout action
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

  /// Gets the work orders badge count from BLoC state
  /// Returns null if no badge should be shown
  int? _getWorkOrdersBadgeCount() {
    // TODO: Implement badge count logic using WorkOrdersBloc
    // Example implementation:
    // final workOrdersBloc = context.read<WorkOrdersBloc>();
    // final state = workOrdersBloc.state;
    // if (state is WorkOrdersLoaded) {
    //   return state.urgentCount + state.overdueCount;
    // }
    return null; // Placeholder - will be implemented when BLoC is integrated
  }

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

                RSizedBox(height: DesignTokens.space2),
                const Divider(height: 1, thickness: 1),

                // Navigation Section - Main FSM Features
                _SectionHeader(title: 'Navigate'),
                _NavigationItem(
                  icon: Icons.dashboard_outlined,
                  selectedIcon: Icons.dashboard,
                  label: 'Dashboard',
                  section: 'dashboard',
                  currentRoute: currentRoute,
                  onTap: () => onNavigate('dashboard'),
                ),
                _NavigationItem(
                  icon: Icons.work_outline,
                  selectedIcon: Icons.work,
                  label: 'Work Orders',
                  section: 'work_orders',
                  currentRoute: currentRoute,
                  onTap: () => onNavigate('work_orders'),
                  badge: _getWorkOrdersBadgeCount(),
                ),
                _NavigationItem(
                  icon: Icons.calendar_today_outlined,
                  selectedIcon: Icons.calendar_today,
                  label: 'Calendar',
                  section: 'calendar',
                  currentRoute: currentRoute,
                  onTap: () => onNavigate('calendar'),
                ),
                _NavigationItem(
                  icon: Icons.description_outlined,
                  selectedIcon: Icons.description,
                  label: 'Documents',
                  section: 'documents',
                  currentRoute: currentRoute,
                  onTap: () => onNavigate('documents'),
                ),
                _NavigationItem(
                  icon: Icons.inventory_2_outlined,
                  selectedIcon: Icons.inventory_2,
                  label: 'Parts Inventory',
                  section: 'parts',
                  currentRoute: currentRoute,
                  onTap: () => onNavigate('parts'),
                ),
                _NavigationItem(
                  icon: Icons.smart_toy_outlined,
                  selectedIcon: Icons.smart_toy,
                  label: 'AI Assistant',
                  section: 'chat',
                  currentRoute: currentRoute,
                  onTap: () => onNavigate('chat'),
                ),
                _NavigationItem(
                  icon: Icons.person_outline,
                  selectedIcon: Icons.person,
                  label: 'Profile',
                  section: 'profile',
                  currentRoute: currentRoute,
                  onTap: () => onNavigate('profile'),
                ),

                RSizedBox(height: DesignTokens.space2),
                const Divider(height: 1, thickness: 1),

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

                RSizedBox(height: DesignTokens.space6),
              ],
            ),
          ),

          // Logout Button (pinned to bottom)
          const Divider(height: 1, thickness: 1),
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
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.secondary,
          ],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: REdgeInsets.symmetric(
            horizontal: DesignTokens.space4,
            vertical: DesignTokens.space6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Photo
              Center(
                child: Container(
                  width: (DesignTokens.space12 + DesignTokens.space8).w,
                  height: (DesignTokens.space12 + DesignTokens.space8).w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: theme.colorScheme.onPrimary,
                      width: 3.w,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: DesignTokens.space8.r,
                    backgroundColor: theme.colorScheme.surface,
                    backgroundImage: profileImageUrl != null
                        ? NetworkImage(profileImageUrl!)
                        : null,
                    child: profileImageUrl == null
                        ? Icon(
                            Icons.person,
                            size: DesignTokens.space8.sp,
                            color: theme.colorScheme.primary,
                          )
                        : null,
                  ),
                ),
              ),

              RSizedBox(height: DesignTokens.space4),

              // Name
              Center(
                child: Text(
                  profileName,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              RSizedBox(height: DesignTokens.space1),

              // Email
              Center(
                child: Text(
                  profileEmail,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onPrimary.withValues(alpha: 0.9),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              RSizedBox(height: DesignTokens.space1),

              // Employee ID
              Center(
                child: Container(
                  padding: REdgeInsets.symmetric(
                    horizontal: DesignTokens.space3,
                    vertical: DesignTokens.space1,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onPrimary.withValues(alpha: 0.2),
                    borderRadius:
                        BorderRadius.circular(DesignTokens.radiusSm.r),
                  ),
                  child: Text(
                    employeeId,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onPrimary,
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
    final theme = Theme.of(context);
    return Padding(
      padding: REdgeInsets.fromLTRB(
        DesignTokens.space4,
        DesignTokens.space4,
        DesignTokens.space4,
        DesignTokens.space2,
      ),
      child: Text(
        title.toUpperCase(),
        style: theme.textTheme.labelSmall?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
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
    final theme = Theme.of(context);
    return ListTile(
      leading: Container(
        width: DesignTokens.space8.w,
        height: DesignTokens.space8.w,
        decoration: BoxDecoration(
          color: theme.colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
        ),
        child: Icon(
          icon,
          color: theme.colorScheme.secondary,
          size: DesignTokens.iconSm.sp,
        ),
      ),
      title: Text(
        label,
        style: theme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: onTap,
      enabled: onTap != null,
      contentPadding: REdgeInsets.symmetric(
        horizontal: DesignTokens.space4,
        vertical: DesignTokens.space1,
      ),
    );
  }
}

/// Navigation item with highlight for current screen
class _NavigationItem extends StatelessWidget {
  final IconData icon;
  final IconData? selectedIcon;
  final String label;
  final String? section; // Section-based navigation for Auto Route
  final String currentRoute;
  final VoidCallback onTap;
  final int? badge;

  const _NavigationItem({
    required this.icon,
    this.selectedIcon,
    required this.label,
    this.section,
    required this.currentRoute,
    required this.onTap,
    this.badge,
  });

  bool get _isActive {
    // Section-based matching for Auto Route drawer sections
    if (section != null) {
      return currentRoute.contains('/$section') ||
          currentRoute.contains(section!) ||
          (section == 'dashboard' &&
              (currentRoute == '/' ||
                  currentRoute == '/dashboard' ||
                  currentRoute == '/app' ||
                  currentRoute == '/app/dashboard'));
    }

    return false;
  }

  IconData get _effectiveIcon =>
      _isActive && selectedIcon != null ? selectedIcon! : icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: REdgeInsets.symmetric(
        horizontal: DesignTokens.space2,
        vertical: 2.h,
      ),
      decoration: BoxDecoration(
        color:
            _isActive ? theme.colorScheme.primaryContainer : Colors.transparent,
        borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
      ),
      child: ListTile(
        leading: Icon(
          _effectiveIcon,
          color: _isActive
              ? theme.colorScheme.primary
              : theme.colorScheme.onSurfaceVariant,
          size: DesignTokens.iconMd.sp,
        ),
        title: Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: _isActive
                ? theme.colorScheme.primary
                : theme.colorScheme.onSurface,
            fontWeight: _isActive ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
        trailing: badge != null && badge! > 0
            ? Container(
                padding: REdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 4.h,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.error,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                constraints: BoxConstraints(
                  minWidth: 20.w,
                  minHeight: 20.h,
                ),
                child: Text(
                  badge! > 99 ? '99+' : badge.toString(),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onError,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            : null,
        onTap: onTap,
        contentPadding: REdgeInsets.symmetric(
          horizontal: DesignTokens.space4,
          vertical: DesignTokens.space1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
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
    final theme = Theme.of(context);
    return ListTile(
      leading: Icon(
        icon,
        color: theme.colorScheme.onSurfaceVariant,
        size: DesignTokens.iconMd.sp,
      ),
      title: Text(
        label,
        style: theme.textTheme.bodyMedium,
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: theme.colorScheme.onSurfaceVariant,
        size: DesignTokens.iconSm.sp,
      ),
      onTap: onTap,
      contentPadding: REdgeInsets.symmetric(
        horizontal: DesignTokens.space4,
        vertical: DesignTokens.space1,
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
    final theme = Theme.of(context);
    return SafeArea(
      top: false,
      child: ListTile(
        leading: Icon(
          Icons.logout,
          color: theme.colorScheme.error,
          size: DesignTokens.iconMd.sp,
        ),
        title: Text(
          'Logout',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.error,
            fontWeight: FontWeight.w600,
          ),
        ),
        onTap: onTap,
        contentPadding: REdgeInsets.symmetric(
          horizontal: DesignTokens.space4,
          vertical: DesignTokens.space2,
        ),
      ),
    );
  }
}
