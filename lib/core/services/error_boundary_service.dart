import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@singleton
class ErrorBoundaryService {
  static const String _tag = 'ErrorBoundary';
  final List<ErrorReport> _errorReports = [];

  /// Initialize error boundary with global error handlers
  void initialize() {
    // Handle Flutter framework errors
    FlutterError.onError = (FlutterErrorDetails details) {
      _handleFlutterError(details);
    };

    // Handle async errors not caught by Flutter
    PlatformDispatcher.instance.onError = (error, stack) {
      _handlePlatformError(error, stack);
      return true;
    };

    if (kDebugMode) {
      developer.log('Error boundary initialized', name: _tag);
    }
  }

  /// Handle Flutter framework errors
  void _handleFlutterError(FlutterErrorDetails details) {
    final errorReport = ErrorReport(
      error: details.exception,
      stackTrace: details.stack,
      context: details.context?.toString(),
      library: details.library,
      timestamp: DateTime.now(),
      type: ErrorType.flutter,
    );

    _recordError(errorReport);

    // In debug mode, show the red screen
    if (kDebugMode) {
      FlutterError.presentError(details);
    }
  }

  /// Handle platform/async errors
  void _handlePlatformError(Object error, StackTrace stackTrace) {
    final errorReport = ErrorReport(
      error: error,
      stackTrace: stackTrace,
      timestamp: DateTime.now(),
      type: ErrorType.platform,
    );

    _recordError(errorReport);
  }

  /// Record error for reporting
  void _recordError(ErrorReport report) {
    _errorReports.add(report);

    // Log error details
    developer.log(
      'Error recorded: ${report.error}',
      name: _tag,
      error: report.error,
      stackTrace: report.stackTrace,
    );

    // Keep only last 50 errors to prevent memory issues
    if (_errorReports.length > 50) {
      _errorReports.removeAt(0);
    }

    // In production, you would send this to a crash reporting service
    if (kReleaseMode) {
      _sendToCrashReporting(report);
    }
  }

  /// Send error to crash reporting service (placeholder)
  void _sendToCrashReporting(ErrorReport report) {
    // TODO: Integrate with Firebase Crashlytics, Sentry, or similar service
    // For now, just log that we would send it
    developer.log(
      'Would send to crash reporting: ${report.error}',
      name: _tag,
    );
  }

  /// Get recent error reports
  List<ErrorReport> getRecentErrors() {
    return List.unmodifiable(_errorReports);
  }

  /// Clear error reports
  void clearErrors() {
    _errorReports.clear();
  }

  /// Manually report an error
  void reportError(
    Object error,
    StackTrace? stackTrace, {
    String? context,
    Map<String, dynamic>? additionalData,
  }) {
    final errorReport = ErrorReport(
      error: error,
      stackTrace: stackTrace,
      context: context,
      additionalData: additionalData,
      timestamp: DateTime.now(),
      type: ErrorType.manual,
    );

    _recordError(errorReport);
  }
}

/// Error report data class
class ErrorReport {
  final Object error;
  final StackTrace? stackTrace;
  final String? context;
  final String? library;
  final DateTime timestamp;
  final ErrorType type;
  final Map<String, dynamic>? additionalData;

  const ErrorReport({
    required this.error,
    this.stackTrace,
    this.context,
    this.library,
    required this.timestamp,
    required this.type,
    this.additionalData,
  });

  @override
  String toString() {
    return 'ErrorReport{error: $error, type: $type, timestamp: $timestamp}';
  }
}

enum ErrorType {
  flutter,
  platform,
  network,
  manual,
}
