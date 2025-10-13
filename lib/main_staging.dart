import 'package:flutter/material.dart';

import 'core/config/app_config.dart';
import 'core/config/app_config_staging.dart';
import 'core/di/injection.dart';
import 'main_common.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set staging environment
  AppConfig.setEnvironment(StagingEnvironment());
  
  await mainCommon(Environment.staging);
}