import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../config/app_config.dart';

/// Logging levels for different types of messages
enum LogLevel {
  debug,
  info,
  warning,
  error,
  critical;

  String get emoji {
    switch (this) {
      case LogLevel.debug:
        return '🐛';
      case LogLevel.info:
        return 'ℹ️';
      case LogLevel.warning:
        return '⚠️';
      case LogLevel.error:
        return '❌';
      case LogLevel.critical:
        return '🔥';
    }
  }

  String get name => toString().split('.').last.toUpperCase();
}

/// Centralized logging service for the FSM app
/// Provides structured logging with different levels and proper formatting
@singleton
class LoggingService {
  static const String _tag = 'FSM_LOG';
  // ignore: unused_field
  static LoggingService? _instance;

  /// Initialize the logging service with configuration
  static void initialize({
    bool enableConsoleLogging = true,
    bool enableFileLogging = false,
    LogLevel logLevel = LogLevel.info,
  }) {
    // Store configuration for later use
    // In a real implementation, you would configure the logging framework here
  }

  /// Static method for logging info messages
  static void logInfo(String message, {String? tag, Object? data}) {
    if (kDebugMode) {
      final timestamp = DateTime.now().toIso8601String().substring(11, 19);
      final logTag = tag ?? _tag;
      print('ℹ️ [$timestamp] $logTag: $message');
      if (data != null) {
        print('  📄 Data: $data');
      }
    }
  }

  /// Static method for logging error messages
  static void logError(String message,
      {String? tag, Object? error, StackTrace? stackTrace}) {
    final timestamp = DateTime.now().toIso8601String().substring(11, 19);
    final logTag = tag ?? _tag;
    print('❌ [$timestamp] $logTag: $message');
    if (error != null) {
      print('  📄 Error: $error');
    }
    if (stackTrace != null) {
      print('  📚 Stack trace:\n$stackTrace');
    }
  }

  /// Log a debug message (only in debug mode)
  void debug(String message,
      {String? tag, Object? data, StackTrace? stackTrace}) {
    if (!AppConfig.isDebug) return;
    _log(LogLevel.debug, message, tag: tag, data: data, stackTrace: stackTrace);
  }

  /// Log an info message
  void info(String message, {String? tag, Object? data}) {
    _log(LogLevel.info, message, tag: tag, data: data);
  }

  /// Log a warning message
  void warning(String message,
      {String? tag, Object? data, StackTrace? stackTrace}) {
    _log(LogLevel.warning, message,
        tag: tag, data: data, stackTrace: stackTrace);
  }

  /// Log an error message
  void error(String message,
      {String? tag, Object? error, StackTrace? stackTrace}) {
    _log(LogLevel.error, message,
        tag: tag, data: error, stackTrace: stackTrace);
  }

  /// Log a critical error (always logged, even in production)
  void critical(String message,
      {String? tag, Object? error, StackTrace? stackTrace}) {
    _log(LogLevel.critical, message,
        tag: tag, data: error, stackTrace: stackTrace);
  }

  /// Log network activity
  void network(String method, String url, {int? statusCode, Object? data}) {
    if (!AppConfig.enableLogging) return;

    final statusIcon = _getStatusIcon(statusCode);
    final message = '$statusIcon $method $url';

    _log(LogLevel.info, message, tag: 'NETWORK', data: data);
  }

  /// Log authentication events
  void auth(String event, {Object? data}) {
    _log(LogLevel.info, event, tag: 'AUTH', data: data);
  }

  /// Log location events
  void location(String event, {Object? data}) {
    _log(LogLevel.info, event, tag: 'LOCATION', data: data);
  }

  /// Log work order events
  void workOrder(String event, {Object? data}) {
    _log(LogLevel.info, event, tag: 'WORK_ORDER', data: data);
  }

  /// Log performance metrics
  void performance(String metric, Duration duration, {String? tag}) {
    if (!AppConfig.isDebug) return;

    final message = '$metric completed in ${duration.inMilliseconds}ms';
    _log(LogLevel.debug, message, tag: tag ?? 'PERFORMANCE');
  }

  /// Internal logging method
  void _log(LogLevel level, String message,
      {String? tag, Object? data, StackTrace? stackTrace}) {
    // Skip debug logs in production (except critical)
    if (!AppConfig.enableLogging && level != LogLevel.critical) {
      return;
    }

    final timestamp = DateTime.now().toIso8601String().substring(11, 19);
    final logTag = tag ?? _tag;
    final formattedMessage = '${level.emoji} [$timestamp] $logTag: $message';

    // Use developer.log for better debugging experience
    if (kDebugMode) {
      developer.log(
        message,
        time: DateTime.now(),
        level: _getLevelValue(level),
        name: logTag,
        error: data,
        stackTrace: stackTrace,
      );

      // Also print to console for immediate visibility
      if (kDebugMode) {
        print(formattedMessage);

        if (data != null) {
          print('  📄 Data: $data');
        }

        if (stackTrace != null &&
            (level == LogLevel.error || level == LogLevel.critical)) {
          print('  📚 Stack trace:\n$stackTrace');
        }
      }
    } else {
      // In production, only log critical errors
      if (level == LogLevel.critical) {
        print(formattedMessage);
        if (data != null) {
          print('  Data: $data');
        }
      }
    }

    // TODO: In a real app, you would also send logs to:
    // - Firebase Crashlytics for crashes
    // - Your backend logging service
    // - Local file storage for offline analysis
    // - Analytics platforms for user behavior tracking
  }

  /// Get developer.log level value
  int _getLevelValue(LogLevel level) {
    switch (level) {
      case LogLevel.debug:
        return 500;
      case LogLevel.info:
        return 800;
      case LogLevel.warning:
        return 900;
      case LogLevel.error:
        return 1000;
      case LogLevel.critical:
        return 1200;
    }
  }

  /// Get status icon for HTTP status codes
  String _getStatusIcon(int? statusCode) {
    if (statusCode == null) return '❓';

    if (statusCode >= 200 && statusCode < 300) {
      return '✅'; // Success
    } else if (statusCode >= 300 && statusCode < 400) {
      return '🔄'; // Redirect
    } else if (statusCode >= 400 && statusCode < 500) {
      return '⚠️'; // Client error
    } else if (statusCode >= 500) {
      return '❌'; // Server error
    }

    return '❓'; // Unknown
  }
}

/// Extension for easy access to logging throughout the app
extension LoggingServiceExtension on LoggingService {
  /// Quick access for logging failures
  void logFailure(String context, Object error, {StackTrace? stackTrace}) {
    this.error('Failure in $context: $error', stackTrace: stackTrace);
  }

  /// Quick access for logging success operations
  void logSuccess(String operation, {Object? data}) {
    info('✅ $operation successful', data: data);
  }

  /// Quick access for logging user actions
  void logUserAction(String action, {Object? data}) {
    info('👤 User action: $action', tag: 'USER_ACTION', data: data);
  }

  /// Quick access for logging app lifecycle events
  void logAppEvent(String event, {Object? data}) {
    info('📱 App event: $event', tag: 'APP_LIFECYCLE', data: data);
  }
}
