/// Navigation State for FSM App Drawer-based Navigation
///
/// Manages the current navigation state including drawer section,
/// route information, and UI state for proper drawer highlighting.
abstract class NavigationState {
  const NavigationState();
}

/// Initial navigation state
class NavigationInitial extends NavigationState {
  const NavigationInitial();
}

/// Active navigation state with current section and route info
class NavigationActive extends NavigationState {
  final String currentSection;
  final String currentRoute;
  final String routePath;
  final bool isDrawerOpen;
  final List<String> breadcrumb;
  final Map<String, dynamic>? routeArguments;

  const NavigationActive({
    required this.currentSection,
    required this.currentRoute,
    required this.routePath,
    this.isDrawerOpen = false,
    this.breadcrumb = const [],
    this.routeArguments,
  });

  NavigationActive copyWith({
    String? currentSection,
    String? currentRoute,
    String? routePath,
    bool? isDrawerOpen,
    List<String>? breadcrumb,
    Map<String, dynamic>? routeArguments,
  }) {
    return NavigationActive(
      currentSection: currentSection ?? this.currentSection,
      currentRoute: currentRoute ?? this.currentRoute,
      routePath: routePath ?? this.routePath,
      isDrawerOpen: isDrawerOpen ?? this.isDrawerOpen,
      breadcrumb: breadcrumb ?? this.breadcrumb,
      routeArguments: routeArguments ?? this.routeArguments,
    );
  }
}

/// Loading state during navigation transitions
class NavigationLoading extends NavigationState {
  final String? targetSection;
  final String? targetRoute;

  const NavigationLoading({
    this.targetSection,
    this.targetRoute,
  });
}

/// Navigation request state (emitted when UI should handle navigation)
class NavigationRequested extends NavigationState {
  final String section;
  final String routePath;
  final String routeName;
  final Map<String, dynamic>? params;

  const NavigationRequested({
    required this.section,
    required this.routePath,
    required this.routeName,
    this.params,
  });
}

/// Error state for navigation failures
class NavigationError extends NavigationState {
  final String message;
  final Object error;
  final String? targetSection;

  const NavigationError({
    required this.message,
    required this.error,
    this.targetSection,
  });
}
