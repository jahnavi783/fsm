import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/forms/work_order_validators.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// Reusable reactive multiline text input field
/// Suitable for notes, work logs, completion notes, etc.
class ReactiveMultilineInput extends StatelessWidget {
  final String formControlName;
  final String? label;
  final String? hint;
  final int minLines;
  final int maxLines;
  final int? maxLength;
  final Map<String, ValidationMessageFunction>? validationMessages;
  final bool showErrors;

  const ReactiveMultilineInput({
    super.key,
    required this.formControlName,
    this.label,
    this.hint,
    this.minLines = 3,
    this.maxLines = 6,
    this.maxLength,
    this.validationMessages,
    this.showErrors = true,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<String>(
      formControlName: formControlName,
      keyboardType: TextInputType.multiline,
      textCapitalization: TextCapitalization.sentences,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,
      style: TextStyle(
        fontSize: 14.sp,
        color: AppColors.textPrimary,
        height: 1.5,
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        alignLabelWithHint: true,
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
          };
}
