import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/config/app_config.dart';
import 'core/di/injection.dart';
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
    return ScreenUtilInit(
      // Design size from Figma/design specs (iPhone 11 Pro dimensions)
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: AppConfig.appName,
          debugShowCheckedModeBanner: AppConfig.isDebug,
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
          home: MyHomePage(title: '${AppConfig.appName} Demo'),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56.h, // Responsive height
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 20.sp), // Responsive font size
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Environment: ${AppConfig.environment.runtimeType}',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(
              'Base URL: ${AppConfig.baseUrl}',
              style: TextStyle(fontSize: 12.sp),
            ),
            SizedBox(height: 16.h),
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: 16.sp), // Responsive font size
            ),
            SizedBox(height: 16.h), // Responsive spacing
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add, size: 24.r), // Responsive icon size
      ),
    );
  }
}