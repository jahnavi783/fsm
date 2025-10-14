import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/di/injection.dart';
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
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Debug Tools',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 20.h),
            _DebugCard(
              title: 'Alice HTTP Inspector',
              description: 'View all HTTP requests and responses',
              icon: Icons.network_check,
              onTap: () => aliceService.showInspector(),
            ),
            SizedBox(height: 16.h),
            _DebugCard(
              title: 'Environment Info',
              description: 'Base URL: ${AppConfig.baseUrl}\nApp Name: ${AppConfig.appName}',
              icon: Icons.info_outline,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Environment: ${AppConfig.environment}'),
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
    );
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
                  color: Colors.deepPurple.withOpacity(0.1),
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