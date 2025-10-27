import 'app_config.dart';

class ProductionEnvironment implements AppEnvironment {
  @override
  String get baseUrl => "https://vast-heron-poetic.ngrok-free.app/api";
  
  @override
  String get appName => "FSM";
  
  @override
  String get bundleId => "com.fsm.app";
  
  @override
  bool get isDebug => false;
  
  @override
  bool get enableLogging => false;
}