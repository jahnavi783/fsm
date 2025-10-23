import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationErrorDialog {
  static void show(
    BuildContext context,
    VoidCallback onRetry,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.location_off, color: Colors.red, size: 24.sp),
            SizedBox(width: 8.w),
            const Text('Location Required'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location access is required to perform work order actions. Please ensure:',
              style: TextStyle(fontSize: 14.sp),
            ),
            SizedBox(height: 12.h),
            Text(
              '• Location services are enabled',
              style: TextStyle(fontSize: 13.sp, color: Colors.grey[600]),
            ),
            Text(
              '• App has location permissions',
              style: TextStyle(fontSize: 13.sp, color: Colors.grey[600]),
            ),
            Text(
              '• GPS signal is available',
              style: TextStyle(fontSize: 13.sp, color: Colors.grey[600]),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).pop();
              onRetry();
            },
            icon: Icon(Icons.refresh, size: 18.sp),
            label: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
