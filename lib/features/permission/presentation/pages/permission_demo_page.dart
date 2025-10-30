import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/widgets/fsm_app_bar.dart';

import '../../../../core/di/injection.dart';
import '../../domain/entities/permission_entity.dart';
import '../blocs/permission/permission_bloc.dart';
import '../blocs/permission/permission_event.dart';
import '../blocs/permission/permission_state.dart';
import '../widgets/permission_helper.dart';
import '../widgets/permission_widgets.dart';

class PermissionDemoPage extends StatefulWidget {
  const PermissionDemoPage({super.key});

  @override
  State<PermissionDemoPage> createState() => _PermissionDemoPageState();
}

class _PermissionDemoPageState extends State<PermissionDemoPage> {
  final _permissionBloc = getIt<PermissionBloc>();
  final _permissionHelper = PermissionHelper(getIt());

  final List<AppPermission> _demoPermissions = [
    AppPermission.camera,
    AppPermission.photos,
    AppPermission.locationWhenInUse,
    AppPermission.storage,
    AppPermission.microphone,
    AppPermission.contacts,
    AppPermission.notification,
  ];

  Map<AppPermission, AppPermissionStatus> _permissionStatuses = {};

  @override
  void initState() {
    super.initState();
    _checkAllPermissions();
  }

  void _checkAllPermissions() {
    _permissionBloc.add(
      PermissionEvent.checkMultiplePermissions(_demoPermissions),
    );
  }

  void _requestSinglePermission(AppPermission permission) async {
    final status = await _permissionHelper.requestPermissionWithDialog(
      context: context,
      permission: permission,
    );

    // Refresh status after request
    _checkAllPermissions();

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Permission ${permission.name}: ${status.name}'),
          backgroundColor: status.isGranted ? Colors.green : Colors.red,
        ),
      );
    }
  }

  void _requestMultiplePermissions() async {
    await _permissionHelper.requestMultiplePermissionsWithDialog(
      context: context,
      permissions: FSMPermissionGroups.critical,
      title: 'Critical Permissions Required',
      message: 'The app needs these permissions for core functionality.',
    );

    _checkAllPermissions();
  }

  void _requestBatchPermissions() async {
    final config = BatchPermissionRequestConfig(
      permissions: FSMPermissionGroups.full,
      title: 'Full App Permissions',
      description: 'Grant all permissions for the best experience',
    );

    _permissionBloc.add(
      PermissionEvent.requestBatchPermissions(config: config),
    );
  }

  void _openAppSettings() {
    _permissionBloc.add(const PermissionEvent.openAppSettings());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FSMAppBar.gradient(
        title: 'Permission Demo',
        actions: [
          FSMAppBarAction.refresh(
            onPressed: _checkAllPermissions,
            tooltip: 'Refresh Permissions',
          ),
        ],
      ),
      body: BlocConsumer<PermissionBloc, PermissionState>(
        bloc: _permissionBloc,
        listener: (context, state) {
          state.when(
            initial: () {},
            loading: () {},
            permissionChecked: (permission, status) {},
            multiplePermissionsChecked: (statusMap) {
              setState(() {
                _permissionStatuses = statusMap;
              });
            },
            permissionRequested: (result) {
              _checkAllPermissions();
            },
            multiplePermissionsRequested: (result) {
              _checkAllPermissions();

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '${result.grantedPermissions.length} of ${result.results.length} permissions granted',
                  ),
                  backgroundColor:
                      result.allGranted ? Colors.green : Colors.orange,
                ),
              );
            },
            serviceStatusChecked: (permission, isEnabled) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '${permission.name} service: ${isEnabled ? 'Enabled' : 'Disabled'}',
                  ),
                ),
              );
            },
            settingsOpened: (success) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    success
                        ? 'Settings opened successfully'
                        : 'Failed to open settings',
                  ),
                ),
              );
            },
            error: (message, permission) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: Colors.red,
                ),
              );
            },
          );
        },
        builder: (context, state) {
          return Column(
            children: [
              // Action buttons section
              Container(
                padding: EdgeInsets.all(16.w),
                color: Colors.grey[50],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Permission Actions',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Wrap(
                      spacing: 8.w,
                      runSpacing: 8.h,
                      children: [
                        ElevatedButton.icon(
                          onPressed: _requestMultiplePermissions,
                          icon: const Icon(Icons.security),
                          label: Text('Request Critical',
                              style: TextStyle(fontSize: 12.sp)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: _requestBatchPermissions,
                          icon: const Icon(Icons.apps),
                          label: Text('Request All',
                              style: TextStyle(fontSize: 12.sp)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: _openAppSettings,
                          icon: const Icon(Icons.settings),
                          label: Text('Open Settings',
                              style: TextStyle(fontSize: 12.sp)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Permissions list
              Expanded(
                child: state.when(
                  initial: () => const Center(
                      child: Text('Tap refresh to check permissions')),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  permissionChecked: (permission, status) =>
                      _buildPermissionsList(),
                  multiplePermissionsChecked: (statusMap) =>
                      _buildPermissionsList(),
                  permissionRequested: (result) => _buildPermissionsList(),
                  multiplePermissionsRequested: (result) =>
                      _buildPermissionsList(),
                  serviceStatusChecked: (permission, isEnabled) =>
                      _buildPermissionsList(),
                  settingsOpened: (success) => _buildPermissionsList(),
                  error: (message, permission) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error, size: 48.w, color: Colors.red),
                        SizedBox(height: 16.h),
                        Text(
                          'Error: $message',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        ElevatedButton(
                          onPressed: _checkAllPermissions,
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPermissionsList() {
    if (_permissionStatuses.isEmpty) {
      return const Center(child: Text('No permissions checked yet'));
    }

    return ListView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: _permissionStatuses.length,
      itemBuilder: (context, index) {
        final permission = _permissionStatuses.keys.elementAt(index);
        final status = _permissionStatuses[permission]!;

        return Column(
          children: [
            PermissionStatusWidget(
              permission: permission,
              status: status,
              onTap: () => _requestSinglePermission(permission),
            ),
            if (index < _permissionStatuses.length - 1) SizedBox(height: 8.h),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _permissionBloc.close();
    super.dispose();
  }
}
