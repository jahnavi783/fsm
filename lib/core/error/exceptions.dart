/// Base exception class for the application
abstract class AppException implements Exception {
  final String message;
  final String? code;

  const AppException(this.message, [this.code]);

  @override
  String toString() => 'AppException: $message${code != null ? ' (Code: $code)' : ''}';
}

/// Server-related exceptions
class ServerException extends AppException {
  final int? statusCode;

  const ServerException(
    super.message, [
    super.code,
    this.statusCode,
  ]);

  @override
  String toString() => 'ServerException: $message${statusCode != null ? ' (Status: $statusCode)' : ''}${code != null ? ' (Code: $code)' : ''}';
}

/// Network-related exceptions
class NetworkException extends AppException {
  const NetworkException(super.message, [super.code]);

  @override
  String toString() => 'NetworkException: $message${code != null ? ' (Code: $code)' : ''}';
}

/// Cache-related exceptions
class CacheException extends AppException {
  const CacheException(super.message, [super.code]);

  @override
  String toString() => 'CacheException: $message${code != null ? ' (Code: $code)' : ''}';
}

/// Validation-related exceptions
class ValidationException extends AppException {
  final Map<String, String>? fieldErrors;

  const ValidationException(
    super.message, [
    super.code,
    this.fieldErrors,
  ]);

  @override
  String toString() => 'ValidationException: $message${code != null ? ' (Code: $code)' : ''}${fieldErrors != null ? ' (Fields: ${fieldErrors!.keys.join(', ')})' : ''}';
}

/// Permission-related exceptions
class PermissionException extends AppException {
  final String permission;

  const PermissionException(
    super.message,
    this.permission, [
    super.code,
  ]);

  @override
  String toString() => 'PermissionException: $message (Permission: $permission)${code != null ? ' (Code: $code)' : ''}';
}

/// Location-related exceptions
class LocationException extends AppException {
  const LocationException(super.message, [super.code]);

  @override
  String toString() => 'LocationException: $message${code != null ? ' (Code: $code)' : ''}';
}

/// Authentication-related exceptions
class AuthenticationException extends AppException {
  const AuthenticationException(super.message, [super.code]);

  @override
  String toString() => 'AuthenticationException: $message${code != null ? ' (Code: $code)' : ''}';
}

/// Timeout-related exceptions
class TimeoutException extends AppException {
  const TimeoutException(super.message, [super.code]);

  @override
  String toString() => 'TimeoutException: $message${code != null ? ' (Code: $code)' : ''}';
}

/// Unknown exceptions
class UnknownException extends AppException {
  const UnknownException(super.message, [super.code]);

  @override
  String toString() => 'UnknownException: $message${code != null ? ' (Code: $code)' : ''}';
}