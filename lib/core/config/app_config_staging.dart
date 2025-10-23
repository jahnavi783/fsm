import 'app_config.dart';

class StagingEnvironment implements AppEnvironment {
  @override
  String get baseUrl => "https://vast-heron-poetic.ngrok-free.app/api";
  
  @override
  String get appName => "FSM Staging";
  
  @override
  String get bundleId => "com.fsm.app.staging";
  
  @override
  bool get isDebug => true;
  
  @override
  bool get enableLogging => true;
}