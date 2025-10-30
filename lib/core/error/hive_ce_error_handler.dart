import 'package:hive_ce/hive.dart';
import 'failures.dart';
import 'exceptions.dart';

/// Specialized error handler for Hive CE exceptions
/// Maps HiveError exceptions to appropriate Failure types
class HiveCEErrorHandler {
  /// Maps HiveError exceptions to appropriate Failure types
  static Failure handleHiveError(HiveError error) {
    final message = error.message;

    // Map specific Hive error messages to appropriate failures
    if (message.contains('Box not found') ||
        message.contains('box not found')) {
      return Failure.cache(
        message: 'Local storage box not found. Please restart the app.',
      );
    }

    if (message.contains('Box is already open') ||
        message.contains('already open')) {
      return Failure.cache(
        message: 'Storage box already initialized.',
      );
    }

    if (message.contains('Adapter not registered') ||
        message.contains('adapter')) {
      return Failure.cache(
        message: 'Data model not registered. Please update the app.',
      );
    }

    if (message.contains('Cannot write') || message.contains('transaction')) {
      return Failure.cache(
        message: 'Cannot write to storage. Storage may be locked.',
      );
    }

    if (message.contains('Corrupted') || message.contains('corrupted')) {
      return Failure.cache(
        message: 'Local storage is corrupted. Data may need to be reset.',
      );
    }

    if (message.contains('Permission') || message.contains('permission')) {
      return Failure.permission(
        message: 'Storage permission denied.',
        permission: 'storage',
      );
    }

    if (message.contains('Disk') ||
        message.contains('space') ||
        message.contains('full')) {
      return Failure.cache(
        message: 'Insufficient storage space. Please free up space.',
      );
    }

    if (message.contains('Timeout') || message.contains('timeout')) {
      return Failure.timeout(
        message: 'Storage operation timed out. Please try again.',
      );
    }

    // Default cache failure for unhandled Hive errors
    return Failure.cache(
      message: 'Local storage error: $message',
    );
  }

  /// Handles adapter registration errors specifically
  static Failure handleAdapterRegistrationError(dynamic error) {
    if (error is HiveError) {
      return handleHiveError(error);
    }

    if (error is ArgumentError) {
      return Failure.cache(
        message: 'Invalid adapter configuration: ${error.message}',
      );
    }

    if (error is StateError) {
      return Failure.cache(
        message: 'Adapter registration state error: ${error.message}',
      );
    }

    return Failure.cache(
      message: 'Failed to register data adapter: ${error.toString()}',
    );
  }

  /// Handles box operation errors (open, close, read, write)
  static Failure handleBoxOperationError(dynamic error, String operation) {
    if (error is HiveError) {
      return handleHiveError(error);
    }

    if (error is ArgumentError) {
      return Failure.validation(
        message: 'Invalid $operation operation: ${error.message}',
      );
    }

    if (error is StateError) {
      return Failure.cache(
        message: 'Storage state error during $operation: ${error.message}',
      );
    }

    if (error is TypeError) {
      return Failure.cache(
        message: 'Data type error during $operation. Data may be corrupted.',
      );
    }

    if (error is FormatException) {
      return Failure.cache(
        message: 'Data format error during $operation. Data may be corrupted.',
      );
    }

    return Failure.cache(
      message: 'Storage $operation failed: ${error.toString()}',
    );
  }

  /// Maps Hive CE failures back to exceptions for consistency
  static Exception mapFailureToHiveException(Failure failure) {
    return failure.when(
      server: (message, statusCode, errorCode) => CacheException(
        'Server error affecting cache: $message',
        errorCode,
      ),
      network: (message) => CacheException(
        'Network error affecting cache: $message',
      ),
      cache: (message) => CacheException(message),
      validation: (message, fieldErrors) => CacheException(
        'Validation error in cache operation: $message',
      ),
      permission: (message, permission) => CacheException(
        'Permission error for cache: $message',
      ),
      location: (message) => CacheException(
        'Location error affecting cache: $message',
      ),
      authentication: (message) => CacheException(
        'Authentication error affecting cache: $message',
      ),
      timeout: (message) => CacheException(
        'Timeout error in cache operation: $message',
      ),
      unknown: (message) => CacheException(
        'Unknown error in cache: $message',
      ),
    );
  }

  /// Provides user-friendly error messages for Hive CE errors
  static String getUserFriendlyMessage(Failure failure) {
    return failure.when(
      server: (message, statusCode, errorCode) =>
          'Server error. Please try again later.',
      network: (message) => 'No internet connection. Working offline.',
      cache: (message) {
        if (message.contains('corrupted')) {
          return 'Local data is corrupted. Please restart the app.';
        }
        if (message.contains('space') || message.contains('full')) {
          return 'Storage full. Please free up space.';
        }
        if (message.contains('permission')) {
          return 'Storage permission required. Please check app permissions.';
        }
        if (message.contains('not found')) {
          return 'Local data not found. Please restart the app.';
        }
        return 'Local storage error. Please try again.';
      },
      validation: (message, fieldErrors) =>
          'Invalid data format. Please check your input.',
      permission: (message, permission) =>
          'Storage permission required. Please check app settings.',
      location: (message) => 'Location error affecting local storage.',
      authentication: (message) =>
          'Authentication required for storage access.',
      timeout: (message) => 'Storage operation timed out. Please try again.',
      unknown: (message) =>
          'An unexpected storage error occurred. Please restart the app.',
    );
  }

  /// Determines if a Hive CE error is recoverable
  static bool isRecoverable(Failure failure) {
    return failure.when(
      server: (message, statusCode, errorCode) => true,
      network: (message) => true,
      cache: (message) {
        // Non-recoverable errors
        if (message.contains('corrupted') ||
            message.contains('permission') ||
            message.contains('not registered')) {
          return false;
        }
        // Recoverable errors
        return true;
      },
      validation: (message, fieldErrors) => true,
      permission: (message, permission) => false,
      location: (message) => true,
      authentication: (message) => false,
      timeout: (message) => true,
      unknown: (message) => true,
    );
  }
}
