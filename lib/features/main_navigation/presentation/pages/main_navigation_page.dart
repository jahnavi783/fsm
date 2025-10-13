import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/router/app_router.gr.dart';

@RoutePage()
class MainNavigationPage extends StatelessWidget {
  const MainNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        DashboardRoute(),
        WorkOrdersRoute(),
        CalendarRoute(),
        DocumentsRoute(),
        PartsRoute(),
        ProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: TextStyle(fontSize: 12.sp),
            unselectedLabelStyle: TextStyle(fontSize: 12.sp),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard, size: 24.sp),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.work, size: 24.sp),
                label: 'Work Orders',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today, size: 24.sp),
                label: 'Calendar',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.folder, size: 24.sp),
                label: 'Documents',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.inventory, size: 24.sp),
                label: 'Parts',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 24.sp),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
