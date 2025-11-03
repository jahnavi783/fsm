import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'navigation_event.dart';
import 'navigation_state.dart';

/// Simplified Navigation BLoC for FSM App Drawer-based Navigation
/// 
/// Manages navigation state without direct router dependencies.
/// The UI layer listens to NavigationRequested states and handles
/// actual navigation using Auto Route context.router methods.
@injectable
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  
  NavigationBloc() : super(const NavigationInitial()) {
    
    // Navigate to specific drawer section
    on<NavigateToSection>(_onNavigateToSection);
    
    // Update current route for drawer highlighting
    on<UpdateCurrentRoute>(_onUpdateCurrentRoute);
    
    // Handle drawer state changes
    on<ToggleDrawer>(_onToggleDrawer);
    on<SetDrawerState>(_onSetDrawerState);
    
    // Handle navigation actions
    on<HandleDeepLink>(_onHandleDeepLink);
    on<NavigateBack>(_onNavigateBack);
    on<ResetToInitial>(_onResetToInitial);
    on<NavigateExternal>(_onNavigateExternal);
    
    // Handle breadcrumb updates
    on<UpdateBreadcrumb>(_onUpdateBreadcrumb);
  }

  /// Navigate to a specific drawer section
  Future<void> _onNavigateToSection(
    NavigateToSection event,
    Emitter<NavigationState> emit,
  ) async {
    try {
      emit(NavigationLoading(targetSection: event.section));

      // Get route path for the section
      final routePath = _getSectionRoutePath(event.section);

      // Emit navigation request state that UI can listen to
      emit(NavigationRequested(
        section: event.section,
        routePath: routePath,
        routeName: _getSectionRouteName(event.section),
      ));

      // Update state with new section (UI will handle actual navigation)
      emit(NavigationActive(
        currentSection: event.section,
        currentRoute: _getSectionRouteName(event.section),
        routePath: routePath,
        isDrawerOpen: false,
        breadcrumb: [event.section],
      ));
      
    } catch (error) {
      emit(NavigationError(
        message: 'Failed to navigate to section: ${event.section}',
        error: error,
        targetSection: event.section,
      ));
    }
  }

  /// Update current route information from UI layer
  Future<void> _onUpdateCurrentRoute(
    UpdateCurrentRoute event,
    Emitter<NavigationState> emit,
  ) async {
    final section = _getRouteSection(event.routeName);
    final breadcrumb = _generateBreadcrumb(event.routePath);

    emit(NavigationActive(
      currentSection: section,
      currentRoute: event.routeName,
      routePath: event.routePath,
      isDrawerOpen: state is NavigationActive ? 
          (state as NavigationActive).isDrawerOpen : false,
      breadcrumb: breadcrumb,
    ));
  }

  /// Toggle drawer open/close state
  Future<void> _onToggleDrawer(
    ToggleDrawer event,
    Emitter<NavigationState> emit,
  ) async {
    if (state is NavigationActive) {
      final currentState = state as NavigationActive;
      emit(currentState.copyWith(isDrawerOpen: !currentState.isDrawerOpen));
    }
  }

  /// Set drawer state explicitly
  Future<void> _onSetDrawerState(
    SetDrawerState event,
    Emitter<NavigationState> emit,
  ) async {
    if (state is NavigationActive) {
      final currentState = state as NavigationActive;
      emit(currentState.copyWith(isDrawerOpen: event.isOpen));
    }
  }

  /// Handle deep link navigation
  Future<void> _onHandleDeepLink(
    HandleDeepLink event,
    Emitter<NavigationState> emit,
  ) async {
    try {
      emit(NavigationLoading(targetSection: _getRouteSection(event.path)));

      // Emit navigation request for UI to handle
      emit(NavigationRequested(
        section: _getRouteSection(event.path),
        routePath: event.path,
        routeName: event.path,
      ));

    } catch (error) {
      emit(NavigationError(
        message: 'Failed to handle deep link: ${event.path}',
        error: error,
        targetSection: _getRouteSection(event.path),
      ));
    }
  }

  /// Navigate back (UI will handle the actual navigation)
  Future<void> _onNavigateBack(
    NavigateBack event,
    Emitter<NavigationState> emit,
  ) async {
    emit(NavigationRequested(
      section: 'back',
      routePath: 'back',
      routeName: 'back',
    ));
  }

  /// Reset navigation to dashboard
  Future<void> _onResetToInitial(
    ResetToInitial event,
    Emitter<NavigationState> emit,
  ) async {
    emit(NavigationRequested(
      section: 'dashboard',
      routePath: '/app/dashboard',
      routeName: 'dashboard',
    ));
  }

  /// Handle external navigation requests
  Future<void> _onNavigateExternal(
    NavigateExternal event,
    Emitter<NavigationState> emit,
  ) async {
    emit(NavigationRequested(
      section: _getRouteSection(event.route),
      routePath: event.route,
      routeName: event.route,
      params: {'clearStack': event.clearStack},
    ));
  }

  /// Update breadcrumb information
  Future<void> _onUpdateBreadcrumb(
    UpdateBreadcrumb event,
    Emitter<NavigationState> emit,
  ) async {
    if (state is NavigationActive) {
      final currentState = state as NavigationActive;
      emit(currentState.copyWith(breadcrumb: event.breadcrumb));
    }
  }

  // Helper methods
  
  /// Get route path for a drawer section
  String _getSectionRoutePath(String section) {
    switch (section) {
      case 'dashboard':
      case 'work_orders':
        // Both dashboard and work_orders use the same dashboard page
        return '/app/dashboard';
      case 'calendar':
        return '/app/calendar';
      case 'documents':
        return '/app/documents';
      case 'parts':
        return '/app/parts';
      case 'chat':
        return '/app/chat';
      case 'profile':
        return '/app/profile';
      case 'settings':
        return '/app/settings';
      default:
        return '/app/dashboard';
    }
  }

  /// Get section name from route path
  String _getSectionRouteName(String section) {
    return _getSectionRoutePath(section);
  }

  /// Extract section from route path
  String _getRouteSection(String routePath) {
    if (routePath.contains('/work-orders') || routePath.contains('dashboard')) {
      return 'work_orders';
    } else if (routePath.contains('/calendar')) {
      return 'calendar';
    } else if (routePath.contains('/documents')) {
      return 'documents';
    } else if (routePath.contains('/parts')) {
      return 'parts';
    } else if (routePath.contains('/chat')) {
      return 'chat';
    } else if (routePath.contains('/profile')) {
      return 'profile';
    } else if (routePath.contains('/settings')) {
      return 'settings';
    } else {
      return 'dashboard';
    }
  }

  /// Generate breadcrumb from route path
  List<String> _generateBreadcrumb(String routePath) {
    final segments = routePath.split('/').where((s) => s.isNotEmpty).toList();
    return segments.isNotEmpty ? [_getRouteSection(routePath)] : ['dashboard'];
  }
}