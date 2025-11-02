import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/design_tokens.dart';
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
    final theme = Theme.of(context);

    return Container(
      padding: REdgeInsets.symmetric(
        vertical: DesignTokens.space8,
        horizontal: DesignTokens.space4,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Centered Avatar
          _buildAvatar(context),

          DesignTokens.verticalSpaceMedium,

          // User Info - Centered
          _buildUserInfo(context),
        ],
      ),
    );
  }

  Widget _buildAvatar(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 80.w,
      height: 80.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: theme.colorScheme.onPrimary,
          width: 3.w,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow.withValues(alpha: 0.2),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: CircleAvatar(
        radius: 38.r,
        backgroundColor: theme.colorScheme.onPrimary,
        backgroundImage: profile.profileImageUrl != null
            ? NetworkImage(profile.profileImageUrl!)
            : null,
        child: profile.profileImageUrl == null
            ? Text(
                profile.initials,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              )
            : null,
      ),
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Name
        Text(
          profile.fullName,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: theme.colorScheme.onPrimary,
          ),
          textAlign: TextAlign.center,
        ),

        DesignTokens.verticalSpaceSmall,

        // Role
        if (profile.role != null)
          Text(
            profile.role!,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onPrimary.withValues(alpha: 0.9),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),

        // Employee ID (if available)
        ...[
          DesignTokens.verticalSpaceSmall,
          Container(
            padding: REdgeInsets.symmetric(
              horizontal: DesignTokens.space2,
              vertical: DesignTokens.space1,
            ),
            decoration: BoxDecoration(
              color: theme.colorScheme.onPrimary.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(DesignTokens.radiusFull.r),
            ),
            child: Text(
              'ID: ${profile.id}',
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
