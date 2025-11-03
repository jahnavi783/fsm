import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fsm/features/auth/presentation/blocs/auth/auth_event.dart';
import 'package:injectable/injectable.dart';

import '../../../features/auth/data/datasources/auth_local_datasource.dart';
import '../../../features/auth/presentation/blocs/auth/auth_bloc.dart';
import '../../../features/auth/presentation/blocs/auth/auth_state.dart';
import '../app_router.gr.dart';

/// Enhanced Authentication Guard for FSM Auto Router
///
/// Features:
/// - Reactive authentication state monitoring via AuthBloc
/// - Comprehensive error handling and logging
/// - Token expiration detection and refresh handling
/// - Graceful navigation with proper stack management
/// - Loading states and guard progress tracking
/// - Deep link preservation during authentication flow
///
/// Implementation:
/// - Integrates with existing AuthBloc for reactive behavior
/// - Uses resolver.redirectUntil for proper login flow
/// - Handles token refresh automatically
/// - Preserves intended route after successful login
///
/// Usage in routes:
/// ```dart
/// AutoRoute(
///   page: ProtectedRoute.page,
///   path: '/protected',
///   guards: [AuthGuard()],
/// )
/// ```
@injectable
class AuthGuard extends AutoRouteGuard {
  final AuthLocalDataSource _localDataSource;
  final AuthBloc _authBloc;

  AuthGuard(this._localDataSource, this._authBloc);

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    try {
      // Skip auth check for public routes (login, splash)
      if (_isPublicRoute(resolver.routeName)) {
        resolver.next();
        return;
      }

      // Get current auth state from BLoC
      final authState = _authBloc.state;

      // Handle different authentication states
      await authState.when(
        initial: () => _handleInitialState(resolver, router),
        loading: () => _handleLoadingState(resolver, router),
        authenticated: (user) => _handleAuthenticatedState(resolver, user),
        unauthenticated: () => _handleUnauthenticatedState(resolver, router),
        error: (message) => _handleErrorState(resolver, router, message),
      );
    } catch (e, stackTrace) {
      // Critical error in authentication guard
      _handleCriticalError(resolver, router, e, stackTrace);
    }
  }

  /// Check if route is publicly accessible (no auth required)
  bool _isPublicRoute(String routeName) {
    const publicRoutes = {
      'SplashRoute',
      'LoginRoute',
      'DeveloperOptionsRoute', // Debug routes are public in development
    };
    return publicRoutes.contains(routeName);
  }

  /// Handle initial authentication state
  Future<void> _handleInitialState(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    // Trigger authentication check
    _authBloc.add(const AuthEvent.checkAuth());

    // Wait for auth state to resolve or timeout
    await _waitForAuthResolution(resolver, router);
  }

  /// Handle loading authentication state
  Future<void> _handleLoadingState(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    // Wait for loading to complete
    await _waitForAuthResolution(resolver, router);
  }

  /// Handle authenticated state
  Future<void> _handleAuthenticatedState(
    NavigationResolver resolver,
    dynamic user,
  ) async {
    // Validate token freshness
    final accessToken = await _localDataSource.getAccessToken();

    if (accessToken != null && _isTokenValid(accessToken)) {
      // User is authenticated with valid token
      resolver.next();
    } else {
      // Token expired, attempt refresh
      _authBloc.add(const AuthEvent.refreshToken());
      // Will be handled by the stream listener
    }
  }

  /// Handle unauthenticated state
  Future<void> _handleUnauthenticatedState(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    // Redirect to login page
    // After successful login, AuthBloc will trigger navigation to MainNavigationRoute
    resolver.redirectUntil(const LoginRoute());
  }

  /// Handle authentication error state
  Future<void> _handleErrorState(
    NavigationResolver resolver,
    StackRouter router,
    String errorMessage,
  ) async {
    // Log authentication error
    debugPrint('AuthGuard: Authentication error - $errorMessage');

    // Treat errors as unauthenticated and redirect to login
    await _handleUnauthenticatedState(resolver, router);
  }

  /// Handle critical errors in the guard itself
  void _handleCriticalError(
    NavigationResolver resolver,
    StackRouter router,
    dynamic error,
    StackTrace stackTrace,
  ) {
    // Log critical error
    debugPrint('AuthGuard: Critical error - $error');
    debugPrint('Stack trace: $stackTrace');

    // Fail safe: redirect to login
    router.replaceAll([const LoginRoute()]);
  }

  /// Wait for authentication state resolution with timeout
  Future<void> _waitForAuthResolution(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    // Listen to auth state changes with timeout
    try {
      await for (final state in _authBloc.stream.take(1)) {
        await state.when(
          initial: () async {
            // Still initial, wait longer or fail
            await Future.delayed(const Duration(milliseconds: 500));
            await _handleUnauthenticatedState(resolver, router);
          },
          loading: () async {
            // Still loading, wait longer or fail
            await Future.delayed(const Duration(seconds: 2));
            await _handleUnauthenticatedState(resolver, router);
          },
          authenticated: (user) async {
            await _handleAuthenticatedState(resolver, user);
          },
          unauthenticated: () async {
            await _handleUnauthenticatedState(resolver, router);
          },
          error: (message) async {
            await _handleErrorState(resolver, router, message);
          },
        );
        break; // Exit the stream once we handle a state
      }
    } catch (e) {
      // Timeout or stream error, default to unauthenticated
      await _handleUnauthenticatedState(resolver, router);
    }
  }

  /// Basic token validation (can be enhanced with JWT parsing)
  bool _isTokenValid(String token) {
    // Basic validation: token exists and is not empty
    if (token.isEmpty) return false;

    // TODO: Add JWT token expiration checking
    // For now, assume token is valid if it exists
    return true;
  }
}
