import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

/// Configuration for golden tests
class GoldenTestConfig {
  static const List<Device> testDevices = [
    Device.phone,
    Device.iphone11,
    Device.tabletPortrait,
    Device.tabletLandscape,
  ];

  static const List<Device> phoneDevices = [
    Device.phone,
    Device.iphone11,
  ];

  static const List<Device> tabletDevices = [
    Device.tabletPortrait,
    Device.tabletLandscape,
  ];

  /// Initialize golden test configuration
  static Future<void> initialize() async {
    await loadAppFonts();
  }

  /// Create a test wrapper with theme and screen util
  static Widget createTestWrapper({
    required Widget child,
    ThemeData? theme,
    Locale? locale,
  }) {
    return MaterialApp(
      theme: theme ?? ThemeData.light(),
      locale: locale ?? const Locale('en', 'US'),
      home: Scaffold(
        body: child,
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  /// Create a test wrapper with navigation
  static Widget createNavigationTestWrapper({
    required Widget child,
    ThemeData? theme,
    Locale? locale,
  }) {
    return MaterialApp(
      theme: theme ?? ThemeData.light(),
      locale: locale ?? const Locale('en', 'US'),
      home: child,
      debugShowCheckedModeBanner: false,
    );
  }
}
