import 'app_config.dart';

class StagingEnvironment implements AppEnvironment {
  @override
  String get baseUrl => "https://staging-api.fsm-app.com/api";
  
  @override
  String get appName => "FSM Staging";
  
  @override
  String get bundleId => "com.fsm.app.staging";
  
  @override
  bool get isDebug => false;
  
  @override
  bool get enableLogging => true;
}