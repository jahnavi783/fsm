import 'app_config.dart';
import 'app_config_dev.dart';
import 'app_config_prod.dart';
import 'app_config_staging.dart';

/// Industry-standard environment configuration for Flutter apps
/// Follows Flutter best practices for flavors and build variants
class Environment {
  // Private constructor to prevent instantiation
  Environment._();

  /// Current environment configuration
  static late AppEnvironment _current;

  /// Get current environment configuration
  static AppEnvironment get current => _current;

  /// Initialize environment configuration based on build flavor
  /// This is the industry-standard approach for Flutter apps
  static void initialize() {
    // Use compile-time constants set by --dart-define
    const flavor =
        String.fromEnvironment('FLUTTER_FLAVOR', defaultValue: 'dev');

    switch (flavor.toLowerCase()) {
      case 'production':
      case 'prod':
        _current = ProductionEnvironment();
        break;
      case 'staging':
      case 'stage':
        _current = StagingEnvironment();
        break;
      case 'development':
      case 'dev':
      default:
        _current = DevEnvironment();
        break;
    }
  }

  /// Get environment name for dependency injection
  static String get name {
    if (_current is ProductionEnvironment) {
      return 'prod';
    } else if (_current is StagingEnvironment) {
      return 'staging';
    } else {
      return 'dev';
    }
  }

  /// Check if current environment is development
  static bool get isDevelopment => _current is DevEnvironment;

  /// Check if current environment is staging
  static bool get isStaging => _current is StagingEnvironment;

  /// Check if current environment is production
  static bool get isProduction => _current is ProductionEnvironment;
}
