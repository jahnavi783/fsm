import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm_flutter/presentation/core/themes/app_theme.dart';

class GradientElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final VoidCallback? onPressed;
  final Widget child;
  final Color? backgroundColor;
  final bool isLoading;

  const GradientElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.backgroundColor,
    this.height = 44.0,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(4);

    Widget effectiveChild = child;
    // If the child is a Text widget, apply default fontSize 15.sp if not set
    if (child is Text) {
      final Text textChild = child as Text;
      final TextStyle? style = textChild.style;
      if (style == null || style.fontSize == null) {
        effectiveChild = Text(
          textChild.data ?? '',
          style: (style ?? const TextStyle()).copyWith(fontSize: 15.sp),
          textAlign: textChild.textAlign,
          maxLines: textChild.maxLines,
          overflow: textChild.overflow,
        );
      }
    }

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        gradient: backgroundColor == null
            ? LinearGradient(
                begin: Alignment(1.00, 0.00),
                end: Alignment(-1, 0),
                colors: [
                  AppColors.finalColor,
                  AppColors.initialColor,
                ],
              )
            : null,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : effectiveChild,
      ),
    );
  }
}
