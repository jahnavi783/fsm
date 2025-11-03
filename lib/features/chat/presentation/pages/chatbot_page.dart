import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/router/app_router.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/core/theme/app_dimensions.dart';
import 'package:fsm/core/theme/app_text_styles.dart';
import 'package:fsm/core/widgets/fsm_app_bar.dart';
import 'package:fsm/core/widgets/navigation/fsm_drawer.dart';
import '../../../auth/presentation/blocs/auth/auth_bloc.dart';
import '../../../auth/presentation/blocs/auth/auth_state.dart';
import '../../../auth/presentation/blocs/auth/auth_event.dart';

/// ChatbotPage - AI Assistant Coming Soon Placeholder (Redesign 2025)
///
/// Displays a "Coming Soon" message for the AI Assistant feature.
/// The chatbot feature will provide intelligent assistance to field technicians.
///
/// Features:
/// - FSMAppBar with "AI Assistant" title
/// - Large robot icon (64dp)
/// - "AI Assistant" title
/// - "Coming Soon" subtitle
/// - Feature description
/// - Suggested action cards for planned features
/// - Gradient accent colors (Teal to Green)
///
/// Usage:
/// ```dart
/// context.router.push(const ChatbotRoute());
/// ```
@RoutePage()
class ChatbotPage extends StatelessWidget {
  const ChatbotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        final user = authState is AuthAuthenticated ? authState.user : null;

        return Scaffold(
          appBar: FSMAppBar.gradient(
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
                tooltip: 'Menu',
              ),
            ),
            title: 'AI Assistant',
            automaticallyImplyLeading: false,
          ),

          // ═══════════════════════════════════════════════════════════
          // DRAWER - FSM Navigation Drawer
          // ═══════════════════════════════════════════════════════════
          drawer: FSMDrawer(
            currentRoute: '/app/chat',
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

          body: SingleChildScrollView(
            padding: EdgeInsets.all(AppDimensions.paddingLarge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40.h),

                // Robot Icon with gradient background
                Container(
                  width: 120.w,
                  height: 120.w,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary,
                        AppColors.primary,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.smart_toy_outlined,
                    size: 64.sp,
                    color: AppColors.white,
                  ),
                ),

                SizedBox(height: AppDimensions.spaceLarge),

                // Title
                Text(
                  'AI Assistant',
                  style: AppTextStyles.headlineMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: AppDimensions.spaceSmall),

                // Coming Soon Subtitle
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.paddingMedium,
                    vertical: AppDimensions.paddingXSmall,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius:
                        BorderRadius.circular(AppDimensions.radiusXLarge),
                  ),
                  child: Text(
                    'Coming Soon',
                    style: AppTextStyles.labelLarge.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                SizedBox(height: AppDimensions.spaceLarge),

                // Description
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.paddingMedium),
                  child: Text(
                    'Get instant help with your field service tasks. '
                    'The AI Assistant will provide intelligent suggestions, '
                    'answer technical questions, and help you complete work orders efficiently.',
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: 40.h),

                // Suggested Features Section
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Planned Features',
                    style: AppTextStyles.titleMedium.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),

                SizedBox(height: AppDimensions.spaceMedium),

                // Feature Cards
                _FeatureCard(
                  icon: Icons.question_answer_outlined,
                  title: 'Technical Assistance',
                  description:
                      'Get instant answers to technical questions and troubleshooting help.',
                  iconColor: AppColors.primary,
                ),

                SizedBox(height: AppDimensions.spaceMedium),

                _FeatureCard(
                  icon: Icons.tips_and_updates_outlined,
                  title: 'Smart Suggestions',
                  description:
                      'Receive intelligent recommendations for work order completion.',
                  iconColor: AppColors.info,
                ),

                SizedBox(height: AppDimensions.spaceMedium),

                _FeatureCard(
                  icon: Icons.search_outlined,
                  title: 'Quick Search',
                  description:
                      'Find parts, documents, and procedures using natural language.',
                  iconColor: AppColors.primary,
                ),

                SizedBox(height: AppDimensions.spaceMedium),

                _FeatureCard(
                  icon: Icons.auto_awesome_outlined,
                  title: 'Workflow Automation',
                  description:
                      'Automate repetitive tasks and streamline your workflow.',
                  iconColor: AppColors.warning,
                ),

                SizedBox(height: 40.h),
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
    // TODO: Implement chat/AI assistant sync functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Syncing AI Assistant data...')),
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

/// Feature card for planned AI features
class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color iconColor;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        border: Border.all(
          color: AppColors.divider,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
            ),
            child: Icon(
              icon,
              size: 24.sp,
              color: iconColor,
            ),
          ),

          SizedBox(width: AppDimensions.spaceMedium),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.titleSmall.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  description,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
