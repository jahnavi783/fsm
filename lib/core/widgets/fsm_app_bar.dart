import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/core/theme/app_dimensions.dart';

/// FSMAppBar - Standardized app bar component with gradient variant
///
/// Provides multiple app bar variants:
/// - [FSMAppBar.standard] - Solid color app bar
/// - [FSMAppBar.gradient] - Gradient background app bar
/// - [FSMAppBar.withSearch] - App bar with integrated search
/// - [FSMAppBar.scrollable] - SliverAppBar with hide-on-scroll behavior
///
/// Supports:
/// - Custom title and subtitle
/// - Action buttons (refresh, notifications, etc.)
/// - Back button handling
/// - Integrated search bar (show/hide on scroll)
/// - Gradient background
/// - Scroll behavior (hide on scroll, pin, float)
///
/// Use cases:
/// - Dashboard header
/// - Work order details header
/// - Search screens
/// - List screens with scrollable content
class FSMAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final String? subtitle;
  final List<Widget>? actions;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final Color? backgroundColor;
  final LinearGradient? gradient;
  final double? elevation;
  final bool centerTitle;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final PreferredSizeWidget? bottom;
  final double? toolbarHeight;

  const FSMAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.subtitle,
    this.actions,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.backgroundColor,
    this.gradient,
    this.elevation,
    this.centerTitle = false,
    this.systemOverlayStyle,
    this.bottom,
    this.toolbarHeight,
  });

  /// Standard app bar with solid color
  const FSMAppBar.standard({
    super.key,
    this.title,
    this.titleWidget,
    this.subtitle,
    this.actions,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.backgroundColor,
    this.elevation,
    this.centerTitle = false,
    this.systemOverlayStyle,
    this.bottom,
  })  : gradient = null,
        toolbarHeight = null;

  /// App bar with gradient background
  const FSMAppBar.gradient({
    super.key,
    this.title,
    this.titleWidget,
    this.subtitle,
    this.actions,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.centerTitle = false,
    this.systemOverlayStyle,
    this.bottom,
  })  : backgroundColor = null,
        gradient = AppColors.primaryGradient,
        elevation = 0,
        toolbarHeight = null;

  /// Simplified navigation app bar for redesign (2025)
  ///
  /// Features:
  /// - Hamburger menu (left) to open drawer
  /// - Centered title
  /// - Search icon (right)
  /// - Optional refresh/sync icon (when offline or always)
  ///
  /// Usage:
  /// ```dart
  /// FSMAppBar.navigation(
  ///   title: 'Dashboard',
  ///   onMenuTap: () => Scaffold.of(context).openDrawer(),
  ///   onSearchTap: () => context.router.push(SearchRoute()),
  ///   onRefreshTap: () => bloc.add(RefreshEvent()),
  ///   showRefresh: isOffline, // Show refresh icon when offline
  /// )
  /// ```
  factory FSMAppBar.navigation({
    Key? key,
    required String title,
    required VoidCallback onMenuTap,
    required VoidCallback onSearchTap,
    VoidCallback? onRefreshTap,
    bool showRefresh = false,
  }) {
    return FSMAppBar(
      key: key,
      title: title,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: onMenuTap,
        tooltip: 'Menu',
      ),
      actions: [
        if (showRefresh && onRefreshTap != null)
          FSMAppBarAction.refresh(
            onPressed: onRefreshTap,
          ),
        FSMAppBarAction.search(
          onPressed: onSearchTap,
        ),
      ],
      automaticallyImplyLeading: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveBackgroundColor = backgroundColor ?? AppColors.primary;
    final effectiveElevation = elevation ?? AppDimensions.elevationSmall;
    final effectiveToolbarHeight = toolbarHeight ?? AppDimensions.appBarHeight;

    // Build title widget
    Widget? titleContent;
    if (titleWidget != null) {
      titleContent = titleWidget;
    } else if (title != null) {
      if (subtitle != null) {
        // Two-line title with subtitle
        titleContent = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: centerTitle
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            Text(
              title!,
              style: theme.textTheme.titleLarge?.copyWith(
                color: AppColors.onPrimary,
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              subtitle!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.onPrimary.withValues(alpha: 0.8),
                fontSize: 12.sp,
              ),
            ),
          ],
        );
      } else {
        // Single-line title
        titleContent = Text(
          title!,
          style: theme.textTheme.titleLarge?.copyWith(
            color: AppColors.onPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
          ),
        );
      }
    }

    // Build app bar
    final appBar = AppBar(
      title: titleContent,
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      actions: actions,
      backgroundColor:
          gradient != null ? Colors.transparent : effectiveBackgroundColor,
      elevation: effectiveElevation,
      centerTitle: centerTitle,
      systemOverlayStyle: systemOverlayStyle ??
          SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.transparent,
          ),
      bottom: bottom,
      toolbarHeight: effectiveToolbarHeight,
      iconTheme: IconThemeData(
        color: AppColors.onPrimary,
        size: AppDimensions.iconMedium,
      ),
    );

    // Wrap with gradient container if gradient is provided
    if (gradient != null) {
      return Container(
        decoration: BoxDecoration(
          gradient: gradient,
        ),
        child: appBar,
      );
    }

    return appBar;
  }

  @override
  Size get preferredSize => Size.fromHeight(
        (toolbarHeight ?? AppDimensions.appBarHeight) +
            (bottom?.preferredSize.height ?? 0),
      );
}

/// FSMSliverAppBar - Scrollable app bar with collapse behavior
///
/// Provides a collapsible app bar with flexible space for headers, images, etc.
class FSMSliverAppBar extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  final String? subtitle;
  final List<Widget>? actions;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final Color? backgroundColor;
  final LinearGradient? gradient;
  final Widget? flexibleSpace;
  final double expandedHeight;
  final bool floating;
  final bool pinned;
  final bool snap;
  final double? elevation;
  final bool centerTitle;
  final SystemUiOverlayStyle? systemOverlayStyle;

  const FSMSliverAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.subtitle,
    this.actions,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.backgroundColor,
    this.gradient,
    this.flexibleSpace,
    this.expandedHeight = 200.0,
    this.floating = false,
    this.pinned = true,
    this.snap = false,
    this.elevation,
    this.centerTitle = false,
    this.systemOverlayStyle,
  });

  /// Scrollable app bar with gradient and flexible space
  const FSMSliverAppBar.gradient({
    super.key,
    this.title,
    this.titleWidget,
    this.subtitle,
    this.actions,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.flexibleSpace,
    this.expandedHeight = 200.0,
    this.floating = false,
    this.pinned = true,
    this.snap = false,
    this.centerTitle = false,
    this.systemOverlayStyle,
  })  : backgroundColor = null,
        gradient = AppColors.primaryGradient,
        elevation = 0;

  /// Scrollable app bar that hides on scroll
  const FSMSliverAppBar.hideOnScroll({
    super.key,
    this.title,
    this.titleWidget,
    this.subtitle,
    this.actions,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.backgroundColor,
    this.gradient,
    this.elevation,
    this.centerTitle = false,
    this.systemOverlayStyle,
  })  : flexibleSpace = null,
        expandedHeight = 56.0,
        floating = true,
        pinned = false,
        snap = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveBackgroundColor = backgroundColor ?? AppColors.primary;
    final effectiveElevation = elevation ?? AppDimensions.elevationSmall;

    // Build title widget
    Widget? titleContent;
    if (titleWidget != null) {
      titleContent = titleWidget;
    } else if (title != null) {
      if (subtitle != null) {
        titleContent = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: centerTitle
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            Text(
              title!,
              style: theme.textTheme.titleLarge?.copyWith(
                color: AppColors.onPrimary,
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              subtitle!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.onPrimary.withValues(alpha: 0.8),
                fontSize: 12.sp,
              ),
            ),
          ],
        );
      } else {
        titleContent = Text(
          title!,
          style: theme.textTheme.titleLarge?.copyWith(
            color: AppColors.onPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
          ),
        );
      }
    }

    final sliverAppBar = SliverAppBar(
      title: titleContent,
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      actions: actions,
      backgroundColor:
          gradient != null ? Colors.transparent : effectiveBackgroundColor,
      elevation: effectiveElevation,
      centerTitle: centerTitle,
      systemOverlayStyle: systemOverlayStyle ??
          SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.transparent,
          ),
      expandedHeight: expandedHeight.h,
      floating: floating,
      pinned: pinned,
      snap: snap,
      flexibleSpace: flexibleSpace,
      iconTheme: IconThemeData(
        color: AppColors.onPrimary,
        size: AppDimensions.iconMedium,
      ),
    );

    // Wrap with gradient if provided
    if (gradient != null) {
      return SliverAppBar(
        title: titleContent,
        leading: leading,
        automaticallyImplyLeading: automaticallyImplyLeading,
        actions: actions,
        backgroundColor: Colors.transparent,
        elevation: effectiveElevation,
        centerTitle: centerTitle,
        systemOverlayStyle: systemOverlayStyle ??
            SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.transparent,
            ),
        expandedHeight: expandedHeight.h,
        floating: floating,
        pinned: pinned,
        snap: snap,
        iconTheme: IconThemeData(
          color: AppColors.onPrimary,
          size: AppDimensions.iconMedium,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: gradient),
          child: flexibleSpace,
        ),
      );
    }

    return sliverAppBar;
  }
}

/// FSMAppBarAction - Reusable action button for app bars
class FSMAppBarAction extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final Widget? badge;
  final Color? iconColor;

  const FSMAppBarAction({
    super.key,
    required this.icon,
    this.onPressed,
    this.tooltip,
    this.badge,
    this.iconColor,
  });

  /// Notification action with badge
  FSMAppBarAction.notification({
    super.key,
    this.onPressed,
    this.tooltip = 'Notifications',
    int? count,
  })  : icon = Icons.notifications_outlined,
        iconColor = null,
        badge = count != null && count > 0
            ? _NotificationBadge(count: count)
            : null;

  /// Refresh action
  const FSMAppBarAction.refresh({
    super.key,
    this.onPressed,
    this.tooltip = 'Refresh',
  })  : icon = Icons.refresh,
        iconColor = null,
        badge = null;

  /// Search action
  const FSMAppBarAction.search({
    super.key,
    this.onPressed,
    this.tooltip = 'Search',
  })  : icon = Icons.search,
        iconColor = null,
        badge = null;

  /// More options action
  const FSMAppBarAction.more({
    super.key,
    this.onPressed,
    this.tooltip = 'More options',
  })  : icon = Icons.more_vert,
        iconColor = null,
        badge = null;

  @override
  Widget build(BuildContext context) {
    Widget button = IconButton(
      icon: Icon(icon, color: iconColor ?? AppColors.onPrimary),
      onPressed: onPressed,
      tooltip: tooltip,
      iconSize: AppDimensions.iconMedium,
      constraints: BoxConstraints(
        minWidth: AppDimensions.touchTargetMin,
        minHeight: AppDimensions.touchTargetMin,
      ),
    );

    if (badge != null) {
      button = Stack(
        clipBehavior: Clip.none,
        children: [
          button,
          Positioned(
            top: 8.h,
            right: 8.w,
            child: badge!,
          ),
        ],
      );
    }

    return button;
  }
}

/// Notification badge for app bar actions
class _NotificationBadge extends StatelessWidget {
  final int count;

  const _NotificationBadge({required this.count});

  @override
  Widget build(BuildContext context) {
    final displayCount = count > 99 ? '99+' : count.toString();

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: count > 9 ? 4.w : 6.w,
        vertical: 2.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.error,
        borderRadius: BorderRadius.circular(10.r),
      ),
      constraints: BoxConstraints(
        minWidth: 16.w,
        minHeight: 16.h,
      ),
      child: Center(
        child: Text(
          displayCount,
          style: TextStyle(
            color: AppColors.onError,
            fontSize: 9.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
