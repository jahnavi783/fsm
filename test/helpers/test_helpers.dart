import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';

/// Test utilities and helpers for FSM app testing
class TestHelpers {
  /// Setup GetIt for testing
  static void setupGetIt() {
    if (GetIt.instance.isRegistered<GetIt>()) {
      GetIt.instance.reset();
    }
  }

  /// Setup Hive for testing
  static Future<void> setupHive() async {
    Hive.init('./test/hive_test_db');
    await Hive.deleteFromDisk();
  }

  /// Cleanup after tests
  static Future<void> tearDown() async {
    await Hive.close();
    await Hive.deleteFromDisk();
    GetIt.instance.reset();
  }

  /// Create a test widget with MaterialApp wrapper
  static Widget createTestWidget(Widget child) {
    return MaterialApp(
      home: Scaffold(body: child),
    );
  }

  /// Create a test widget with full app wrapper including theme
  static Widget createTestApp({
    required Widget home,
    ThemeData? theme,
    List<NavigatorObserver>? navigatorObservers,
  }) {
    return MaterialApp(
      title: 'FSM Test App',
      theme: theme ?? ThemeData.light(),
      home: home,
      navigatorObservers: navigatorObservers ?? [],
    );
  }

  /// Pump and settle with custom duration
  static Future<void> pumpAndSettleWithDelay(
    WidgetTester tester, {
    Duration delay = const Duration(milliseconds: 100),
  }) async {
    await tester.pump(delay);
    await tester.pumpAndSettle();
  }

  /// Find widget by key with type safety
  static T findWidgetByKey<T extends Widget>(String key) {
    final finder = find.byKey(Key(key));
    expect(finder, findsOneWidget);
    return finder.evaluate().first.widget as T;
  }

  /// Verify that a widget is not present
  static void verifyWidgetNotPresent(String key) {
    expect(find.byKey(Key(key)), findsNothing);
  }

  /// Verify that a widget is present
  static void verifyWidgetPresent(String key) {
    expect(find.byKey(Key(key)), findsOneWidget);
  }

  /// Tap widget by key
  static Future<void> tapByKey(WidgetTester tester, String key) async {
    await tester.tap(find.byKey(Key(key)));
    await tester.pumpAndSettle();
  }

  /// Enter text in widget by key
  static Future<void> enterTextByKey(
    WidgetTester tester,
    String key,
    String text,
  ) async {
    await tester.enterText(find.byKey(Key(key)), text);
    await tester.pumpAndSettle();
  }

  /// Scroll until widget is visible
  static Future<void> scrollUntilVisible(
    WidgetTester tester,
    Finder finder,
    Finder scrollable, {
    double delta = 100.0,
  }) async {
    await tester.scrollUntilVisible(
      finder,
      delta,
      scrollable: scrollable,
    );
    await tester.pumpAndSettle();
  }

  /// Wait for a specific condition to be true
  static Future<void> waitFor(
    WidgetTester tester,
    bool Function() condition, {
    Duration timeout = const Duration(seconds: 5),
    Duration interval = const Duration(milliseconds: 100),
  }) async {
    final stopwatch = Stopwatch()..start();

    while (!condition() && stopwatch.elapsed < timeout) {
      await tester.pump(interval);
    }

    if (!condition()) {
      throw TimeoutException(
        'Condition not met within ${timeout.inMilliseconds}ms',
        timeout,
      );
    }
  }

  /// Verify text is present
  static void verifyText(String text) {
    expect(find.text(text), findsOneWidget);
  }

  /// Verify text is not present
  static void verifyTextNotPresent(String text) {
    expect(find.text(text), findsNothing);
  }

  /// Verify multiple texts are present
  static void verifyTexts(List<String> texts) {
    for (final text in texts) {
      verifyText(text);
    }
  }

  /// Create a mock navigator observer for testing navigation
  static NavigatorObserver createMockNavigatorObserver() {
    return _MockNavigatorObserver();
  }
}

class _MockNavigatorObserver extends NavigatorObserver {
  final List<Route<dynamic>> pushedRoutes = [];
  final List<Route<dynamic>> poppedRoutes = [];
  final List<Route<dynamic>> removedRoutes = [];
  final List<Route<dynamic>> replacedRoutes = [];

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    pushedRoutes.add(route);
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    poppedRoutes.add(route);
    super.didPop(route, previousRoute);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    removedRoutes.add(route);
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (newRoute != null) replacedRoutes.add(newRoute);
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  void reset() {
    pushedRoutes.clear();
    poppedRoutes.clear();
    removedRoutes.clear();
    replacedRoutes.clear();
  }
}

/// Custom matchers for testing
class TestMatchers {
  /// Matcher for checking if a failure is of specific type
  static Matcher isFailureOfType<T>() {
    return predicate<dynamic>((dynamic failure) {
      return failure is T;
    }, 'is failure of type $T');
  }

  /// Matcher for checking if Either is Right with specific value
  static Matcher isRightWith<T>(T value) {
    return predicate<dynamic>((dynamic either) {
      return either.isRight && either.right == value;
    }, 'is Right with value $value');
  }

  /// Matcher for checking if Either is Left with specific failure
  static Matcher isLeftWith<T>(T failure) {
    return predicate<dynamic>((dynamic either) {
      return either.isLeft && either.left == failure;
    }, 'is Left with failure $failure');
  }
}

/// Exception for test timeouts
class TimeoutException implements Exception {
  final String message;
  final Duration timeout;

  const TimeoutException(this.message, this.timeout);

  @override
  String toString() => 'TimeoutException: $message';
}
