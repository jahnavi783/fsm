import 'app_config.dart';

class DevEnvironment implements AppEnvironment {
  @override
  String get baseUrl => "http://192.168.1.2:3011/api";

  @override
  String get appName => "FSM Dev";

  @override
  String get bundleId => "com.fsm.app.dev";

  @override
  bool get isDebug => true;

  @override
  bool get enableLogging => true;
}
