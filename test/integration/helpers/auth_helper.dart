import 'package:dio/dio.dart';
import '../test_config.dart';
import '../fixtures/test_data.dart';
import 'dio_helper.dart';

/// Helper class for authentication in integration tests
class AuthHelper {
  static String? _cachedTechnicianToken;
  static String? _cachedManagerToken;
  static String? _cachedHelpdeskToken;
  static String? _cachedRefreshToken;

  /// Login as technician and return access token
  static Future<String> loginAsTechnician() async {
    if (_cachedTechnicianToken != null) {
      return _cachedTechnicianToken!;
    }

    _cachedTechnicianToken = await _login(
      TestUsers.technicianEmail,
      TestUsers.technicianPassword,
    );
    return _cachedTechnicianToken!;
  }

  /// Login as manager and return access token
  static Future<String> loginAsManager() async {
    if (_cachedManagerToken != null) {
      return _cachedManagerToken!;
    }

    _cachedManagerToken = await _login(
      TestUsers.managerEmail,
      TestUsers.managerPassword,
    );
    return _cachedManagerToken!;
  }

  /// Login as helpdesk and return access token
  static Future<String> loginAsHelpdesk() async {
    if (_cachedHelpdeskToken != null) {
      return _cachedHelpdeskToken!;
    }

    _cachedHelpdeskToken = await _login(
      TestUsers.helpdeskEmail,
      TestUsers.helpdeskPassword,
    );
    return _cachedHelpdeskToken!;
  }

  /// Generic login method
  static Future<String> _login(String email, String password) async {
    final dio = DioHelper.createDio(enableLogging: false);

    try {
      final response = await dio.post(
        '/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        final accessToken = response.data['accessToken'] as String?;
        final refreshToken = response.data['refreshToken'] as String?;

        if (accessToken == null) {
          throw Exception('Login failed: No access token in response');
        }

        // Cache refresh token for token refresh tests
        _cachedRefreshToken = refreshToken;

        return accessToken;
      } else {
        throw Exception('Login failed with status: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Login failed: ${e.message}');
    }
  }

  /// Get cached refresh token (for refresh token tests)
  static String? get cachedRefreshToken => _cachedRefreshToken;

  /// Clear all cached tokens (useful for cleanup between tests)
  static void clearTokens() {
    _cachedTechnicianToken = null;
    _cachedManagerToken = null;
    _cachedHelpdeskToken = null;
    _cachedRefreshToken = null;
  }

  /// Create authenticated Dio instance for technician
  static Future<Dio> createAuthenticatedDio({String? role}) async {
    String token;

    switch (role) {
      case 'manager':
        token = await loginAsManager();
        break;
      case 'helpdesk':
        token = await loginAsHelpdesk();
        break;
      case 'technician':
      default:
        token = await loginAsTechnician();
        break;
    }

    return DioHelper.createDio(authToken: token);
  }
}
