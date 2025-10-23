import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  const factory Failure.server({
    required String message,
    int? statusCode,
    String? errorCode,
  }) = ServerFailure;
  
  const factory Failure.network({
    required String message,
  }) = NetworkFailure;
  
  const factory Failure.cache({
    required String message,
  }) = CacheFailure;
  
  const factory Failure.validation({
    required String message,
    Map<String, String>? fieldErrors,
  }) = ValidationFailure;
  
  const factory Failure.permission({
    required String message,
    required String permission,
  }) = PermissionFailure;
  
  const factory Failure.location({
    required String message,
  }) = LocationFailure;
  
  const factory Failure.authentication({
    required String message,
  }) = AuthenticationFailure;
  
  const factory Failure.timeout({
    required String message,
  }) = TimeoutFailure;
  
  const factory Failure.unknown({
    required String message,
  }) = UnknownFailure;
}

extension FailureExtension on Failure {
  String get userFriendlyMessage {
    return when(
      server: (message, statusCode, errorCode) {
        switch (statusCode) {
          case 400:
            return 'Invalid request. Please check your input and try again.';
          case 401:
            return 'Authentication failed. Please log in again.';
          case 403:
            return 'You don\'t have permission to perform this action.';
          case 404:
            return 'The requested resource was not found.';
          case 500:
            return 'Server error. Please try again later.';
          case 503:
            return 'Service temporarily unavailable. Please try again later.';
          default:
            return message.isNotEmpty ? message : 'An error occurred on the server.';
        }
      },
      network: (message) => 'No internet connection. Please check your network and try again.',
      cache: (message) => 'Failed to access local data. Please try again.',
      validation: (message, fieldErrors) => message,
      permission: (message, permission) => 'Permission required: $permission',
      location: (message) => 'Location error: $message',
      authentication: (message) => 'Authentication failed. Please log in again.',
      timeout: (message) => 'Request timed out. Please try again.',
      unknown: (message) => 'An unexpected error occurred. Please try again.',
    );
  }

  bool get isRetryable {
    return when(
      server: (message, statusCode, errorCode) => 
          statusCode == null || statusCode >= 500,
      network: (message) => true,
      cache: (message) => true,
      validation: (message, fieldErrors) => false,
      permission: (message, permission) => false,
      location: (message) => true,
      authentication: (message) => false,
      timeout: (message) => true,
      unknown: (message) => true,
    );
  }
}