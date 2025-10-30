import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/core/widgets/form/work_order_validators.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// Reusable reactive text input field with consistent styling
/// Uses ScreenUtil for responsive design
class ReactiveTextInput extends StatelessWidget {
  final String formControlName;
  final String? label;
  final String? hint;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final int? maxLength;
  final TextCapitalization textCapitalization;
  final Map<String, ValidationMessageFunction>? validationMessages;
  final bool showErrors;

  const ReactiveTextInput({
    super.key,
    required this.formControlName,
    this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.inputFormatters,
    this.obscureText = false,
    this.maxLength,
    this.textCapitalization = TextCapitalization.none,
    this.validationMessages,
    this.showErrors = true,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<String>(
      formControlName: formControlName,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      maxLength: maxLength,
      textCapitalization: textCapitalization,
      style: TextStyle(
        fontSize: 14.sp,
        color: AppColors.textPrimary,
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, size: 20.sp, color: AppColors.grey600)
            : null,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.outline, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.outline, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.error, width: 2),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 14.h,
        ),
        labelStyle: TextStyle(
          fontSize: 14.sp,
          color: AppColors.grey700,
        ),
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: AppColors.grey500,
        ),
        errorStyle: TextStyle(
          fontSize: 12.sp,
          color: AppColors.error,
        ),
      ),
      validationMessages: validationMessages ?? _defaultValidationMessages,
      showErrors: (control) => showErrors && control.invalid && control.touched,
    );
  }

  static Map<String, ValidationMessageFunction>
      get _defaultValidationMessages => {
            ValidationMessage.required: (_) => 'This field is required',
            ValidationMessage.email: (_) => 'Please enter a valid email',
            ValidationMessage.minLength: (error) {
              final requiredLength = (error as Map)['requiredLength'];
              final actualLength = error['actualLength'];
              return 'Minimum $requiredLength characters required (current: $actualLength)';
            },
            ValidationMessage.maxLength: (error) {
              final requiredLength = (error as Map)['requiredLength'];
              return 'Maximum $requiredLength characters allowed';
            },
            'requiredReason': (_) =>
                WorkOrderValidationMessages.getErrorMessage(
                    'requiredReason', null),
            'invalidNumber': (_) => WorkOrderValidationMessages.getErrorMessage(
                'invalidNumber', null),
          };
}
