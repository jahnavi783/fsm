import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const String interFontFamily = "Inter";

class AppColors {
  //*********************
  // Static Colors
  //*********************
  static final Color lightPrimaryColor = Color(0xFF116587);
  static final Color lightPrimaryVariantColor = Color(0xff2b2a28);
  static final Color lightOnPrimaryColor = Color(0xffffffff);
  static final Color initialColor = Color(0xFF116587);
  static final Color finalColor = Color(0xFF00A74F);

  static final Color darkPrimaryColor = Color(0xFF00A74F);
  static const Color darkPrimaryVariantColor = Color(0xff2b2a28);
  static final Color darkOnPrimaryColor = Color(0xffffffff);

  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color errorColor = Colors.red;
  static const Color grayColor = Color(0xffa6a6a6);
  static const Color greenColor = Colors.green;
  static const Color transparent = Colors.transparent;
}

class AppTheme {
  AppTheme._();

  // ************************
  // Text Style - light
  // ************************
  static const TextStyle _lightHeadingText = TextStyle(
    color: AppColors.blackColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: interFontFamily,
  );

  static const TextStyle _lightBodyText = TextStyle(
    color: AppColors.blackColor,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    fontFamily: interFontFamily,
  );

  static const TextTheme _lightTextTheme = TextTheme(
    displayLarge: _lightHeadingText,
    bodyLarge: _lightBodyText,
  );

  // ************************
  // Text Style - dark
  // ************************
  static final TextStyle _darkThemeHeadingTextStyle =
      _lightHeadingText.copyWith(color: AppColors.whiteColor);

  static final TextStyle _darkThemeBodyTextStyle =
      _lightBodyText.copyWith(color: AppColors.whiteColor);

  static final TextTheme _darkTextTheme = TextTheme(
    displayLarge: _darkThemeHeadingTextStyle,
    bodyLarge: _darkThemeBodyTextStyle,
  );

  // ***********************
  // Theme light/dark
  // ***********************
  static final ThemeData lightTheme = ThemeData(
    // scaffoldBackgroundColor: _lightPrimaryColor,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.whiteColor),
      backgroundColor: AppColors.transparent,
      toolbarHeight: 80,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: TextStyle(
          color: AppColors.whiteColor,
          fontSize: (22),
          fontWeight: FontWeight.w500),
      centerTitle: true,
      actionsIconTheme: IconThemeData(size: (25)),
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: AppColors.lightPrimaryColor),
    colorScheme: ColorScheme.light(
      primary: AppColors.lightPrimaryColor,
      onPrimary: AppColors.lightOnPrimaryColor,
      primaryContainer: AppColors.lightPrimaryVariantColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.transparent,
        foregroundColor: AppColors.transparent,
        textStyle: TextStyle(
          color: AppColors.whiteColor,
          fontFamily: interFontFamily,
          fontSize: 20,
          fontWeight: FontWeight.w900,
        ),
      ),
    ),
    listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColors.blackColor),
            borderRadius: BorderRadius.circular((10)))),
    progressIndicatorTheme:
        ProgressIndicatorThemeData(color: AppColors.whiteColor),
    textTheme: _lightTextTheme,
    useMaterial3: true,
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
    expansionTileTheme: ExpansionTileThemeData(
      collapsedBackgroundColor: Colors.green.shade200,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      collapsedShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      childrenPadding: EdgeInsets.symmetric(horizontal: (10), vertical: (5)),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.whiteColor,
      // surfaceTintColor: Colors.transparent,
      // headerForegroundColor: Colors.white,

      //u need to match the text color also
      dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.lightPrimaryColor;
        }
        return Colors.transparent;
      }),
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: AppColors.whiteColor,
      entryModeIconColor: AppColors.lightPrimaryColor,
      dialBackgroundColor: AppColors.lightPrimaryColor.withValues(alpha: 0.1),
      dayPeriodColor: AppColors.lightPrimaryColor,
      timeSelectorSeparatorColor: WidgetStateProperty.resolveWith((state) {
        return AppColors.lightPrimaryColor;
      }),
      timeSelectorSeparatorTextStyle: WidgetStateProperty.resolveWith(
        (states) {
          return TextStyle(
            fontSize: (50), // Separator text size
            color: AppColors.lightPrimaryColor, // Separator text color
          );
        },
      ),
      hourMinuteTextStyle: TextStyle(
        fontSize: (35),
        color: AppColors.lightPrimaryColor, // Hour and minute text color
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkPrimaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.transparent,
      iconTheme: const IconThemeData(color: AppColors.blackColor),
      toolbarHeight: 80,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 22,
          fontWeight: FontWeight.w500),
      actionsIconTheme: IconThemeData(size: (25)),
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: AppColors.darkPrimaryColor),
    colorScheme: ColorScheme.dark(
      primary: AppColors.darkPrimaryColor,
      onPrimary: AppColors.darkOnPrimaryColor,
      primaryContainer: AppColors.darkPrimaryVariantColor,
    ),
    textTheme: _darkTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.darkPrimaryColor,
      foregroundColor: AppColors.blackColor,
    )),
    listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColors.whiteColor),
            borderRadius: BorderRadius.circular((10)))),
    progressIndicatorTheme:
        ProgressIndicatorThemeData(color: AppColors.blackColor),
    useMaterial3: true,
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
    expansionTileTheme: ExpansionTileThemeData(
      collapsedBackgroundColor: Colors.green.shade200,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      collapsedShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      childrenPadding: EdgeInsets.symmetric(horizontal: (10), vertical: (5)),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: Color.fromARGB(255, 38, 41, 48),
      surfaceTintColor: Colors.transparent,
      headerForegroundColor: Colors.white,

      //u need to match the text color also
      dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.green;
        }
        return Colors.black;
      }),
    ),
  );
}
