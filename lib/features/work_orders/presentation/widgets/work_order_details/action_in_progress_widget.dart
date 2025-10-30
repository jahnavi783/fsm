import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionInProgressWidget extends StatelessWidget {
  final String actionType;

  const ActionInProgressWidget({
    super.key,
    required this.actionType,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          SizedBox(height: 16.h),
          Text(
            '${actionType.toUpperCase()}ING work order...',
            style: TextStyle(fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
