import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/permission_entity.dart';
import '../../data/datasources/permission_mapper.dart';

/// Widget to display permission request dialog
class PermissionRequestDialog extends StatelessWidget {
  final AppPermission permission;
  final String? customTitle;
  final String? customMessage;
  final VoidCallback onGrant;
  final VoidCallback? onDeny;
  final VoidCallback? onSettings;

  const PermissionRequestDialog({
    super.key,
    required this.permission,
    this.customTitle,
    this.customMessage,
    required this.onGrant,
    this.onDeny,
    this.onSettings,
  });

  @override
  Widget build(BuildContext context) {
    final permissionName =
        PermissionMapper.getPermissionDisplayName(permission);
    final serviceName = PermissionMapper.getServiceName(permission);

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      title: Text(
        customTitle ?? '$permissionName Permission Required',
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            customMessage ?? _getDefaultMessage(permissionName, serviceName),
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
              height: 1.4,
            ),
          ),
          SizedBox(height: 16.h),
          _buildPermissionIcon(permission),
        ],
      ),
      actions: [
        if (onSettings != null)
          TextButton(
            onPressed: onSettings,
            child: Text(
              'Open Settings',
              style: TextStyle(fontSize: 14.sp),
            ),
          ),
        TextButton(
          onPressed: onDeny ?? () => Navigator.of(context).pop(),
          child: Text(
            'Cancel',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
            onGrant();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Text(
            'Grant Permission',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPermissionIcon(AppPermission permission) {
    IconData iconData;
    Color iconColor;

    switch (permission) {
      case AppPermission.camera:
        iconData = Icons.camera_alt;
        iconColor = Colors.blue;
        break;
      case AppPermission.photos:
        iconData = Icons.photo_library;
        iconColor = Colors.purple;
        break;
      case AppPermission.location:
      case AppPermission.locationAlways:
      case AppPermission.locationWhenInUse:
        iconData = Icons.location_on;
        iconColor = Colors.red;
        break;
      case AppPermission.microphone:
        iconData = Icons.mic;
        iconColor = Colors.orange;
        break;
      case AppPermission.storage:
      case AppPermission.manageExternalStorage:
        iconData = Icons.folder;
        iconColor = Colors.brown;
        break;
      case AppPermission.notification:
        iconData = Icons.notifications;
        iconColor = Colors.green;
        break;
      case AppPermission.contacts:
        iconData = Icons.contacts;
        iconColor = Colors.teal;
        break;
      case AppPermission.calendar:
        iconData = Icons.calendar_today;
        iconColor = Colors.indigo;
        break;
      default:
        iconData = Icons.security;
        iconColor = Colors.grey;
    }

    return Center(
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Icon(
          iconData,
          size: 32.w,
          color: iconColor,
        ),
      ),
    );
  }

  String _getDefaultMessage(String permissionName, String serviceName) {
    switch (permission) {
      case AppPermission.camera:
        return 'This app needs camera access to take photos of work orders, equipment, and documentation for field service reports.';
      case AppPermission.photos:
        return 'This app needs photo library access to select and attach images to work orders and service documentation.';
      case AppPermission.location:
      case AppPermission.locationAlways:
      case AppPermission.locationWhenInUse:
        return 'This app needs location access to track work orders and provide location-based services for field service management.';
      case AppPermission.microphone:
        return 'This app needs microphone access to record voice notes and audio documentation for work orders.';
      case AppPermission.storage:
      case AppPermission.manageExternalStorage:
        return 'This app needs storage access to save and manage work order documents, photos, and files.';
      case AppPermission.notification:
        return 'This app needs notification permission to keep you updated about work orders, schedules, and important alerts.';
      case AppPermission.contacts:
        return 'This app needs contacts access to quickly add customer and team member information to work orders.';
      case AppPermission.calendar:
        return 'This app needs calendar access to schedule and manage work order appointments and service calls.';
      default:
        return 'This app needs $permissionName permission to provide enhanced functionality and better user experience.';
    }
  }
}

/// Widget to display batch permission request
class BatchPermissionRequestDialog extends StatelessWidget {
  final List<AppPermission> permissions;
  final String? customTitle;
  final String? customMessage;
  final VoidCallback onGrant;
  final VoidCallback? onDeny;

  const BatchPermissionRequestDialog({
    super.key,
    required this.permissions,
    this.customTitle,
    this.customMessage,
    required this.onGrant,
    this.onDeny,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      title: Text(
        customTitle ?? 'Permissions Required',
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            customMessage ??
                'This app needs the following permissions to function properly:',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
              height: 1.4,
            ),
          ),
          SizedBox(height: 16.h),
          ...permissions.map((permission) => _buildPermissionItem(permission)),
        ],
      ),
      actions: [
        TextButton(
          onPressed: onDeny ?? () => Navigator.of(context).pop(),
          child: Text(
            'Cancel',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
            onGrant();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Text(
            'Grant Permissions',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPermissionItem(AppPermission permission) {
    final permissionName =
        PermissionMapper.getPermissionDisplayName(permission);

    IconData iconData;
    Color iconColor;

    switch (permission) {
      case AppPermission.camera:
        iconData = Icons.camera_alt;
        iconColor = Colors.blue;
        break;
      case AppPermission.photos:
        iconData = Icons.photo_library;
        iconColor = Colors.purple;
        break;
      case AppPermission.location:
      case AppPermission.locationAlways:
      case AppPermission.locationWhenInUse:
        iconData = Icons.location_on;
        iconColor = Colors.red;
        break;
      case AppPermission.microphone:
        iconData = Icons.mic;
        iconColor = Colors.orange;
        break;
      case AppPermission.storage:
      case AppPermission.manageExternalStorage:
        iconData = Icons.folder;
        iconColor = Colors.brown;
        break;
      case AppPermission.notification:
        iconData = Icons.notifications;
        iconColor = Colors.green;
        break;
      default:
        iconData = Icons.security;
        iconColor = Colors.grey;
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              iconData,
              size: 20.w,
              color: iconColor,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              permissionName,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Widget to show permission status
class PermissionStatusWidget extends StatelessWidget {
  final AppPermission permission;
  final AppPermissionStatus status;
  final VoidCallback? onTap;

  const PermissionStatusWidget({
    super.key,
    required this.permission,
    required this.status,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final permissionName =
        PermissionMapper.getPermissionDisplayName(permission);

    Color statusColor;
    IconData statusIcon;
    String statusText;

    switch (status) {
      case AppPermissionStatus.granted:
        statusColor = Colors.green;
        statusIcon = Icons.check_circle;
        statusText = 'Granted';
        break;
      case AppPermissionStatus.limited:
        statusColor = Colors.orange;
        statusIcon = Icons.warning;
        statusText = 'Limited';
        break;
      case AppPermissionStatus.denied:
        statusColor = Colors.red;
        statusIcon = Icons.cancel;
        statusText = 'Denied';
        break;
      case AppPermissionStatus.permanentlyDenied:
        statusColor = Colors.red[700]!;
        statusIcon = Icons.block;
        statusText = 'Permanently Denied';
        break;
      case AppPermissionStatus.restricted:
        statusColor = Colors.grey;
        statusIcon = Icons.security;
        statusText = 'Restricted';
        break;
      case AppPermissionStatus.notDetermined:
        statusColor = Colors.grey;
        statusIcon = Icons.help;
        statusText = 'Not Requested';
        break;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        margin: EdgeInsets.symmetric(vertical: 4.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                permissionName,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(
              statusIcon,
              color: statusColor,
              size: 20.w,
            ),
            SizedBox(width: 8.w),
            Text(
              statusText,
              style: TextStyle(
                fontSize: 12.sp,
                color: statusColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
