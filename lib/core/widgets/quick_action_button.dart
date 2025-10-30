import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';
import '../theme/app_text_styles.dart';

/// Standardized action button for cards and quick actions
///
/// Used in work order cards, document cards, and other action-required contexts
/// Features:
/// - Icon + label layout
/// - Consistent sizing and spacing
/// - Custom colors
/// - Disabled state support
/// - Loading state support
class QuickActionButton extends StatelessWidget {
  const QuickActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.color,
    this.backgroundColor,
    this.isLoading = false,
    this.isCompact = false,
  });

  /// Icon to display
  final IconData icon;

  /// Button label text
  final String label;

  /// Callback when button is pressed
  final VoidCallback? onPressed;

  /// Custom icon/text color (defaults to primary)
  final Color? color;

  /// Custom background color (defaults to transparent)
  final Color? backgroundColor;

  /// Show loading indicator
  final bool isLoading;

  /// Use compact layout (smaller padding)
  final bool isCompact;

  bool get _isDisabled => onPressed == null;

  Color get _foregroundColor {
    if (_isDisabled) return AppColors.disabled;
    return color ?? AppColors.primary;
  }

  Color get _backgroundButtonColor {
    if (_isDisabled) return AppColors.disabledBackground;
    return backgroundColor ?? Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _backgroundButtonColor,
      borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
      child: InkWell(
        onTap: isLoading ? null : onPressed,
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isCompact ? AppDimensions.paddingSmall : AppDimensions.paddingMedium,
            vertical: isCompact ? AppDimensions.paddingXSmall : AppDimensions.paddingSmall,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isLoading)
                SizedBox(
                  width: AppDimensions.iconSmall,
                  height: AppDimensions.iconSmall,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.w,
                    valueColor: AlwaysStoppedAnimation<Color>(_foregroundColor),
                  ),
                )
              else
                Icon(
                  icon,
                  size: AppDimensions.iconSmall,
                  color: _foregroundColor,
                ),
              SizedBox(width: 4.w),
              Text(
                label,
                style: (isCompact ? AppTextStyles.labelSmall : AppTextStyles.labelMedium).copyWith(
                  color: _foregroundColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Variant constructors for common action button types
extension QuickActionButtonVariants on QuickActionButton {
  /// Primary action button (filled with primary color)
  static Widget primary({
    required IconData icon,
    required String label,
    required VoidCallback? onPressed,
    bool isLoading = false,
    bool isCompact = false,
  }) {
    return QuickActionButton(
      icon: icon,
      label: label,
      onPressed: onPressed,
      color: AppColors.white,
      backgroundColor: AppColors.primary,
      isLoading: isLoading,
      isCompact: isCompact,
    );
  }

  /// Secondary action button (outlined)
  static Widget secondary({
    required IconData icon,
    required String label,
    required VoidCallback? onPressed,
    bool isLoading = false,
    bool isCompact = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: onPressed == null ? AppColors.disabled : AppColors.primary,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
      ),
      child: QuickActionButton(
        icon: icon,
        label: label,
        onPressed: onPressed,
        color: AppColors.primary,
        backgroundColor: Colors.transparent,
        isLoading: isLoading,
        isCompact: isCompact,
      ),
    );
  }

  /// Success action button (green, for complete/submit actions)
  static Widget success({
    required IconData icon,
    required String label,
    required VoidCallback? onPressed,
    bool isLoading = false,
    bool isCompact = false,
  }) {
    return QuickActionButton(
      icon: icon,
      label: label,
      onPressed: onPressed,
      color: AppColors.white,
      backgroundColor: AppColors.success,
      isLoading: isLoading,
      isCompact: isCompact,
    );
  }

  /// Warning action button (orange, for pause/caution actions)
  static Widget warning({
    required IconData icon,
    required String label,
    required VoidCallback? onPressed,
    bool isLoading = false,
    bool isCompact = false,
  }) {
    return QuickActionButton(
      icon: icon,
      label: label,
      onPressed: onPressed,
      color: AppColors.white,
      backgroundColor: AppColors.warning,
      isLoading: isLoading,
      isCompact: isCompact,
    );
  }

  /// Error/destructive action button (red, for cancel/delete actions)
  static Widget error({
    required IconData icon,
    required String label,
    required VoidCallback? onPressed,
    bool isLoading = false,
    bool isCompact = false,
  }) {
    return QuickActionButton(
      icon: icon,
      label: label,
      onPressed: onPressed,
      color: AppColors.white,
      backgroundColor: AppColors.error,
      isLoading: isLoading,
      isCompact: isCompact,
    );
  }

  /// Text-only action button (no background)
  static Widget text({
    required IconData icon,
    required String label,
    required VoidCallback? onPressed,
    Color? color,
    bool isLoading = false,
    bool isCompact = false,
  }) {
    return QuickActionButton(
      icon: icon,
      label: label,
      onPressed: onPressed,
      color: color ?? AppColors.primary,
      backgroundColor: Colors.transparent,
      isLoading: isLoading,
      isCompact: isCompact,
    );
  }
}
