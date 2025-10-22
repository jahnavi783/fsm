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
