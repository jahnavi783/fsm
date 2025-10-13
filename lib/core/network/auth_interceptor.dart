import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../constants/app_constants.dart';
import '../storage/hive_service.dart';

@injectable
class AuthInterceptor extends Interceptor {
  final HiveService _hiveService;

  AuthInterceptor(this._hiveService);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await _hiveService.getAccessToken();
    
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
      final refreshed = await _refreshToken();
      if (refreshed) {
        // Retry the original request
        try {
          final response = await _retry(err.requestOptions);
          return handler.resolve(response);
        } catch (e) {
          return handler.next(err);
        }
      } else {
        // Clear tokens and let the error propagate
        await _hiveService.clearAuthTokens();
      }
    }
    return handler.next(err);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final dio = Dio();
    final accessToken = await _hiveService.getAccessToken();
    
    final options = Options(
      method: requestOptions.method,
      headers: {
        ...requestOptions.headers,
        'Authorization': 'Bearer $accessToken',
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
      final refreshToken = await _hiveService.getRefreshToken();
      if (refreshToken == null) {
        return false;
      }

      // Create a new Dio instance to avoid interceptors loop
      final tokenDio = Dio(BaseOptions(
        baseUrl: AppConstants.baseUrl,
      ));

      // Call refresh token API
      final response = await tokenDio.post('/auth/refresh', data: {
        'refreshToken': refreshToken,
      });

      if (response.statusCode == 200) {
        final data = response.data;
        await _hiveService.saveAccessToken(data['accessToken']);
        if (data['refreshToken'] != null) {
          await _hiveService.saveRefreshToken(data['refreshToken']);
        }
        return true;
      }
      
      return false;
    } catch (e) {
      // If refresh token failed, clear tokens
      await _hiveService.clearAuthTokens();
      return false;
    }
  }
}