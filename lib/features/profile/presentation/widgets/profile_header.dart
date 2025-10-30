import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
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
      padding: EdgeInsets.symmetric(
        vertical: AppDimensions.paddingLarge * 2,
        horizontal: AppDimensions.paddingLarge,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary,
            AppColors.primary,
          ],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Centered Avatar
          _buildAvatar(),

          SizedBox(height: AppDimensions.spaceMedium),

          // User Info - Centered
          _buildUserInfo(),
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
          color: AppColors.white,
          width: 3.w,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.2),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: CircleAvatar(
        radius: 38.r,
        backgroundColor: AppColors.white,
        backgroundImage: profile.profileImageUrl != null
            ? NetworkImage(profile.profileImageUrl!)
            : null,
        child: profile.profileImageUrl == null
            ? Text(
                profile.initials,
                style: AppTextStyles.headlineMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              )
            : null,
      ),
    );
  }

  Widget _buildUserInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Name
        Text(
          profile.fullName,
          style: AppTextStyles.headlineSmall.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
          textAlign: TextAlign.center,
        ),

        SizedBox(height: AppDimensions.spaceXSmall),

        // Role
        if (profile.role != null)
          Text(
            profile.role!,
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.white.withValues(alpha: 0.9),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),

        // Employee ID (if available)
        if (profile.id != null) ...[
          SizedBox(height: AppDimensions.spaceXSmall),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingSmall,
              vertical: AppDimensions.paddingXSmall / 2,
            ),
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(AppDimensions.radiusXLarge),
            ),
            child: Text(
              'ID: ${profile.id}',
              style: AppTextStyles.labelSmall.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
