import 'package:dio/dio.dart';
import 'package:fsm_flutter/core/constants.dart';
import 'package:fsm_flutter/data/client.dart';
import 'package:fsm_flutter/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;
  final SharedPreferences _prefs = serviceLocator<SharedPreferences>();

  AuthInterceptor(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = _prefs.getString(AppConstants.accessToken);
    if (accessToken != null && !options.uri.toString().contains("/auth")) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    //handle un authorized error
    if (err.response?.statusCode == 401) {
      await _refreshToken();
    }
    return handler.next(err);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    final accessToken = _prefs.getString(AppConstants.accessToken);
    options.headers?['Authorization'] = 'Bearer $accessToken';

    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  Future<bool> _refreshToken() async {
    try {
      final refreshToken = _prefs.getString(AppConstants.refreshToken);
      if (refreshToken == null) {
        return false;
      }

      // Create a new Dio instance to avoid interceptors loop
      final tokenDio = Dio();
      final client = RestClient(tokenDio);

      // Call refresh token API
      final response = await client.refreshToken({
        'refreshToken': refreshToken,
      });

      // Save the new tokens
      await _prefs.setString(AppConstants.accessToken, response.accessToken);
      await _prefs.setString(AppConstants.refreshToken, refreshToken);

      return true;
    } catch (e) {
      // If refresh token failed, clear tokens and return false
      await _prefs.remove(AppConstants.accessToken);
      await _prefs.remove(AppConstants.refreshToken);
      return false;
    }
  }
}
