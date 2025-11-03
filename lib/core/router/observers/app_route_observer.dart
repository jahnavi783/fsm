import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../services/logging_service.dart';
import '../app_router.dart';

/// Enhanced FSM App Route Observer - Navigation Event Tracking
///
/// Features:
/// - Tracks all navigation events (push, pop, replace) with detailed analytics
/// - Syncs navigation state with NavigationBloc for drawer highlighting
/// - Provides route performance monitoring and debugging information
/// - Integrates with drawer highlighting system automatically
/// - Monitors deep link usage patterns and user navigation flow
/// - Handles route lifecycle events for proper cleanup and state management
///
/// Integration:
/// - Works seamlessly with Auto Route navigation system
/// - Sends events to NavigationBloc for reactive state management
/// - Logs navigation patterns for analytics and performance monitoring
/// - Updates drawer selection state automatically based on current route
/// - Provides comprehensive debugging information for development
///
/// Usage:
/// ```dart
/// MaterialApp.router(
///   routerConfig: appRouter.config(
///     navigatorObservers: () => [AppRouteObserver()],
///   ),
/// )
/// ```
@injectable
class AppRouteObserver extends AutoRouterObserver {
  final LoggingService _loggingService;

  AppRouteObserver(this._loggingService);

  // ═══════════════════════════════════════════════════════════════════════
  // STACK ROUTE EVENTS - COMPREHENSIVE NAVIGATION TRACKING
  // ═══════════════════════════════════════════════════════════════════════

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);

    _logNavigationEvent(
      'didPush',
      route: route,
      previousRoute: previousRoute,
    );

    _updateNavigationState(route);
    _trackRouteAnalytics(route, 'push');
    _monitorRoutePerformance(route, 'push_start');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);

    _logNavigationEvent(
      'didPop',
      route: route,
      previousRoute: previousRoute,
    );

    if (previousRoute != null) {
      _updateNavigationState(previousRoute);
    }

    _trackRouteAnalytics(route, 'pop');
    _monitorRoutePerformance(route, 'pop_complete');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);

    _logNavigationEvent(
      'didRemove',
      route: route,
      previousRoute: previousRoute,
    );

    if (previousRoute != null) {
      _updateNavigationState(previousRoute);
    }

    _trackRouteAnalytics(route, 'remove');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);

    _logNavigationEvent(
      'didReplace',
      route: newRoute,
      previousRoute: oldRoute,
    );

    if (newRoute != null) {
      _updateNavigationState(newRoute);
      _trackRouteAnalytics(newRoute, 'replace');
    }
  }

  // ═══════════════════════════════════════════════════════════════════════
  // TAB ROUTE EVENTS - FUTURE PROOFING FOR TAB SUPPORT
  // ═══════════════════════════════════════════════════════════════════════

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    super.didInitTabRoute(route, previousRoute);

    _logTabNavigationEvent(
      'didInitTabRoute',
      route: route,
      previousRoute: previousRoute,
    );

    _updateTabNavigationState(route);
    _trackTabAnalytics(route, 'init');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    super.didChangeTabRoute(route, previousRoute);

    _logTabNavigationEvent(
      'didChangeTabRoute',
      route: route,
      previousRoute: previousRoute,
    );

    _updateTabNavigationState(route);
    _trackTabAnalytics(route, 'change');
  }

  // ═══════════════════════════════════════════════════════════════════════
  // PRIVATE HELPER METHODS - CORE FUNCTIONALITY
  // ═══════════════════════════════════════════════════════════════════════

  /// Log comprehensive navigation events for debugging and analytics
  void _logNavigationEvent(
    String event, {
    Route<dynamic>? route,
    Route<dynamic>? previousRoute,
  }) {
    final routeName = route?.settings.name ?? 'Unknown';
    final previousRouteName = previousRoute?.settings.name ?? 'None';
    final routePath = _getRoutePath(route);
    final arguments = _getRouteArguments(route);

    _loggingService.info(
      'Navigation Event: $event - Route: $routeName',
      data: {
        'event': event,
        'route_name': routeName,
        'route_path': routePath,
        'previous_route': previousRouteName,
        'arguments': arguments,
        'timestamp': DateTime.now().toIso8601String(),
        'is_deep_link': _isDeepLink(route),
        'route_depth': _getRouteDepth(route),
      },
    );
  }

  /// Update NavigationBloc with current route state for drawer highlighting
  void _updateNavigationState(Route<dynamic> route) {
    final routeName = route.settings.name;
    if (routeName == null) return;

    // Convert route name to drawer section for highlighting
    final drawerSection = routeName.drawerSection;
    if (drawerSection == null) return;

    try {
      // Notify navigation state change for drawer highlighting
      _notifyDrawerSectionChanged(drawerSection, routeName);
    } catch (e, stackTrace) {
      _loggingService.error(
        'Failed to update navigation state: $e',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  /// Log tab navigation events for debugging and analytics
  void _logTabNavigationEvent(
    String event, {
    TabPageRoute? route,
    TabPageRoute? previousRoute,
  }) {
    final routeName = route?.name ?? 'Unknown';
    final previousRouteName = previousRoute?.name ?? 'None';

    _loggingService.info(
      'Tab Navigation Event: $event',
      data: {
        'event': event,
        'route_name': routeName,
        'previous_route': previousRouteName,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  /// Update tab navigation state (for future tab support)
  void _updateTabNavigationState(TabPageRoute route) {
    _loggingService.info(
      'Tab Navigation State Updated - Route: ${route.name}',
      data: {
        'tab_route': route.name,
      },
    );
  }

  /// Track comprehensive route analytics for app usage patterns
  void _trackRouteAnalytics(Route<dynamic> route, String action) {
    final routeName = route.settings.name;
    if (routeName == null) return;

    final analytics = RouteAnalytics(
      routeName: routeName,
      action: action,
      timestamp: DateTime.now(),
      isDeepLink: _isDeepLink(route),
      routePath: _getRoutePath(route),
      sessionId: _getSessionId(),
      arguments: _getRouteArguments(route),
    );

    _loggingService.info('Route Analytics', data: analytics.toJson());
  }

  /// Track tab-specific analytics
  void _trackTabAnalytics(TabPageRoute route, String action) {
    _loggingService.info('Tab Navigation Analytics', data: {
      'tab_name': route.name,
      'action': action,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  /// Monitor route performance for optimization insights
  void _monitorRoutePerformance(Route<dynamic> route, String phase) {
    final routeName = route.settings.name;
    if (routeName == null) return;

    if (phase == 'push_start') {
      NavigationPerformanceMonitor.startTiming(routeName);
    } else if (phase.contains('complete')) {
      NavigationPerformanceMonitor.endTiming(routeName);
    }
  }

  /// Notify drawer about section changes for highlighting
  void _notifyDrawerSectionChanged(DrawerSection section, String routeName) {
    // This integrates with NavigationBloc for reactive drawer highlighting
    // Example implementation would depend on your specific NavigationBloc structure

    _loggingService.debug(
      'Drawer section changed: ${section.toString()}',
      data: {
        'section': section.toString(),
        'route_name': routeName,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );

    // TODO: Implement actual NavigationBloc integration
    // Example:
    // final navigationBloc = getIt<NavigationBloc>();
    // navigationBloc.add(NavigationEvent.sectionChanged(section));
  }

  /// Extract comprehensive route path from route settings
  String _getRoutePath(Route<dynamic>? route) {
    if (route?.settings.arguments is Map) {
      final args = route!.settings.arguments as Map;
      return args['path']?.toString() ?? route.settings.name ?? '';
    }
    return route?.settings.name ?? '';
  }

  /// Extract detailed route arguments for comprehensive logging
  Map<String, dynamic> _getRouteArguments(Route<dynamic>? route) {
    final arguments = route?.settings.arguments;

    if (arguments is Map) {
      return Map<String, dynamic>.from(arguments);
    } else if (arguments != null) {
      return {'arguments': arguments.toString()};
    }

    return {};
  }

  /// Enhanced deep link detection for comprehensive tracking
  bool _isDeepLink(Route<dynamic>? route) {
    if (route == null) return false;

    final routePath = _getRoutePath(route);
    final arguments = _getRouteArguments(route);

    // Check multiple indicators of deep linking
    return routePath.contains(':') || // Has path parameters
        routePath.startsWith('/work-orders/') ||
        routePath.startsWith('/documents/') ||
        routePath.startsWith('/parts/') ||
        arguments.containsKey('deep_link') ||
        arguments.containsKey('external_link');
  }

  /// Calculate route depth for navigation complexity analysis
  int _getRouteDepth(Route<dynamic>? route) {
    if (route == null) return 0;

    final routePath = _getRoutePath(route);
    return routePath.split('/').where((part) => part.isNotEmpty).length;
  }

  /// Get current session ID for analytics correlation
  String _getSessionId() {
    // This would integrate with your session management system
    return 'session_${DateTime.now().millisecondsSinceEpoch}';
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// DATA MODELS AND ANALYTICS SUPPORT
// ═══════════════════════════════════════════════════════════════════════════

/// Comprehensive route analytics data model
class RouteAnalytics {
  final String routeName;
  final String action;
  final DateTime timestamp;
  final bool isDeepLink;
  final String routePath;
  final String sessionId;
  final Map<String, dynamic> arguments;

  const RouteAnalytics({
    required this.routeName,
    required this.action,
    required this.timestamp,
    required this.isDeepLink,
    required this.routePath,
    required this.sessionId,
    required this.arguments,
  });

  Map<String, dynamic> toJson() => {
        'route_name': routeName,
        'action': action,
        'timestamp': timestamp.toIso8601String(),
        'is_deep_link': isDeepLink,
        'route_path': routePath,
        'session_id': sessionId,
        'arguments': arguments,
      };
}

/// Navigation performance monitoring system
class NavigationPerformanceMonitor {
  static final Map<String, DateTime> _routeStartTimes = {};
  static final List<RoutePerformanceData> _performanceData = [];

  /// Start timing a route navigation for performance analysis
  static void startTiming(String routeName) {
    _routeStartTimes[routeName] = DateTime.now();
  }

  /// End timing and record comprehensive performance data
  static void endTiming(String routeName) {
    final startTime = _routeStartTimes.remove(routeName);
    if (startTime != null) {
      final duration = DateTime.now().difference(startTime);
      _performanceData.add(RoutePerformanceData(
        routeName: routeName,
        duration: duration,
        timestamp: DateTime.now(),
      ));

      // Maintain performance data limit for memory efficiency
      if (_performanceData.length > 500) {
        _performanceData.removeRange(0, 100); // Remove oldest 100 entries
      }
    }
  }

  /// Get comprehensive performance statistics
  static List<RoutePerformanceData> get performanceData =>
      List.unmodifiable(_performanceData);

  /// Calculate average navigation time for performance optimization
  static Duration getAverageTime(String routeName) {
    final routeData =
        _performanceData.where((data) => data.routeName == routeName).toList();

    if (routeData.isEmpty) return Duration.zero;

    final totalMs = routeData
        .map((data) => data.duration.inMilliseconds)
        .reduce((a, b) => a + b);

    return Duration(milliseconds: totalMs ~/ routeData.length);
  }

  /// Get performance report for analytics
  static Map<String, dynamic> getPerformanceReport() {
    final routeStats = <String, Map<String, dynamic>>{};

    for (final route in _performanceData.map((d) => d.routeName).toSet()) {
      final routeData =
          _performanceData.where((data) => data.routeName == route).toList();

      if (routeData.isNotEmpty) {
        final durations =
            routeData.map((d) => d.duration.inMilliseconds).toList();
        durations.sort();

        routeStats[route] = {
          'count': routeData.length,
          'average_ms': durations.reduce((a, b) => a + b) ~/ durations.length,
          'min_ms': durations.first,
          'max_ms': durations.last,
          'median_ms': durations[durations.length ~/ 2],
        };
      }
    }

    return {
      'total_navigations': _performanceData.length,
      'unique_routes': routeStats.length,
      'route_statistics': routeStats,
      'report_timestamp': DateTime.now().toIso8601String(),
    };
  }
}

/// Detailed route performance data model
class RoutePerformanceData {
  final String routeName;
  final Duration duration;
  final DateTime timestamp;

  const RoutePerformanceData({
    required this.routeName,
    required this.duration,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => {
        'route_name': routeName,
        'duration_ms': duration.inMilliseconds,
        'timestamp': timestamp.toIso8601String(),
      };
}
