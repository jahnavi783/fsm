import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import '../../../features/auth/data/datasources/auth_local_datasource.dart';
import '../app_router.gr.dart';

/// Authentication guard for Auto Router
///
/// Protects routes by checking if user is authenticated before allowing navigation.
/// If authentication check fails, user is redirected to login screen.
///
/// Usage in routes:
/// ```dart
/// AutoRoute(
///   page: ProtectedRoute.page,
///   path: '/protected',
///   guards: [AuthGuard],
/// )
/// ```
@injectable
class AuthGuard extends AutoRouteGuard {
  final AuthLocalDataSource _localDataSource;

  AuthGuard(this._localDataSource);

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    try {
      // Check if user has valid access token and cached user data
      final accessToken = await _localDataSource.getAccessToken();
      final user = await _localDataSource.getUser();

      if (accessToken != null && user != null) {
        // User is authenticated, allow navigation
        resolver.next();
      } else {
        // User is not authenticated, redirect to login
        router.replaceAll([const LoginRoute()]);
      }
    } catch (e) {
      // Error checking authentication (e.g., storage error), redirect to login
      router.replaceAll([const LoginRoute()]);
    }
  }
}
