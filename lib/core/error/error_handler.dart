import 'package:dio/dio.dart';
import 'package:hive_ce/hive.dart';
// import 'package:location/location.dart'; // Not needed

import 'exceptions.dart';
import 'failures.dart';
import 'hive_ce_error_handler.dart';

class ErrorHandler {
  static Failure handleException(dynamic exception) {
    if (exception is DioException) {
      return _handleDioException(exception);
    } else if (exception is HiveError) {
      return _handleHiveError(exception);
    } else if (exception is ServerException) {
      return Failure.server(
        message: exception.message,
        statusCode: exception.statusCode,
        errorCode: exception.code,
      );
    } else if (exception is NetworkException) {
      return Failure.network(message: exception.message);
    } else if (exception is CacheException) {
      return Failure.cache(message: exception.message);
    } else if (exception is ValidationException) {
      return Failure.validation(
        message: exception.message,
        fieldErrors: exception.fieldErrors,
      );
    } else if (exception is PermissionException) {
      return Failure.permission(
        message: exception.message,
        permission: exception.permission,
      );
    } else if (exception is LocationException) {
      return Failure.location(message: exception.message);
    } else if (exception is AuthenticationException) {
      return Failure.authentication(message: exception.message);
    } else if (exception is TimeoutException) {
      return Failure.timeout(message: exception.message);
    } else {
      return Failure.unknown(message: exception.toString());
    }
  }

  static Failure _handleDioException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Failure.timeout(
          message:
              'Request timed out. Please check your connection and try again.',
        );

      case DioExceptionType.connectionError:
        return Failure.network(
          message:
              'No internet connection. Please check your network settings.',
        );

      case DioExceptionType.badResponse:
        final statusCode = exception.response?.statusCode;
        final responseData = exception.response?.data;

        String message = 'Server error occurred';
        String? errorCode;

        if (responseData is Map<String, dynamic>) {
          message = responseData['message'] ??
              responseData['error'] ??
              responseData['detail'] ??
              message;
          errorCode = responseData['code']?.toString();
        }

        return Failure.server(
          message: message,
          statusCode: statusCode,
          errorCode: errorCode,
        );

      case DioExceptionType.cancel:
        return Failure.unknown(message: 'Request was cancelled');

      case DioExceptionType.badCertificate:
        return Failure.network(message: 'SSL certificate error');

      case DioExceptionType.unknown:
        return Failure.unknown(
          message: exception.message ?? 'An unknown error occurred',
        );
    }
  }

  static Failure _handleHiveError(HiveError error) {
    return HiveCEErrorHandler.handleHiveError(error);
  }

  static Exception mapFailureToException(Failure failure) {
    return failure.when(
      server: (message, statusCode, errorCode) => ServerException(
        message,
        errorCode,
        statusCode,
      ),
      network: (message) => NetworkException(message),
      cache: (message) => CacheException(message),
      validation: (message, fieldErrors) => ValidationException(
        message,
        null,
        fieldErrors,
      ),
      permission: (message, permission) => PermissionException(
        message,
        permission,
      ),
      location: (message) => LocationException(message),
      authentication: (message) => AuthenticationException(message),
      timeout: (message) => TimeoutException(message),
      unknown: (message) => UnknownException(message),
    );
  }
}
