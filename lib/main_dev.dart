import 'package:flutter/material.dart';

import 'core/config/app_config.dart';
import 'core/config/app_config_dev.dart';
import 'core/di/injection.dart';
import 'main_common.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set development environment
  AppConfig.setEnvironment(DevEnvironment());
  
  await mainCommon(Environment.dev);
}