import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../test_config.dart';

/// Helper class to create configured Dio instances for integration tests
class DioHelper {
  /// Create a Dio instance with base configuration for tests
  static Dio createDio({String? authToken, bool enableLogging = true}) {
    final dio = Dio(
      BaseOptions(
        baseUrl: TestConfig.baseUrl,
        connectTimeout: TestConfig.connectTimeout,
        receiveTimeout: TestConfig.receiveTimeout,
        sendTimeout: TestConfig.sendTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          if (authToken != null) 'Authorization': 'Bearer $authToken',
        },
      ),
    );

    // Add logging interceptor for debugging
    if (enableLogging && TestConfig.enableLogging) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }

    return dio;
  }

  /// Create a Dio instance for multipart requests
  static Dio createMultipartDio({required String authToken}) {
    final dio = createDio(authToken: authToken, enableLogging: true);

    // Override content type for multipart
    dio.options.headers['Content-Type'] = 'multipart/form-data';

    return dio;
  }
}
