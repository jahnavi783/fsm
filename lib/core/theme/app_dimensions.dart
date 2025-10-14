import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDimensions {
  AppDimensions._();

  // Responsive Padding
  static double get paddingXSmall => 4.w;
  static double get paddingSmall => 8.w;
  static double get paddingMedium => 16.w;
  static double get paddingLarge => 24.w;
  static double get paddingXLarge => 32.w;

  // Responsive Margins
  static double get marginXSmall => 4.w;
  static double get marginSmall => 8.w;
  static double get marginMedium => 16.w;
  static double get marginLarge => 24.w;
  static double get marginXLarge => 32.w;

  // Responsive Border Radius
  static double get radiusXSmall => 4.r;
  static double get radiusSmall => 8.r;
  static double get radiusMedium => 12.r;
  static double get radiusLarge => 16.r;
  static double get radiusXLarge => 24.r;
  static double get radiusCircular => 50.r;

  // Responsive Icon Sizes
  static double get iconXSmall => 16.sp;
  static double get iconSmall => 20.sp;
  static double get iconMedium => 24.sp;
  static double get iconLarge => 32.sp;
  static double get iconXLarge => 48.sp;

  // Responsive Heights
  static double get buttonHeight => 48.h;
  static double get inputHeight => 56.h;
  static double get appBarHeight => 80.h;
  static double get bottomNavHeight => 80.h;
  static double get cardMinHeight => 120.h;
  static double get listItemHeight => 72.h;

  // Responsive Widths
  static double get buttonMinWidth => 120.w;
  static double get cardMaxWidth => 400.w;
  static double get dialogMaxWidth => 560.w;

  // Elevation
  static double get elevationNone => 0;
  static double get elevationSmall => 2;
  static double get elevationMedium => 4;
  static double get elevationLarge => 8;
  static double get elevationXLarge => 16;

  // Responsive Spacing
  static double get spaceXSmall => 4.h;
  static double get spaceSmall => 8.h;
  static double get spaceMedium => 16.h;
  static double get spaceLarge => 24.h;
  static double get spaceXLarge => 32.h;

  // Responsive Divider
  static double get dividerThickness => 1.h;
  static double get dividerIndent => 16.w;

  // Responsive Card
  static double get cardElevation => 2;
  static double get cardBorderWidth => 1.w;

  // Responsive Chip
  static double get chipHeight => 32.h;
  static double get chipPadding => 12.w;

  // Responsive Progress Indicator
  static double get progressIndicatorHeight => 4.h;
  static double get progressIndicatorRadius => 2.r;

  // Responsive Shimmer
  static double get shimmerHeight => 16.h;
  static double get shimmerRadius => 4.r;

  // Responsive Image
  static double get avatarSmall => 32.w;
  static double get avatarMedium => 48.w;
  static double get avatarLarge => 64.w;
  static double get avatarXLarge => 96.w;

  // Responsive Breakpoints
  static double get mobileBreakpoint => 600.w;
  static double get tabletBreakpoint => 900.w;
  static double get desktopBreakpoint => 1200.w;

  // Grid and Layout
  static int get gridCrossAxisCount {
    final screenWidth = 1.sw;
    if (screenWidth < mobileBreakpoint) return 1;
    if (screenWidth < tabletBreakpoint) return 2;
    if (screenWidth < desktopBreakpoint) return 3;
    return 4;
  }

  static double get gridChildAspectRatio {
    final screenWidth = 1.sw;
    if (screenWidth < mobileBreakpoint) return 1.2;
    if (screenWidth < tabletBreakpoint) return 1.1;
    return 1.0;
  }

  // Animation Durations
  static const Duration animationFast = Duration(milliseconds: 150);
  static const Duration animationMedium = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);

  // Responsive Methods
  static bool get isMobile => 1.sw < mobileBreakpoint;
  static bool get isTablet => 1.sw >= mobileBreakpoint && 1.sw < desktopBreakpoint;
  static bool get isDesktop => 1.sw >= desktopBreakpoint;

  // Responsive Padding Methods
  static EdgeInsets get paddingAllSmall => EdgeInsets.all(paddingSmall);
  static EdgeInsets get paddingAllMedium => EdgeInsets.all(paddingMedium);
  static EdgeInsets get paddingAllLarge => EdgeInsets.all(paddingLarge);

  static EdgeInsets get paddingHorizontalSmall => EdgeInsets.symmetric(horizontal: paddingSmall);
  static EdgeInsets get paddingHorizontalMedium => EdgeInsets.symmetric(horizontal: paddingMedium);
  static EdgeInsets get paddingHorizontalLarge => EdgeInsets.symmetric(horizontal: paddingLarge);

  static EdgeInsets get paddingVerticalSmall => EdgeInsets.symmetric(vertical: paddingSmall);
  static EdgeInsets get paddingVerticalMedium => EdgeInsets.symmetric(vertical: paddingMedium);
  static EdgeInsets get paddingVerticalLarge => EdgeInsets.symmetric(vertical: paddingLarge);

  // Responsive Margin Methods
  static EdgeInsets get marginAllSmall => EdgeInsets.all(marginSmall);
  static EdgeInsets get marginAllMedium => EdgeInsets.all(marginMedium);
  static EdgeInsets get marginAllLarge => EdgeInsets.all(marginLarge);

  static EdgeInsets get marginHorizontalSmall => EdgeInsets.symmetric(horizontal: marginSmall);
  static EdgeInsets get marginHorizontalMedium => EdgeInsets.symmetric(horizontal: marginMedium);
  static EdgeInsets get marginHorizontalLarge => EdgeInsets.symmetric(horizontal: marginLarge);

  static EdgeInsets get marginVerticalSmall => EdgeInsets.symmetric(vertical: marginSmall);
  static EdgeInsets get marginVerticalMedium => EdgeInsets.symmetric(vertical: marginMedium);
  static EdgeInsets get marginVerticalLarge => EdgeInsets.symmetric(vertical: marginLarge);
}