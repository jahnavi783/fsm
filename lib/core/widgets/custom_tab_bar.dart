import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabBar extends StatelessWidget {
  final TabController controller;
  final List<String> tabs;

  const CustomTabBar({
    super.key,
    required this.controller,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _CustomTabBarDelegate(
        controller: controller,
        tabs: tabs,
      ),
    );
  }
}

class _CustomTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabController controller;
  final List<String> tabs;

  _CustomTabBarDelegate({
    required this.controller,
    required this.tabs,
  });

  @override
  double get minExtent => 60.h;

  @override
  double get maxExtent => 60.h;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(28.r),
          border: Border.all(
            color: Colors.grey[200]!,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: TabBar(
          controller: controller,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(26.r),
            color: const Color(0xFF116587),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF116587).withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey[600],
          labelStyle: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          labelPadding: EdgeInsets.symmetric(horizontal: 4.w),
          tabs: tabs
              .map((tab) => Tab(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Text(
                        tab,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
