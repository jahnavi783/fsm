import 'app_config.dart';

class ProductionEnvironment implements AppEnvironment {
  @override
  String get baseUrl => "https://vast-heron-poetic.ngrok-free.app/api";
  // String get baseUrl => "http://172.16.116.138:3033/api";

  @override
  String get appName => "FSM";

  @override
  String get bundleId => "com.fsm.app";

  @override
  bool get isDebug => false;

  @override
  bool get enableLogging => false;
}
