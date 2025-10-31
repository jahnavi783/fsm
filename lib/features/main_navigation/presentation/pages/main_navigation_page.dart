import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/widgets/navigation/fsm_drawer.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.gr.dart';
import '../../../auth/presentation/blocs/auth/auth_bloc.dart';
import '../../../auth/presentation/blocs/auth/auth_event.dart';
import '../../../auth/presentation/blocs/auth/auth_state.dart';
import '../../../work_orders/presentation/blocs/work_order_action/work_order_action_bloc.dart';
import '../../../work_orders/presentation/blocs/work_orders_list/work_orders_list_bloc.dart';
import '../blocs/navigation/navigation_bloc.dart';
import '../blocs/navigation/navigation_event.dart';
import '../blocs/navigation/navigation_state.dart';

@RoutePage()
class MainNavigationPage extends StatelessWidget {
  const MainNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<NavigationBloc>(),
        ),
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

class _MainNavigationView extends StatelessWidget {
  const _MainNavigationView();

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        DashboardRoute(),
        CalendarRoute(),
        DocumentsRoute(),
        PartsRoute(),
        ProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        final theme = Theme.of(context);

        return BlocListener<NavigationBloc, NavigationState>(
          listener: (context, state) {
            state.maybeWhen(
              navigateToTab: (index) {
                if (index != tabsRouter.activeIndex) {
                  tabsRouter.setActiveIndex(index);
                }
              },
              orElse: () {},
            );
          },
          // PopScope properly integrates hardware back button with Auto Router
          // When on first tab (Dashboard), allow exit; otherwise navigate to Dashboard
          child: PopScope(
            canPop: tabsRouter.activeIndex == 0,
            onPopInvokedWithResult: (didPop, result) {
              if (!didPop && tabsRouter.activeIndex != 0) {
                // If not on first tab (Dashboard), go back to Dashboard
                tabsRouter.setActiveIndex(0);
                context.read<NavigationBloc>().add(
                      const NavigationEvent.tabChanged(0),
                    );
              }
            },
            child: BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                state.maybeWhen(
                  unauthenticated: () {
                    // User logged out: clear navigation stack and return to login
                    context.router.replaceAll([const LoginRoute()]);
                  },
                  orElse: () {},
                );
              },
              child: Scaffold(
                drawer: FSMDrawer(
                  currentRoute: _getCurrentRoute(tabsRouter.activeIndex),
                  profileName: 'Technician',
                  profileEmail: 'tech@example.com',
                  employeeId: 'EMP-001',
                  profileImageUrl: null,
                  onNavigate: (route) {
                    // Handle navigation
                    context.router.pop();
                  },
                  onLogout: () {
                    // Trigger logout via AuthBloc
                    context.read<AuthBloc>().add(const AuthEvent.logout());
                    context.router.pop();
                  },
                ),
                body: child,
                bottomNavigationBar: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 8,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  child: BottomNavigationBar(
                    currentIndex: tabsRouter.activeIndex,
                    onTap: (index) {
                      tabsRouter.setActiveIndex(index);
                      context.read<NavigationBloc>().add(
                            NavigationEvent.tabChanged(index),
                          );
                    },
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: theme.colorScheme.primary,
                    unselectedItemColor:
                        theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    selectedLabelStyle: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    backgroundColor: theme.colorScheme.surface,
                    elevation: 0,
                    items: [
                      BottomNavigationBarItem(
                        icon: _buildNavIcon(
                          Icons.assignment_outlined,
                          Icons.assignment,
                          0,
                          tabsRouter.activeIndex,
                        ),
                        label: 'Work Orders',
                      ),
                      BottomNavigationBarItem(
                        icon: _buildNavIcon(
                          Icons.calendar_today_outlined,
                          Icons.calendar_today,
                          1,
                          tabsRouter.activeIndex,
                        ),
                        label: 'Calendar',
                      ),
                      BottomNavigationBarItem(
                        icon: _buildNavIcon(
                          Icons.folder_outlined,
                          Icons.folder,
                          2,
                          tabsRouter.activeIndex,
                        ),
                        label: 'Documents',
                      ),
                      BottomNavigationBarItem(
                        icon: _buildNavIcon(
                          Icons.inventory_2_outlined,
                          Icons.inventory_2,
                          3,
                          tabsRouter.activeIndex,
                        ),
                        label: 'Parts',
                      ),
                      BottomNavigationBarItem(
                        icon: _buildNavIcon(
                          Icons.person_outline,
                          Icons.person,
                          4,
                          tabsRouter.activeIndex,
                        ),
                        label: 'Profile',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String _getCurrentRoute(int index) {
    switch (index) {
      case 0:
        return '/work-orders';
      case 1:
        return '/calendar';
      case 2:
        return '/documents';
      case 3:
        return '/parts';
      case 4:
        return '/profile';
      default:
        return '/work-orders';
    }
  }

  Widget _buildNavIcon(
    IconData outlinedIcon,
    IconData filledIcon,
    int index,
    int activeIndex,
  ) {
    final isActive = index == activeIndex;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: Icon(
        isActive ? filledIcon : outlinedIcon,
        size: 24.sp,
        key: ValueKey(isActive),
      ),
    );
  }
}
