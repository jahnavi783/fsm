import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isEnabled;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;
  final double? width;
  final double? height;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final ButtonStyle? style;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.width,
    this.height,
    this.borderRadius,
    this.padding,
    this.textStyle,
    this.style,
  });

  const CustomButton.primary({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.icon,
    this.width,
    this.height,
    this.borderRadius,
    this.padding,
    this.textStyle,
    this.style,
  })  : backgroundColor = null,
        textColor = null;

  const CustomButton.secondary({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.icon,
    this.width,
    this.height,
    this.borderRadius,
    this.padding,
    this.textStyle,
    this.style,
  })  : backgroundColor = null,
        textColor = null;

  const CustomButton.outline({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.textColor,
    this.icon,
    this.width,
    this.height,
    this.borderRadius,
    this.padding,
    this.textStyle,
    this.style,
  }) : backgroundColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final effectiveBackgroundColor = backgroundColor ?? colorScheme.primary;
    final effectiveTextColor = textColor ??
        (backgroundColor == Colors.transparent
            ? colorScheme.primary
            : colorScheme.onPrimary);

    final buttonStyle = style ??
        ElevatedButton.styleFrom(
          backgroundColor: effectiveBackgroundColor,
          foregroundColor: effectiveTextColor,
          minimumSize: Size(width ?? 0, height ?? 48.h),
          padding:
              padding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius?.r ?? 8.r),
            side: backgroundColor == Colors.transparent
                ? BorderSide(color: effectiveTextColor)
                : BorderSide.none,
          ),
        );

    Widget buttonChild = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isLoading) ...[
          SizedBox(
            width: 16.w,
            height: 16.h,
            child: CircularProgressIndicator(
              strokeWidth: 2.w,
              valueColor: AlwaysStoppedAnimation<Color>(effectiveTextColor),
            ),
          ),
          SizedBox(width: 8.w),
        ] else if (icon != null) ...[
          Icon(
            icon,
            size: 18.sp,
            color: effectiveTextColor,
          ),
          SizedBox(width: 8.w),
        ],
        Text(
          text,
          style: textStyle ??
              TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: effectiveTextColor,
              ),
        ),
      ],
    );

    if (width != null) {
      buttonChild = SizedBox(
        width: width,
        child: buttonChild,
      );
    }

    return ElevatedButton(
      onPressed: (isEnabled && !isLoading) ? onPressed : null,
      style: buttonStyle,
      child: buttonChild,
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isEnabled;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? size;
  final double? iconSize;
  final String? tooltip;
  final EdgeInsetsGeometry? padding;

  const CustomIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.backgroundColor,
    this.iconColor,
    this.size,
    this.iconSize,
    this.tooltip,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final effectiveBackgroundColor = backgroundColor ?? colorScheme.primary;
    final effectiveIconColor = iconColor ?? colorScheme.onPrimary;
    final effectiveSize = size ?? 48.w;
    final effectiveIconSize = iconSize ?? 24.sp;

    Widget buttonChild = isLoading
        ? SizedBox(
            width: effectiveIconSize,
            height: effectiveIconSize,
            child: CircularProgressIndicator(
              strokeWidth: 2.w,
              valueColor: AlwaysStoppedAnimation<Color>(effectiveIconColor),
            ),
          )
        : Icon(
            icon,
            size: effectiveIconSize,
            color: effectiveIconColor,
          );

    Widget button = Material(
      color: effectiveBackgroundColor,
      borderRadius: BorderRadius.circular(effectiveSize / 2),
      child: InkWell(
        onTap: (isEnabled && !isLoading) ? onPressed : null,
        borderRadius: BorderRadius.circular(effectiveSize / 2),
        child: Container(
          width: effectiveSize,
          height: effectiveSize,
          padding: padding,
          child: Center(child: buttonChild),
        ),
      ),
    );

    if (tooltip != null) {
      button = Tooltip(
        message: tooltip!,
        child: button,
      );
    }

    return button;
  }
}
