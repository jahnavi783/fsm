
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Spacing and dimension tokens as ThemeExtension (Flutter-official approach)
///
/// This provides a theme-aware design token system following Material Design's
/// 8pt grid system. All spacing values can vary between light/dark themes.
///
/// Access via: Theme.of(context).extension<SpacingTheme>()
/// or use the extension: context.spacing
///
/// Example:
/// ```dart
/// Container(
///   padding: context.spacing.cardPaddingAll,
///   child: Column(
///     children: [
///       Text('Title'),
///       context.spacing.verticalSpaceMedium,
///       Text('Body'),
///     ],
///   ),
/// )
/// ```
@immutable
class SpacingTheme extends ThemeExtension<SpacingTheme> {
  // ============================================
  // PRIMITIVE SPACING SCALE (8pt grid)
  // ============================================
  /// 0px - No spacing
  final double space0;

  /// 4px - Extra small spacing (0.5x base)
  final double space1;

  /// 8px - Small spacing (1x base unit)
  final double space2;

  /// 12px - Medium-small spacing (1.5x base)
  final double space3;

  /// 16px - Medium spacing (2x base)
  final double space4;

  /// 20px - Medium-large spacing (2.5x base)
  final double space5;

  /// 24px - Large spacing (3x base)
  final double space6;

  /// 32px - Extra large spacing (4x base)
  final double space8;

  /// 40px - 2XL spacing (5x base)
  final double space10;

  /// 48px - 3XL spacing (6x base)
  final double space12;

  /// 64px - 4XL spacing (8x base)
  final double space16;

  /// 80px - 5XL spacing (10x base)
  final double space20;

  // ============================================
  // RADIUS SCALE
  // ============================================
  /// No border radius
  final double radiusNone;

  /// 4px - Extra small radius
  final double radiusXs;

  /// 8px - Small radius
  final double radiusSm;

  /// 12px - Medium radius
  final double radiusMd;

  /// 16px - Large radius
  final double radiusLg;

  /// 24px - Extra large radius
  final double radiusXl;

  /// Fully rounded (pill shape)
  final double radiusFull;

  // ============================================
  // ICON SIZES
  // ============================================
  /// 12px - Extra extra small icon
  final double iconXxs;

  /// 16px - Extra small icon
  final double iconXs;

  /// 20px - Small icon
  final double iconSm;

  /// 24px - Medium icon (default)
  final double iconMd;

  /// 32px - Large icon
  final double iconLg;

  /// 40px - Extra large icon
  final double iconXl;

  /// 48px - 2XL icon
  final double iconXxl;

  // ============================================
  // COMPONENT HEIGHTS
  // ============================================
  /// 32px - Small button height
  final double buttonHeightSm;

  /// 48px - Medium button height (default)
  final double buttonHeightMd;

  /// 56px - Large button height
  final double buttonHeightLg;

  /// 56px - Input field height
  final double inputHeight;

  /// 56px - App bar height
  final double appBarHeight;

  /// 80px - Bottom navigation height
  final double bottomNavHeight;

  /// 64px - List item minimum height
  final double listItemHeight;

  // ============================================
  // SEMANTIC COMPONENT TOKENS (Theme-Variant)
  // ============================================
  // These can vary between light/dark themes for better UX

  /// Card padding (can be larger in dark mode for readability)
  final double cardPadding;

  /// Card corner radius
  final double cardRadius;

  /// Card margin between items
  final double cardMargin;

  /// Button horizontal padding
  final double buttonPaddingHorizontal;

  /// Button vertical padding
  final double buttonPaddingVertical;

  /// Button corner radius
  final double buttonRadius;

  /// Input field horizontal padding
  final double inputPaddingHorizontal;

  /// Input field vertical padding
  final double inputPaddingVertical;

  /// Input field corner radius
  final double inputRadius;

  /// List item padding
  final double listItemPadding;

  /// Spacing between list item content
  final double listItemContentGap;

  /// Page horizontal margins
  final double pageMarginHorizontal;

  /// Page vertical margins
  final double pageMarginVertical;

  /// Section spacing (between major sections)
  final double sectionSpacing;

  // ============================================
  // ACCESSIBILITY
  // ============================================
  /// 48dp - Minimum touch target size (Material Design)
  final double minTouchTarget;

  // ============================================
  // Z-INDEX / ELEVATION
  // ============================================
  /// No elevation
  final double elevationNone;

  /// 2dp elevation
  final double elevationSm;

  /// 4dp elevation
  final double elevationMd;

  /// 8dp elevation
  final double elevationLg;

  /// 16dp elevation
  final double elevationXl;

  const SpacingTheme({
    // Spacing scale
    this.space0 = 0,
    this.space1 = 4,
    this.space2 = 8,
    this.space3 = 12,
    this.space4 = 16,
    this.space5 = 20,
    this.space6 = 24,
    this.space8 = 32,
    this.space10 = 40,
    this.space12 = 48,
    this.space16 = 64,
    this.space20 = 80,
    // Radius scale
    this.radiusNone = 0,
    this.radiusXs = 4,
    this.radiusSm = 8,
    this.radiusMd = 12,
    this.radiusLg = 16,
    this.radiusXl = 24,
    this.radiusFull = 9999,
    // Icon sizes
    this.iconXxs = 12,
    this.iconXs = 16,
    this.iconSm = 20,
    this.iconMd = 24,
    this.iconLg = 32,
    this.iconXl = 40,
    this.iconXxl = 48,
    // Component heights
    this.buttonHeightSm = 32,
    this.buttonHeightMd = 48,
    this.buttonHeightLg = 56,
    this.inputHeight = 56,
    this.appBarHeight = 56,
    this.bottomNavHeight = 80,
    this.listItemHeight = 64,
    // Semantic tokens (can vary by theme)
    this.cardPadding = 16,
    this.cardRadius = 16,
    this.cardMargin = 12,
    this.buttonPaddingHorizontal = 16,
    this.buttonPaddingVertical = 12,
    this.buttonRadius = 12,
    this.inputPaddingHorizontal = 16,
    this.inputPaddingVertical = 12,
    this.inputRadius = 12,
    this.listItemPadding = 16,
    this.listItemContentGap = 12,
    this.pageMarginHorizontal = 16,
    this.pageMarginVertical = 24,
    this.sectionSpacing = 32,
    // Accessibility
    this.minTouchTarget = 48,
    // Elevation
    this.elevationNone = 0,
    this.elevationSm = 2,
    this.elevationMd = 4,
    this.elevationLg = 8,
    this.elevationXl = 16,
  });

  /// Light theme spacing (standard values)
  static const light = SpacingTheme();

  /// Dark theme spacing (slightly adjusted for better readability)
  static const dark = SpacingTheme(
    // Slightly larger padding in dark mode for comfort
    cardPadding: 18,
    buttonPaddingVertical: 14,
    listItemPadding: 18,
    pageMarginVertical: 28,
  );

  @override
  ThemeExtension<SpacingTheme> copyWith({
    double? space0,
    double? space1,
    double? space2,
    double? space3,
    double? space4,
    double? space5,
    double? space6,
    double? space8,
    double? space10,
    double? space12,
    double? space16,
    double? space20,
    double? radiusNone,
    double? radiusXs,
    double? radiusSm,
    double? radiusMd,
    double? radiusLg,
    double? radiusXl,
    double? radiusFull,
    double? iconXxs,
    double? iconXs,
    double? iconSm,
    double? iconMd,
    double? iconLg,
    double? iconXl,
    double? iconXxl,
    double? buttonHeightSm,
    double? buttonHeightMd,
    double? buttonHeightLg,
    double? inputHeight,
    double? appBarHeight,
    double? bottomNavHeight,
    double? listItemHeight,
    double? cardPadding,
    double? cardRadius,
    double? cardMargin,
    double? buttonPaddingHorizontal,
    double? buttonPaddingVertical,
    double? buttonRadius,
    double? inputPaddingHorizontal,
    double? inputPaddingVertical,
    double? inputRadius,
    double? listItemPadding,
    double? listItemContentGap,
    double? pageMarginHorizontal,
    double? pageMarginVertical,
    double? sectionSpacing,
    double? minTouchTarget,
    double? elevationNone,
    double? elevationSm,
    double? elevationMd,
    double? elevationLg,
    double? elevationXl,
  }) {
    return SpacingTheme(
      space0: space0 ?? this.space0,
      space1: space1 ?? this.space1,
      space2: space2 ?? this.space2,
      space3: space3 ?? this.space3,
      space4: space4 ?? this.space4,
      space5: space5 ?? this.space5,
      space6: space6 ?? this.space6,
      space8: space8 ?? this.space8,
      space10: space10 ?? this.space10,
      space12: space12 ?? this.space12,
      space16: space16 ?? this.space16,
      space20: space20 ?? this.space20,
      radiusNone: radiusNone ?? this.radiusNone,
      radiusXs: radiusXs ?? this.radiusXs,
      radiusSm: radiusSm ?? this.radiusSm,
      radiusMd: radiusMd ?? this.radiusMd,
      radiusLg: radiusLg ?? this.radiusLg,
      radiusXl: radiusXl ?? this.radiusXl,
      radiusFull: radiusFull ?? this.radiusFull,
      iconXxs: iconXxs ?? this.iconXxs,
      iconXs: iconXs ?? this.iconXs,
      iconSm: iconSm ?? this.iconSm,
      iconMd: iconMd ?? this.iconMd,
      iconLg: iconLg ?? this.iconLg,
      iconXl: iconXl ?? this.iconXl,
      iconXxl: iconXxl ?? this.iconXxl,
      buttonHeightSm: buttonHeightSm ?? this.buttonHeightSm,
      buttonHeightMd: buttonHeightMd ?? this.buttonHeightMd,
      buttonHeightLg: buttonHeightLg ?? this.buttonHeightLg,
      inputHeight: inputHeight ?? this.inputHeight,
      appBarHeight: appBarHeight ?? this.appBarHeight,
      bottomNavHeight: bottomNavHeight ?? this.bottomNavHeight,
      listItemHeight: listItemHeight ?? this.listItemHeight,
      cardPadding: cardPadding ?? this.cardPadding,
      cardRadius: cardRadius ?? this.cardRadius,
      cardMargin: cardMargin ?? this.cardMargin,
      buttonPaddingHorizontal: buttonPaddingHorizontal ?? this.buttonPaddingHorizontal,
      buttonPaddingVertical: buttonPaddingVertical ?? this.buttonPaddingVertical,
      buttonRadius: buttonRadius ?? this.buttonRadius,
      inputPaddingHorizontal: inputPaddingHorizontal ?? this.inputPaddingHorizontal,
      inputPaddingVertical: inputPaddingVertical ?? this.inputPaddingVertical,
      inputRadius: inputRadius ?? this.inputRadius,
      listItemPadding: listItemPadding ?? this.listItemPadding,
      listItemContentGap: listItemContentGap ?? this.listItemContentGap,
      pageMarginHorizontal: pageMarginHorizontal ?? this.pageMarginHorizontal,
      pageMarginVertical: pageMarginVertical ?? this.pageMarginVertical,
      sectionSpacing: sectionSpacing ?? this.sectionSpacing,
      minTouchTarget: minTouchTarget ?? this.minTouchTarget,
      elevationNone: elevationNone ?? this.elevationNone,
      elevationSm: elevationSm ?? this.elevationSm,
      elevationMd: elevationMd ?? this.elevationMd,
      elevationLg: elevationLg ?? this.elevationLg,
      elevationXl: elevationXl ?? this.elevationXl,
    );
  }

  @override
  ThemeExtension<SpacingTheme> lerp(
    covariant ThemeExtension<SpacingTheme>? other,
    double t,
  ) {
    if (other is! SpacingTheme) return this;
    // Simple interpolation: choose nearest end based on t
    return t < 0.5 ? this : other;
  }

  // ============================================
  // CONVENIENCE HELPERS (Responsive)
  // ============================================

  //-----------------------------------------
  // Strongly-typed EdgeInsets presets
  //-----------------------------------------
  REdgeInsets get paddingXs => REdgeInsets.all(space1);
  REdgeInsets get paddingSm => REdgeInsets.all(space2);
  REdgeInsets get paddingMd => REdgeInsets.all(space4);
  REdgeInsets get paddingLg => REdgeInsets.all(space6);

  // Card padding preset
  REdgeInsets get cardPaddingAll => REdgeInsets.all(cardPadding);

  /// Card padding compact (less padding)
  REdgeInsets get cardPaddingCompact =>
      REdgeInsets.symmetric(horizontal: space3, vertical: space2);

  /// Button padding preset
  REdgeInsets get buttonPadding => REdgeInsets.symmetric(
    horizontal: buttonPaddingHorizontal,
    vertical: buttonPaddingVertical,
  );

  /// Button padding for icon-only buttons
  REdgeInsets get buttonPaddingIconOnly => REdgeInsets.all(space3);

  /// List item padding preset
  REdgeInsets get listPadding => REdgeInsets.all(listItemPadding);

  /// Page layout padding (respects margins)
  REdgeInsets get pageLayoutPadding => REdgeInsets.symmetric(
    horizontal: pageMarginHorizontal,
    vertical: pageMarginVertical,
  );

  /// Input decoration padding
  REdgeInsets get inputDecorationPadding => REdgeInsets.symmetric(
    horizontal: inputPaddingHorizontal,
    vertical: inputPaddingVertical,
  );

  // --------------------------------------------
  // Strongly-typed BorderRadius presets
  // --------------------------------------------
  BorderRadius get radiusSmBr => BorderRadius.circular(radiusSm.r);
  BorderRadius get radiusMdBr => BorderRadius.circular(radiusMd.r);
  BorderRadius get radiusLgBr => BorderRadius.circular(radiusLg.r);
  BorderRadius get radiusXlBr => BorderRadius.circular(radiusXl.r);
  BorderRadius get cardRadiusBr => BorderRadius.circular(cardRadius.r);

  // --------------------------------------------
  // Strongly-typed Size presets
  // --------------------------------------------
  Size get buttonSizeSm => Size(double.infinity, buttonHeightSm.h);
  Size get buttonSizeMd => Size(double.infinity, buttonHeightMd.h);
  Size get buttonSizeLg => Size(double.infinity, buttonHeightLg.h);

  // ============================================
  // SPACING WIDGETS (Semantic & Responsive)
  // ============================================

  /// Vertical spacing: 4px
  Widget get verticalSpaceXs => RSizedBox(height: space1);

  /// Vertical spacing: 8px
  Widget get verticalSpaceSmall => RSizedBox(height: space2);

  /// Vertical spacing: 12px
  Widget get verticalSpaceMd => RSizedBox(height: space3);

  /// Vertical spacing: 16px
  Widget get verticalSpaceMedium => RSizedBox(height: space4);

  /// Vertical spacing: 24px
  Widget get verticalSpaceLarge => RSizedBox(height: space6);

  /// Vertical spacing: 32px
  Widget get verticalSpaceXl => RSizedBox(height: space8);

  /// Horizontal spacing: 4px
  Widget get horizontalSpaceXs => RSizedBox(width: space1);

  /// Horizontal spacing: 8px
  Widget get horizontalSpaceSmall => RSizedBox(width: space2);

  /// Horizontal spacing: 12px
  Widget get horizontalSpaceMd => RSizedBox(width: space3);

  /// Horizontal spacing: 16px
  Widget get horizontalSpaceMedium => RSizedBox(width: space4);

  /// Horizontal spacing: 24px
  Widget get horizontalSpaceLarge => RSizedBox(width: space6);

  /// Horizontal spacing: 32px
  Widget get horizontalSpaceXl => RSizedBox(width: space8);

  /// Spacing between form fields
  Widget get formFieldSpacing => RSizedBox(height: space4);

  /// Spacing between sections
  Widget get sectionSpacingWidget => RSizedBox(height: sectionSpacing);

  /// Spacing between card content items
  Widget get cardContentSpacing => RSizedBox(height: space3);

  /// Spacing between list items
  Widget get listItemSpacingWidget => RSizedBox(height: space2);

  // ============================================
  // BREAKPOINT HELPERS
  // ============================================

  /// 600px - Mobile/tablet breakpoint
  static const double breakpointMobile = 600;

  /// 1200px - Tablet/desktop breakpoint
  static const double breakpointTablet = 1200;

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

/// Extension for convenient access to spacing theme
extension SpacingThemeExtension on BuildContext {
  SpacingTheme get spacing {
    final extension = Theme.of(this).extension<SpacingTheme>();
    assert(
      extension != null,
      'SpacingTheme not found in theme. '
      'Make sure SpacingTheme is added to ThemeData.extensions',
    );
    return extension!;
  }
}
