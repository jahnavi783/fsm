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
    final accessToken = await _localDataSource.getAccessToken();

    // Don't add token to auth endpoints
    if (accessToken != null && !options.uri.toString().contains("/auth")) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle unauthorized error
    if (err.response?.statusCode == 401) {
      _loggingService.warning(
        '401 Unauthorized detected, attempting token refresh...',
        tag: 'AUTH_INTERCEPTOR',
      );

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
      if (refreshToken == null) {
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
          // Add Ngrok-specific header to bypass browser warning
          if (AppConfig.baseUrl.contains('ngrok-free.app') ||
              AppConfig.baseUrl.contains('ngrok.io'))
            'ngrok-skip-browser-warning': 'true',
        },
      ));

      // Call refresh token API
      final response = await tokenDio.post('/auth/refresh-token', data: {
        'refresh_token': refreshToken,
      });

      if (response.statusCode == 200) {
        final data = response.data;
        await _localDataSource.saveTokens(
          accessToken: data['access_token'],
          refreshToken: data['refresh_token'],
        );
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
      // If refresh token failed, clear tokens
      _loggingService.error(
        'Refresh token API call failed',
        tag: 'AUTH_INTERCEPTOR',
        error: e,
      );
      await _localDataSource.clearAuthData();
      return false;
    }
  }
}
