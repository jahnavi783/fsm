import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'design_tokens.dart';
import 'extensions/fsm_theme_extension.dart';

class AppTheme {
  AppTheme._();

  /// Creates responsive text theme using DesignTokens
  ///
  /// Typography is configured here instead of a separate class to:
  /// - Apply responsive scaling (.sp) at theme creation time
  /// - Avoid ScreenUtil timing issues with static getters
  /// - Keep typography configuration centralized in one place
  static TextTheme _createTextTheme() {
    const fontFamily = 'Inter';

    return TextTheme(
      // Display styles - Large headings
      displayLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: DesignTokens.fontSize48.sp,
        fontWeight: DesignTokens.fontWeightRegular,
        letterSpacing: -0.25,
        height: DesignTokens.lineHeightTight,
      ),
      displayMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: DesignTokens.fontSize36.sp,
        fontWeight: DesignTokens.fontWeightRegular,
        height: DesignTokens.lineHeightTight,
      ),
      displaySmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: DesignTokens.fontSize32.sp,
        fontWeight: DesignTokens.fontWeightRegular,
        height: DesignTokens.lineHeightTight,
      ),

      // Headline styles - Section headings
      headlineLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: DesignTokens.fontSize32.sp,
        fontWeight: DesignTokens.fontWeightRegular,
        height: DesignTokens.lineHeightNormal,
      ),
      headlineMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: DesignTokens.fontSize28.sp,
        fontWeight: DesignTokens.fontWeightRegular,
        height: DesignTokens.lineHeightNormal,
      ),
      headlineSmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: DesignTokens.fontSize24.sp,
        fontWeight: DesignTokens.fontWeightRegular,
        height: DesignTokens.lineHeightNormal,
      ),

      // Title styles - Card/list titles
      titleLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: DesignTokens.fontSize20.sp,
        fontWeight: DesignTokens.fontWeightMedium,
        letterSpacing: 0.15,
        height: DesignTokens.lineHeightNormal,
      ),
      titleMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: DesignTokens.fontSize16.sp,
        fontWeight: DesignTokens.fontWeightMedium,
        letterSpacing: 0.15,
        height: DesignTokens.lineHeightNormal,
      ),
      titleSmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: DesignTokens.fontSize14.sp,
        fontWeight: DesignTokens.fontWeightMedium,
        letterSpacing: 0.1,
        height: DesignTokens.lineHeightNormal,
      ),

      // Body styles - Content text
      bodyLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: DesignTokens.fontSize16.sp,
        fontWeight: DesignTokens.fontWeightRegular,
        letterSpacing: 0.5,
        height: DesignTokens.lineHeightNormal,
      ),
      bodyMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: DesignTokens.fontSize14.sp,
        fontWeight: DesignTokens.fontWeightRegular,
        letterSpacing: 0.25,
        height: DesignTokens.lineHeightNormal,
      ),
      bodySmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: DesignTokens.fontSize12.sp,
        fontWeight: DesignTokens.fontWeightRegular,
        letterSpacing: 0.4,
        height: DesignTokens.lineHeightNormal,
      ),

      // Label styles - Buttons, chips, etc.
      labelLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: DesignTokens.fontSize14.sp,
        fontWeight: DesignTokens.fontWeightMedium,
        letterSpacing: 0.1,
        height: DesignTokens.lineHeightNormal,
      ),
      labelMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: DesignTokens.fontSize12.sp,
        fontWeight: DesignTokens.fontWeightMedium,
        letterSpacing: 0.5,
        height: DesignTokens.lineHeightNormal,
      ),
      labelSmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: DesignTokens.fontSize11.sp,
        fontWeight: DesignTokens.fontWeightMedium,
        letterSpacing: 0.5,
        height: DesignTokens.lineHeightNormal,
      ),
    );
  }

  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: _lightColorScheme,
    scaffoldBackgroundColor: AppColors.background,
    textTheme: _createTextTheme(),
    extensions: const <ThemeExtension<dynamic>>[
      FSMThemeExtension.light,
    ],
    
    // App Bar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: DesignTokens.elevationNone,
      scrolledUnderElevation: DesignTokens.elevationNone,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: AppColors.onPrimary,
        size: DesignTokens.iconMd.sp,
      ),
      actionsIconTheme: IconThemeData(
        color: AppColors.onPrimary,
        size: DesignTokens.iconMd.sp,
      ),
      titleTextStyle: TextStyle(
        fontFamily: 'Inter',
        fontSize: DesignTokens.fontSize20.sp,
        fontWeight: DesignTokens.fontWeightSemiBold,
        color: AppColors.onPrimary,
      ),
      systemOverlayStyle: SystemUiOverlayStyle.light,
      toolbarHeight: DesignTokens.appBarHeight.h,
    ),

    // Bottom Navigation Bar Theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.surface,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.onSurface.withValues(alpha: 0.6),
      selectedLabelStyle: TextStyle(
        fontFamily: 'Inter',
        fontSize: DesignTokens.fontSize11.sp,
        fontWeight: DesignTokens.fontWeightSemiBold,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: 'Inter',
        fontSize: DesignTokens.fontSize11.sp,
        fontWeight: DesignTokens.fontWeightMedium,
      ),
      type: BottomNavigationBarType.fixed,
      elevation: DesignTokens.elevationLg,
    ),

    // Card Theme
    cardTheme: CardThemeData(
      color: AppColors.surface,
      elevation: DesignTokens.elevationSm,
      shadowColor: AppColors.shadow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
      ),
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.onPrimary,
        elevation: DesignTokens.elevationNone,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
        ),
        padding: REdgeInsets.symmetric(
          horizontal: DesignTokens.space6,
          vertical: DesignTokens.space4,
        ),
        textStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: DesignTokens.fontSize14.sp,
          fontWeight: DesignTokens.fontWeightSemiBold,
        ),
        minimumSize: Size(0, DesignTokens.buttonHeightMd.h),
      ),
    ),

    // Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: DesignTokens.fontSize14.sp,
          fontWeight: DesignTokens.fontWeightSemiBold,
        ),
        padding: REdgeInsets.symmetric(
          horizontal: DesignTokens.space4,
          vertical: DesignTokens.space2,
        ),
      ),
    ),

    // Outlined Button Theme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: BorderSide(color: AppColors.primary, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
        ),
        padding: REdgeInsets.symmetric(
          horizontal: DesignTokens.space6,
          vertical: DesignTokens.space4,
        ),
        textStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: DesignTokens.fontSize14.sp,
          fontWeight: DesignTokens.fontWeightSemiBold,
        ),
        minimumSize: Size(0, DesignTokens.buttonHeightMd.h),
      ),
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
        borderSide: BorderSide(color: AppColors.outline),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
        borderSide: BorderSide(color: AppColors.outline),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
        borderSide: BorderSide(color: AppColors.primary, width: DesignTokens.borderWidthMedium),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
        borderSide: BorderSide(color: AppColors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
        borderSide: BorderSide(color: AppColors.error, width: DesignTokens.borderWidthMedium),
      ),
      contentPadding: REdgeInsets.symmetric(
        horizontal: DesignTokens.space4,
        vertical: DesignTokens.space4,
      ),
      hintStyle: TextStyle(
        fontFamily: 'Inter',
        fontSize: DesignTokens.fontSize14.sp,
        color: AppColors.onSurface.withValues(alpha: 0.6),
      ),
      labelStyle: TextStyle(
        fontFamily: 'Inter',
        fontSize: DesignTokens.fontSize14.sp,
        color: AppColors.onSurface.withValues(alpha: 0.8),
      ),
      floatingLabelStyle: TextStyle(
        fontFamily: 'Inter',
        fontSize: DesignTokens.fontSize12.sp,
        color: AppColors.primary,
      ),
    ),

    // List Tile Theme
    listTileTheme: ListTileThemeData(
      contentPadding: REdgeInsets.symmetric(
        horizontal: DesignTokens.space4,
        vertical: DesignTokens.space2,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
      ),
      tileColor: AppColors.surface,
      selectedTileColor: AppColors.primary.withValues(alpha: 0.1),
      iconColor: AppColors.onSurface.withValues(alpha: 0.7),
      textColor: AppColors.onSurface,
    ),

    // Chip Theme
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.surfaceVariant,
      selectedColor: AppColors.primary,
      disabledColor: AppColors.onSurface.withValues(alpha: 0.12),
      labelStyle: TextStyle(
        fontFamily: 'Inter',
        fontSize: DesignTokens.fontSize12.sp,
        fontWeight: DesignTokens.fontWeightMedium,
      ),
      secondaryLabelStyle: TextStyle(
        fontFamily: 'Inter',
        fontSize: DesignTokens.fontSize12.sp,
        fontWeight: DesignTokens.fontWeightMedium,
        color: AppColors.onPrimary,
      ),
      padding: REdgeInsets.symmetric(
        horizontal: DesignTokens.space2,
        vertical: DesignTokens.space1,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusLg.r),
      ),
    ),

    // Progress Indicator Theme
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.primary,
      linearTrackColor: AppColors.primary.withValues(alpha: 0.2),
      circularTrackColor: AppColors.primary.withValues(alpha: 0.2),
    ),

    // Floating Action Button Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.onPrimary,
      elevation: DesignTokens.elevationMd,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
      ),
    ),

    // Snack Bar Theme
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.inverseSurface,
      contentTextStyle: TextStyle(
        fontFamily: 'Inter',
        fontSize: DesignTokens.fontSize14.sp,
        color: AppColors.inverseOnSurface,
      ),
      actionTextColor: AppColors.inversePrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusSm.r),
      ),
      behavior: SnackBarBehavior.floating,
    ),

    // Dialog Theme
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.surface,
      elevation: DesignTokens.elevationLg,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusLg.r),
      ),
      titleTextStyle: TextStyle(
        fontFamily: 'Inter',
        fontSize: DesignTokens.fontSize24.sp,
        fontWeight: DesignTokens.fontWeightRegular,
      ),
      contentTextStyle: TextStyle(
        fontFamily: 'Inter',
        fontSize: DesignTokens.fontSize14.sp,
        fontWeight: DesignTokens.fontWeightRegular,
      ),
    ),

    // Divider Theme
    dividerTheme: DividerThemeData(
      color: AppColors.outline.withValues(alpha: 0.2),
      thickness: DesignTokens.borderWidthThin,
      space: DesignTokens.space4,
    ),
  );

  static ThemeData get darkTheme => lightTheme.copyWith(
    brightness: Brightness.dark,
    colorScheme: _darkColorScheme,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    extensions: const <ThemeExtension<dynamic>>[
      FSMThemeExtension.dark,
    ],
    
    appBarTheme: lightTheme.appBarTheme.copyWith(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
  );

  static ColorScheme get _lightColorScheme => ColorScheme.light(
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimary,
    primaryContainer: AppColors.primaryContainer,
    onPrimaryContainer: AppColors.onPrimaryContainer,
    secondary: AppColors.secondary,
    onSecondary: AppColors.onSecondary,
    secondaryContainer: AppColors.secondaryContainer,
    onSecondaryContainer: AppColors.onSecondaryContainer,
    tertiary: AppColors.tertiary,
    onTertiary: AppColors.onTertiary,
    tertiaryContainer: AppColors.tertiaryContainer,
    onTertiaryContainer: AppColors.onTertiaryContainer,
    error: AppColors.error,
    onError: AppColors.onError,
    errorContainer: AppColors.errorContainer,
    onErrorContainer: AppColors.onErrorContainer,
    surface: AppColors.surface,
    onSurface: AppColors.onSurface,
    surfaceContainerHighest: AppColors.surfaceVariant,
    onSurfaceVariant: AppColors.onSurfaceVariant,
    outline: AppColors.outline,
    outlineVariant: AppColors.outlineVariant,
    shadow: AppColors.shadow,
    scrim: AppColors.scrim,
    inverseSurface: AppColors.inverseSurface,
    onInverseSurface: AppColors.inverseOnSurface,
    inversePrimary: AppColors.inversePrimary,
  );

  static ColorScheme get _darkColorScheme => ColorScheme.dark(
    primary: AppColors.primaryDark,
    onPrimary: AppColors.onPrimaryDark,
    primaryContainer: AppColors.primaryContainerDark,
    onPrimaryContainer: AppColors.onPrimaryContainerDark,
    secondary: AppColors.secondaryDark,
    onSecondary: AppColors.onSecondaryDark,
    secondaryContainer: AppColors.secondaryContainerDark,
    onSecondaryContainer: AppColors.onSecondaryContainerDark,
    tertiary: AppColors.tertiaryDark,
    onTertiary: AppColors.onTertiaryDark,
    tertiaryContainer: AppColors.tertiaryContainerDark,
    onTertiaryContainer: AppColors.onTertiaryContainerDark,
    error: AppColors.errorDark,
    onError: AppColors.onErrorDark,
    errorContainer: AppColors.errorContainerDark,
    onErrorContainer: AppColors.onErrorContainerDark,
    surface: AppColors.surfaceDark,
    onSurface: AppColors.onSurfaceDark,
    surfaceContainerHighest: AppColors.surfaceVariantDark,
    onSurfaceVariant: AppColors.onSurfaceVariantDark,
    outline: AppColors.outlineDark,
    outlineVariant: AppColors.outlineVariantDark,
    shadow: AppColors.shadowDark,
    scrim: AppColors.scrimDark,
    inverseSurface: AppColors.inverseSurfaceDark,
    onInverseSurface: AppColors.inverseOnSurfaceDark,
    inversePrimary: AppColors.inversePrimaryDark,
  );
}