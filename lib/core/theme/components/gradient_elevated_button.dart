import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors.dart';
import '../app_dimensions.dart';
import '../app_text_styles.dart';

class GradientElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Gradient? gradient;
  final bool isLoading;
  final EdgeInsetsGeometry? padding;
  final double? elevation;
  final Color? shadowColor;

  const GradientElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height,
    this.backgroundColor,
    this.gradient,
    this.isLoading = false,
    this.padding,
    this.elevation,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius = borderRadius ?? 
        BorderRadius.circular(AppDimensions.radiusSmall);
    final effectiveHeight = height ?? AppDimensions.buttonHeight;
    final effectivePadding = padding ?? EdgeInsets.symmetric(
      horizontal: AppDimensions.paddingLarge,
      vertical: AppDimensions.paddingMedium,
    );
    final effectiveGradient = gradient ?? AppColors.primaryGradient;

    Widget effectiveChild = child;
    
    // Apply default text style if child is Text widget
    if (child is Text) {
      final Text textChild = child as Text;
      final TextStyle? style = textChild.style;
      if (style == null || style.fontSize == null) {
        effectiveChild = Text(
          textChild.data ?? '',
          style: AppTextStyles.buttonText.copyWith(
            color: AppColors.onPrimary,
            fontSize: 15.sp,
          ).merge(style),
          textAlign: textChild.textAlign,
          maxLines: textChild.maxLines,
          overflow: textChild.overflow,
        );
      }
    }

    return Container(
      width: width,
      height: effectiveHeight,
      decoration: BoxDecoration(
        color: backgroundColor,
        gradient: backgroundColor == null ? effectiveGradient : null,
        borderRadius: effectiveBorderRadius,
        boxShadow: elevation != null ? [
          BoxShadow(
            color: (shadowColor ?? AppColors.shadow).withValues(alpha: 0.2),
            blurRadius: elevation!,
            offset: Offset(0, elevation! / 2),
          ),
        ] : null,
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: effectiveBorderRadius,
          ),
          padding: effectivePadding,
          minimumSize: Size(width ?? 0, effectiveHeight),
        ),
        child: isLoading
            ? SizedBox(
                width: 20.w,
                height: 20.w,
                child: CircularProgressIndicator(
                  strokeWidth: 2.w,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.onPrimary,
                  ),
                ),
              )
            : effectiveChild,
      ),
    );
  }
}

// Convenience constructors for common button types
class GradientElevatedButtonPrimary extends GradientElevatedButton {
  const GradientElevatedButtonPrimary({
    super.key,
    required super.onPressed,
    required super.child,
    super.borderRadius,
    super.width,
    super.height,
    super.isLoading = false,
    super.padding,
    super.elevation,
  }) : super(
    gradient: AppColors.primaryGradient,
  );
}

class GradientElevatedButtonSecondary extends GradientElevatedButton {
  const GradientElevatedButtonSecondary({
    super.key,
    required super.onPressed,
    required super.child,
    super.borderRadius,
    super.width,
    super.height,
    super.isLoading = false,
    super.padding,
    super.elevation,
  }) : super(
    backgroundColor: AppColors.secondary,
  );
}

class GradientElevatedButtonOutlined extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  final bool isLoading;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;
  final double? borderWidth;

  const GradientElevatedButtonOutlined({
    super.key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height,
    this.isLoading = false,
    this.padding,
    this.borderColor,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius = borderRadius ?? 
        BorderRadius.circular(AppDimensions.radiusSmall);
    final effectiveHeight = height ?? AppDimensions.buttonHeight;
    final effectivePadding = padding ?? EdgeInsets.symmetric(
      horizontal: AppDimensions.paddingLarge,
      vertical: AppDimensions.paddingMedium,
    );

    return Container(
      width: width,
      height: effectiveHeight,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor ?? AppColors.primary,
          width: borderWidth ?? 1.5.w,
        ),
        borderRadius: effectiveBorderRadius,
      ),
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: borderColor ?? AppColors.primary,
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: effectiveBorderRadius,
          ),
          padding: effectivePadding,
          minimumSize: Size(width ?? 0, effectiveHeight),
        ),
        child: isLoading
            ? SizedBox(
                width: 20.w,
                height: 20.w,
                child: CircularProgressIndicator(
                  strokeWidth: 2.w,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    borderColor ?? AppColors.primary,
                  ),
                ),
              )
            : child,
      ),
    );
  }
}