import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/design_tokens.dart';

/// FSMAppBar - Standardized app bar component with consistent theming
///
/// **STANDARDIZATION (2025 Redesign):**
/// - Height: 80.h (AppDimensions.appBarHeight) across ALL screens
/// - Background: Teal-to-Green gradient (AppColors.primaryGradient)
/// - Title Font: 18.sp, FontWeight.w600, color: white (AppColors.onPrimary)
/// - Subtitle Font: 12.sp, FontWeight.normal, color: white with 80% opacity
/// - Icon Color: White (AppColors.onPrimary)
/// - Icon Size: 24.0 (AppDimensions.iconMedium)
///
/// Provides multiple app bar variants:
/// - [FSMAppBar.standard] - Solid color app bar (deprecated, use .gradient)
/// - [FSMAppBar.gradient] - **RECOMMENDED** Gradient background app bar
/// - [FSMAppBar.navigation] - Navigation variant with hamburger + search
///
/// Supports:
/// - Custom title and subtitle
/// - Action buttons (refresh, notifications, etc.)
/// - Back button handling
/// - Gradient background
///
/// Use cases:
/// - Dashboard header
/// - Work order details header
/// - All main tab pages (Calendar, Documents, Parts, Profile)
/// - Detail pages
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
  /// Uses standardized theme colors and dimensions for consistency
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
    this.toolbarHeight,
    LinearGradient? customGradient,
  })  : backgroundColor = null,
        gradient = customGradient,
        elevation = 0;

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
    final effectiveBackgroundColor =
        backgroundColor ?? theme.colorScheme.primary;
    final effectiveElevation = elevation ?? DesignTokens.elevationSm;
    final effectiveToolbarHeight =
        toolbarHeight ?? DesignTokens.buttonHeightLg.h;

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
                color: theme.colorScheme.onPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            RSizedBox(height: DesignTokens.space1),
            Text(
              subtitle!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onPrimary.withValues(alpha: 0.8),
              ),
            ),
          ],
        );
      } else {
        // Single-line title
        titleContent = Text(
          title!,
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.onPrimary,
            fontWeight: FontWeight.w600,
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
        color: theme.colorScheme.onPrimary,
        size: DesignTokens.iconMd,
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
        (toolbarHeight ?? DesignTokens.buttonHeightLg.h) +
            (bottom?.preferredSize.height ?? 0),
      );
}

/// FSMSliverAppBar - Scrollable app bar with collapse behavior
///
/// **STANDARDIZATION (2025 Redesign):**
/// - Collapsed Height: 80.h (same as FSMAppBar for consistency)
/// - Expanded Height: 120.0 (default for dashboard/main screens)
/// - Background: Teal-to-Green gradient (AppColors.primaryGradient)
/// - Title/Subtitle: Same styling as FSMAppBar (18.sp / 12.sp)
/// - Icon Color: White (AppColors.onPrimary)
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
  /// Uses standardized 120.0 expanded height for consistency
  const FSMSliverAppBar.gradient({
    super.key,
    this.title,
    this.titleWidget,
    this.subtitle,
    this.actions,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.flexibleSpace,
    this.expandedHeight = 120.0,
    this.floating = false,
    this.pinned = true,
    this.snap = false,
    this.centerTitle = false,
    this.systemOverlayStyle,
    LinearGradient? customGradient,
  })  : backgroundColor = null,
        gradient = customGradient,
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
    final effectiveBackgroundColor =
        backgroundColor ?? theme.colorScheme.primary;
    final effectiveElevation = elevation ?? DesignTokens.elevationSm;

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
                color: theme.colorScheme.onPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            RSizedBox(height: DesignTokens.space1),
            Text(
              subtitle!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onPrimary.withValues(alpha: 0.8),
              ),
            ),
          ],
        );
      } else {
        titleContent = Text(
          title!,
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.onPrimary,
            fontWeight: FontWeight.w600,
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
        color: theme.colorScheme.onPrimary,
        size: DesignTokens.iconMd,
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
          color: theme.colorScheme.onPrimary,
          size: DesignTokens.iconMd,
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
    final theme = Theme.of(context);
    Widget button = IconButton(
      icon: Icon(icon, color: iconColor ?? theme.colorScheme.onPrimary),
      onPressed: onPressed,
      tooltip: tooltip,
      iconSize: DesignTokens.iconMd,
      constraints: BoxConstraints(
        minWidth: DesignTokens.buttonHeightMd,
        minHeight: DesignTokens.buttonHeightMd,
      ),
    );

    if (badge != null) {
      button = Stack(
        clipBehavior: Clip.none,
        children: [
          button,
          Positioned(
            top: DesignTokens.space2.h,
            right: DesignTokens.space2.w,
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
    final theme = Theme.of(context);
    final displayCount = count > 99 ? '99+' : count.toString();

    return Container(
      padding: REdgeInsets.symmetric(
        horizontal: count > 9 ? DesignTokens.space1 : DesignTokens.space2,
        vertical: DesignTokens.space1,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.error,
        borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
      ),
      constraints: BoxConstraints(
        minWidth: DesignTokens.space4.w,
        minHeight: DesignTokens.space4.h,
      ),
      child: Center(
        child: Text(
          displayCount,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onError,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
