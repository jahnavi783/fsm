import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../features/auth/data/datasources/auth_local_datasource.dart';
import '../config/app_config.dart';
import '../services/logging_service.dart';

@injectable
class AuthInterceptor extends Interceptor {
  final AuthLocalDataSource _localDataSource;
  final LoggingService _loggingService;

  AuthInterceptor(this._localDataSource, this._loggingService);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final accessToken = await _localDataSource.getAccessToken();
      // Don't add token to auth endpoints
      if (accessToken != null &&
          accessToken.isNotEmpty &&
          !options.uri.toString().contains("/auth")) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }
      return handler.next(options);
    } catch (e) {
      _loggingService.error(
        'Error retrieving access token',
        tag: 'AUTH_INTERCEPTOR',
        error: e,
      );
      // Optionally, you can reject the request or proceed without token
      return handler.next(options);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle unauthorized error
    if (err.response?.statusCode == 401) {
      _loggingService.warning(
        '401 Unauthorized detected, attempting token refresh...',
        tag: 'AUTH_INTERCEPTOR',
      );

      // Don't retry FormData requests - they can't be reused after being finalized
      if (err.requestOptions.data is FormData) {
        _loggingService.warning(
          'Cannot retry FormData request after 401 - FormData is already finalized. User must retry manually.',
          tag: 'AUTH_INTERCEPTOR',
        );
        await _localDataSource.clearAuthData();
        return handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error:
                'Session expired during file upload. Please login and try again.',
            response: err.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }

      final refreshed = await _refreshToken();
      if (refreshed) {
        _loggingService.info(
          'Token refresh successful, retrying original request',
          tag: 'AUTH_INTERCEPTOR',
        );
        // Retry the original request
        try {
          final response = await _retry(err.requestOptions);
          _loggingService.info(
            'Original request retried successfully',
            tag: 'AUTH_INTERCEPTOR',
          );
          return handler.resolve(response);
        } catch (e) {
          _loggingService.error(
            'Failed to retry request after token refresh',
            tag: 'AUTH_INTERCEPTOR',
            error: e,
          );
          // Reject with the retry error, not the original 401
          return handler.reject(
            DioException(
              requestOptions: err.requestOptions,
              error: e,
              type: DioExceptionType.unknown,
            ),
          );
        }
      } else {
        // Token refresh failed, clear auth data and reject
        _loggingService.warning(
          'Token refresh failed, clearing auth data and forcing logout',
          tag: 'AUTH_INTERCEPTOR',
        );
        await _localDataSource.clearAuthData();
        // Reject the error to trigger proper error handling/logout
        return handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: 'Authentication failed. Please login again.',
            response: err.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    }
    return handler.next(err);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final dio = Dio(BaseOptions(
      baseUrl: AppConfig.baseUrl,
    ));
    final accessToken = await _localDataSource.getAccessToken();

    final options = Options(
      method: requestOptions.method,
      headers: {
        ...requestOptions.headers,
        'Authorization': 'Bearer $accessToken',
        // Add Ngrok-specific header to bypass browser warning
        if (AppConfig.baseUrl.contains('ngrok-free.app') ||
            AppConfig.baseUrl.contains('ngrok.io'))
          'ngrok-skip-browser-warning': 'true',
      },
    );

    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  Future<bool> _refreshToken() async {
    try {
      final refreshToken = await _localDataSource.getRefreshToken();
      if (refreshToken == null || refreshToken.isEmpty) {
        _loggingService.warning(
          'No refresh token found in storage',
          tag: 'AUTH_INTERCEPTOR',
        );
        return false;
      }
      _loggingService.debug(
        'Calling refresh token API...',
        tag: 'AUTH_INTERCEPTOR',
      );
      // Create a new Dio instance to avoid interceptors loop
      final tokenDio = Dio(BaseOptions(
        baseUrl: AppConfig.baseUrl,
        headers: {
          'Content-Type': 'application/json',
          if (AppConfig.baseUrl.contains('ngrok-free.app') ||
              AppConfig.baseUrl.contains('ngrok.io'))
            'ngrok-skip-browser-warning': 'true',
        },
      ));
      // Call refresh token API
      final response = await tokenDio.post('/auth/refresh-token', data: {
        'refreshToken': refreshToken,
      });
      if (response.statusCode == 200) {
        final data = response.data;
        try {
          await _localDataSource.saveTokens(
              accessToken: data['accessToken'], refreshToken: refreshToken);
        } catch (e) {
          _loggingService.error(
            'Error saving tokens to storage',
            tag: 'AUTH_INTERCEPTOR',
            error: e,
          );
          return false;
        }
        _loggingService.info(
          'Tokens refreshed and saved successfully',
          tag: 'AUTH_INTERCEPTOR',
        );
        return true;
      }
      _loggingService.warning(
        'Refresh token API returned status: ${response.statusCode}',
        tag: 'AUTH_INTERCEPTOR',
      );
      return false;
    } catch (e) {
      _loggingService.error(
        'Refresh token API call failed',
        tag: 'AUTH_INTERCEPTOR',
        error: e,
      );
      try {
        await _localDataSource.clearAuthData();
      } catch (clearError) {
        _loggingService.error(
          'Error clearing auth data after refresh failure',
          tag: 'AUTH_INTERCEPTOR',
          error: clearError,
        );
      }
      return false;
    }
  }
}
