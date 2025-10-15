import 'package:flutter_test/flutter_test.dart';
import '../lib/core/config/app_config.dart';
import '../lib/core/config/environment_resolver.dart' as env;

void main() {
  group('Environment Configuration Tests', () {
    test('should initialize correct environment based on FLUTTER_FLAVOR', () {
      // Initialize environment based on compile-time constant
      env.Environment.initialize();
      AppConfig.setEnvironment(env.Environment.current);

      // Get the flavor from compile-time constant
      const flavor =
          String.fromEnvironment('FLUTTER_FLAVOR', defaultValue: 'dev');

      // Verify environment is correctly detected
      expect(env.Environment.name, isIn(['dev', 'staging', 'prod']));
      expect(env.Environment.current, isNotNull);

      // Verify configuration is properly set based on environment
      expect(AppConfig.baseUrl, isNotEmpty);
      expect(AppConfig.appName, isNotEmpty);
      expect(AppConfig.bundleId, isNotEmpty);
      expect(AppConfig.isDebug, isA<bool>());
      expect(AppConfig.enableLogging, isA<bool>());

      // Test environment-specific configurations
      switch (flavor.toLowerCase()) {
        case 'dev':
        case 'development':
          expect(env.Environment.isDevelopment, isTrue);
          expect(AppConfig.appName, equals('FSM Dev'));
          expect(AppConfig.bundleId, equals('com.fsm.app.dev'));
          expect(AppConfig.isDebug, isTrue);
          expect(AppConfig.enableLogging, isTrue);
          break;
        case 'staging':
        case 'stage':
          expect(env.Environment.isStaging, isTrue);
          expect(AppConfig.appName, equals('FSM Staging'));
          expect(AppConfig.bundleId, equals('com.fsm.app.staging'));
          expect(AppConfig.isDebug, isFalse);
          expect(AppConfig.enableLogging, isTrue);
          break;
        case 'prod':
        case 'production':
          expect(env.Environment.isProduction, isTrue);
          expect(AppConfig.appName, equals('FSM'));
          expect(AppConfig.bundleId, equals('com.fsm.app'));
          expect(AppConfig.isDebug, isFalse);
          expect(AppConfig.enableLogging, isFalse);
          break;
      }
    });

    test('should handle environment detection correctly', () {
      // Test environment name mapping
      env.Environment.initialize();

      expect(env.Environment.name, isIn(['dev', 'staging', 'prod']));
      expect(env.Environment.current, isNotNull);
    });

    test('should provide correct base URLs for each environment', () {
      env.Environment.initialize();
      AppConfig.setEnvironment(env.Environment.current);

      const flavor =
          String.fromEnvironment('FLUTTER_FLAVOR', defaultValue: 'dev');

      switch (flavor.toLowerCase()) {
        case 'dev':
        case 'development':
          expect(AppConfig.baseUrl, equals('http://192.168.1.2:3011/api'));
          break;
        case 'staging':
        case 'stage':
          expect(
              AppConfig.baseUrl, equals('https://staging-api.fsm-app.com/api'));
          break;
        case 'prod':
        case 'production':
          expect(AppConfig.baseUrl, equals('https://api.fsm-app.com/api'));
          break;
      }
    });
  });
}
