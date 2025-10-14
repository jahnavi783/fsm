import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/services/alice_service.dart';

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

    final aliceService = getIt<AliceService>();

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
                  color: Colors.green.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Colors.green, width: 1),
                ),
                child: Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green, size: 16.sp),
                    SizedBox(width: 8.w),
                    Text(
                      'Debug Mode: ${AppConfig.isDebug ? 'ENABLED' : 'DISABLED'} | Alice: CONFIGURED',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.green[700],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              _DebugCard(
                title: 'Alice HTTP Inspector',
                description:
                    'View all HTTP requests and responses\n✓ Configured for DEV environment\n✓ Debug mode enabled',
                icon: Icons.network_check,
                onTap: () => _openAliceInspector(context, aliceService),
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
                        'Alice: Configured and Ready\n'
                        'Base URL: ${AppConfig.baseUrl}',
                      ),
                      duration: Duration(seconds: 4),
                    ),
                  );
                },
              ),
              SizedBox(height: 16.h),
              _DebugCard(
                title: 'Test API Call',
                description: 'Make a test HTTP request to populate Alice',
                icon: Icons.api,
                onTap: () => _makeTestApiCall(context, aliceService),
              ),
              SizedBox(height: 16.h),
              _DebugCard(
                title: 'Logging Demo',
                description: 'Test and demonstrate the logging service',
                icon: Icons.assignment,
                onTap: () {
                  context.router.pushNamed('/logging-demo');
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

  /// Open Alice inspector with better error handling
  void _openAliceInspector(BuildContext context, AliceService aliceService) {
    try {
      debugPrint('🔍 Attempting to open Alice inspector...');
      aliceService.showInspector();

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Alice inspector opened! If no requests visible, make some API calls first.'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3),
        ),
      );
    } catch (e) {
      debugPrint('🔍 Alice inspector error: $e');
      _showAliceTroubleshootingDialog(context, aliceService);
    }
  }

  /// Show troubleshooting dialog for Alice
  void _showAliceTroubleshootingDialog(
      BuildContext context, AliceService aliceService) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Alice HTTP Inspector'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Alice is configured but may not have captured any HTTP requests yet.'),
            SizedBox(height: 16),
            Text('To populate Alice:'),
            SizedBox(height: 8),
            Text('• Login to the app'),
            Text('• Load work orders'),
            Text('• Navigate between pages'),
            Text('• Use the "Test API Call" button'),
            SizedBox(height: 16),
            Text(
                'Once HTTP requests are made, Alice will show them in the inspector.'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _makeTestApiCall(context, aliceService);
            },
            child: const Text('Test API Call'),
          ),
        ],
      ),
    );
  }

  /// Make a test API call to populate Alice with sample data
  Future<void> _makeTestApiCall(
      BuildContext context, AliceService aliceService) async {
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

      // Make a test API call (this will be captured by Alice)
      try {
        await dioClient.dio.get('/health');
      } catch (e) {
        // It's okay if this fails - we just want to generate traffic for Alice
        debugPrint('Test API call completed (may have failed): $e');
      }

      // Wait a moment then show Alice
      await Future.delayed(const Duration(milliseconds: 500));
      aliceService.showInspector();
    } catch (e) {
      messenger.showSnackBar(
        SnackBar(
          content: Text('Test API Error: $e'),
          backgroundColor: Colors.orange,
        ),
      );
      // Still try to show Alice
      aliceService.showInspector();
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
