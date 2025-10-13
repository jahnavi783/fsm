import 'package:flutter/material.dart';

import 'core/config/app_config.dart';
import 'core/config/app_config_prod.dart';
import 'main_common.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set production environment
  AppConfig.setEnvironment(ProductionEnvironment());
  
  await mainCommon();
}