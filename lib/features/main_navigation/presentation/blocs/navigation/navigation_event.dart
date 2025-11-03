/// Navigation Events for FSM App Drawer-based Navigation
///
/// Handles all navigation-related events in the drawer-based navigation system.
/// Integrates with Auto Route for type-safe navigation and state management.
abstract class NavigationEvent {
  const NavigationEvent();
}

/// Navigate to a specific drawer section
class NavigateToSection extends NavigationEvent {
  final String section;

  const NavigateToSection(this.section);
}

/// Update current route information for drawer highlighting
class UpdateCurrentRoute extends NavigationEvent {
  final String routeName;
  final String routePath;

  const UpdateCurrentRoute(this.routeName, this.routePath);
}

/// Handle drawer open/close state
class ToggleDrawer extends NavigationEvent {
  const ToggleDrawer();
}

/// Set drawer state explicitly
class SetDrawerState extends NavigationEvent {
  final bool isOpen;

  const SetDrawerState(this.isOpen);
}

/// Handle deep link navigation
class HandleDeepLink extends NavigationEvent {
  final String path;
  final Map<String, dynamic>? parameters;

  const HandleDeepLink(this.path, {this.parameters});
}

/// Navigate back in the stack
class NavigateBack extends NavigationEvent {
  const NavigateBack();
}

/// Reset navigation to initial state (dashboard)
class ResetToInitial extends NavigationEvent {
  const ResetToInitial();
}

/// Handle external navigation (from notifications, etc.)
class NavigateExternal extends NavigationEvent {
  final String route;
  final Map<String, dynamic>? arguments;
  final bool clearStack;

  const NavigateExternal({
    required this.route,
    this.arguments,
    this.clearStack = false,
  });
}

/// Update navigation breadcrumb
class UpdateBreadcrumb extends NavigationEvent {
  final List<String> breadcrumb;

  const UpdateBreadcrumb(this.breadcrumb);
}
