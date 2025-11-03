import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Centralized design tokens following an 8pt grid system.
///
/// This class provides all spacing, sizing, typography, and layout constants
/// used throughout the app. All values are const to avoid ScreenUtil
/// initialization issues. Responsive extensions (.w, .h, .sp, .r) should
/// be applied at the call site, not in token definitions.
///
/// Example usage:
/// ```dart
/// // Spacing
/// padding: REdgeInsets.all(DesignTokens.space4),
///
/// // Typography
/// fontSize: DesignTokens.fontSize14.sp,
///
/// // Widget helpers
/// DesignTokens.verticalSpaceMedium,
/// ```
class DesignTokens {
  DesignTokens._();

  // ============================================
  // SPACING SCALE (8pt grid)
  // ============================================
  /// 0px - No spacing
  static const double space0 = 0;

  /// 4px - Extra small spacing (0.5x base)
  static const double space1 = 4;

  /// 8px - Small spacing (1x base unit)
  static const double space2 = 8;

  /// 12px - Medium-small spacing (1.5x base)
  static const double space3 = 12;

  /// 16px - Medium spacing (2x base)
  static const double space4 = 16;

  /// 20px - Medium-large spacing (2.5x base)
  static const double space5 = 20;

  /// 24px - Large spacing (3x base)
  static const double space6 = 24;

  /// 32px - Extra large spacing (4x base)
  static const double space8 = 32;

  /// 40px - 2XL spacing (5x base)
  static const double space10 = 40;

  /// 48px - 3XL spacing (6x base)
  static const double space12 = 48;

  /// 56px - Large spacing (7x base)
  static const double space14 = 56;

  /// 64px - 4XL spacing (8x base)
  static const double space16 = 64;

  /// 80px - 5XL spacing (10x base)
  static const double space20 = 80;

  // ============================================
  // RADIUS SCALE
  // ============================================
  /// No border radius
  static const double radiusNone = 0;

  /// 4px - Extra small radius
  static const double radiusXs = 4;

  /// 8px - Small radius
  static const double radiusSm = 8;

  /// 12px - Medium radius
  static const double radiusMd = 12;

  /// 16px - Large radius
  static const double radiusLg = 16;

  /// 24px - Extra large radius
  static const double radiusXl = 24;

  /// Fully rounded (pill shape)
  static const double radiusFull = 9999;

  // ============================================
  // ICON SIZES
  // ============================================
  /// 12px - Extra small icon
  static const double iconXxs = 12;

  /// 16px - Extra small icon
  static const double iconXs = 16;

  /// 20px - Small icon
  static const double iconSm = 20;

  /// 24px - Medium icon (default)
  static const double iconMd = 24;

  /// 32px - Large icon
  static const double iconLg = 32;

  /// 40px - Extra large icon
  static const double iconXl = 40;

  /// 48px - 2XL icon
  static const double iconXxl = 48;

  // ============================================
  // COMPONENT HEIGHTS
  // ============================================
  /// 32px - Small button height
  static const double buttonHeightSm = 32;

  /// 48px - Medium button height (default)
  static const double buttonHeightMd = 48;

  /// 56px - Large button height
  static const double buttonHeightLg = 56;

  /// 56px - Input field height
  static const double inputHeight = 56;

  /// 56px - App bar height
  static const double appBarHeight = 56;

  /// 80px - Bottom navigation height
  static const double bottomNavHeight = 80;

  /// 64px - List item minimum height
  static const double listItemHeight = 64;

  // ============================================
  // TOUCH TARGETS
  // ============================================
  /// 44px - Minimum touch target size (accessibility)
  static const double touchTargetMin = 44;

  // ============================================
  // TYPOGRAPHY SCALE
  // ============================================
  /// 10px font size
  static const double fontSize10 = 10;

  /// 11px font size
  static const double fontSize11 = 11;

  /// 12px font size
  static const double fontSize12 = 12;

  /// 13px font size
  static const double fontSize13 = 13;

  /// 14px font size (body default)
  static const double fontSize14 = 14;

  /// 15px font size
  static const double fontSize15 = 15;

  /// 16px font size
  static const double fontSize16 = 16;

  /// 18px font size
  static const double fontSize18 = 18;

  /// 20px font size
  static const double fontSize20 = 20;

  /// 22px font size
  static const double fontSize22 = 22;

  /// 24px font size
  static const double fontSize24 = 24;

  /// 28px font size
  static const double fontSize28 = 28;

  /// 32px font size
  static const double fontSize32 = 32;

  /// 36px font size
  static const double fontSize36 = 36;

  /// 48px font size
  static const double fontSize48 = 48;

  // ============================================
  // FONT WEIGHTS
  // ============================================
  static const FontWeight fontWeightLight = FontWeight.w300;
  static const FontWeight fontWeightRegular = FontWeight.w400;
  static const FontWeight fontWeightMedium = FontWeight.w500;
  static const FontWeight fontWeightSemiBold = FontWeight.w600;
  static const FontWeight fontWeightBold = FontWeight.w700;

  // ============================================
  // LINE HEIGHTS
  // ============================================
  /// 1.2 - Tight line height
  static const double lineHeightTight = 1.2;

  /// 1.5 - Normal line height
  static const double lineHeightNormal = 1.5;

  /// 1.75 - Relaxed line height
  static const double lineHeightRelaxed = 1.75;

  // ============================================
  // BREAKPOINTS
  // ============================================
  /// 600px - Mobile/tablet breakpoint
  static const double breakpointMobile = 600;

  /// 1200px - Tablet/desktop breakpoint
  static const double breakpointTablet = 1200;

  // ============================================
  // ACCESSIBILITY
  // ============================================
  /// 48dp - Minimum touch target size (Material Design)
  static const double minTouchTarget = 48;

  // ============================================
  // Z-INDEX / ELEVATION
  // ============================================
  /// No elevation
  static const double elevationNone = 0;

  /// 1dp elevation - Extra small
  static const double elevationXSmall = 1;

  /// 2dp elevation
  static const double elevationSm = 2;

  /// 2dp elevation (alias)
  static const double elevationSmall = 2;

  /// 4dp elevation
  static const double elevationMd = 4;

  /// 8dp elevation
  static const double elevationLg = 8;

  /// 16dp elevation
  static const double elevationXl = 16;

  // ============================================
  // OPACITY LEVELS
  // ============================================
  static const double opacityDisabled = 0.38;
  static const double opacityMedium = 0.60;
  static const double opacityHigh = 0.87;

  // ============================================
  // BORDER WIDTHS
  // ============================================
  static const double borderWidthThin = 1.0;
  static const double borderWidthMedium = 2.0;
  static const double borderWidthThick = 4.0;

  // ============================================
  // CARD COMPONENTS
  // ============================================
  /// Standard list card horizontal padding
  static const double cardPaddingHorizontal = space4;

  /// Standard list card vertical padding
  static const double cardPaddingVertical = space2;

  /// Card thumbnail/icon container size (square)
  static const double cardThumbnailSize = 80;

  /// Card icon container size for smaller icons (square)
  static const double cardIconContainerSize = iconXl;

  /// Card metadata row height
  static const double cardMetadataRowHeight = 20;

  /// Card accent border width (left side)
  static const double cardAccentBorderWidth = borderWidthThick;

  /// Card minimum height (for list cards)
  static const double cardMinHeight = 100;

  /// Card spacing between elements (internal)
  static const double cardInternalSpacing = space2;

  /// Card badge size (status, priority)
  static const double cardBadgeHeight = 24;

  /// Standard card elevation
  static const double cardElevation = elevationSm;

  // ============================================
  // RESPONSIVE HELPERS
  // ============================================

  /// Pre-built responsive padding: 8px all sides
  static REdgeInsets get paddingAllSmall => REdgeInsets.all(space2);

  /// Pre-built responsive padding: 16px all sides
  static REdgeInsets get paddingAllMedium => REdgeInsets.all(space4);

  /// Pre-built responsive padding: 24px all sides
  static REdgeInsets get paddingAllLarge => REdgeInsets.all(space6);

  /// Pre-built responsive padding: 16px horizontal, 8px vertical
  static REdgeInsets get paddingSymmetricDefault =>
      REdgeInsets.symmetric(horizontal: space4, vertical: space2);

  /// Standard card padding (16px horizontal, 8px vertical)
  static REdgeInsets get cardPadding => REdgeInsets.symmetric(
        horizontal: cardPaddingHorizontal,
        vertical: cardPaddingVertical,
      );

  /// Creates responsive padding with custom horizontal and vertical values
  static REdgeInsets paddingSymmetricR({
    double horizontal = 0,
    double vertical = 0,
  }) {
    return REdgeInsets.symmetric(
      horizontal: horizontal,
      vertical: vertical,
    );
  }

  /// Creates responsive padding with custom values for all sides
  static REdgeInsets paddingOnlyR({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return REdgeInsets.only(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    );
  }

  /// Creates vertical spacing widget with custom height
  static Widget verticalSpace(double height) => RSizedBox(height: height);

  /// Creates horizontal spacing widget with custom width
  static Widget horizontalSpace(double width) => RSizedBox(width: width);

  /// Vertical spacing: 4px
  static const Widget verticalSpaceXs = RSizedBox(height: space1);

  /// Vertical spacing: 8px
  static const Widget verticalSpaceSmall = RSizedBox(height: space2);

  /// Vertical spacing: 12px
  static const Widget verticalSpaceMd = RSizedBox(height: space3);

  /// Vertical spacing: 16px
  static const Widget verticalSpaceMedium = RSizedBox(height: space4);

  /// Vertical spacing: 24px
  static const Widget verticalSpaceLarge = RSizedBox(height: space6);

  /// Vertical spacing: 24px (alias)
  static const Widget verticalSpaceLg = RSizedBox(height: space6);

  /// Vertical spacing: 32px
  static const Widget verticalSpaceXl = RSizedBox(height: space8);

  /// Horizontal spacing: 4px
  static const Widget horizontalSpaceXs = RSizedBox(width: space1);

  /// Horizontal spacing: 8px
  static const Widget horizontalSpaceSmall = RSizedBox(width: space2);

  /// Horizontal spacing: 12px
  static const Widget horizontalSpaceMd = RSizedBox(width: space3);

  /// Horizontal spacing: 16px
  static const Widget horizontalSpaceMedium = RSizedBox(width: space4);

  /// Horizontal spacing: 24px
  static const Widget horizontalSpaceLarge = RSizedBox(width: space6);

  /// Horizontal spacing: 32px
  static const Widget horizontalSpaceXl = RSizedBox(width: space8);

  // ============================================
  // BREAKPOINT HELPERS
  // ============================================

  /// Check if current screen is mobile size (<600px)
  static bool get isMobile => 1.sw < breakpointMobile;

  /// Check if current screen is tablet size (600px-1200px)
  static bool get isTablet =>
      1.sw >= breakpointMobile && 1.sw < breakpointTablet;

  /// Check if current screen is desktop size (>1200px)
  static bool get isDesktop => 1.sw >= breakpointTablet;

  // ============================================
  // DURATION CONSTANTS
  // ============================================
  /// 150ms - Fast animation
  static const Duration durationFast = Duration(milliseconds: 150);

  /// 300ms - Normal animation
  static const Duration durationNormal = Duration(milliseconds: 300);

  /// 500ms - Slow animation
  static const Duration durationSlow = Duration(milliseconds: 500);
}
