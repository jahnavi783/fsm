import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/di/injection.dart';
import '../../services/logging_service.dart';

/// Custom route observer for the FSM app
/// 
/// Tracks navigation events and integrates with Auto Router for proper
/// hardware back button handling, analytics, and debugging.
/// 
/// Features:
/// - Logs all navigation events (push, pop, replace)
/// - Tracks tab navigation in AutoTabsRouter
/// - Monitors back button behavior
/// - Provides analytics hooks for navigation tracking
class AppRouteObserver extends AutoRouterObserver {
  final LoggingService _loggingService = getIt<LoggingService>();

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    _loggingService.debug(
      'Navigation: Pushed ${route.settings.name}',
      tag: 'AppRouteObserver',
    );
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    _loggingService.debug(
      'Navigation: Popped ${route.settings.name}',
      tag: 'AppRouteObserver',
    );
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _loggingService.debug(
      'Navigation: Replaced ${oldRoute?.settings.name} with ${newRoute?.settings.name}',
      tag: 'AppRouteObserver',
    );
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    _loggingService.debug(
      'Navigation: Removed ${route.settings.name}',
      tag: 'AppRouteObserver',
    );
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    super.didInitTabRoute(route, previousRoute);
    _loggingService.debug(
      'Tab Navigation: Initialized ${route.name}',
      tag: 'AppRouteObserver',
    );
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    super.didChangeTabRoute(route, previousRoute);
    _loggingService.debug(
      'Tab Navigation: Changed from ${previousRoute.name} to ${route.name}',
      tag: 'AppRouteObserver',
    );
  }
}
