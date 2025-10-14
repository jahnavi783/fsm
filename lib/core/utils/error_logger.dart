import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../di/injection.dart';
import '../services/logging_service.dart';

/// Global error handling utilities for the FSM app
class ErrorLogger {
  static final LoggingService _loggingService = getIt<LoggingService>();

  /// Log a user action for analytics and debugging
  static void logUserAction(String action, {Map<String, dynamic>? metadata}) {
    _loggingService.logUserAction(action, data: metadata);
  }

  /// Log a performance metric
  static void logPerformance(String operation, Duration duration,
      {String? context}) {
    _loggingService.performance(operation, duration, tag: context);
  }

  /// Log a successful operation
  static void logSuccess(String operation, {Object? data}) {
    _loggingService.logSuccess(operation, data: data);
  }

  /// Log a failure or error
  static void logFailure(String context, Object error,
      {StackTrace? stackTrace}) {
    _loggingService.logFailure(context, error, stackTrace: stackTrace);
  }

  /// Log app lifecycle events
  static void logAppEvent(String event, {Object? data}) {
    _loggingService.logAppEvent(event, data: data);
  }

  /// Log network related activities
  static void logNetwork(String method, String url,
      {int? statusCode, Object? data}) {
    _loggingService.network(method, url, statusCode: statusCode, data: data);
  }

  /// Log authentication events
  static void logAuth(String event, {Object? data}) {
    _loggingService.auth(event, data: data);
  }

  /// Log location events
  static void logLocation(String event, {Object? data}) {
    _loggingService.location(event, data: data);
  }

  /// Log work order events
  static void logWorkOrder(String event, {Object? data}) {
    _loggingService.workOrder(event, data: data);
  }
}

/// Extension for easy error logging from BLoCs
extension BlocErrorLogging<Event, State> on BlocBase<State> {
  void logError(String context, Object error, {StackTrace? stackTrace}) {
    ErrorLogger.logFailure('$runtimeType: $context', error,
        stackTrace: stackTrace);
  }

  void logSuccess(String operation, {Object? data}) {
    ErrorLogger.logSuccess('$runtimeType: $operation', data: data);
  }
}

/// Extension for easy error logging from widgets
extension WidgetErrorLogging on StatelessWidget {
  void logError(String context, Object error, {StackTrace? stackTrace}) {
    ErrorLogger.logFailure('$runtimeType: $context', error,
        stackTrace: stackTrace);
  }

  void logUserAction(String action, {Map<String, dynamic>? metadata}) {
    ErrorLogger.logUserAction('$runtimeType: $action', metadata: metadata);
  }
}

extension StatefulWidgetErrorLogging on StatefulWidget {
  void logError(String context, Object error, {StackTrace? stackTrace}) {
    ErrorLogger.logFailure('$runtimeType: $context', error,
        stackTrace: stackTrace);
  }

  void logUserAction(String action, {Map<String, dynamic>? metadata}) {
    ErrorLogger.logUserAction('$runtimeType: $action', metadata: metadata);
  }
}

/// Mixin for easy error logging in any class
mixin ErrorLoggingMixin {
  void logError(String context, Object error, {StackTrace? stackTrace}) {
    ErrorLogger.logFailure('$runtimeType: $context', error,
        stackTrace: stackTrace);
  }

  void logSuccess(String operation, {Object? data}) {
    ErrorLogger.logSuccess('$runtimeType: $operation', data: data);
  }

  void logInfo(String message, {Object? data}) {
    final loggingService = getIt<LoggingService>();
    loggingService.info('$runtimeType: $message',
        tag: runtimeType.toString(), data: data);
  }

  void logDebug(String message, {Object? data}) {
    final loggingService = getIt<LoggingService>();
    loggingService.debug('$runtimeType: $message',
        tag: runtimeType.toString(), data: data);
  }

  void logWarning(String message, {Object? data}) {
    final loggingService = getIt<LoggingService>();
    loggingService.warning('$runtimeType: $message',
        tag: runtimeType.toString(), data: data);
  }
}

/// Exception handler that automatically logs errors
class LoggedError extends Error {
  final String context;
  final String message;
  final Object? originalError;

  LoggedError(this.context, this.message, {this.originalError}) {
    ErrorLogger.logFailure(context, message, stackTrace: stackTrace);
  }

  @override
  String toString() => 'LoggedError($context): $message';
}

/// Exception class that automatically logs exceptions
class LoggedException implements Exception {
  final String context;
  final String message;
  final Object? originalException;

  LoggedException(this.context, this.message, {this.originalException}) {
    ErrorLogger.logFailure(context, message);
  }

  @override
  String toString() => 'LoggedException($context): $message';
}
