abstract class AppConfig {
  static late AppEnvironment _environment;
  
  static AppEnvironment get environment => _environment;
  
  static void setEnvironment(AppEnvironment env) {
    _environment = env;
  }
  
  static String get baseUrl => _environment.baseUrl;
  static String get appName => _environment.appName;
  static String get bundleId => _environment.bundleId;
  static bool get isDebug => _environment.isDebug;
  static bool get enableLogging => _environment.enableLogging;
}

abstract class AppEnvironment {
  String get baseUrl;
  String get appName;
  String get bundleId;
  bool get isDebug;
  bool get enableLogging;
}