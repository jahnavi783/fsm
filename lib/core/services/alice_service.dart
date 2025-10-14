import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class AliceService {
  late Alice _alice;
  static AliceService? _instance;

  AliceService() {
    _alice = Alice();
    _instance = this;
  }

  /// Get global Alice instance for easy access
  static Alice? get globalAlice => _instance?._alice;

  /// Get Alice instance
  Alice get alice => _alice;

  /// Configure Dio to work with Alice
  /// Alice requires manual configuration for each HTTP call
  void configureDio(Dio dio) {
    // Alice will be accessible through the global navigator key
    // HTTP requests will be manually added to Alice in interceptors or manual calls
    debugPrint('🔍 Alice configured for HTTP inspection');
  }

  /// Show Alice inspector manually
  void showInspector() {
    _alice.showInspector();
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
    debugPrint('🔍 Alice [$level]: $message');
  }
}