import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/profile_entity.dart';

class ProfileHeader extends StatelessWidget {
  final ProfileEntity profile;
  final VoidCallback? onEditPressed;

  const ProfileHeader({
    super.key,
    required this.profile,
    this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.grey[800]!,
            Colors.grey[700]!,
          ],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              _buildAvatar(),
              SizedBox(width: 16.w),
              Expanded(
                child: _buildUserInfo(),
              ),
              // if (onEditPressed != null) _buildEditButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 80.w,
      height: 80.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 2.w,
        ),
      ),
      child: CircleAvatar(
        radius: 38.r,
        backgroundColor: Colors.white,
        backgroundImage: profile.profileImageUrl != null
            ? NetworkImage(profile.profileImageUrl!)
            : null,
        child: profile.profileImageUrl == null
            ? Text(
                profile.initials,
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              )
            : null,
      ),
    );
  }

  Widget _buildUserInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          profile.fullName,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 4.h),
        if (profile.role != null)
          Text(
            profile.role!,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[300],
            ),
          ),
        SizedBox(height: 4.h),
        Text(
          profile.email,
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }

//   Widget _buildEditButton() {
//     return IconButton(
//       onPressed: onEditPressed,
//       icon: Icon(
//         Icons.edit,
//         color: Colors.white,
//         size: 24.sp,
//       ),
//     );
//   }
}
