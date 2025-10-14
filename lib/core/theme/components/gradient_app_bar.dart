import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors.dart';
import '../app_dimensions.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final PreferredSizeWidget? bottom;
  final List<Widget>? actions;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final bool centerTitle;
  final double? elevation;
  final Color? backgroundColor;
  final Gradient? gradient;

  const GradientAppBar({
    super.key,
    required this.title,
    this.bottom,
    this.actions,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.centerTitle = true,
    this.elevation,
    this.backgroundColor,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveGradient = gradient ?? AppColors.primaryGradient;
    
    return Container(
      decoration: BoxDecoration(
        gradient: effectiveGradient,
      ),
      child: AppBar(
        title: title,
        bottom: bottom,
        actions: actions,
        leading: leading,
        automaticallyImplyLeading: automaticallyImplyLeading,
        centerTitle: centerTitle,
        elevation: elevation ?? 0,
        backgroundColor: backgroundColor ?? Colors.transparent,
        foregroundColor: AppColors.onPrimary,
        iconTheme: IconThemeData(
          color: AppColors.onPrimary,
          size: AppDimensions.iconMedium,
        ),
        actionsIconTheme: IconThemeData(
          color: AppColors.onPrimary,
          size: AppDimensions.iconMedium,
        ),
        titleTextStyle: theme.textTheme.headlineSmall?.copyWith(
          color: AppColors.onPrimary,
          fontWeight: FontWeight.w600,
          fontSize: 20.sp,
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    final bottomHeight = bottom?.preferredSize.height ?? 0;
    return Size.fromHeight(AppDimensions.appBarHeight + bottomHeight);
  }
}

// Convenience constructors for common use cases
class GradientAppBarPrimary extends GradientAppBar {
  const GradientAppBarPrimary({
    super.key,
    required super.title,
    super.bottom,
    super.actions,
    super.leading,
    super.automaticallyImplyLeading = true,
    super.centerTitle = true,
    super.elevation,
  }) : super(
    gradient: AppColors.primaryGradient,
  );
}

class GradientAppBarHorizontal extends GradientAppBar {
  const GradientAppBarHorizontal({
    super.key,
    required super.title,
    super.bottom,
    super.actions,
    super.leading,
    super.automaticallyImplyLeading = true,
    super.centerTitle = true,
    super.elevation,
  }) : super(
    gradient: AppColors.primaryGradientHorizontal,
  );
}