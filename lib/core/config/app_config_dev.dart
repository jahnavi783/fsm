import 'app_config.dart';

class DevEnvironment implements AppEnvironment {
  @override
  String get baseUrl => "https://vast-heron-poetic.ngrok-free.app/api";
  
  @override
  String get appName => "FSM Dev";
  
  @override
  String get bundleId => "com.fsm.app.dev";
  
  @override
  bool get isDebug => true;
  
  @override
  bool get enableLogging => true;
}