import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

import '../config/app_config.dart';
import '../constants/app_constants.dart';
import '../services/alice_service.dart';
import '../services/logging_service.dart';
import 'auth_interceptor.dart';

@module
abstract class NetworkModule {
  @singleton
  Dio provideDio(AuthInterceptor authInterceptor, AliceService aliceService,
      LoggingService loggingService) {
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

    // Alice HTTP inspection using alice_dio adapter (debug builds only)
    if (AppConfig.isDebug) {
      aliceService.configureDio(dio);
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
