import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final VoidCallback? onPressed;
  final Widget child;
  final Color? backgroundColor;
  final bool isLoading;
  final List<Color>? gradientColors;

  const GradientElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.backgroundColor,
    this.height = 44.0,
    this.isLoading = false,
    this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(4.r);
    final theme = Theme.of(context);

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
      height: height.h,
      decoration: BoxDecoration(
        color: backgroundColor,
        gradient: backgroundColor == null
            ? LinearGradient(
                begin: const Alignment(1.00, 0.00),
                end: const Alignment(-1, 0),
                colors: gradientColors ?? [
                  theme.colorScheme.primary,
                  theme.colorScheme.secondary,
                ],
              )
            : null,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: isLoading
            ? SizedBox(
                width: 20.w,
                height: 20.h,
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : effectiveChild,
      ),
    );
  }
}