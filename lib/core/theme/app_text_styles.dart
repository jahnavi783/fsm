import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String _fontFamily = 'Inter';

  // Display Styles
  static TextStyle get displayLarge => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 57.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
    height: 1.12,
    color: AppColors.onBackground,
  );

  static TextStyle get displayMedium => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 45.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.16,
    color: AppColors.onBackground,
  );

  static TextStyle get displaySmall => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 36.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.22,
    color: AppColors.onBackground,
  );

  // Headline Styles
  static TextStyle get headlineLarge => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 32.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.25,
    color: AppColors.onBackground,
  );

  static TextStyle get headlineMedium => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.29,
    color: AppColors.onBackground,
  );

  static TextStyle get headlineSmall => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.33,
    color: AppColors.onBackground,
  );

  // Title Styles
  static TextStyle get titleLarge => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.27,
    color: AppColors.onBackground,
  );

  static TextStyle get titleMedium => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    height: 1.50,
    color: AppColors.onBackground,
  );

  static TextStyle get titleSmall => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
    color: AppColors.onBackground,
  );

  // Body Styles
  static TextStyle get bodyLarge => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 1.50,
    color: AppColors.onBackground,
  );

  static TextStyle get bodyMedium => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 1.43,
    color: AppColors.onBackground,
  );

  static TextStyle get bodySmall => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.33,
    color: AppColors.onBackground,
  );

  // Label Styles
  static TextStyle get labelLarge => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
    color: AppColors.onBackground,
  );

  static TextStyle get labelMedium => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.33,
    color: AppColors.onBackground,
  );

  static TextStyle get labelSmall => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 11.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.45,
    color: AppColors.onBackground,
  );

  // Custom App-Specific Styles
  static TextStyle get appBarTitle => headlineSmall.copyWith(
    fontWeight: FontWeight.w600,
    color: AppColors.onPrimary,
  );

  static TextStyle get cardTitle => titleMedium.copyWith(
    fontWeight: FontWeight.w600,
  );

  static TextStyle get cardSubtitle => bodyMedium.copyWith(
    color: AppColors.onSurface.withValues(alpha: 0.7),
  );

  static TextStyle get buttonText => labelLarge.copyWith(
    fontWeight: FontWeight.w600,
  );

  static TextStyle get chipText => labelMedium.copyWith(
    fontWeight: FontWeight.w500,
  );

  static TextStyle get captionText => bodySmall.copyWith(
    color: AppColors.onSurface.withValues(alpha: 0.6),
  );

  static TextStyle get errorText => bodySmall.copyWith(
    color: AppColors.error,
  );

  static TextStyle get successText => bodySmall.copyWith(
    color: AppColors.success,
  );

  static TextStyle get warningText => bodySmall.copyWith(
    color: AppColors.warning,
  );

  static TextStyle get infoText => bodySmall.copyWith(
    color: AppColors.info,
  );

  // Status-specific styles
  static TextStyle get statusAssigned => labelMedium.copyWith(
    color: AppColors.statusAssigned,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get statusInProgress => labelMedium.copyWith(
    color: AppColors.statusInProgress,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get statusPaused => labelMedium.copyWith(
    color: AppColors.statusPaused,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get statusCompleted => labelMedium.copyWith(
    color: AppColors.statusCompleted,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get statusCancelled => labelMedium.copyWith(
    color: AppColors.statusCancelled,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get statusRejected => labelMedium.copyWith(
    color: AppColors.statusRejected,
    fontWeight: FontWeight.w600,
  );

  // Priority-specific styles
  static TextStyle get priorityLow => labelMedium.copyWith(
    color: AppColors.priorityLow,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get priorityMedium => labelMedium.copyWith(
    color: AppColors.priorityMedium,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get priorityHigh => labelMedium.copyWith(
    color: AppColors.priorityHigh,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get priorityUrgent => labelMedium.copyWith(
    color: AppColors.priorityUrgent,
    fontWeight: FontWeight.w600,
  );

  // Helper methods
  static TextStyle getStatusStyle(String status) {
    switch (status.toLowerCase()) {
      case 'assigned':
        return statusAssigned;
      case 'in_progress':
      case 'inprogress':
        return statusInProgress;
      case 'paused':
        return statusPaused;
      case 'completed':
        return statusCompleted;
      case 'cancelled':
        return statusCancelled;
      case 'rejected':
        return statusRejected;
      default:
        return labelMedium;
    }
  }

  static TextStyle getPriorityStyle(String priority) {
    switch (priority.toLowerCase()) {
      case 'low':
        return priorityLow;
      case 'medium':
        return priorityMedium;
      case 'high':
        return priorityHigh;
      case 'urgent':
        return priorityUrgent;
      default:
        return labelMedium;
    }
  }
}