import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/config/app_config.dart';
import 'core/di/injection.dart';
import 'core/router/app_router.dart';
import 'core/storage/hive_service.dart';

Future<void> mainCommon(String environment) async {
  // Initialize Hive service
  await HiveService.create();

  // Configure dependency injection with environment
  await configureDependencies(environment);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();

    return ScreenUtilInit(
      // Design size from Figma/design specs (iPhone 11 Pro dimensions)
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: AppConfig.appName,
          debugShowCheckedModeBanner: AppConfig.isDebug,
          routerConfig: appRouter.config(),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            // Use .sp for font sizes in theme
            textTheme: TextTheme(
              displayLarge: TextStyle(fontSize: 32.sp),
              displayMedium: TextStyle(fontSize: 28.sp),
              displaySmall: TextStyle(fontSize: 24.sp),
              headlineLarge: TextStyle(fontSize: 22.sp),
              headlineMedium: TextStyle(fontSize: 20.sp),
              headlineSmall: TextStyle(fontSize: 18.sp),
              titleLarge: TextStyle(fontSize: 16.sp),
              titleMedium: TextStyle(fontSize: 14.sp),
              titleSmall: TextStyle(fontSize: 12.sp),
              bodyLarge: TextStyle(fontSize: 16.sp),
              bodyMedium: TextStyle(fontSize: 14.sp),
              bodySmall: TextStyle(fontSize: 12.sp),
              labelLarge: TextStyle(fontSize: 14.sp),
              labelMedium: TextStyle(fontSize: 12.sp),
              labelSmall: TextStyle(fontSize: 10.sp),
            ),
          ),
        );
      },
    );
  }
}
