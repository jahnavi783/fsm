import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Centralized theme constants for the FSM application
/// This file contains additional theme-related constants that don't fit
/// into the main theme files but are used throughout the app
class ThemeConstants {
  ThemeConstants._();

  // Animation Constants
  static const Duration fastAnimation = Duration(milliseconds: 150);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration slowAnimation = Duration(milliseconds: 500);
  static const Duration extraSlowAnimation = Duration(milliseconds: 800);

  // Curve Constants
  static const Curve defaultCurve = Curves.easeInOut;
  static const Curve bounceCurve = Curves.bounceInOut;
  static const Curve elasticCurve = Curves.elasticInOut;

  // Opacity Constants
  static const double disabledOpacity = 0.38;
  static const double mediumOpacity = 0.54;
  static const double highOpacity = 0.87;
  static const double overlayOpacity = 0.12;

  // Border Constants
  static double get thinBorder => 0.5.w;
  static double get normalBorder => 1.0.w;
  static double get thickBorder => 2.0.w;

  // Shadow Constants
  static List<BoxShadow> get cardShadow => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.05),
      offset: Offset(0, 1.h),
      blurRadius: 3.r,
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.1),
      offset: Offset(0, 1.h),
      blurRadius: 2.r,
    ),
  ];

  static List<BoxShadow> get elevatedShadow => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.1),
      offset: Offset(0, 2.h),
      blurRadius: 4.r,
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.15),
      offset: Offset(0, 1.h),
      blurRadius: 6.r,
    ),
  ];

  static List<BoxShadow> get floatingShadow => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.15),
      offset: Offset(0, 4.h),
      blurRadius: 8.r,
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.2),
      offset: Offset(0, 2.h),
      blurRadius: 4.r,
    ),
  ];

  // Gradient Constants (beyond basic primary gradient)
  static const LinearGradient successGradient = LinearGradient(
    colors: [Color(0xFF4CAF50), Color(0xFF45a049)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient warningGradient = LinearGradient(
    colors: [Color(0xFFFF9800), Color(0xFFf57c00)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient errorGradient = LinearGradient(
    colors: [Color(0xFFF44336), Color(0xFFd32f2f)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient neutralGradient = LinearGradient(
    colors: [Color(0xFF9E9E9E), Color(0xFF757575)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Layout Constants
  static double get maxContentWidth => 1200.w;
  static double get sidebarWidth => 280.w;
  static double get collapsedSidebarWidth => 64.w;

  // Breakpoint Helper Methods
  static bool isMobileSize(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  static bool isTabletSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 600 && width < 1024;
  }

  static bool isDesktopSize(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1024;
  }

  // Status Badge Colors and Gradients
  static const Map<String, LinearGradient> statusGradients = {
    'assigned': LinearGradient(
      colors: [Color(0xFF2196F3), Color(0xFF1976D2)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    'in_progress': LinearGradient(
      colors: [Color(0xFFFF9800), Color(0xFFF57C00)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    'paused': LinearGradient(
      colors: [Color(0xFF9C27B0), Color(0xFF7B1FA2)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    'completed': LinearGradient(
      colors: [Color(0xFF4CAF50), Color(0xFF388E3C)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    'cancelled': LinearGradient(
      colors: [Color(0xFFF44336), Color(0xFFD32F2F)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    'rejected': LinearGradient(
      colors: [Color(0xFF795548), Color(0xFF5D4037)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  };

  // Priority Badge Colors and Gradients
  static const Map<String, LinearGradient> priorityGradients = {
    'low': LinearGradient(
      colors: [Color(0xFFFFBB00), Color(0xFFFF8F00)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    'medium': LinearGradient(
      colors: [Color(0xFF497FE4), Color(0xFF3F51B5)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    'high': LinearGradient(
      colors: [Color(0xFFA01313), Color(0xFF7B1FA2)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    'urgent': LinearGradient(
      colors: [Color(0xFFA01313), Color(0xFF8B0000)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  };

  // Helper Methods for Gradients
  static LinearGradient getStatusGradient(String status) {
    return statusGradients[status.toLowerCase()] ?? neutralGradient;
  }

  static LinearGradient getPriorityGradient(String priority) {
    return priorityGradients[priority.toLowerCase()] ?? neutralGradient;
  }

  // Form Constants
  static double get inputBorderWidth => 1.5.w;
  static double get inputFocusBorderWidth => 2.0.w;
  static double get inputErrorBorderWidth => 2.0.w;

  // Card Constants
  static double get cardBorderWidth => 1.0.w;
  static double get cardSelectedBorderWidth => 2.0.w;

  // List Constants
  static double get listItemMinHeight => 56.h;
  static double get listItemPadding => 16.w;
  static double get listItemSpacing => 8.h;

  // Shimmer Constants
  static const Duration shimmerDuration = Duration(milliseconds: 1500);
  static const Color shimmerBaseColor = Color(0xFFE0E0E0);
  static const Color shimmerHighlightColor = Color(0xFFF5F5F5);

  // Z-Index Constants (for stacking order)
  static const int bottomNavZIndex = 10;
  static const int appBarZIndex = 20;
  static const int drawerZIndex = 30;
  static const int modalZIndex = 40;
  static const int overlayZIndex = 50;
  static const int tooltipZIndex = 60;
}