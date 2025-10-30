import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardSliverAppBar extends StatelessWidget {
  final VoidCallback? onSearch;
  final VoidCallback? onNotifications;
  final int notificationCount;

  const DashboardSliverAppBar({
    super.key,
    this.onSearch,
    this.onNotifications,
    this.notificationCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 110.h,
      floating: false,
      pinned: true,
      elevation: 0,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF0F5F7A),
                Color(0xFF116587),
                Color(0xFF00B458),
                Color(0xFF00A74F),
              ],
              stops: [0.0, 0.3, 0.7, 1.0],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dashboard',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.5,
                              height: 1.1,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            'Manage your work orders',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.85),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          _buildHeaderAction(
                            icon: Icons.search,
                            onTap: onSearch ?? () {},
                          ),
                          SizedBox(width: 12.w),
                          _buildNotificationAction(
                            icon: Icons.notifications_outlined,
                            onTap: onNotifications ?? () {},
                            notificationCount: notificationCount,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(),
      ),
    );
  }

  Widget _buildHeaderAction({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.2),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 18.sp,
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationAction({
    required IconData icon,
    required VoidCallback onTap,
    required int notificationCount,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.2),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 18.sp,
              ),
              if (notificationCount > 0)
                Positioned(
                  top: -4.h,
                  right: -4.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: notificationCount > 9 ? 4.w : 6.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 16.w,
                      minHeight: 16.h,
                    ),
                    child: Center(
                      child: Text(
                        notificationCount > 99 ? '99+' : notificationCount.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w700,
                        ),
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
