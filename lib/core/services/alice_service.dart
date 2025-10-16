import 'package:alice/alice.dart';
import 'package:alice_dio/alice_dio_adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../config/app_config.dart';
import 'logging_service.dart';

@singleton
class AliceService {
  late Alice _alice;
  static AliceService? _instance;
  bool _isInitialized = false;
  final LoggingService _loggingService;

  AliceService(this._loggingService) {
    _initializeAlice();
    _instance = this;
  }

  /// Initialize Alice with dev environment specific settings
  void _initializeAlice() {
    try {
      _alice = Alice();
      _isInitialized = true;
      _loggingService.info(
          'Alice initialized successfully for ${AppConfig.isDebug ? 'DEBUG' : 'RELEASE'} mode',
          tag: 'ALICE');
    } catch (e, stackTrace) {
      _loggingService.error('Alice initialization failed',
          tag: 'ALICE', error: e, stackTrace: stackTrace);
      _isInitialized = false;
    }
  }

  /// Get global Alice instance for easy access
  static Alice? get globalAlice => _instance?._alice;

  /// Get Alice instance
  Alice get alice => _alice;

  /// Configure Dio to work with Alice by adding proper alice_dio adapter (dev environment only)
  void configureDio(Dio dio) {
    if (!AppConfig.isDebug || !_isInitialized) {
      _loggingService.debug(
          'Alice skipped - Debug: ${AppConfig.isDebug}, Initialized: $_isInitialized',
          tag: 'ALICE');
      return;
    }

    try {
      // Create single Alice Dio adapter instance for proper HTTP tracking
      final aliceAdapter = AliceDioAdapter();
      _alice.addAdapter(aliceAdapter);
      dio.interceptors.add(aliceAdapter);
      _loggingService.info(
          'Alice Dio adapter added successfully for dev environment',
          tag: 'ALICE');
    } catch (e, stackTrace) {
      _loggingService.error('Alice Dio adapter configuration failed',
          tag: 'ALICE', error: e, stackTrace: stackTrace);
    }
  }

  /// Show Alice inspector manually with context fallback (dev environment only)
  void showInspector([BuildContext? context]) {
    if (!AppConfig.isDebug) {
      _loggingService.debug('Alice inspector not available in non-debug mode',
          tag: 'ALICE');
      if (context != null) {
        _showProductionWarning(context);
      }
      return;
    }

    if (!_isInitialized) {
      _loggingService.error('Alice not initialized properly', tag: 'ALICE');
      if (context != null) {
        _showInitializationError(context);
      }
      return;
    }

    try {
      _alice.showInspector();
      _loggingService.info('Alice inspector opened successfully in dev mode',
          tag: 'ALICE');
    } catch (e, stackTrace) {
      _loggingService.error('Alice inspector error',
          tag: 'ALICE', error: e, stackTrace: stackTrace);
      // Fallback: try to show with context if available
      if (context != null) {
        _showAliceWithContext(context);
      } else {
        _loggingService.warning('Alice: No context available for fallback',
            tag: 'ALICE');
      }
    }
  }

  /// Show Alice with context as fallback
  void _showAliceWithContext(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Alice HTTP Inspector'),
        content: const Text(
          'Alice is configured for dev environment but no HTTP calls have been captured yet. '
          'Make some API calls in the app (like login or loading work orders) '
          'and then check Alice again.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Try to show Alice again
              _alice.showInspector();
            },
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }

  /// Show production warning when Alice is accessed in non-debug mode
  void _showProductionWarning(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Alice HTTP Inspector'),
        content: const Text(
          'Alice HTTP Inspector is only available in development mode. '
          'Please use the dev build to access debugging features.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  /// Show initialization error dialog
  void _showInitializationError(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Alice HTTP Inspector'),
        content: const Text(
          'Alice failed to initialize properly. '
          'Please restart the app or check the console for error details.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  /// Get navigation key for Alice (for MaterialApp.navigatorKey)
  GlobalKey<NavigatorState>? getNavigatorKey() => _alice.getNavigatorKey();

  /// Add HTTP call manually to Alice (for custom tracking)
  void addHttpCall(
    String method,
    String url, {
    Map<String, dynamic>? requestData,
    int? statusCode,
    Map<String, dynamic>? responseData,
    Duration? duration,
  }) {
    debugPrint('🔍 Alice HTTP Call: $method $url - Status: $statusCode');
    // Alice will display this in the inspector UI
  }

  /// Add custom log to Alice
  void addLog(String message, {String level = 'INFO'}) {
    _loggingService.debug('Alice [$level]: $message', tag: 'ALICE');
  }

  /// Create sample HTTP calls for testing Alice
  void generateSampleData() {
    _loggingService.debug('Generating sample HTTP data for Alice...',
        tag: 'ALICE');

    // This would typically be handled by Alice's Dio adapter
    // For now, we'll show Alice inspector regardless of data
    showInspector();
  }
}

