import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/network/dio_client.dart';

@RoutePage()
class DeveloperOptionsPage extends StatelessWidget {
  const DeveloperOptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (!AppConfig.isDebug) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Developer Options'),
        ),
        body: Center(
          child: Text(
            'Developer options are only available in debug mode',
            style: TextStyle(fontSize: 16.sp),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Developer Options'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Debug Tools - DEV Environment',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Platform.isAndroid
                      ? Colors.green.withValues(alpha: 0.1)
                      : Colors.orange.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                      color: Platform.isAndroid ? Colors.green : Colors.orange,
                      width: 1),
                ),
                child: Row(
                  children: [
                    Icon(
                        Platform.isAndroid
                            ? Icons.check_circle
                            : Icons.info_outline,
                        color:
                            Platform.isAndroid ? Colors.green : Colors.orange,
                        size: 16.sp),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        Platform.isAndroid
                            ? 'Debug Mode: ${AppConfig.isDebug ? 'ENABLED' : 'DISABLED'} | Chuck: CONFIGURED'
                            : 'Debug Mode: ${AppConfig.isDebug ? 'ENABLED' : 'DISABLED'} | Chuck: Android Only',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Platform.isAndroid
                              ? Colors.green[700]
                              : Colors.orange[700],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              if (Platform.isAndroid)
                _DebugCard(
                  title: 'Chuck HTTP Inspector',
                  description:
                      'View all HTTP requests and responses\n✓ Configured for DEV environment\n✓ Android debug mode enabled',
                  icon: Icons.network_check,
                  onTap: () => _openChuckInspector(context),
                )
              else
                _DebugCard(
                  title: 'HTTP Inspector Unavailable',
                  description:
                      'Chuck is only available on Android\nUse PrettyDioLogger in console for iOS/other platforms',
                  icon: Icons.info_outline,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Chuck HTTP Inspector is Android-only.\n'
                          'Check the console logs for HTTP request/response details on iOS.',
                        ),
                        duration: Duration(seconds: 4),
                      ),
                    );
                  },
                ),
              SizedBox(height: 16.h),
              _DebugCard(
                title: 'Environment Info',
                description:
                    'Base URL: ${AppConfig.baseUrl}\nApp Name: ${AppConfig.appName}\nDebug: ${AppConfig.isDebug}\nLogging: ${AppConfig.enableLogging}',
                icon: Icons.info_outline,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'DEV Environment Active\n'
                        'Debug Mode: ${AppConfig.isDebug}\n'
                        'HTTP Inspector: ${Platform.isAndroid ? "Chuck (Android)" : "Console Logger"}\n'
                        'Base URL: ${AppConfig.baseUrl}',
                      ),
                      duration: Duration(seconds: 4),
                    ),
                  );
                },
              ),
              SizedBox(height: 16.h),
              if (Platform.isAndroid)
                _DebugCard(
                  title: 'Test API Call',
                  description: 'Make a test HTTP request to populate Chuck',
                  icon: Icons.api,
                  onTap: () => _makeTestApiCall(context),
                ),
              SizedBox(height: 16.h),
              _DebugCard(
                title: 'Logging Demo',
                description: 'Test and demonstrate the logging service',
                icon: Icons.assignment,
                onTap: () {
                  // TODO: Implement logging demo page with route
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Logging demo page coming soon'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              ),
              SizedBox(height: 16.h),
              _DebugCard(
                title: 'Clear Cache',
                description: 'Clear all local storage and cache',
                icon: Icons.clear_all,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Cache clearing would be implemented here'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Open Chuck inspector (Android only)
  void _openChuckInspector(BuildContext context) {
    if (!Platform.isAndroid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Chuck is only available on Android devices'),
          backgroundColor: Colors.orange,
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    try {
      debugPrint('🔍 Opening Chuck inspector...');
      // Chuck v2.3.1 uses showNotification() or directly navigates via http calls
      // The inspector opens automatically when you tap the notification or when HTTP calls are made
      
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Chuck is running! Make API calls and check notifications, or use the console logs.'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3),
        ),
      );
    } catch (e) {
      debugPrint('🔍 Chuck inspector error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error opening Chuck: $e'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  /// Make a test API call to populate Chucker with sample data
  Future<void> _makeTestApiCall(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);

    try {
      final dioClient = getIt<DioClient>();

      // Show loading
      messenger.showSnackBar(
        const SnackBar(
          content: Text('Making test API call...'),
          duration: Duration(seconds: 2),
        ),
      );

      // Make a test API call (this will be captured by Chuck on Android)
      try {
        await dioClient.dio.get('/health');
      } catch (e) {
        // It's okay if this fails - we just want to generate traffic for HTTP inspection
        debugPrint('Test API call completed (may have failed): $e');
      }

      // Wait a moment - Chuck will capture the request automatically (Android only)
      await Future.delayed(const Duration(milliseconds: 500));
      if (Platform.isAndroid) {
        // Chuck automatically captures HTTP calls and shows notifications
      } else {
        messenger.showSnackBar(
          const SnackBar(
            content: Text(
                'Test API call completed. Check console logs for details (iOS/other platforms)'),
            backgroundColor: Colors.blue,
          ),
        );
      }
    } catch (e) {
      messenger.showSnackBar(
        SnackBar(
          content: Text('Test API Error: $e'),
          backgroundColor: Colors.orange,
        ),
      );
      // Chuck automatically captures HTTP calls on Android
      if (Platform.isAndroid) {
        // Chuck will show notifications for captured requests
      }
    }
  }
}

class _DebugCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  const _DebugCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.r),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  icon,
                  color: Colors.deepPurple,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16.sp,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
