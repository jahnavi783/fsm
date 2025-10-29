import 'dart:io' show Platform;

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

import '../config/app_config.dart';
import '../constants/app_constants.dart';
import '../services/logging_service.dart';
import 'auth_interceptor.dart';

@module
abstract class NetworkModule {
  @singleton
  Dio provideDio(
      AuthInterceptor authInterceptor, LoggingService loggingService) {
    final dio = Dio(BaseOptions(
      baseUrl: AppConfig.baseUrl,
      connectTimeout: AppConstants.connectTimeout,
      receiveTimeout: AppConstants.receiveTimeout,
      sendTimeout: AppConstants.sendTimeout,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // Add Ngrok-specific header to bypass browser warning
        if (AppConfig.baseUrl.contains('ngrok-free.app') ||
            AppConfig.baseUrl.contains('ngrok.io'))
          'ngrok-skip-browser-warning': 'true',
      },
    ));

    // Add interceptors
    dio.interceptors.addAll([
      authInterceptor,
      RetryInterceptor(
        dio: dio,
        logPrint: AppConfig.enableLogging
            ? (message) =>
                loggingService.debug(message.toString(), tag: 'RETRY')
            : null,
        retries: 3,
        retryDelays: const [
          Duration(seconds: 1),
          Duration(seconds: 2),
          Duration(seconds: 3),
        ],
        retryEvaluator: (error, attempt) {
          // Don't retry on 401 - let AuthInterceptor handle token refresh
          if (error.response?.statusCode == 401) {
            return false;
          }
          // Don't retry on 307 redirects - these need to be fixed at the configuration level
          if (error.response?.statusCode == 307) {
            loggingService.error(
                'Received 307 redirect - check if URL should use HTTPS instead of HTTP',
                tag: 'NETWORK');
            return false;
          }
          // Don't retry requests with FormData - FormData can only be sent once
          // because it's stream-based and gets finalized after the first send
          if (error.requestOptions.data is FormData) {
            loggingService.warning(
                'Skipping retry for FormData request - FormData can only be sent once',
                tag: 'RETRY');
            return false;
          }
          // Default retry logic for other errors
          return error.type != DioExceptionType.cancel &&
              error.type != DioExceptionType.unknown;
        },
      ),
    ]);

    // Chuck HTTP inspection for Android debug builds only
    // Note: Chuck instance is created and managed in app.dart
    // The interceptor is added there after Chuck is initialized with context
    if (AppConfig.isDebug && Platform.isAndroid) {
      // Chuck interceptor will be added via ChuckInterceptor(chuck) in app initialization
      // We skip adding it here to avoid context dependency in DI module
    }

    // Enhanced network logging for development and staging
    if (AppConfig.enableLogging) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: false,
          maxWidth: 120,
          logPrint: (object) {
            // Use logging service instead of direct print
            loggingService.debug(object.toString(), tag: 'NETWORK');
          },
        ),
      );
    }

    return dio;
  }
}

@singleton
class DioClient {
  final Dio _dio;

  DioClient(this._dio);

  Dio get dio => _dio;
}
