import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                    // Handle navigation to different sections
                    _handleNavigation(context, route, tabsRouter);
                    context.router.pop();
                  },
                  onLogout: () {
                    // Trigger logout via AuthBloc
                    context.read<AuthBloc>().add(const AuthEvent.logout());
                    context.router.pop();
                  },
                ),
                body: child,
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
        return '/dashboard';
      case 1:
        return '/calendar';
      case 2:
        return '/documents';
      case 3:
        return '/parts';
      case 4:
        return '/profile';
      default:
        return '/dashboard';
    }
  }

  void _handleNavigation(
      BuildContext context, String route, TabsRouter tabsRouter) {
    switch (route) {
      case '/dashboard':
        tabsRouter.setActiveIndex(0);
        context.read<NavigationBloc>().add(const NavigationEvent.tabChanged(0));
        break;
      case '/calendar':
        tabsRouter.setActiveIndex(1);
        context.read<NavigationBloc>().add(const NavigationEvent.tabChanged(1));
        break;
      case '/documents':
        tabsRouter.setActiveIndex(2);
        context.read<NavigationBloc>().add(const NavigationEvent.tabChanged(2));
        break;
      case '/parts':
        tabsRouter.setActiveIndex(3);
        context.read<NavigationBloc>().add(const NavigationEvent.tabChanged(3));
        break;
      case '/profile':
        tabsRouter.setActiveIndex(4);
        context.read<NavigationBloc>().add(const NavigationEvent.tabChanged(4));
        break;
      default:
        // Handle other routes like settings pages
        break;
    }
  }
}
